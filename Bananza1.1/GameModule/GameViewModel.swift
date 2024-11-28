import SwiftUI

class GameViewModel: ObservableObject {
    let contact = GameModel()
    @Published var isLose = false
    @Published var isPauseAvailible = false
    @Published var timer: Timer?
    @Published var timeRemaining = 120
    
    func goToPause() {
        isPauseAvailible = true
    }
    
    func stepBack() {
        
    }
    
    func addMove() {
        
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.isLose = true
                self.timer?.invalidate()
            }
        }
    }
}


