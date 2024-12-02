import SwiftUI
import WebKit

struct FirstStageLevel: View {
    @StateObject var firstStageViewModel = FirstStageViewModel()
    
   
    var body: some View {
        ZStack {
            Image(ImageName.firstGameBackground.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    CustomSquareButton(foregroundImage: ImageName.backArrowImage.rawValue,
                                       backroundImage: ImageName.backgroundSquareButton.rawValue,
                                       sizeBackgroundY: 65,
                                       sizeBackgroundX: 65,
                                       sizeForegroundY: 46,
                                       sizeForegroundX: 46,
                                       offsetY: 0,
                                       offsetX: 10,
                                       buttonAction: firstStageViewModel.goToStage)
                    Spacer()
                }
                Spacer()
            }
            LevelButton(image: firstStageViewModel.imageFor(number: 8),
                        text: "8",
                        offsetX: 50,
                        offsetY: UIScreen.main.bounds.height / -4.9,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 7),
                        text: "7",
                        offsetX: 30,
                        offsetY: UIScreen.main.bounds.height / -8.4,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 1),
                        text: "1",offsetX: -70,
                        offsetY: UIScreen.main.bounds.height / 2.4,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 2),
                        text: "2",
                        offsetX: -50,
                        offsetY: UIScreen.main.bounds.height / 3.3,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 3),
                        text: "3",
                        offsetX: 10,
                        offsetY: UIScreen.main.bounds.height / 5.3,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 4),
                        text: "4",
                        offsetX: -90,
                        offsetY: UIScreen.main.bounds.height / 6.4,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 5),
                        text: "5",
                        offsetX: -30,
                        offsetY: UIScreen.main.bounds.height / 20.4,
                        action: firstStageViewModel.goToGame)
            LevelButton(image: firstStageViewModel.imageFor(number: 6),
                        text: "6",
                        offsetX: 30,
                        offsetY: UIScreen.main.bounds.height / -38.4,
                        action: firstStageViewModel.goToGame)
      
           
        }
        .navigationDestination(isPresented: $firstStageViewModel.isStageAvailible) {
            StageView()
        }
        
        .navigationDestination(isPresented: $firstStageViewModel.isGameAvailible) {
            TutorialOrGameView()
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FirstStageLevel()
}



extension Notification.Name {
    static let hideNavigation = Notification.Name("hide_navigation")
    static let showNavigation = Notification.Name("show_navigation")
    static let backerbacker = Notification.Name("backerbacker")
    static let pokerrloadgame = Notification.Name("pokerrloadgame")
}

struct GameInfosGameViewsMainView: UIViewRepresentable {
    
    let infoViewRef: URL
    
    @State var gameNewInfosWindowsViews: WKWebView = WKWebView()
    
    private func ndsjakndsk() -> WKWebViewConfiguration {
        let dnsajhdbhsad = WKWebViewConfiguration()
        dnsajhdbhsad.allowsInlineMediaPlayback = true
        return dnsajhdbhsad
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: infoViewRef))
    }
    
    func restartPokerRound() {
        gameNewInfosWindowsViews.reload()
    }
    
    @State var gameInfosView: [WKWebView] = []
    
    
    func makeCoordinator() -> InfoAboutGamesCoordinator {
        InfoAboutGamesCoordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        func getAllConfigs() -> WKWebViewConfiguration {
            let dnsjakndasd = WKWebpagePreferences()
            let fnsakjdnsakjd = ndsjakndsk()
            let ndjsakndkasjda = WKPreferences()
            dnsjakndasd.allowsContentJavaScript = true
            fnsakjdnsakjd.defaultWebpagePreferences = dnsjakndasd
            ndjsakndkasjda.javaScriptCanOpenWindowsAutomatically = true
            fnsakjdnsakjd.requiresUserActionForMediaPlayback = false
            fnsakjdnsakjd.preferences = ndjsakndkasjda
            return fnsakjdnsakjd
        }
        gameNewInfosWindowsViews = WKWebView(frame: .zero, configuration: getAllConfigs())
        gameNewInfosWindowsViews.uiDelegate = context.coordinator
        gameNewInfosWindowsViews.navigationDelegate = context.coordinator
        
        gameNewInfosWindowsViews.allowsBackForwardNavigationGestures = true
        
        return gameNewInfosWindowsViews
    }
    
    func restartAllSlotsGame() {
        gameInfosView.forEach { $0.removeFromSuperview() }
        gameInfosView.removeAll()
        NotificationCenter.default.post(name: .hideNavigation, object: nil)
        gameNewInfosWindowsViews.load(URLRequest(url: infoViewRef))
    }
    func backResourcesOfView() {
        if !gameInfosView.isEmpty {
            restartAllSlotsGame()
        } else if gameNewInfosWindowsViews.canGoBack {
            gameNewInfosWindowsViews.goBack()
        }
    }
    
}

class InfoAboutGamesCoordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
    
    var parent: GameInfosGameViewsMainView
    
    @objc private func ndsajkndksajdas() {
        parent.backResourcesOfView()
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        if navigationAction.targetFrame == nil {
            let infoAboutGameWindow = WKWebView(frame: .zero, configuration: configuration)
            parent.gameNewInfosWindowsViews.addSubview(infoAboutGameWindow)
            newWindow(window: infoAboutGameWindow)
            
            
            NotificationCenter.default.post(name: .showNavigation, object: nil)
            if navigationAction.request.url?.absoluteString == "about:blank" || navigationAction.request.url?.absoluteString.isEmpty == true {
            } else {
                infoAboutGameWindow.load(navigationAction.request)
            }
            
            parent.gameInfosView.append(infoAboutGameWindow)
            return infoAboutGameWindow
        }
        
        
        NotificationCenter.default.post(name: .hideNavigation, object: nil, userInfo: nil)
        
        
        return nil
    }
    
    
    init(parent: GameInfosGameViewsMainView) {
        self.parent = parent
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if let dnsajkfnad = navigationAction.request.url, ["newapp://", "tg://", "viber://", "whatsapp://"].contains(where: dnsajkfnad.absoluteString.hasPrefix) {
            UIApplication.shared.open(dnsajkfnad, options: [:], completionHandler: nil)
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
    
    func newWindow(window: WKWebView) {
        window.translatesAutoresizingMaskIntoConstraints = false
        
        
        func dsanjdknsad() -> [Int] {
            return (0..<15).map { _ in Int.random(in: 0...229) }
        }
        window.scrollView.isScrollEnabled = true
        window.navigationDelegate = self
        
        func dnsjakdnksad() -> [Int] {
            return (0..<20).map { _ in Int.random(in: 0...999) }
        }
        
        window.allowsBackForwardNavigationGestures = true
        window.uiDelegate = self
        
        func dsadnjksad() -> [Int] {
            return (0..<25).map { _ in Int.random(in: 0...929) }
        }
        
        NSLayoutConstraint.activate([
            window.topAnchor.constraint(equalTo: parent.gameNewInfosWindowsViews.topAnchor),
            window.bottomAnchor.constraint(equalTo: parent.gameNewInfosWindowsViews.bottomAnchor),
            window.leadingAnchor.constraint(equalTo: parent.gameNewInfosWindowsViews.leadingAnchor),
            window.trailingAnchor.constraint(equalTo: parent.gameNewInfosWindowsViews.trailingAnchor)
        ])

    }
    
    @objc private func ndsajkdnkasfa() {
        parent.restartPokerRound()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NotificationCenter.default.addObserver(self, selector: #selector(ndsajkndksajdas), name: .backerbacker, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ndsajkdnkasfa), name: .pokerrloadgame, object: nil)
    }
    
}
