import Alamofire
import Foundation

public class KeyRequest {

    public enum Service : String, Codable {
        case apns   = "U27F4V844T"
        case device = "DQ8HTZ7739"
        case music  = "6A7HVUVQ3M"
    }

    public struct Descriptor {
        public let name: String
        public let configuration: KeyRequest.Configuration

        public init(name: String, configuration: KeyRequest.Configuration) {
            self.name = name
            self.configuration = configuration
        }
    }

    public class Configuration {
        typealias ConfigurationJSON = [String : [String]]

        public var apnsServicesEnabled: Bool = false
        public var deviceServicesEnabled: Bool = false
        public var musicServicesEnabled: Bool = false
        public var musicIdentifiers: [String] = []

        public required init() { }

        public convenience init(apns: Bool = false, device: Bool = false, musicIdentifiers: [String] = []) {
            self.init()
            apnsServicesEnabled = apns
            deviceServicesEnabled = device
            musicServicesEnabled  = musicIdentifiers.count > 0
            self.musicIdentifiers = musicIdentifiers
        }

        var jsonDict : ConfigurationJSON {
            var data = ConfigurationJSON()
            if apnsServicesEnabled   { data[Service.apns.rawValue] = [] }
            if deviceServicesEnabled { data[Service.device.rawValue] = [] }
            if musicServicesEnabled  { data[Service.apns.rawValue] = musicIdentifiers }
            return data
        }
    }

    static let base = "https://developer.apple.com/services-account/"

    public static func all(_ session: Session) -> DataRequest {
        let pageNumber = 1
        let pageSize   = 500

        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/auth/key/list",
            method: .post,
            parameters: [
                "teamId"                : session.selectedTeamId!,
                "pageNumber"            : pageNumber,
                "pageSize"              : pageSize,
                "sort"                  : "name=asc",
            ]
        )
    }

    public static func show(_ session: Session, keyIdentifier: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/auth/key/get",
            method: .post,
            parameters: [
                "teamId" : session.selectedTeamId!,
                "keyId"  : keyIdentifier
            ]
        )
    }

    public static func create(_ session: Session, descriptor: Descriptor ) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/auth/key/create",
            method: .post,
            parameters: [
                "teamId"                : session.selectedTeamId!,
                "name"                  : descriptor.name,
                "serviceConfigurations" : descriptor.configuration.jsonDict
            ],
            encoding: JSONEncoding.default,
            headers: [
                "Content-Type" : "application/json"
            ]
        )
    }

    public static func download(_ session: Session, keyIdentifier: String ) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/auth/key/download",
            method: .post,
            parameters: [
                "teamId"                : session.selectedTeamId!,
                "keyId"                 : keyIdentifier
            ]
        )
    }

    public static func delete(_ session: Session, keyIdentifier: String ) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/auth/key/revoke",
            method: .post,
            parameters: [
                "teamId"                : session.selectedTeamId!,
                "keyId"                 : keyIdentifier
            ]
        )
    }

}
