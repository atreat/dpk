
public enum Platform : String {
    case ios = "ios"
    case mac = "mac"
}

public struct Configuration {
    var platform   : Platform
    var apiVersion : String
    var teamId     : String?
}
