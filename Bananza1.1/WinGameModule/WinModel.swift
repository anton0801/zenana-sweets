import SwiftUI

class WinViewModel: ObservableObject {
    let contact = WinModel()
    @Published var isNextAvailible = false
    @Published var isRestartAvailible = false
    @Published var isMenuAvailible = false
    @Published var timer: Timer?
    @Published var timeRemaining = 120
    
    func goToNext() {
        isNextAvailible = true
        UserDefaultsManager().completeLevel()
        UserDefaultsManager().addCandy()
    }
    
    func goToRestart() {
        isRestartAvailible = true
    }
    
    func goToMenu() {
        isMenuAvailible = true
        UserDefaultsManager().completeLevel()
        UserDefaultsManager().addCandy()
    }
}
