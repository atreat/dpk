import Alamofire
import Foundation

public class Session {

    // MARK: Static
    static let `default`: Session = {
        return Session()
    }()

    static let defaultHTTPHeaders: HTTPHeaders = {
        let acceptEncoding = "gzip;q=1.0, compress;q=0.5"
        let userAgent      = "DevPoop \(DevPoopKit.version)"

        return [
            "Accept-Encoding": acceptEncoding,
            "User-Agent": userAgent
        ]
    }()

    // MARK: - Instance

    public var configuration = Configuration.default

    public var selectedTeamId: String? {
        get { return configuration.teamId }
        set(team) { configuration.teamId = team }
    }

    // MARK: - Alamofire
    private let alamofire: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Session.defaultHTTPHeaders

//        let proxyHost = "127.0.0.1"
//        let proxyPort = 8888
//        let proxyConfig : [AnyHashable : Any] = [
//            kCFNetworkProxiesHTTPEnable: true,
//            kCFNetworkProxiesHTTPProxy: proxyHost,
//            kCFNetworkProxiesHTTPPort: proxyPort,
//            kCFNetworkProxiesHTTPSEnable: true,
//            kCFNetworkProxiesHTTPSProxy: proxyHost,
//            kCFNetworkProxiesHTTPSPort: proxyPort
//        ]
//
//        configuration.connectionProxyDictionary = proxyConfig

        return SessionManager(configuration: configuration)
    }()

    @discardableResult
    public func request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> DataRequest
    {
        return alamofire.request(
            url,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers
        )
    }
}
