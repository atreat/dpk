
import Alamofire
import AlamofireSynchronous
import Commander
import DevPoopKit

import Foundation

let main = command { (username: String, password: String) in

    let credential = Credential(username: username, password: password)

    // let session  = Session.default
    // let _ = LoginRequest.request(session, credential: credential).response()

    let session = Session.login(credential, sync: true) { response, session in
//        print("Login completion handled: \(String(describing: response))")
    }

    /// Teams
//    let teams = TeamRequest.request(session)
//    print(teams.responseJSON())

    /// All Apps
//    let apps = AppRequest.all(session)
//    print(apps.responseJSON())

    /// App Detail
//    let appDetail = AppRequest.show(session, appIdentifier: "QLPJ34B39V")
//    print(appDetail.responseJSON())

    /// Devices
//    let devices = DeviceRequest.all(session)
//    print(devices.responseJSON())

    /// Invites
//    let invites = InviteRequest.all(session)
//    print(invites.responseJSON())

    /// Team Mebers
//    let members = TeamMemberRequest.all(session)
//    print(members.responseJSON())

    /// Keys
//    let keys = KeyRequest.all(session)
//    print(keys.responseJSON())

    // FIXME: Getting 421 error
//    let configuration = KeyRequest.Configuration(device: true)
//    let createKey = KeyRequest.create(session, descriptor: KeyRequest.Descriptor(name: "Test Key 2", configuration: configuration))
//    print(createKey.response())

//    let profiles = ProvisioningProfileRequest.all(session)
//    print(profile.responseJSON())

//    let profilesDetail = ProvisioningProfileRequest.allDetails(session)
//    print(profilesDetail.responsePropertyList())

//    let profile = ProvisioningProfileRequest.show(session, profileIdentifier: "9XM9WFQC84")
//    print(profile.responseJSON())

}

main.run()
