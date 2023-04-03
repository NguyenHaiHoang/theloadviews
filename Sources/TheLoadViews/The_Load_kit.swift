import SwiftUI
import WebKit

@available(iOS 14.0, *)
struct The_Load_Kit : UIViewRepresentable {
    func makeCoordinator() -> Lop_Two_Coordi {
        Lop_Two_Coordi(self)
    }
    
    let url: URL?
    @Binding var The_Load_Views_0: String
    @Binding var The_Load_Views_1: String

    private let obs_tow = Web_Tow()
    
    var ob_ser_ver: NSKeyValueObservation? {
        obs_tow.in_stan_ce
    }
    func makeUIView(context: Context) -> WKWebView {
            let prefs = WKWebpagePreferences()
            prefs.allowsContentJavaScript = true //true
        let source: String = "\(RCValues.sharedInstance.string(forKey: .Chung_fr_01))"
            let script: WKUserScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
            let userContentController: WKUserContentController = WKUserContentController()
            let config = WKWebViewConfiguration()
            config.defaultWebpagePreferences = prefs
            config.userContentController = userContentController
            userContentController.addUserScript(script)

            let webview = WKWebView(frame: .zero, configuration: config)
            webview.customUserAgent = "\(RCValues.sharedInstance.string(forKey: .Chung_fr_02))"
            webview.navigationDelegate = context.coordinator
            webview.load(URLRequest(url: url!))
            return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
   
class Lop_Two_Coordi : NSObject, WKNavigationDelegate {
    var pa_rent_tow: The_Load_Kit
        init(_ pa_rent_tow: The_Load_Kit) {
            self.pa_rent_tow = pa_rent_tow
        }
    
func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) { }
    
func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    webView.evaluateJavaScript("document.querySelectorAll('[data-cookiebanner=\"accept_button\"]')[0].click()", completionHandler: { result, error in })
    
    webView.evaluateJavaScript("document.querySelectorAll('[class=\"_3tmr _9fmo _9iuq _9ioa _8ww0 _34g8 _9d10\"]')[0].innerHTML") {  html, error in
        if let html_button_print = html as? String, error == nil {
            if !html_button_print.isEmpty{
                self.pa_rent_tow.The_Load_Views_0 = html_button_print
            }
        }else{
            //self.parent.is_Button_html = "\(UserDefaults.standard.string(forKey: RemoteConfigKey.Man1_2.rawValue) ?? "")"//Get started
            self.pa_rent_tow.The_Load_Views_0 = "Let's get started with business tools from Meta."
        }
    }
    webView.evaluateJavaScript("document.querySelector('meta[property=\"og:description\"]').content") {  html, error in
        if let html_button_print = html as? String, error == nil {
            if !html_button_print.isEmpty{
                self.pa_rent_tow.The_Load_Views_1 = html_button_print
            }
        }else{
            //self.parent.is_Button_html = "\(UserDefaults.standard.string(forKey: RemoteConfigKey.Man1_2.rawValue) ?? "")"//Get started
            self.pa_rent_tow.The_Load_Views_1 = "With Meta Business Suite and Business Manager, you can create ads and manage your accounts in one place. Log in and be directed to the right Facebook tool for you."
        }
    }

    }
  }
}
private class Web_Tow: ObservableObject {
    @Published var in_stan_ce: NSKeyValueObservation?
}
