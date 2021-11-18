//
//  MenuViewController.swift
//  Somosmas
//
//  Created by Coti on 15/10/2021.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    
    private lazy var controllers: [UIViewController] = {
        [LandingViewController.buildController(),
         AboutUsViewController.buildController(),
         ActivitiesViewController.buildController(),
         NovedadesViewController.buildController(),
         HomeViewController.buildController()]
    }()
    
    var getHome: UIViewController? {
        return self.controllers.first
    }
    
    @IBAction private func btnActionSection(_ sender: UIButton) {
        self.revealViewController().frontViewController = self.controllers[sender.tag]
        self.revealViewController().revealToggle(nil)
        
    }
    
    @IBAction private func contactBtnShowAlert(_ sender: Any) {
        self.showAlertWithTitle("Sección:", message: "Contacto")
    }
    @IBAction private func contributeBtnShowAlert(_ sender: Any) {
        self.showAlertWithTitle("Sección:", message: "Contribuye")
    }
    
    @IBAction func closeSession(_ sender: Any) {
        UserSession.sessionVerify?.closeSession()
        self.revealViewController().navigationController?.popToRootViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MenuViewController {
    
    class func buildController() -> MenuViewController {
        
        let story = UIStoryboard(name: "Menu", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
        return controller ?? MenuViewController()
    }
}
