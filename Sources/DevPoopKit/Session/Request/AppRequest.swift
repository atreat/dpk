// account/#{platform_slug(mac)}/identifiers/listAppIds.action
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
}

