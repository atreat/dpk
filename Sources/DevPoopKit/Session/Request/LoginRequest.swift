import Alamofire
import AlamofireSynchronous
import Foundation

public extension Session {
    public typealias LoginCompletionHandler = (_ response: HTTPURLResponse?, _ session: Session) -> ()

    /**
        Begins session with login request and returns it. Can be marked synchronized,
        if so the completion handler will be called with the response and the session.
    */
    public static func login(_ credential: Credential, sync: Bool = false, completion: @escaping LoginCompletionHandler) -> Session {
        let session = Session()
        let request = LoginRequest.request(session, credential: credential)

        if sync {
            let login = request.response()
            completion(login.response, session)
        } else {
            request.response() { login in completion(login.response, session) }
        }

        return session
    }
}

public class LoginRequest {
    public static func request(_ session: Session, credential: Credential) -> DataRequest {
        return session.request(
            "https://idmsa.apple.com/appleauth/auth/signin",
            method: .post,
            parameters: [
                "accountName" : credential.username,
                "password"    : credential.password,
                "rememberMe"  : true
            ],
            encoding: JSONEncoding.default,
            headers: [
                "X-Apple-Widget-Key" : retrieveWidgetKey()!,
                "Content-Type" : "application/json",
            ]
        )
    }

    private static func retrieveWidgetKey() -> String? {
        let endpoint = "https://olympus.itunes.apple.com/v1/app/config?hostname=itunesconnect.apple.com"
        let response = Session.default.request(endpoint).responseJSON()

        if response.result.isSuccess {
            return (response.result.value as! [String: String])["authServiceKey"]
        } else {
            print("ERROR: Unable to retrieve widget key")
            return nil
        }
    }
}
