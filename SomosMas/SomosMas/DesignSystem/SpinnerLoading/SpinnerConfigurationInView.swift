//
//  SpinnerConfigurationInView.swift
//  Somosmas
//
//  Created by Nahuel Paez on 14/10/2021.
//

import UIKit


extension LoadingView {
    
    class func buildInView(_ view: UIView) -> LoadingView {
        
        let loading = LoadingView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loading)
        
        loading.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loading.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loading.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loading.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        return loading
    }
}

class LoadingView: UIView {
    
    // llama al icono que se mueve y le da props
    lazy private var icon: RotatingCirclesView = {
       let icon = RotatingCirclesView()
        self.addSubview(icon)
        return icon
    }()
    
    // Crea el background del spinner
    lazy private var backgroundView: UIView = {
        let backgroundView = UIView()
        self.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = .clear
        self.addBackgroundView()
        self.addIcon()
    }

    // inicia el spinner
    func starAnimating() {
        
        self.isHidden = false
        self.backgroundView.alpha = 0
        self.icon.alpha = 0
        self.icon.transform = CGAffineTransform(translationX: 0, y: 100).scaledBy(x: 0.8, y: 0.8)
        self.icon.starAnimation()
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
            self.icon.alpha = 1
            self.backgroundView.alpha = 1
            self.icon.transform = .identity
        }, completion: nil)
    }
    

    func endAnimating() {
        UIView.animate(withDuration: 0.5) {
            self.backgroundView.alpha = 0
            self.icon.alpha = 0
        } completion: { _ in
            self.icon.layer.removeAllAnimations()
            self.icon.endAnimation()
            self.isHidden = true
        }
    }
    
    // agrega constraints al background
    private func addBackgroundView() {
        self.backgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    // agrega constraits al icono
    private func addIcon() {
        self.icon.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.icon.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.icon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.icon.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}




