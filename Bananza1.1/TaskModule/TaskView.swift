import SwiftUI

struct TaskView: View {
    @StateObject private var taskViewModel = TaskViewModel()
    
    var body: some View {
        ZStack {
            Image(ImageName.menuBackgroundDark.rawValue)
                .resizable()
                .ignoresSafeArea()
            VStack {
                BackButtonWithTitleView(action: taskViewModel.goBack, title: taskViewModel.contact.taskLabel, offsetX: -35)
                BalanceOfCandy(countOfCandy: "\(taskViewModel.candyCount as? Int ?? 0)")

                ScrollView {
                    LazyVGrid(columns: taskViewModel.contact.columns, spacing: 35) {
                        ForEach(Array(taskViewModel.contact.items.enumerated()), id: \.1) { index, item in
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
                                    .offset(x: -25, y: 30)
                                
                                Text(taskViewModel.contact.coundRewardForTask[index])
                                    .Madimi(size: 26, color: .pink)
                                    .offset(x: 20, y: 30)
                                
                                Text(taskViewModel.contact.tasks[index])
                                    .Madimi(size: 22, color: .white)
                                    .lineLimit(3)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 120)
                                    .offset(x: 0, y: -50)
                                       
                                ZStack {
                                    Button(action: {
                                        
                                    }) {
                                        Text(taskViewModel.contact.lockedLabel)
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
                }
            }
            .navigationDestination(isPresented: $taskViewModel.isMenuAvailible) {
                MenuView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TaskView()
}
