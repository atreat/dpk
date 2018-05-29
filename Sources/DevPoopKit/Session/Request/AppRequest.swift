import Alamofire
import AlamofireSynchronous

public class AppRequest {

    open static let base = "https://developer.apple.com/services-account/"
    open static let versionPath = "QH65B2"
    open static let platform = "ios"

    public static func all(_ session: Session) -> DataRequest {
        let pageNumber = 1
        let pageSize   = 500

        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/identifiers/listAppIds.action",
            method: .post,
            parameters: [
                "teamId"     : session.selectedTeamId!,
                "pageNumber" : pageNumber,
                "pageSize"   : pageSize,
                "sort"       : "name=asc"
            ]
        )
    }

    public static func show(_ session: Session, appIdentifier: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/identifiers/getAppIdDetail.action",
            method: .post,
            parameters: [
                "teamId"     : session.selectedTeamId!,
                "appIdId"    : appIdentifier
            ]
        )
    }

    public static func create(_ session: Session, appIdentifier: String, name: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/identifiers/getAppIdDetail.action",
            method: .post,
            parameters: [
                "teamId"     : session.selectedTeamId!,
                "appIdId"    : appIdentifier
            ]
        )
    }

    public static func update(_ session: Session, appIdentifier: String, name: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/identifiers/updateAppIdName.action",
            method: .post,
            parameters: [
                "teamId"     : session.selectedTeamId!,
                "appIdId"    : appIdentifier,
                name         : name
            ]
        )
    }

    public static func delete(_ session: Session, appIdentifier: String, name: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/identifiers/deleteAppId.action",
            method: .post,
            parameters: [
                "teamId"     : session.selectedTeamId!,
                "appIdId"    : appIdentifier
            ]
        )
    }
}
