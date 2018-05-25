import Alamofire
import Foundation

public class Session {

    // MARK: Static
    open static let `default`: Session = {
        return Session()
    }()

    open static let defaultHTTPHeaders: HTTPHeaders = {
        let acceptEncoding = "gzip;q=1.0, compress;q=0.5"
        let userAgent      = "DevPoop \(DevPoopKit.version)"

        return [
            "Accept-Encoding": acceptEncoding,
            "User-Agent": userAgent
        ]
    }()

    // MARK: - Instance
    public var selectedTeamId: String?

    // MARK: - Alamofire
    private let alamofire: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Session.defaultHTTPHeaders

        //        let proxyConfig : [String: AnyObject] = [
        //            kCFNetworkProxiesHTTPProxy      as String  :   "127.0.0.1" as AnyObject,
        //            kCFNetworkProxiesHTTPPort       as String  :   "8888" as AnyObject,
        //            kCFNetworkProxiesHTTPEnable     as String  :   true as AnyObject,
        //            kCFStreamPropertyHTTPSProxyHost as String  :   "127.0.0.1" as AnyObject,
        //            kCFStreamPropertyHTTPSProxyPort as String  :   "8888" as AnyObject,
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
