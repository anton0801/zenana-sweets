import SwiftUI

struct BlockShopModel {
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 150))]
    let items = Array(1...4)
    let imageOfCell = ["purpleBlock", "greenBlock", "yellowBlock", "blueBlock"]
    let nameOfCell = ["CLASSIC BLOCKS", "EMERALD BLOCKS", "GOLD BLOCKS", "WATER BLOCKS"]
    let selectedBlocks = ["SELECTED", "BUY", "BUY", "BUY"]
    let colorOfLowLabel = [Color(#colorLiteral(red: 151/255, green: 203/255, blue: 149/255, alpha: 1)), Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)), Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)), Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1))]
    var arrayOfByedBlocks = [false, true, true, true]
    let shopTitle = "SHOP"
}
