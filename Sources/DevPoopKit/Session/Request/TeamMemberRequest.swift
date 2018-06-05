import Alamofire
import AlamofireSynchronous

public class TeamMemberRequest {

    public static let base = "https://developer.apple.com/services-account/"
    public static let versionPath = "QH65B2"

    public static func all(_ session: Session) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/getTeamMembers",
            method: .post,
            parameters: [
                "teamId"  : session.selectedTeamId!
            ],
            encoding: JSONEncoding.default,
            headers: [
                "Content-Type" : "application/json",
            ]
        )
    }

    public static func update(_ session: Session, memberIdentifiers: [String], role: TeamMemberRole) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/getTeamMembers",
            method: .post,
            parameters: [
                "teamId"        : session.selectedTeamId!,
                "role"          : role,
                "teamMemberIds" : memberIdentifiers
            ],
            encoding: JSONEncoding.default,
            headers: [
                "Content-Type" : "application/json",
            ]
        )
    }

    public static func delete(_ session: Session, memberIdentifiers: [String]) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/getTeamMembers",
            method: .post,
            parameters: [
                "teamId"        : session.selectedTeamId!,
                "teamMemberIds" : memberIdentifiers
            ],
            encoding: JSONEncoding.default,
            headers: [
                "Content-Type" : "application/json",
            ]
        )
    }
}
