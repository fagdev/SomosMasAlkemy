//
//  SplashViewController.swift
//  Somosmas
//
//  Created by Nahuel Paez on 11/10/2021.
//

import UIKit

class SplashViewController : UIViewController {
   
    private let viewModel = OnBoardingViewModel()
    var arraySlide = [Slide]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Termino de presentar")
        self.timer()
    }
    
    private func setBinds() {
        self.viewModel.bindErrorMessage = { (_ errorMessage: String) -> Void in
            Alert.apiAlert(on: self, messegeBtn: "Ok") { _ in
                self.goToLogin()
            }
        }
        self.viewModel.bindSlide = { (_ arraySlide: [Slide]) -> Void in
            self.arraySlide = arraySlide
            self.performSegue(withIdentifier: "OnBoardingViewController", sender: nil)
        }
    }
    
    func timer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.existSession() ? self.goToLogin()  :  self.goToOnboarding()
        }
    }
    
    func goToLogin() {
        self.performSegue(withIdentifier: "HomeViewController", sender: nil)
    }

    func existSession() -> Bool {
        if UserSession.sessionVerify != nil {
            return true
        } else {
            return false
        }
    }
    
    func goToOnboarding() {
        self.setBinds()
        self.viewModel.fetchData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "OnBoardingViewController",
            let onBoard:OnBoardingViewController = segue.destination as? OnBoardingViewController{
                onBoard.arrSlide = arraySlide
            }
    }
}
