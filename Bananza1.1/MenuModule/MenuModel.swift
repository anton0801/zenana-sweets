import Foundation

public enum ImageName: String {
    case menuBackground = "menuBackground"
    case backgroundSquareButton = "backgroundSquareButton"
    case settingsButton = "settingsButton"
    case cupImage = "cupImage"
    case woman = "woman"
    case backgroundRectangleButton = "backgroundRectangleButton"
    case playButton = "playButton"
    case pinkCircleBackround = "pinkCircleBackround"
    case menuBackgroundDark = "menuBackgroundDark"
    case backArrowImage = "backArrowImage"
    case previousButton = "previousButton"
    case nextButton = "nextButton"
    case firstGameBackground = "game1"
    case secondGameBackground = "game2"
    case thirdGameBackground = "game3"
    case lockedImage = "lockedImage"
    case candy = "candy"
    case lockedLevel = "lockedLevel"
    case currentLevel = "currentLevel"
    case doneLevel = "doneLevel"
    case gameDarkImage = "gameDarkImage"
    case nextArrowImage = "nextArrowImage"
    case pauseImage = "pauseImage"
    case purpleBlock = "purpleBlock"
    case addMoveImage = "addMoveImage"
    case stepBackImage = "stepBackImage"
    case firstStage = "firstStage"
    case secondStage = "secondStage"
    case thirdStage = "thirdStage"
    case fourthStage = "fourthStage"
    case fifthStage = "fifthStage"
    case sixthStage = "sixthStage"
    case loseWoman = "loseWoman"
}

public enum BlockSize: CGFloat {
    case purpleXScale = 0.12
    case purpleYScale = 0.2
    case horizontalBlockXScale = 0.52
    case horizontalBlockYScale = 0.5
    case smallBlockXScale = 0.35
    case smallBlockYScale = 0.55
}



struct MenuModel {
    let play = "PLAY"
    let shop = "SHOP"
    let zeroValue: CGFloat = 0
    let sizeSquareButton: CGFloat = 65
    let sizeForegroundSquareButton: CGFloat = 46
    let sizeBackgroundY: CGFloat = 99
    let offsetPlayButton: CGFloat = -99
    let sizeBackgroundX: CGFloat = 298
    let sizeSquareBackgroundY: CGFloat = 118
    let sizeSquareBackgroundX: CGFloat = 139
    let rectangleOffset: CGFloat = 20
}
