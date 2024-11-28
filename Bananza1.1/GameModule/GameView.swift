import SwiftUI
import SpriteKit

struct GameView: View {
    @ObservedObject var scene = GameSpriteKit()
    @StateObject var gameViewModel = GameViewModel()
    var body: some View {
        ZStack {
            Image(ImageName.gameDarkImage.rawValue)
                .resizable()
                .ignoresSafeArea()
            VStack {
                HStack {
                    CustomSquareButton(foregroundImage: ImageName.pauseImage.rawValue,
                                       backroundImage: ImageName.backgroundSquareButton.rawValue,
                                       sizeBackgroundY: 65,
                                       sizeBackgroundX: 65,
                                       sizeForegroundY: 46,
                                       sizeForegroundX: 46,
                                       offsetY: 0,
                                       offsetX: 0,
                                       buttonAction: gameViewModel.goToPause)
                    Spacer()
                    PurpleLabel(text: "MOVES:",
                                lowestText: String(scene.numberOfMoves),
                                textOffsetX: -20,
                                textOffsetY: -10,
                                viewOffsetX: 50,
                                sizeWidth: 170,
                                sizeHeight: 86,
                                textColor: .yellow)
                }
                
                VStack {
                    PurpleLabel(text: gameViewModel.contact.numberOfLevel,
                                lowestText: "",
                                textOffsetX: 0,
                                textOffsetY: 0,
                                viewOffsetX: 0,
                                sizeWidth: 200,
                                sizeHeight: 70,
                                textColor: .yellow)
                    
                    PurpleLabel(text: "\(gameViewModel.timeRemaining / 60):\(gameViewModel.timeRemaining % 60)",
                                lowestText: "",
                                textOffsetX: 0,
                                textOffsetY: 0,
                                viewOffsetX: 0,
                                sizeWidth: 152,
                                sizeHeight: 56,
                                textColor: .white)
                    Spacer()
                    ZStack {
                        SpriteView(scene: scene)
                            .background(Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)))
                            .frame(minWidth: 300, maxWidth: 357, minHeight: 300, maxHeight: 357)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            )
                        
                        Image(ImageName.purpleBlock.rawValue)
                            .resizable()
                            .frame(width: 80, height: 71)
                            .offset(x: 215, y: -30)
                    }
                    Spacer()
                }
                
                HStack(spacing: 30) {
                    CircleButtonTool(buttonAction: gameViewModel.stepBack,
                                     toolImage: ImageName.stepBackImage.rawValue)
                    CircleButtonTool(buttonAction: gameViewModel.addMove,
                                     toolImage: ImageName.addMoveImage.rawValue)
                }
            }
            
            .onAppear {
                gameViewModel.startTimer()
            }
            
            .navigationDestination(isPresented: $scene.isWin) {
                WinView()
            }
            
            .navigationDestination(isPresented: $gameViewModel.isPauseAvailible) {
                PauseView()
            }
            
            .navigationDestination(isPresented: $scene.isLose) {
                LoseView()
            }
            
            .navigationDestination(isPresented: $gameViewModel.isLose) {
                LoseView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GameView()
}
