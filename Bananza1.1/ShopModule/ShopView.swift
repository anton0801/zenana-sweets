import SwiftUI

struct ShopView: View {
    @StateObject private var shopViewModel = ShopViewModel()

    var body: some View {
        ZStack {
            Image(ImageName.menuBackgroundDark.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                BackButtonWithTitleView(action: shopViewModel.goBack,
                                        title: shopViewModel.contact.titleShop,
                                        offsetX: -32)
                BalanceOfCandy(countOfCandy: "\(shopViewModel.candyCount as? Int ?? 0)")
                Spacer()
                LazyVGrid(columns: shopViewModel.contact.columns, spacing: 35) {
                    ForEach(Array(shopViewModel.contact.items.enumerated()), id: \.1) { index, item in
                        ZStack {
                            Rectangle()
                                .fill(Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)))
                                .frame(width: 155, height: 244)
                                .opacity(0.7)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray, lineWidth: 0.5)
                                )
                            
                            ZStack {
                                Button(action: {
                                    shopViewModel.goTo(index: index)
                                }) {
                                    VStack(spacing: -10) {
                                        Image(shopViewModel.contact.imageOfCell[index])
                                            .resizable()
                                            .frame(width: 140, height: shopViewModel.contact.imageHeight[index])
                                            .cornerRadius(20)
                                        
                                        Text(shopViewModel.contact.titleOfCell[index])
                                            .Madimi(size: 27, color: .white)
                                            .frame(width: 100, height: 40)
                                    }
                                    .offset(y: shopViewModel.contact.offsetY[index])
                                }
                                .offset(y: 105)
                            }
                        }
                    }
                }
                .padding(20)
                Spacer(minLength: 210)
            }
            .navigationDestination(isPresented: $shopViewModel.isMenuAvailible) {
                MenuView()
            }
            
            .navigationDestination(isPresented: $shopViewModel.isBlocksShopAvailible) {
                BlocksShopView()
            }
            
            .navigationDestination(isPresented: $shopViewModel.isToolShopAvailible) {
                ToolsShopView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    ShopView()
}

struct BalanceOfCandy: View {
    var countOfCandy: String
    var body: some View {
        ZStack {
            Image("goldBackground")
                .resizable()
                .frame(width: 129, height: 51)
            
            Image("candy")
                .resizable()
                .frame(width: 76, height: 76)
                .offset(x: -45)
            
            Text(countOfCandy)
                .Madimi(size: 24, color: .pink)
                .offset(x: 10, y: 1)
        }
    }
}
