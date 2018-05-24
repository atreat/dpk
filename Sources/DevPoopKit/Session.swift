import Alamofire
import Foundation

public class Session {

    open static let `default`: Session = {
        return Session()
    }()

    public var selectedTeamId: String?

    /// A default instance of `SessionManager`, used by top-level Alamofire request methods, and suitable for use
    /// directly for any ad hoc requests.
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

    // private let proxyConfig = {
    //     [:]
    // //     var proxyConfiguration = [NSObject: AnyObject]()
    // //     proxyConfiguration[kCFNetworkProxiesHTTPProxy] = "127.0.0.1" as AnyObject?
    // //     proxyConfiguration[kCFNetworkProxiesHTTPPort] = "8888"

    // //     proxyConfiguration[kCFNetworkProxiesHTTPEnable] = true as AnyObject?
    // //     proxyConfiguration[kCFStreamPropertyHTTPSProxyHost as String] = "127.0.0.1"
    // //     proxyConfiguration[kCFStreamPropertyHTTPSProxyPort as String] = "8888"
    // }()

    open static let defaultHTTPHeaders: HTTPHeaders = {
        let acceptEncoding = "gzip;q=1.0, compress;q=0.5"
        let userAgent      = "DevPoop \(DevPoopKit.version)"

        return [
            "Accept-Encoding": acceptEncoding,
            "User-Agent": userAgent
        ]
    }()


    // MARK: - Data Request

    /// Creates a `DataRequest` using the default `SessionManager` to retrieve the contents of the specified `url`,
    /// `method`, `parameters`, `encoding` and `headers`.
    ///
    /// - parameter url:        The URL.
    /// - parameter method:     The HTTP method. `.get` by default.
    /// - parameter parameters: The parameters. `nil` by default.
    /// - parameter encoding:   The parameter encoding. `URLEncoding.default` by default.
    /// - parameter headers:    The HTTP headers. `nil` by default.
    ///
    /// - returns: The created `DataRequest`.
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
