import Alamofire
import AlamofireSynchronous

public class ProvisioningProfileRequest {

    public struct Descriptor {
        public let name: String
        public let distributionType: String
        public let appIdentifier: String
        public let certificateIdentifiers: [String]
        public let deviceIdentifiers: [String]
        public let subPlatform: String
        public let template: String
    }

    static let base = "https://developer.apple.com/services-account/"

    public static func all(_ session: Session) -> DataRequest {
        let pageNumber = 1
        let pageSize = 500
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/profile/listProvisioningProfiles.action",
            method: .post,
            parameters: [
                "teamId"                  : session.selectedTeamId!,
                "includeInactiveProfiles" : true,
                "onlyCountLists"          : true,
                "pageNumber"              : pageNumber,
                "pageSize"                : pageSize,
                "sort"                    : "name=asc"
            ]
        )
    }

    public static func show(_ session: Session, profileIdentifier: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/profile/getProvisioningProfile.action",
            method: .post,
            parameters: [
                "teamId"                : session.selectedTeamId!,
                "provisioningProfileId" : profileIdentifier
            ]
        )
    }

    public static func create(_ session: Session, descriptor: Descriptor) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/profile/createProvisioningProfile",
            method: .post,
            parameters: [
                "teamId"                  : session.selectedTeamId!,
                "provisioningProfileName" : descriptor.name,
                "appIdId"                 : descriptor.appIdentifier,
                "distributionType"        : descriptor.distributionType,
                "certificateIds"          : descriptor.certificateIdentifiers,
                "deviceIds"               : descriptor.deviceIdentifiers,
                "subPlatform"             : descriptor.subPlatform,
                "template"                : descriptor.template
            ]
        )
    }

    public static func download(_ session: Session, profileIdentifier: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/profile/downloadProfileContent",
            method: .post,
            parameters: [
                "teamId"                : session.selectedTeamId!,
                "provisioningProfileId" : profileIdentifier
            ]
        )
    }

    public static func repair(_ session: Session, profileIdentifier: String, descriptor: Descriptor) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/profile/regenProvisioningProfile.action",
            method: .post,
            parameters: [
                "teamId"                  : session.selectedTeamId!,
                "provisioningProfileId"   : profileIdentifier,
                "provisioningProfileName" : descriptor.name,
                "appIdId"                 : descriptor.appIdentifier,
                "distributionType"        : descriptor.distributionType,
                "certificateIds"          : descriptor.certificateIdentifiers,
                "deviceIds"               : descriptor.deviceIdentifiers,
                "subPlatform"             : descriptor.subPlatform,
                "template"                : descriptor.template
            ]
        )
    }

    public static func delete(_ session: Session, profileIdentifier: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/profile/deleteProvisioningProfile.action",
            method: .post,
            parameters: [
                "teamId"                : session.selectedTeamId!,
                "provisioningProfileId" : profileIdentifier
            ]
        )
    }

}
