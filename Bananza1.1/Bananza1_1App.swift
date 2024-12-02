import SwiftUI

@main
struct Bananza1_1App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            Loading()
                .onAppear {
                    UserDefaultsManager().firstLaunch()
                }
        }
    }
}
