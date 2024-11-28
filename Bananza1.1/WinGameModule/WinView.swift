import SwiftUI

struct WinView: View {
    @StateObject var winViewModel = WinViewModel()
    var body: some View {
        ZStack {
            Image(ImageName.menuBackgroundDark.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text(winViewModel.contact.youWin)
                    .Madimi(size: 42, color: .yellow)
                
                Text(winViewModel.contact.youHelped)
                    .Madimi(size: 24, color: .yellow)
                
                BalanceOfCandy(countOfCandy: "+ 20")
                
                ZStack {
                    CustomRectangleButton(backroundImage: ImageName.backgroundRectangleButton.rawValue,
                                          label: winViewModel.contact.next,
                                          sizeBackgroundY: winViewModel.contact.sizeBackgroundY,
                                          sizeBackgroundX: winViewModel.contact.sizeBackgroundX,
                                          offsetY: winViewModel.contact.zeroValue,
                                          offsetX: winViewModel.contact.rectangleOffset,
                                          buttonAction: winViewModel.goToNext,
                                          sizeForText: 42)
                    
                    CustomSquareButton(foregroundImage: ImageName.nextArrowImage.rawValue,
                                       backroundImage: ImageName.pinkCircleBackround.rawValue,
                                       sizeBackgroundY: winViewModel.contact.sizeSquareBackgroundY,
                                       sizeBackgroundX: winViewModel.contact.sizeSquareBackgroundX,
                                       sizeForegroundY: winViewModel.contact.sizeSquareButton,
                                       sizeForegroundX: winViewModel.contact.sizeSquareButton,
                                       offsetY: winViewModel.contact.zeroValue,
                                       offsetX: winViewModel.contact.offsetPlayButton,
                                       buttonAction: winViewModel.goToNext)
                }
                
                HStack {
                    CustomRectangleButton(backroundImage: ImageName.backgroundRectangleButton.rawValue,
                                          label: winViewModel.contact.restart,
                                          sizeBackgroundY: winViewModel.contact.sizeBackgroundY,
                                          sizeBackgroundX: winViewModel.contact.sizeBackgroundXForDoubleButton,
                                          offsetY: winViewModel.contact.zeroValue,
                                          offsetX: winViewModel.contact.zeroValue,
                                          buttonAction: winViewModel.goToRestart,
                                          sizeForText: 26)
                    
                    CustomRectangleButton(backroundImage: ImageName.backgroundRectangleButton.rawValue,
                                          label: winViewModel.contact.menu,
                                          sizeBackgroundY: winViewModel.contact.sizeBackgroundY,
                                          sizeBackgroundX: winViewModel.contact.sizeBackgroundXForDoubleButton,
                                          offsetY: winViewModel.contact.zeroValue,
                                          offsetX: winViewModel.contact.zeroValue,
                                          buttonAction: winViewModel.goToMenu,
                                          sizeForText: 32)
                }
                
                Image(ImageName.woman.rawValue)
                    .resizable()
                    .frame(minWidth: UIScreen.main.bounds.width / 1.5,
                           maxWidth: UIScreen.main.bounds.width / 1.3,
                           minHeight: UIScreen.main.bounds.height / 3,
                           maxHeight: UIScreen.main.bounds.height / 2.5)
                    .offset(y: 35)
            }
        }
        
        .navigationDestination(isPresented: $winViewModel.isMenuAvailible) {
            MenuView()
        }
        
        .navigationDestination(isPresented: $winViewModel.isNextAvailible) {
            let currentLevel = UserDefaultsManager.defaults.object(forKey: Keys.firstStageLevelDone.rawValue) as? Int ?? 0
            if currentLevel <= 8  {
                FirstStageLevel()
            } else if currentLevel >= 9, currentLevel < 21 {
                SecondStageView()
            } else if currentLevel >= 21, currentLevel < 31 {
                ThirdStageView()
            }
        }
        
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    WinView()
}
