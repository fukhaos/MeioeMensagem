//
//  UserTermViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 25/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//


import UIKit
import WebKit

class UserTermViewController: UIViewController, WKNavigationDelegate {
    
    
    
    
    var webView: WKWebView!
    var progressView: UIProgressView!
    //Using user term with Barpass for demo.
    var url: URL = URL(string: "http://api.barpass.dev.megaleios.com/content/termos-de-uso.html")!
    var useTerm: Bool = false
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        CadastroViewController()
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        let progressButton = UIBarButtonItem(customView: progressView)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        toolbarItems = [progressButton, spacer, refresh]
        
        navigationController?.isToolbarHidden = false
        
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.isToolbarHidden = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
            if progressView.progress >= 1.0 {
                progressView.isHidden = true
            } else {
                progressView.isHidden = false
            }
        }
    }
    
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    
            let globalUrl: URL = self.url
    
            let localUrl = navigationAction.request.url ?? URL(string: "")
    
            if localUrl != globalUrl {
                decisionHandler(.cancel)
                UIApplication.shared.open(url, options: [:]) { (value) in
    
                }
                return
            }
    
            decisionHandler(.allow)
        }
    
    
    @IBAction func UserAndTerms(_ sender: UIBarButtonItem) {
        //Dismiss na tela atual e volta pra View anterior.
        if ((self.presentingViewController) != nil){
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    
    
    
}

