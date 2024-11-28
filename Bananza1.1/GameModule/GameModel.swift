import SwiftUI

struct GameModel {
    let numberOfLevel = "LEVEL \(UserDefaultsManager.defaults.object(forKey: Keys.firstStageLevelDone.rawValue) ?? 0)"
}
