import Foundation

enum Keys: String {
    case firstStageLevelDone = "firstStageLevelDone"
    case candyCount = "candyCount"
    case isFirstLauchKey = "isFirstLauchKey"
}

class UserDefaultsManager {
    static let defaults = UserDefaults.standard
    
    func isFirstTime(isFirstLaunch: Bool) {
        if isFirstLaunch {
            UserDefaultsManager.defaults.set(true, forKey: Keys.isFirstLauchKey.rawValue)
        }
    }
    
    func firstLaunch() {
        if UserDefaultsManager.defaults.string(forKey: Keys.firstStageLevelDone.rawValue) == nil {
            UserDefaultsManager.defaults.set(1, forKey: Keys.firstStageLevelDone.rawValue)
            UserDefaultsManager.defaults.set(245, forKey: Keys.candyCount.rawValue)
        }
    }
    
    func completeLevel() {
        let currentFirst = UserDefaultsManager.defaults.object(forKey: Keys.firstStageLevelDone.rawValue) as? Int ?? 0
        if currentFirst < 31 {
            UserDefaultsManager.defaults.set(currentFirst + 1, forKey: Keys.firstStageLevelDone.rawValue)
        }
    }
    
    func addCandy() {
        let currentFirst = UserDefaultsManager.defaults.object(forKey: Keys.candyCount.rawValue) as? Int ?? 0
        UserDefaultsManager.defaults.set(currentFirst + 20, forKey: Keys.candyCount.rawValue)
    }
}

