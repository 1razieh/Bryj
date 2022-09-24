//
//  ViewController.swift
//  BryjApp
//
//  Created by Razieh Halimi on 2022-09-22.
//

import UIKit
import WebKit

class MainViewController: UIViewController {
    
    private var webView = WKWebView()
    private let headerView = HeaderView()
    var pageName: PageName!
    
    init(_ pageName: PageName) {
        super.init(nibName: nil, bundle: nil)
        self.pageName = pageName
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.view.backgroundColor = .white
        self.headerView.delegate = self
        self.configureUI()
        self.loadData()
    }
}

//MARK: Extension
extension MainViewController {
    private func configureUI() {
        self.view.addSubview(self.headerView)
        self.headerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 60),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        self.view.addSubview(self.webView)
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.webView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            self.webView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    private func loadData() {
        guard let url = URL(string: getURL()) else {
            return
        }
        self.webView.load(URLRequest(url: url))
    }
    
    private func getURL() -> String {
        switch pageName {
        case .home:
            return homeAddress
        case .account:
            return accountAddress
        case .shop:
            return shopAddress
        case .bag:
            return bagAddress
        case .none:
            return homeAddress
        }
    }
    
    func injectJavaScript(_ script: String) {
        webView.evaluateJavaScript(script, completionHandler: nil)
    }
}
