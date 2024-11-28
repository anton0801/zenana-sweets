import SwiftUI

class StageViewModel: ObservableObject {
    let contact = StageModel()
    
    @Published var currentIndex = 0
    @Published var isPreviousButtonDisabled = true
    @Published var isFirstStageAvailible = false
    @Published var isSecondStageAvailible = false
    @Published var isThirdStageAvailible = false
    @Published var isNextButtonDisabled = false
    @Published var isPlayButtonDisable = false
    @Published var isMenuAvailible = false
    
    @Published var stageDone = 1
    @Published var opacityPrevious = 0.5
    @Published var opacityNext = 1.0
    
    enum gameStatus: String {
        case locked = "LOCKED"
        case start = "START"
    }
    
    var statusOfGame = [gameStatus.start,
                        gameStatus.start,
                        gameStatus.start,
                        gameStatus.locked,
                        gameStatus.locked,
                        gameStatus.locked]
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func previousStage() {
        currentIndex = currentIndex - 1
        disableButton()
    }
    
    func nextStage() {
        currentIndex = currentIndex + 1
        disableButton()
    }
    
    func goTo() {
        if currentIndex == 0 {
            isFirstStageAvailible = true
        } else if currentIndex == 1 {
            isSecondStageAvailible = true
        } else {
            isThirdStageAvailible = true
        }
    }
    
    func disableButton() {
        if currentIndex == 0 {
            isPreviousButtonDisabled = true
            opacityPrevious = 0.5
        } else  if currentIndex == 5 {
            isNextButtonDisabled = true
            opacityNext = 0.5
        } else {
            isNextButtonDisabled = false
            isPreviousButtonDisabled = false
            opacityNext = 1.0
            opacityPrevious = 1.0
        }
    }
    
    func isPlayButtonActive() -> Bool {
        if statusOfGame[currentIndex] == gameStatus.start {
            return false
        } else {
            return true
        }
    }
    
    func isLockedStage() -> String {
        if statusOfGame[currentIndex] == gameStatus.start {
            return ImageName.playButton.rawValue
        } else {
            return ImageName.lockedImage.rawValue
        }
    }
}
