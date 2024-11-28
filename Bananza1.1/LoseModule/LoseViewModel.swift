import SwiftUI

class LoseViewModel: ObservableObject {
    let contact = LoseModel()
    @Published var isShopAvailible = false
    @Published var isRestartAvailible = false
    @Published var isMenuAvailible = false
    @Published var timer: Timer?
    @Published var timeRemaining = 120
    
    func goToShop() {
        isShopAvailible = true
    }
    
    func goToRestart() {
        isRestartAvailible = true
    }
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
 
}
