import Alamofire
import AlamofireSynchronous

public class AppleTeamRequest {

    public static let base = "https://developer.apple.com/services-account/"
    public static let versionPath = "QH65B2"

    public static func all(_ session: Session) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/listTeams.action",
            method: .post
        )
    }
}
