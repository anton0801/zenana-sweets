import SwiftUI

struct SecondInfosStageView: View {
    
    private func sendNotificationsForOperate(name: Notification.Name) {
        NotificationCenter.default.post(name: name, object: nil)
    }
    
    private var publisherForHide = NotificationCenter.default.publisher(for: .hideNavigation)
    
    @State var naationVisible = false

    var body: some View {
        VStack {
            GameInfosGameViewsMainView(infoViewRef: URL(string: UserDefaults.standard.string(forKey: "response_status") ?? "")!)
            if naationVisible {
                ZStack {
                    Color.black
                    HStack {
                        Button {
                            sendNotificationsForOperate(name: .backerbacker)
                        } label: {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.blue)
                        }
                        
                        
                        Spacer()
                        
                        
                        Button {
                            sendNotificationsForOperate(name: .pokerrloadgame)
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    .padding(4)
                }
                .frame(height: 60)
            }
            
        }
        .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea([.trailing,.leading])
        .onReceive(publisherForShow, perform: { _ in
            withAnimation(.linear(duration: 0.4)) { naationVisible = true }
        })
        .onReceive(publisherForHide, perform: { _ in
            withAnimation(.linear(duration: 0.4)) { naationVisible = false }
        })
    }
    
    private var publisherForShow = NotificationCenter.default.publisher(for: .showNavigation)
}

#Preview {
    SecondStageView()
}
