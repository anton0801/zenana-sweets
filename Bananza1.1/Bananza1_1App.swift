import SwiftUI

@main
struct Bananza1_1App: App {
    var body: some Scene {
        WindowGroup {
            MenuView()
                .onAppear {
                    UserDefaultsManager().firstLaunch()
                }
        }
    }
}
