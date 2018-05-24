import Alamofire
import AlamofireSynchronous

public class AppRequest {
    public static func request(_ session: Session) -> DataRequest {

        let pageNumber = 1
        let pageSize   = 500

        return session.request(
            "https://developer.apple.com/services-account/QH65B2/account/ios/identifiers/listAppIds.action",
            method: .post,
            parameters: [
                "teamId"     : session.selectedTeamId!,
                "pageNumber" : pageNumber,
                "pageSize"   : pageSize,
                "sort"       : "name=asc"
            ]
        )
    }

    public static func detail(_ session: Session, appIdentifier: String) -> DataRequest {
        print(appIdentifier)
        return session.request(
            "https://developer.apple.com/services-account/QH65B2/account/ios/identifiers/getAppIdDetail.action",
            method: .post,
            parameters: [
                "teamId"     : session.selectedTeamId!,
                "appIdId"    : appIdentifier
            ]
        )
    }
}
