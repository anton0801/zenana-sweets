import SwiftUI

struct TutorialOrGameView: View {
    @State private var isFirstLaunch: Bool = false
    var body: some View {
        VStack {
            if isFirstLaunch {
                TutorialView()
            } else {
                GameView()
            }
        }
        .onAppear(perform: checkFirstLaunch)
    }
    func checkFirstLaunch() {
        isFirstLaunch = !UserDefaultsManager.defaults.bool(forKey: Keys.isFirstLauchKey.rawValue)
        UserDefaultsManager().isFirstTime(isFirstLaunch: isFirstLaunch)
    }
}

#Preview {
    TutorialOrGameView()
}
