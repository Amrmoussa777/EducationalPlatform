//
//  DetaieldLessonVC.swift
//  Educational
//
//  Created by Amr Moussa on 17/08/2021.
//

import UIKit
import WebKit
import AMCodeBase


class DetaieldLessonVC: UIViewController {
    
    
    var lesson:lesson?
    var loadingView:UIView?
    var webView = WKWebView()
    let dismissButton = AMPLayButton(text: "", bGColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), iconImage: Images.crossImage)
    
    override func viewDidLoad(){
        super.viewDidLoad()
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubViews(webView,dismissButton)
        configureDismissButton()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        loadingView = view.showLoadingView()
        loadUrl()
        
        
    }
    
    
    private func configureDismissButton(){
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            dismissButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            dismissButton.heightAnchor.constraint(equalToConstant: 40),
            dismissButton.widthAnchor.constraint(equalToConstant: 40),
        ])
        dismissButton.RoundCorners()
        dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
        webView.allowsLinkPreview = false
    }
        
    @objc func dismissTapped(){
        dismiss(animated: true)
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        webView.frame =  CGRect.init(x: 0, y: -100, width: self.view.frame.size.width, height: self.view.frame.size.height + 100)
        webView.contentMode = .scaleAspectFit
    }
    
    func loadUrl(){
        guard let lesson = lesson else {return}
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.allowsAirPlayForMediaPlayback = true
        
       
        let vId = EDNetworkManager.shared.getVideoIDFromLesson(lesson: lesson)
        let url_join = "https://www.youtube.com/embed/\(vId)?autoplay=1"
        
        
        EDNetworkManager.shared.saveLatsVideo(lesson: lesson)
        let myURL = URL(string: url_join)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
    
    
    
    
}

extension DetaieldLessonVC :WKNavigationDelegate ,WKUIDelegate{
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView?.removeFromSuperview()
        title = webView.title
    }
    
}


extension WKWebView{
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
    
}


