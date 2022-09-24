//
//  HeaderView.swift
//  BryjApp
//
//  Created by Razieh Halimi on 2022-09-22.
//

protocol HeaderViewDelegate: AnyObject {
    func didTapMenu()
}

import UIKit

class HeaderView: UIView {
    
    let burgerMenu = UIButton()
    let headerImageView = TopImageView(frame: .zero)
    weak var delegate: HeaderViewDelegate!
    
    convenience init(delegate: HeaderViewDelegate) {
        self.init(frame: .zero)
        self.delegate   = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureHeaderImageView()
        configureBurgerMenu()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHeaderImageView() {
        addSubview(headerImageView)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.headerImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.headerImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.headerImageView.heightAnchor.constraint(equalToConstant: 60),
            self.headerImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureBurgerMenu() {
        addSubview(burgerMenu)
        burgerMenu.setImage(UIImage(named: "burgerMenu"), for: .normal)
        burgerMenu.addTarget(self, action: #selector(menuButtonTap), for: .touchUpInside)
        
        burgerMenu.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            burgerMenu.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            burgerMenu.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            burgerMenu.heightAnchor.constraint(equalToConstant: 30),
            burgerMenu.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
        
    @objc func menuButtonTap() {
        delegate.didTapMenu()
    }

}
