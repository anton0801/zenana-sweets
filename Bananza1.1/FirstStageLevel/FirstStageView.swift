import SwiftUI

struct FirstStageLevel: View {
    @StateObject var firstStageViewModel = FirstStageViewModel()
    
   
    var body: some View {
        ZStack {
            Image(ImageName.firstGameBackground.rawValue)
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
                                       buttonAction: firstStageViewModel.goToStage)
                    Spacer()
                }
                Spacer()
            }
            LevelButton(image: firstStageViewModel.imageFor(number: 8),
                        text: "8",
                        offsetX: 50,
                        offsetY: UIScreen.main.bounds.height / -4.9,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 7),
                        text: "7",
                        offsetX: 30,
                        offsetY: UIScreen.main.bounds.height / -8.4,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 1),
                        text: "1",offsetX: -70,
                        offsetY: UIScreen.main.bounds.height / 2.4,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 2),
                        text: "2",
                        offsetX: -50,
                        offsetY: UIScreen.main.bounds.height / 3.3,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 3),
                        text: "3",
                        offsetX: 10,
                        offsetY: UIScreen.main.bounds.height / 5.3,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 4),
                        text: "4",
                        offsetX: -90,
                        offsetY: UIScreen.main.bounds.height / 6.4,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 5),
                        text: "5",
                        offsetX: -30,
                        offsetY: UIScreen.main.bounds.height / 20.4,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 6),
                        text: "6",
                        offsetX: 30,
                        offsetY: UIScreen.main.bounds.height / -38.4,
                        action: firstStageViewModel.goToGame)
      
           
        }
        .navigationDestination(isPresented: $firstStageViewModel.isStageAvailible) {
            StageView()
        }
        
        .navigationDestination(isPresented: $firstStageViewModel.isGameAvailible) {
            TutorialOrGameView()
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FirstStageLevel()
}
