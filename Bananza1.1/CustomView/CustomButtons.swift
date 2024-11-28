import SwiftUI

struct CustomSquareButton: View {
    var foregroundImage: String
    var backroundImage: String
    var sizeBackgroundY: CGFloat
    var sizeBackgroundX: CGFloat
    var sizeForegroundY: CGFloat
    var sizeForegroundX: CGFloat
    var offsetY: CGFloat
    var offsetX: CGFloat
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            Button(action: {
                buttonAction()
            }) {
                ZStack {
                    Image(backroundImage)
                        .resizable()
                        .frame(width: sizeBackgroundX, height: sizeBackgroundY)
                    
                    Image(foregroundImage)
                        .resizable()
                        .frame(width: sizeForegroundX, height: sizeForegroundY)
                }
            }
        }
        .offset(x: offsetX, y: offsetY)
    }
}

struct CircleButtonTool: View {
    var buttonAction: () -> Void
    var toolImage: String
    var body: some View {
        ZStack {
            Button(action: {
                buttonAction()
            }) {
                ZStack {
                    Image(toolImage)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .offset(x: 1, y: -2)
                }
            }
        }
        .frame(width: 90, height: 90)
        .background(Color(#colorLiteral(red: 113/255, green: 67/255, blue: 90/255, alpha: 1)))
        .cornerRadius(45)
        .overlay(
            RoundedRectangle(cornerRadius: 45)
                .stroke(Color(#colorLiteral(red: 220/255, green: 107/255, blue: 120/255, alpha: 1)), lineWidth: 3)
        )
    }
}

struct PurpleLabel: View {
    var text: String
    var lowestText: String
    var textOffsetX: CGFloat
    var textOffsetY: CGFloat
    var viewOffsetX: CGFloat
    var sizeWidth: CGFloat
    var sizeHeight: CGFloat
    var textColor: Color
    var body: some View {
        Text(text)
            .Madimi(size: 26, color: textColor)
            .frame(width: sizeWidth, height: sizeHeight)
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .offset(x: textOffsetX ,y: textOffsetY)
            .background(Color(#colorLiteral(red: 113/255, green: 67/255, blue: 90/255, alpha: 1)))
            .cornerRadius(40)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color(#colorLiteral(red: 220/255, green: 107/255, blue: 120/255, alpha: 1)), lineWidth: 3)
                    .overlay(
                        Text(lowestText)
                            .Madimi(size: 26, color: .white)
                            .offset(x: -20, y: 20)
                    )
            )
            .offset(x: viewOffsetX)
    }
}

struct CustomRectangleButton: View {
    var backroundImage: String
    var label: String
    var sizeBackgroundY: CGFloat
    var sizeBackgroundX: CGFloat
    var offsetY: CGFloat
    var offsetX: CGFloat
    var buttonAction: () -> Void
    var sizeForText: CGFloat
    
    var body: some View {
        ZStack {
            Button(action: {
                buttonAction()
            }) {
                ZStack {
                    Image(backroundImage)
                        .resizable()
                        .frame(width: sizeBackgroundX, height: sizeBackgroundY)
                    Text(label)
                        .Madimi(size: sizeForText, color: .yellow)
                    
                        .offset(x: offsetX, y: offsetY)
                }
            }
        }
    }
}

struct SettingsButtons: View {
    var label: String
    var body: some View {
        Button(action: {
            
        }) {
            Text(label)
                .Madimi(size: 32, color: .white)
                .frame(width: 233, height: 56)
                .padding()
                .background(.black)
                .cornerRadius(10)
                .opacity(0.8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 0.25)
                )
        }
        
    }
}

struct SoundButton: View {
    var body: some View {
        HStack {
            Text("Sound")
                .Madimi(size: 15, color: .white)
                .offset(x: 50)
            Spacer()
            HStack {
                Button(action: {
                    
                }) {
                    Image("sound")
                        .resizable()
                        .frame(width: 44, height: 39)
                }
                
                Button(action: {
                    
                }) {
                    Image("soundDisable")
                        .resizable()
                        .frame(width: 44, height: 39)
                        .offset(y: 2)
                }
            }
            .offset(x: -50)
        }
        .frame(width: 336, height: 66)
        .background(.black)
        .cornerRadius(10)
        .opacity(0.8)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.white, lineWidth: 0.25)
        )
    }
}

struct BackButtonWithTitleView: View {
    var action: () -> Void
    var title: String
    var offsetX: CGFloat
    var body: some View {
        HStack {
            CustomSquareButton(foregroundImage: ImageName.backArrowImage.rawValue,
                               backroundImage: ImageName.backgroundSquareButton.rawValue,
                               sizeBackgroundY: 65,
                               sizeBackgroundX: 65,
                               sizeForegroundY: 46,
                               sizeForegroundX: 46,
                               offsetY: 0,
                               offsetX: 0,
                               buttonAction: action)
            Spacer()
            Text(title)
                .Madimi(size: 42, color: .white)
                .offset(x: offsetX, y: 20)
            Spacer()
        }
        .padding()
    }
}


struct LevelButton: View {
    var image: String
    var text: String
    var offsetX: CGFloat
    var offsetY: CGFloat
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(image)
                    .resizable()
                    .frame(width: 73, height: 96)
                if image != ImageName.lockedLevel.rawValue {
                    Text(text)
                        .Madimi(size: 20, color: .white)
                        .offset(x: -2 ,y: -26)
                }
            }
        }
        .disabled(image == ImageName.currentLevel.rawValue ? false : true)
        .offset(x: offsetX, y: offsetY)
    }
}
