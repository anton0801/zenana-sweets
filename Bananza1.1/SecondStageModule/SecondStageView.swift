import SwiftUI

struct SecondStageView: View {
    @StateObject var secondStageViewModel = SecondStageViewModel()
    var body: some View {
        ZStack {
            Image(ImageName.secondGameBackground.rawValue)
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
                                       buttonAction: secondStageViewModel.goToStage)
                    Spacer()
                }
                Spacer()
            }
            LevelButton(image: secondStageViewModel.imageFor(number: 9),
                        text: "9",
                        offsetX: -20,
                        offsetY: UIScreen.main.bounds.height / 2.4,
                        action: secondStageViewModel.goToGame)
        
            LevelButton(image: secondStageViewModel.imageFor(number: 10),
                        text: "10",
                        offsetX: 30,
                        offsetY: UIScreen.main.bounds.height / 3.3,
                        action: secondStageViewModel.goToGame)
            LevelButton(image: secondStageViewModel.imageFor(number: 11),
                        text: "11",
                        offsetX: -90,
                        offsetY: UIScreen.main.bounds.height / 4.3,
                        action: secondStageViewModel.goToGame)
            LevelButton(image: secondStageViewModel.imageFor(number: 12),
                        text: "12",
                        offsetX: 20,
                        offsetY: UIScreen.main.bounds.height / 6.4,
                        action: secondStageViewModel.goToGame)
            LevelButton(image: secondStageViewModel.imageFor(number: 13),
                        text: "13",
                        offsetX: 90,
                        offsetY: UIScreen.main.bounds.height / 10.4,
                        action: secondStageViewModel.goToGame)
            LevelButton(image: secondStageViewModel.imageFor(number: 14),
                        text: "14",
                        offsetX: -20,
                        offsetY: UIScreen.main.bounds.height / 38.4,
                        action: secondStageViewModel.goToGame)
      
            LevelButton(image: secondStageViewModel.imageFor(number: 15),
                        text: "15",
                        offsetX: -100,
                        offsetY: UIScreen.main.bounds.height / -28.4,
                        action: secondStageViewModel.goToGame)
            
            LevelButton(image: secondStageViewModel.imageFor(number: 16),
                        text: "16",
                        offsetX: -40,
                        offsetY: UIScreen.main.bounds.height / -8.9,
                        action: secondStageViewModel.goToGame)
            
            LevelButton(image: secondStageViewModel.imageFor(number: 17),
                        text: "17",
                        offsetX: 40,
                        offsetY: UIScreen.main.bounds.height / -6,
                        action: secondStageViewModel.goToGame)
            
            LevelButton(image: secondStageViewModel.imageFor(number: 18),
                        text: "18",
                        offsetX: -10,
                        offsetY: UIScreen.main.bounds.height / -4.5,
                        action: secondStageViewModel.goToGame)
            
            LevelButton(image: secondStageViewModel.imageFor(number: 19),
                        text: "19",
                        offsetX: 50,
                        offsetY: UIScreen.main.bounds.height / -3.5,
                        action: secondStageViewModel.goToGame)
            
            LevelButton(image: secondStageViewModel.imageFor(number: 20),
                        text: "20",
                        offsetX: -30,
                        offsetY: UIScreen.main.bounds.height / -3.0,
                        action: secondStageViewModel.goToGame)
           
        }
        .navigationDestination(isPresented: $secondStageViewModel.isStageAvailible) {
            StageView()
        }
        
        .navigationDestination(isPresented: $secondStageViewModel.isGameAvailible) {
            TutorialOrGameView()
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SecondStageView()
}
