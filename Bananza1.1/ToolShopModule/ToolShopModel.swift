import SwiftUI

struct ToolsShopModel {
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 150))]
    let items = Array(1...2)
    let imageOfCell = ["stepBackImage", "addMoveImage"]
    let nameOfCell = ["Step Back", "Add Move"]
    let buyLabel = "BUY"
    let shopLabel = "SHOP"
}
