import SwiftUI

struct ToolsShopView: View {
    @StateObject private var toolsShopViewModel = ToolsShopViewModel()

    var body: some View {
        ZStack {
            Image(ImageName.menuBackgroundDark.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                BackButtonWithTitleView(action: toolsShopViewModel.goBack,
                                        title: toolsShopViewModel.contact.shopLabel,
                                        offsetX: -35)
                BalanceOfCandy(countOfCandy: "\(toolsShopViewModel.candyCount as? Int ?? 0)")
                
                LazyVGrid(columns: toolsShopViewModel.contact.columns, spacing: 35) {
                    ForEach(Array(toolsShopViewModel.contact.items.enumerated()), id: \.1) { index, item in
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
                            
                            
                            Image(ImageName.candy.rawValue)
                                .resizable()
                                .frame(width: 45, height: 45)
                                .offset(x: -20, y: 60)
                            
                            Text("30")
                                .Madimi(size: 26, color: .pink)
                                .offset(x: 22, y: 60)
                            
                            Text(toolsShopViewModel.contact.nameOfCell[index])
                                .Madimi(size: 24, color: .white)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .frame(width: 80, height: 80)
                                .offset(x: 0, y: -80)
                            
                            Image(toolsShopViewModel.contact.imageOfCell[index])
                                .resizable()
                                .frame(width: 92, height: 92)
                                .cornerRadius(15)
                            
                            
                            
                            ZStack {
                                Button(action: {
                                    
                                }) {
                                    Text(toolsShopViewModel.contact.buyLabel)
                                        .Madimi(size: 22, color: .white)
                                        .frame(width: 100, height: 40)
                                }
                                .frame(width: 119, height: 39)
                                .background(Color(#colorLiteral(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 0.5)
                                )
                                .offset(y: 115)
                            }
                        }
                    }
                }
                .padding(20)
                
                Image(ImageName.woman.rawValue)
                    .resizable()
                    .frame(minWidth: UIScreen.main.bounds.width / 1.5,
                           maxWidth: UIScreen.main.bounds.width / 1.5,
                           minHeight: UIScreen.main.bounds.height / 3,
                           maxHeight: UIScreen.main.bounds.height / 2.5)
                    .offset(y: 35)
            }
            .navigationDestination(isPresented: $toolsShopViewModel.isShopAvailible) {
                ShopView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ToolsShopView()
}
