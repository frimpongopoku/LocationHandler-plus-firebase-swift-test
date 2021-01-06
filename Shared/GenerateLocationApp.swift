

import SwiftUI
import Firebase
@main
struct GenerateLocationApp: App {
	init(){
		FirebaseApp.configure()
	}
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
