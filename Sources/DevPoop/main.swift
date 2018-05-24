
import Alamofire
import AlamofireSynchronous
import Commander
import DevPoopKit


let main = command { (username: String, password: String) in

    let credential = LoginCredential(username: username, password: password)

    let session  = Session.default

    session.selectedTeamId = "TPTUF752H8"



    let _ = LoginRequest.request(session, credential: credential).response()
//    let apps = AppRequest.request(session)

    let teams = AppleTeamRequest.request(session)
//    print(teams.responseJSON())

    let appDetail = AppRequest.detail(session, appIdentifier: "QLPJ34B39V")
    print(appDetail.responseJSON())
}

main.run()
