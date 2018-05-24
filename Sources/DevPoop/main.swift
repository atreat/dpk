
import Alamofire
import AlamofireSynchronous
import Commander
import DevPoopKit


let main = command { (username: String, password: String) in

    let credential = LoginCredential(username: username, password: password)
    Session.default.selectedTeamId = "TPTUF752H8"

    let _ = LoginRequest.request(Session.default, credential: credential).response()

    let apps = AppRequest.request(Session.default)
    let response = apps.responseJSON()
}

main.run()
