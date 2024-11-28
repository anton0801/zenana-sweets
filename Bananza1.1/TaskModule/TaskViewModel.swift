import SwiftUI

class TaskViewModel: ObservableObject {
    let contact = TaskModel()
    @Published var isMenuAvailible = false
    @Published var candyCount = UserDefaultsManager.defaults.object(forKey: Keys.candyCount.rawValue)
    
    func goBack() {
        isMenuAvailible = true
    }
}
