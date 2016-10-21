//
//  BrowserViewController.swift
//  NewsReaderSwift
//
//  Created by Mihai Iancu on 15/10/2016.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import UIKit

class BrowserViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webview: UIWebView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var url:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let validUrl = url else {
            let alertController = UIAlertController(title: "ups",
                                                    message: "no url for this story", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel, handler: { (action:UIAlertAction) in
                self.navigationController?.popViewController(animated: true)
            })
            
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)

                
            return
        }
        
        indicator.startAnimating()
        webview.delegate = self
        webview.loadRequest(URLRequest(url: URL(string: validUrl)!))
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        indicator.stopAnimating()
        indicator.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
