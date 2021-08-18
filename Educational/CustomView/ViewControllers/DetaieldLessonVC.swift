//
//  DetaieldLessonVC.swift
//  Educational
//
//  Created by Amr Moussa on 17/08/2021.
//

import UIKit
import WebKit
class DetaieldLessonVC: UIViewController {
    
    
    var lesson:Lesson?
    var loadingView:UIView?
    var webView = WKWebView()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        navigationController?.navigationBar.removeAllSubViews()
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        webView.navigationDelegate = self
        loadingView = view.showLoadingView()
        
        loadUrl()
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        webView.frame =  CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        webView.contentMode = .scaleAspectFit
    }
    
    func loadUrl(){
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        let url_join = lesson?.videoLink ?? "" + "?autoplay=1"
        let myURL = URL(string: url_join)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
    
    
    
}

extension DetaieldLessonVC :WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView?.removeFromSuperview()
        title = webView.title
    }
    
   
   
}
