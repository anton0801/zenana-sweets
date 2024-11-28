import SwiftUI

struct MenuView: View {
    @StateObject private var menuViewModel = MenuViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(ImageName.menuBackground.rawValue)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        CustomSquareButton(foregroundImage: ImageName.settingsButton.rawValue,
                                           backroundImage: ImageName.backgroundSquareButton.rawValue,
                                           sizeBackgroundY: menuViewModel.contact.sizeSquareButton,
                                           sizeBackgroundX: menuViewModel.contact.sizeSquareButton,
                                           sizeForegroundY: menuViewModel.contact.sizeForegroundSquareButton,
                                           sizeForegroundX: menuViewModel.contact.sizeForegroundSquareButton,
                                           offsetY: menuViewModel.contact.zeroValue,
                                           offsetX: menuViewModel.contact.zeroValue,
                                           buttonAction: menuViewModel.openSettings)
                        Spacer()
                        CustomSquareButton(foregroundImage: ImageName.cupImage.rawValue,
                                           backroundImage: ImageName.backgroundSquareButton.rawValue,
                                           sizeBackgroundY: menuViewModel.contact.sizeSquareButton,
                                           sizeBackgroundX: menuViewModel.contact.sizeSquareButton,
                                           sizeForegroundY: menuViewModel.contact.sizeForegroundSquareButton,
                                           sizeForegroundX: menuViewModel.contact.sizeForegroundSquareButton,
                                           offsetY: menuViewModel.contact.zeroValue,
                                           offsetX: menuViewModel.contact.zeroValue,
                                           buttonAction: menuViewModel.openRecords)
                    }
                    .padding()
                    Spacer()
                    
                    VStack {
                        Image(ImageName.woman.rawValue)
                            .resizable()
                        VStack(spacing: -5) {
                            ZStack {
                                CustomRectangleButton(backroundImage: ImageName.backgroundRectangleButton.rawValue,
                                                      label: menuViewModel.contact.play,
                                                      sizeBackgroundY: menuViewModel.contact.sizeBackgroundY,
                                                      sizeBackgroundX: menuViewModel.contact.sizeBackgroundX,
                                                      offsetY: menuViewModel.contact.zeroValue,
                                                      offsetX: menuViewModel.contact.rectangleOffset,
                                                      buttonAction: menuViewModel.playGame, sizeForText: 42)
                                
                                CustomSquareButton(foregroundImage: ImageName.playButton.rawValue,
                                                   backroundImage: ImageName.pinkCircleBackround.rawValue,
                                                   sizeBackgroundY: menuViewModel.contact.sizeSquareBackgroundY,
                                                   sizeBackgroundX: menuViewModel.contact.sizeSquareBackgroundX,
                                                   sizeForegroundY: menuViewModel.contact.sizeSquareButton,
                                                   sizeForegroundX: menuViewModel.contact.sizeSquareButton,
                                                   offsetY: menuViewModel.contact.zeroValue,
                                                   offsetX: menuViewModel.contact.offsetPlayButton,
                                                   buttonAction: menuViewModel.playGame)
                            }
                            
                            CustomRectangleButton(backroundImage: ImageName.backgroundRectangleButton.rawValue,
                                                  label: menuViewModel.contact.shop,
                                                  sizeBackgroundY: menuViewModel.contact.sizeBackgroundY,
                                                  sizeBackgroundX: menuViewModel.contact.sizeBackgroundX,
                                                  offsetY: menuViewModel.contact.zeroValue,
                                                  offsetX: menuViewModel.contact.zeroValue,
                                                  buttonAction: menuViewModel.openShop, sizeForText: 42)
                        }
                        .offset(x: 0, y: -30)
                    }
                }
            }
            .navigationDestination(isPresented: $menuViewModel.isPlayAvailible) {
                StageView()
            }
            
            .navigationDestination(isPresented: $menuViewModel.isShopAvailible) {
                ShopView()
            }
            
            .navigationDestination(isPresented: $menuViewModel.isTaskAvailible) {
                TaskView()
            }
            
            .navigationDestination(isPresented: $menuViewModel.isSettingsAvailible) {
                SettingsView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MenuView()
}



