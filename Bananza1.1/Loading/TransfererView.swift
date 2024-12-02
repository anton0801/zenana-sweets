import SwiftUI

struct TransfererView: View {
    
    @EnvironmentObject var loadingVM: LoadingSplasVm
    
    var body: some View {
        VStack {
            if (loadingVM.responseMessage ?? "").isEmpty {
                MenuView()
            } else {
                SecondInfosStageView()
            }
        }
    }
}

#Preview {
    TransfererView()
        .environmentObject(LoadingSplasVm())
}
