import SwiftUI

struct BlocksShopView: View {
    @StateObject private var blockShopViewModel = BlockShopViewModel()
 
    var body: some View {
        ZStack {
            Image(ImageName.menuBackgroundDark.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                BackButtonWithTitleView(action: blockShopViewModel.goBack,
                                        title: blockShopViewModel.contact.shopTitle,
                                        offsetX: -35)
                BalanceOfCandy(countOfCandy: "\(blockShopViewModel.candyCount as? Int ?? 0)")
                
                ScrollView {
                    LazyVGrid(columns: blockShopViewModel.contact.columns, spacing: 35) {
                        ForEach(Array(blockShopViewModel.contact.items.enumerated()), id: \.1) { index, item in
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
                                
                                if blockShopViewModel.contact.arrayOfByedBlocks[index] {
                                    Image(ImageName.candy.rawValue)
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                        .offset(x: -20, y: 60)
                                    
                                    Text("150")
                                        .Madimi(size: 26, color: .pink)
                                        .offset(x: 22, y: 60)
                                }
                                
                                Text(blockShopViewModel.contact.nameOfCell[index])
                                    .Madimi(size: 22, color: .white)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 100, height: 60)
                                    .offset(x: 0, y: -70)
                                
                                Image(blockShopViewModel.contact.imageOfCell[index])
                                    .resizable()
                                    .frame(width: 112, height: 52)
                                    .cornerRadius(15)
                                    .offset(y: 0)
                                
                            
                                
                                ZStack {
                                    Button(action: {
                                        
                                    }) {
                                        Text(blockShopViewModel.contact.selectedBlocks[index])
                                            .Madimi(size: 22, color: .white)
                                            .frame(width: 100, height: 40)
                                    }
                                    .frame(width: 119, height: 39)
                                    .background(blockShopViewModel.contact.colorOfLowLabel[index])
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
                }
                
                
            }
            .navigationDestination(isPresented: $blockShopViewModel.isShopAvailible) {
                ShopView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BlocksShopView()
}
