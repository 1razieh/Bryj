//
//  TopImageView.swift
//  BryjApp
//
//  Created by Razieh Halimi on 2022-09-22.
//

import Foundation
import UIKit

class TopImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        image               = logoIcone
        contentMode         = .scaleAspectFit
        clipsToBounds       = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
