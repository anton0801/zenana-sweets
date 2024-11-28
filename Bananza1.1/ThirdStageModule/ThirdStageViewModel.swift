import SwiftUI

class ThirdStageViewModel: ObservableObject {
    let contact = ThirdStageModel()
    @Published var isStageAvailible = false
    @Published var isGameAvailible = false
    
    func goToStage() {
        isStageAvailible = true
    }
    
    func goToGame() {
        isGameAvailible = true
    }
    
    func imageFor(number: Int) -> String {
        var imageString = ""
        let currentLevel = UserDefaultsManager.defaults.object(forKey: Keys.firstStageLevelDone.rawValue) as? Int ?? 0
        if currentLevel == number {
            imageString = ImageName.currentLevel.rawValue
        } else if currentLevel > number {
            imageString = ImageName.doneLevel.rawValue
        } else if currentLevel < number {
            imageString = ImageName.lockedLevel.rawValue
        }
        return imageString
    }
}


