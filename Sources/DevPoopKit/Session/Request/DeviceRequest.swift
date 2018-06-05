import Alamofire
import Foundation

public class DeviceRequest {

    public struct DeviceDescriptor {
        let deviceClass: String
        let UDID: String
        let deviceName: String
    }

    static let base = "https://developer.apple.com/services-account/"

    public static func all(_ session: Session, includeDisabled: Bool = false, deviceClass: String? = nil) -> DataRequest {
        let pageNumber = 1
        let pageSize   = 500

        var parameters : [String : Any] = [
            "teamId"                : session.selectedTeamId!,
            "includeRemovedDevices" : includeDisabled,
            "pageNumber"            : pageNumber,
            "pageSize"              : pageSize,
            "sort"                  : "name=asc",
        ]

        if deviceClass != nil { parameters["deviceClass"] = deviceClass }

        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/device/listDevices.action",
            method: .post,
            parameters: parameters
        )
    }

    public static func create(_ session: Session, descriptor: DeviceDescriptor) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/device/listDevices.action",
            method: .post,
            parameters: [
                "teamId"                : session.selectedTeamId!,
                "deviceClasses"         : descriptor.deviceClass,
                "deviceNumbers"         : descriptor.UDID,
                "deviceNames"           : descriptor.deviceName
                ]
        )
    }

    public static func disable(_ session: Session, deviceId: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/device/deleteDevice.action",
            method: .post,
            parameters: [
                "teamId"                : session.selectedTeamId!,
                "deviceId"              : deviceId
            ]
        )
    }

    public static func enable(_ session: Session, deviceId: String, deviceUDID: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/device/enableDevice.action",
            method: .post,
            parameters: [
                "teamId"                 : session.selectedTeamId!,
                "displayId"              : deviceId,
                "deviceNumber"           : deviceUDID
            ]
        )
    }
}
