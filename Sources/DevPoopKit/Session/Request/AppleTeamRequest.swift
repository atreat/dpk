import Alamofire
import AlamofireSynchronous

public class AppleTeamRequest {

    open static let base = "https://developer.apple.com/services-account/"
    open static let versionPath = "QH65B2"

    public static func all(_ session: Session) -> DataRequest {
        return session.request(
            "\(base)\(versionPath)/account/listTeams.action",
            method: .post
        )
    }
}
