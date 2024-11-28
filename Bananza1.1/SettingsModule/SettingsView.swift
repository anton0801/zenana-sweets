import SwiftUI

struct SettingsView: View {
    @StateObject private var settingsViewModel = SettingsViewModel()
    var body: some View {
        ZStack {
            Image(ImageName.menuBackgroundDark.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                BackButtonWithTitleView(action: settingsViewModel.goBack,
                                        title: settingsViewModel.contact.settingsLabel,
                                        offsetX: -20)
                
                ZStack {
                    Rectangle()
                        .frame(minWidth: 361, maxWidth: 361, minHeight: 400, maxHeight: 600)
                        .background(.secondary)
                        .cornerRadius(10)
                        .opacity(0.54)
                    
                    VStack(spacing: 25) {
                        VStack {
                            SoundButton()
                        }
                        SettingsButtons(label: settingsViewModel.contact.resetLabel)
                        SettingsButtons(label: settingsViewModel.contact.aboutUsLabel)
                        SettingsButtons(label: settingsViewModel.contact.aboutUsLabel)
                        SettingsButtons(label: settingsViewModel.contact.privacyPoliceLabel)
                    }
                    
                }
                Spacer()
             
            }
            .navigationDestination(isPresented: $settingsViewModel.isMenuAvailible) {
                MenuView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SettingsView()
}
