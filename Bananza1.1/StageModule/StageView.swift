import SwiftUI

struct StageView: View {
    @StateObject private var stageViewModel = StageViewModel()
    
    var body: some View {
        ZStack {
            Image(ImageName.menuBackgroundDark.rawValue)
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
                                       offsetX: 0,
                                       buttonAction: stageViewModel.goToMenu)
                    Spacer()
                    Text(stageViewModel.contact.selectStage)
                        .Madimi(size: 42, color: .white)
                        .frame(minWidth: 100, maxWidth: 140, minHeight: 50, maxHeight: 120)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .offset(x: -30, y: 20)
                    Spacer()
                }
                .padding()
                
                Text("\(stageViewModel.contact.stage) \(stageViewModel.currentIndex + 1)")
                    .Madimi(size: 50, color: .white)
                    .minimumScaleFactor(0.5)
                
                ZStack {
                    Image(stageViewModel.contact.arrayOfStageImage[stageViewModel.currentIndex])
                        .resizable()
                        .frame(minWidth: 156, maxWidth: 306, minHeight: 186, maxHeight: 306)
                    
                    CustomSquareButton(foregroundImage: stageViewModel.isLockedStage(),
                                       backroundImage: ImageName.pinkCircleBackround.rawValue,
                                       sizeBackgroundY: 92,
                                       sizeBackgroundX: 110,
                                       sizeForegroundY: 46,
                                       sizeForegroundX: 46,
                                       offsetY: 0,
                                       offsetX: 0,
                                       buttonAction: stageViewModel.goTo)
                    .offset(y: 103)
                    .disabled(stageViewModel.isPlayButtonActive())
                    
                }
                
                VStack {
                    
                    Text(stageViewModel.contact.arrayOfStageName[stageViewModel.currentIndex])
                        .Madimi(size: 42, color: .yellow)
                        .offset(y: 10)
                    
                    HStack(spacing: 50) {
                        CustomSquareButton(foregroundImage: ImageName.previousButton.rawValue,
                                           backroundImage: ImageName.backgroundSquareButton.rawValue,
                                           sizeBackgroundY: 82,
                                           sizeBackgroundX: 82,
                                           sizeForegroundY: 36,
                                           sizeForegroundX: 60,
                                           offsetY: 0,
                                           offsetX: -0,
                                           buttonAction: stageViewModel.previousStage)
                        .disabled(stageViewModel.isPreviousButtonDisabled)
                        .opacity(stageViewModel.opacityPrevious)
                        
                        CustomSquareButton(foregroundImage: ImageName.nextButton.rawValue,
                                           backroundImage: ImageName.backgroundSquareButton.rawValue,
                                           sizeBackgroundY: 82,
                                           sizeBackgroundX: 82,
                                           sizeForegroundY: 36,
                                           sizeForegroundX: 60,
                                           offsetY: 0,
                                           offsetX: 0,
                                           buttonAction: stageViewModel.nextStage)
                        .disabled(stageViewModel.isNextButtonDisabled)
                        .opacity(stageViewModel.opacityNext)
                    }
                }
                Spacer()
            }
            .navigationDestination(isPresented: $stageViewModel.isMenuAvailible) {
                MenuView()
            }
            
            .navigationDestination(isPresented: $stageViewModel.isFirstStageAvailible) {
                FirstStageLevel()
            }
            
            .navigationDestination(isPresented: $stageViewModel.isSecondStageAvailible) {
                SecondStageView()
            }
            
            .navigationDestination(isPresented: $stageViewModel.isThirdStageAvailible) {
                ThirdStageView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StageView()
}
