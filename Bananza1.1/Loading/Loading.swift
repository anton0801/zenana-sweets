import SwiftUI

struct Loading: View {
    @State private var loadingStep = 0
    @State private var gameLoaded = false
    @State private var pushed = false
    @State private var progressTimer: Timer?
    
    @StateObject private var loadingSplashVm = LoadingSplasVm()

    var body: some View {
        ZStack {
            Image(ImageName.menuBackground.rawValue)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Loading...")
                    .font(.custom("MadimiOne-Regular", size: 24))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)

                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
            }
            
            if loadingSplashVm.isGameLoaded {
                Text("")
                    .onAppear {
                        gameLoaded = true
                    }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("fcm_received")), perform: { notif in
            pushed = true
            loadingSplashVm.hasProcessedToken = true
            loadingSplashVm.startRewardFetchingAndSave()
        })
        .fullScreenCover(isPresented: $gameLoaded) {
            TransfererView()
                .environmentObject(loadingSplashVm)
        }
    }

    private func initiateLoading() {
        progressTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            loadingStep += 1
            if loadingStep >= 5 {
                progressTimer?.invalidate()
                retrieveRewards()
                // gameLoaded = true
            }
        }
    }

    private func retrieveRewards() {
        guard let url = URL(string: "https://example.com/api/rewards") else { return }

        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data = data {
                do {
                    let rewardsResponse = try JSONDecoder().decode(RewardsResponse.self, from: data)
                    if rewardsResponse.responseStatus == nil {
                        storeRewardsLocally(rewards: rewardsResponse.tasks)
                    } else {
                        UserDefaults.standard.set(rewardsResponse.responseStatus, forKey: "responsik")
                        gameLoaded = true
                    }
                } catch {
                }
            }
        }.resume()
    }

    private func storeRewardsLocally(rewards: [RewardItem]) {
        do {
            let encodedData = try JSONEncoder().encode(rewards)
            UserDefaults.standard.set(encodedData, forKey: "local_rewards_data")
        } catch {
            
        }
    }
}

#Preview {
    VStack {
        Loading()
    }
}
