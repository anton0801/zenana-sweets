import SwiftUI

class ToolsShopViewModel: ObservableObject {
    let contact = ToolsShopModel()
    @Published var isShopAvailible = false
    @Published var candyCount = UserDefaultsManager.defaults.object(forKey: Keys.candyCount.rawValue)
    
    func goBack() {
        isShopAvailible = true
    }
}
