import Alamofire
import AlamofireSynchronous

public class AppleTeamRequest {
    public static func request(_ session: Session) -> DataRequest {

        return session.request(
            "https://developer.apple.com/services-account/QH65B2/account/listTeams.action",
            method: .post
        )
    }
}
