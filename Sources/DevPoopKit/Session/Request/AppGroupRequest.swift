import Alamofire
import Foundation

public class AppGroupRequest {

    public static func all(_ session: Session) -> DataRequest {
        let pageNumber = 1
        let pageSize   = 500

        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/identifiers/listApplicationGroups.action",
            method: .post,
            parameters: [
                "teamId"     : session.selectedTeamId!,
                "pageNumber" : pageNumber,
                "pageSize"   : pageSize,
                "sort"       : "name=asc"
            ]
        )
    }

    public static func create(_ session: Session, name: String, identifier: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/identifiers/addApplicationGroup.action",
            method: .post,
            parameters: [
                "teamId"       : session.selectedTeamId!,
                "name"         : name,
                "identifier"   : identifier,
            ]
        )
    }

    public static func delete(_ session: Session, groupIdentifier: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/identifiers/deleteApplicationGroup.action",
            method: .post,
            parameters: [
                "teamId"     : session.selectedTeamId!,
                "applicationGroup" : groupIdentifier,
            ]
        )
    }

}

