import SwiftUI

struct ThirdStageView: View {
    @StateObject var thirdStageViewModel = ThirdStageViewModel()
    var body: some View {
        ZStack {
            Image(ImageName.thirdGameBackground.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    CustomSquareButton(foregroundImage: ImageName.backArrowImage.rawValue,
                                       backroundImage: ImageName.backgroundSquareButton.rawValue,
                                       sizeBackgroundY: 65,
                                       sizeBackgroundX: 65,
                                       sizeForegroundY: 46,
                                       sizeForegroundX: 46,
                                       offsetY: 0,
                                       offsetX: 10,
                                       buttonAction: thirdStageViewModel.goToStage)
                    Spacer()
                }
                Spacer()
            }
            LevelButton(image: thirdStageViewModel.imageFor(number: 21),
                        text: "21",offsetX: -120,
                        offsetY: UIScreen.main.bounds.height / 2.4,
                        action: thirdStageViewModel.goToGame)
        
            LevelButton(image: thirdStageViewModel.imageFor(number: 22),
                        text: "22",
                        offsetX: 20,
                        offsetY: UIScreen.main.bounds.height / 2.7,
                        action: thirdStageViewModel.goToGame)
            LevelButton(image: thirdStageViewModel.imageFor(number: 23),
                        text: "23",
                        offsetX: 40,
                        offsetY: UIScreen.main.bounds.height / 4.1,
                        action: thirdStageViewModel.goToGame)
            LevelButton(image: thirdStageViewModel.imageFor(number: 24),
                        text: "24",
                        offsetX: -70,
                        offsetY: UIScreen.main.bounds.height / 5.4,
                        action: thirdStageViewModel.goToGame)
            LevelButton(image: thirdStageViewModel.imageFor(number: 25),
                        text: "25",
                        offsetX: -70,
                        offsetY: UIScreen.main.bounds.height / 11.0,
                        action: thirdStageViewModel.goToGame)
            LevelButton(image: thirdStageViewModel.imageFor(number: 26),
                        text: "26",
                        offsetX: 40,
                        offsetY: UIScreen.main.bounds.height / 24.4,
                        action: thirdStageViewModel.goToGame)
      
            LevelButton(image: thirdStageViewModel.imageFor(number: 27),
                        text: "27",
                        offsetX: -45,
                        offsetY: UIScreen.main.bounds.height / -16.4,
                        action: thirdStageViewModel.goToGame)
            
            LevelButton(image: thirdStageViewModel.imageFor(number: 28),
                        text: "28",
                        offsetX: 70,
                        offsetY: UIScreen.main.bounds.height / -8.9,
                        action: thirdStageViewModel.goToGame)
            
            LevelButton(image: thirdStageViewModel.imageFor(number: 29),
                        text: "29",
                        offsetX: 10,
                        offsetY: UIScreen.main.bounds.height / -5.5,
                        action: thirdStageViewModel.goToGame)
            
            LevelButton(image: thirdStageViewModel.imageFor(number: 30),
                        text: "30",
                        offsetX: -25,
                        offsetY: UIScreen.main.bounds.height / -3.5,
                        action: thirdStageViewModel.goToGame)
            
     
           
        }
        .navigationDestination(isPresented: $thirdStageViewModel.isStageAvailible) {
            StageView()
        }
        
        .navigationDestination(isPresented: $thirdStageViewModel.isGameAvailible) {
            TutorialOrGameView()
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ThirdStageView()
}
