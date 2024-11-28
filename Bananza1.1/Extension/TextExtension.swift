import SwiftUI

extension Text {
    func Madimi(size: CGFloat, color: Color) -> some View {
        self.font(.custom("MadimiOne-Regular", size: size))
            .bold()
            .foregroundColor(color)
    }
}
