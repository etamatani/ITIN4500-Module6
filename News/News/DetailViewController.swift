//
//  DetailViewController.swift
//  News
//
//  Created by Eisuke Tamatani on 1/12/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var articleUrl:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Check that there's a url
        if articleUrl != nil {
            
            // Cretate the URL object
            let url = URL(string: articleUrl!)
            
            guard url != nil else {
                // Couldn't create the URL object
                return
            }
            
            // Create the URLRequest object
            let request = URLRequest(url: url!)
            
            // Start spinner
            spinner.alpha = 1
            spinner.startAnimating()
            
            // Load it  in the webview
            webView.load(request)
            
        }
    }
}

extension DetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // Stop the spinner and hide it
        spinner.stopAnimating()
        spinner.alpha = 0
        
    }
    
}
