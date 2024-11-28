import SwiftUI

class PauseViewModel: ObservableObject {
    let contact = PauseModel()
    @Published var isResumeAvailible = false
    @Published var isRestartAvailible = false
    @Published var isMenuAvailible = false
    @Published var timer: Timer?
    @Published var timeRemaining = 120
    
    func resumeGame() {
        isResumeAvailible = true
    }
    
    func goToRestart() {
        isRestartAvailible = true
    }
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
 
}
