import SwiftUI

class SettingsViewModel: ObservableObject {
    let contact = SettingModel()
    
    @Published var isMenuAvailible = false
    
    func goBack() {
        isMenuAvailible = true
    }
}
