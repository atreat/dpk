import Alamofire
import Foundation

public class InviteRequest {
    public struct InviteDescriptor {
        let email : String
        let role  : TeamMemberRole
    }

    static let base = "https://developer.apple.com/services-account/"

    public static func all(_ session: Session) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/getInvites",
            method: .post,
            parameters: [
                "teamId"     : session.selectedTeamId!,
            ],
            encoding: JSONEncoding.default,
            headers: [
                "Content-Type" : "application/json",
            ]
        )
    }

    public static func create(_ session: Session, invites: [InviteDescriptor]) -> DataRequest {
        let inviteData = invites.map { invite in
            return [
                "recipientEmail" : invite.email,
                "recipientRole" : invite.role.rawValue
            ]
        }

        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/sendInvites",
            method: .post,
            parameters: [
                "teamId"  : session.selectedTeamId!,
                "invites" : inviteData
            ],
            encoding: JSONEncoding.default,
            headers: [
                "Content-Type" : "application/json",
            ]
        )

    }

    public static func delete(_ session: Session, inviteIdentifiers: [String]) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/sendInvites",
            method: .post,
            parameters: [
                "teamId"  : session.selectedTeamId!,
                "inviteIds" : inviteIdentifiers
            ],
            encoding: JSONEncoding.default,
            headers: [
                "Content-Type" : "application/json",
            ]
        )
    }
}
