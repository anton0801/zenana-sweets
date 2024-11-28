import SwiftUI

struct TutorialView: View {
    @State var currentIndex = 0
    @State private var isLinkVisible = false
    var tutorialArrayImage = ["pic1","pic2","pic3","pic4","pic5","pic6"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(tutorialArrayImage[currentIndex])
                    .resizable()
                    .ignoresSafeArea()
                
                ZStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            currentIndex = currentIndex + 1
                            if currentIndex == 5 {
                                isLinkVisible = true
                            }
                        }) {
                            Image("clearImage")
                                .resizable()
                                .ignoresSafeArea()
                        }
                        .frame(width: 393, height: 852)
                        
                    }
                }
                
                if isLinkVisible {
                    NavigationLink(destination: GameView()) {
                        Text("perehod")
                            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                            .foregroundColor(.clear)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TutorialView()
}
