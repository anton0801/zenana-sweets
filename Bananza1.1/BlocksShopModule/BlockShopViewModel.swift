import SwiftUI

class BlockShopViewModel: ObservableObject {
    let contact = BlockShopModel()
    @Published var isShopAvailible = false
    @Published var candyCount = UserDefaultsManager.defaults.object(forKey: Keys.candyCount.rawValue)
    
    func goBack() {
        isShopAvailible = true
    }
}
