//
//  RevealViewController.swift
//  Somosmas
//
//  Created by Kenyi Rodriguez on 8/11/21.
//

import Foundation

class RevealViewController: SWRevealViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rearController = MenuViewController.buildController()
        self.rearViewController = rearController
        self.frontViewController = rearController.getHome
        self.rearViewRevealWidth = 270
    }

}

class FrontRevealController: UIViewController {

    @IBAction private func clickBtnReveal(_ sender: Any) {
        
        if let revealController = self.revealViewController() {
            revealController.revealToggle(nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let controller = self.revealViewController() {
            self.view.addGestureRecognizer(controller.panGestureRecognizer())
        }
    }
}
