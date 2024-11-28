import Foundation

class MenuViewModel: ObservableObject {
    let contact = MenuModel()
    
    @Published var isPlayAvailible = false
    @Published var isSettingsAvailible = false
    @Published var isShopAvailible = false
    @Published var isTaskAvailible = false
    
    func openSettings() {
        isSettingsAvailible = true
    }
    
    func openRecords() {
        isTaskAvailible = true
    }
    
    func openShop() {
        isShopAvailible = true
    }
    
    func playGame() {
        isPlayAvailible = true
    }
}
