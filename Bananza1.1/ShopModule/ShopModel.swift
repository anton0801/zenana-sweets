import SwiftUI

struct ShopModel {
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 150))]
    let items = Array(1...2)
    let titleOfCell = ["BLOCKS", "TOOLS"]
    let imageOfCell = ["blocks", "tools"]
    let imageHeight: [CGFloat] = [252,212]
    let offsetY: [CGFloat] = [-130,-110]
    let titleShop = "SHOP"
}
