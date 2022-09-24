//
//  MainViewController+Extension.swift
//  BryjApp
//
//  Created by Razieh Halimi on 2022-09-22.
//

import Foundation
import WebKit

//MARK: WKNavigationDelegate

extension MainViewController: HeaderViewDelegate {
    func didTapMenu() {
        let script = "var navBarVisibility = document.querySelector('.navigation-section .main-menu.in'); if (navBarVisibility) { navBarVisibility.querySelector('.close-menu button').click(); } else { document.getElementsByClassName('navbar-toggler')[0].click(); }"
        injectJavaScript(script)
    }
    
}
