import Alamofire
import AlamofireSynchronous

public enum CertificateType: String {
    case developmentIos     = "5QPB9NHCEI"
    case productionIos      = "R58UK2EWSO"
    case inHouseIos         = "9RQEK7MSXA"
    case certificateIos     = "LA30L5BJEU"
    case developmentPushIos = "BKLRAVXMGM"
    case productionPushIos  = "UPV3DW712I"
    case passbookIos        = "Y3B2F3TYSI"
    case websitePushIos     = "3T2ZP62QW8"
    case voipPushIos        = "E5D663CMZW"
    case applePayIos        = "4APLUP237T"

    case developmentMac            = "749Y1QAGU7"
    case appDistributionMac        = "HXZEUKP0FP"
    case installerDistributionMac  = "2PQI8IDXNH"
    case developerIDInstallerMac   = "OYVN2GW35E"
    case developerIDApplicationMac = "W0EURJRMC5"
    case productionPushMac         = "CDZ7EMXIZ1"
    case developmentPushMac        = "HQ4KP3I34R"

    case developerIDApplicationMac2  = "DIVN2GW3XT"    // FIXME: why is this duplicate?
}

public class CertificateRequest {
    
    public struct Descriptor {
        let type: CertificateType
        let csrContents: String
        let appIdentifier: String?
    }

    static let base = "https://developer.apple.com/services-account/"

    public static func all(_ session: Session, types: [CertificateType]) -> DataRequest {
        let pageNumber = 1
        let pageSize = 500
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/certificate/listCertRequests.action",
            method: .post,
            parameters: [
                "teamId"                  : session.selectedTeamId!,
                "types"                   : types.map({ $0.rawValue }).joined(separator: ","),
                "onlyCountLists"          : true,
                "pageNumber"              : pageNumber,
                "pageSize"                : pageSize,
                "sort"                    : "name=asc"
            ]
        )
    }

    public static func create(_ session: Session, descriptor: Descriptor) -> DataRequest {
        var parameters = [
            "teamId"     : session.selectedTeamId!,
            "type"       : descriptor.type.rawValue,
            "csrContent" : descriptor.csrContents,
        ]

        if descriptor.appIdentifier != nil { parameters["appIdId"] = descriptor.appIdentifier! }

        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/certificate/submitCertificateRequest.action",
            method: .post,
            parameters: parameters
        )
    }

    public static func download(_ session: Session, type: CertificateType, certificateIdentifier: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/certificate/downloadCertificateContent.action",
            method: .get,
            parameters: [
                "teamId"        : session.selectedTeamId!,
                "type"          : type.rawValue,
                "certificateId" : certificateIdentifier
            ]
        )
    }

    public static func revoke(_ session: Session, type: CertificateType, certificateIdentifier: String) -> DataRequest {
        return session.request(
            "\(base)\(session.configuration.apiVersion)/account/\(session.configuration.platform)/certificate/revokeCertificate.action",
            method: .post,
            parameters: [
                "teamId"        : session.selectedTeamId!,
                "type"          : type.rawValue,
                "certificateId" : certificateIdentifier
            ]
        )
    }
    
}
