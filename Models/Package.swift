

import Foundation

struct Package: Identifiable {
    var id = UUID()
    var title: String
    var link: String
    
}

let packagesData = [

    Package(title: "Firebase", link: "https://github.com/firebase/firebase-ios-sdk"),
    Package(title: "Firebase", link: "https://github.com/firebase/firebase-ios-sdk"),
    Package(title: "Firebase", link: "https://github.com/firebase/firebase-ios-sdk"),
    Package(title: "Firebase", link: "https://github.com/firebase/firebase-ios-sdk")

]
