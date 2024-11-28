import SwiftUI

class ShopViewModel: ObservableObject {
    let contact = ShopModel()
    @Published var isMenuAvailible = false
    @Published var isBlocksShopAvailible = false
    @Published var isToolShopAvailible = false
    @Published var candyCount = UserDefaultsManager.defaults.object(forKey: Keys.candyCount.rawValue)
    
    func goBack() {
        isMenuAvailible = true
    }
    
    func goTo(index: Int) {
        if index == 0 {
            isBlocksShopAvailible = true
        } else {
            isToolShopAvailible = true
        }
    }
}
