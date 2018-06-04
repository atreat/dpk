
public enum Platform : String {
    case ios = "ios"
    case mac = "mac"
}

public struct Configuration {
    var platform   : Platform
    var apiVersion : String
    var teamId     : String?

    public static let `default` : Configuration =  {
        return Configuration(
            platform: .ios,
            apiVersion: "QH65B2",
            teamId: nil
        )
    }()
}
