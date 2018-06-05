
import Alamofire
import AlamofireSynchronous
import Commander
import DevPoopKit


let main = command { (username: String, password: String) in

    let credential = Credential(username: username, password: password)

    // let session  = Session.default
    // let _ = LoginRequest.request(session, credential: credential).response()

    let session = Session.login(credential, sync: true) { response, session in
//        print("Login completion handled: \(String(describing: response))")
    }

    /// Teams
//    let teams = AppleTeamRequest.request(session)
//    print(teams.responseJSON())

    /// All Apps
    let apps = AppRequest.all(session)
    print(apps.responseJSON())

    /// App Detail
//    let appDetail = AppRequest.show(session, appIdentifier: "QLPJ34B39V")
//    print(appDetail.responseJSON())

    /// Devices
//    let devices = DeviceRequest.all(session)
//    print(devices.responseJSON())

    /// Invites
    let invites = InviteRequest.all(session)
    print(invites.responseJSON())
}

main.run()
