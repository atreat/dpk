import Alamofire
import AlamofireSynchronous

public struct LoginCredential {
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }

    public var username : String
    public var password : String
}

public class LoginRequest {
    public static func request(_ session: Session, credential: LoginCredential) -> DataRequest {
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

        if let result = response.result.value {
            let accessKey = (result as! [String: String])["authServiceKey"]
            return accessKey!
        } else {

        }

        return nil
    }
}
