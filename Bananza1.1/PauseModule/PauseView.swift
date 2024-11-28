import SwiftUI

struct PauseView: View {
    @StateObject var pauseViewModel = PauseViewModel()
    var body: some View {
        ZStack {
            Image(ImageName.menuBackgroundDark.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 40) {
                    Text(pauseViewModel.contact.pause)
                        .Madimi(size: 42, color: .yellow)
                    
                    Text(pauseViewModel.contact.gamePaused)
                        .Madimi(size: 24, color: .white)
                }
                
                CustomRectangleButton(backroundImage: ImageName.backgroundRectangleButton.rawValue,
                                      label: pauseViewModel.contact.resume,
                                      sizeBackgroundY: pauseViewModel.contact.sizeBackgroundY,
                                      sizeBackgroundX: pauseViewModel.contact.sizeBackgroundX,
                                      offsetY: pauseViewModel.contact.zeroValue,
                                      offsetX: pauseViewModel.contact.zeroValue,
                                      buttonAction: pauseViewModel.resumeGame,
                                      sizeForText: 42)
                
                HStack {
                    CustomRectangleButton(backroundImage: ImageName.backgroundRectangleButton.rawValue,
                                          label: pauseViewModel.contact.restart,
                                          sizeBackgroundY: pauseViewModel.contact.sizeBackgroundY,
                                          sizeBackgroundX: pauseViewModel.contact.sizeBackgroundXForDoubleButton,
                                          offsetY: pauseViewModel.contact.zeroValue,
                                          offsetX: pauseViewModel.contact.zeroValue,
                                          buttonAction: pauseViewModel.goToRestart,
                                          sizeForText: 26)
                    
                    CustomRectangleButton(backroundImage: ImageName.backgroundRectangleButton.rawValue,
                                          label: pauseViewModel.contact.menu,
                                          sizeBackgroundY: pauseViewModel.contact.sizeBackgroundY,
                                          sizeBackgroundX: pauseViewModel.contact.sizeBackgroundXForDoubleButton,
                                          offsetY: pauseViewModel.contact.zeroValue,
                                          offsetX: pauseViewModel.contact.zeroValue,
                                          buttonAction: pauseViewModel.goToMenu,
                                          sizeForText: 32)
                }
                
                Image(ImageName.firstStage.rawValue)
                    .resizable()
                    .frame(minWidth: UIScreen.main.bounds.width / 1.5,
                           maxWidth: UIScreen.main.bounds.width / 1.3,
                           minHeight: UIScreen.main.bounds.height / 3,
                           maxHeight: UIScreen.main.bounds.height / 2.5)
            }
        }
        
        .navigationDestination(isPresented: $pauseViewModel.isMenuAvailible) {
            MenuView()
        }
        
        .navigationDestination(isPresented: $pauseViewModel.isRestartAvailible) {
            GameView()
        }
        
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    PauseView()
}
