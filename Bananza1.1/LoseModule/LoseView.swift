import SwiftUI

struct LoseView: View {
    @StateObject var loseViewModel = LoseViewModel()
    var body: some View {
        ZStack {
            Image(ImageName.menuBackgroundDark.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 40) {
                    Text(loseViewModel.contact.gameOver)
                        .Madimi(size: 42, color: .yellow)
                    
                    Text(loseViewModel.contact.girlTrouble)
                        .Madimi(size: 24, color: .white)
                    Spacer()
                }
             
                CustomRectangleButton(backroundImage: ImageName.backgroundRectangleButton.rawValue,
                                      label: loseViewModel.contact.restart,
                                      sizeBackgroundY: loseViewModel.contact.sizeBackgroundY,
                                      sizeBackgroundX: loseViewModel.contact.sizeBackgroundX,
                                      offsetY: loseViewModel.contact.zeroValue,
                                      offsetX: loseViewModel.contact.zeroValue,
                                      buttonAction: loseViewModel.goToRestart,
                                      sizeForText: 42)
              
                HStack {
                    CustomRectangleButton(backroundImage: ImageName.backgroundRectangleButton.rawValue,
                                          label: loseViewModel.contact.shop,
                                          sizeBackgroundY: loseViewModel.contact.sizeBackgroundY,
                                          sizeBackgroundX: loseViewModel.contact.sizeBackgroundXForDoubleButton,
                                          offsetY: loseViewModel.contact.zeroValue,
                                          offsetX: loseViewModel.contact.zeroValue,
                                          buttonAction: loseViewModel.goToShop,
                                          sizeForText: 26)
                    
                    CustomRectangleButton(backroundImage: ImageName.backgroundRectangleButton.rawValue,
                                          label: loseViewModel.contact.menu,
                                          sizeBackgroundY: loseViewModel.contact.sizeBackgroundY,
                                          sizeBackgroundX: loseViewModel.contact.sizeBackgroundXForDoubleButton,
                                          offsetY: loseViewModel.contact.zeroValue,
                                          offsetX: loseViewModel.contact.zeroValue,
                                          buttonAction: loseViewModel.goToMenu,
                                          sizeForText: 32)
                }
                
                Image(ImageName.loseWoman.rawValue)
                    .resizable()
                    .frame(minWidth: UIScreen.main.bounds.width / 1.5,
                           maxWidth: UIScreen.main.bounds.width / 1.3,
                           minHeight: UIScreen.main.bounds.height / 3,
                           maxHeight: UIScreen.main.bounds.height / 2.3)
                    .offset(y: 40)
            }
        }
        
        .navigationDestination(isPresented: $loseViewModel.isMenuAvailible) {
            MenuView()
        }
        
        .navigationDestination(isPresented: $loseViewModel.isShopAvailible) {
            ShopView()
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoseView()
}
