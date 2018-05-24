
import Alamofire
import AlamofireSynchronous
import Commander
import DevPoopKit


let main = command { (username: String, password: String) in

    let credential = LoginCredential(username: username, password: password)
    Session.default.selectedTeamId = "TPTUF752H8"

    let login = LoginRequest.request(Session.default, credential: credential).response()

    let apps = AppRequest.request(Session.default)
    let response = apps.response()

    print(apps)
    print(response)
    print(response.data)
    print("STATUS : \(String(describing: response.response?.statusCode))")
}

main.run()
