//
//  ContentPVCViewController.swift
//  Somosmas
//
//  Created by Lucas Di Lorenzo on 15/10/2021.
//

import UIKit


class ContentPVCViewController: UIViewController {
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var imagPVC: UIImageView!
    @IBOutlet weak private var lblDescrip: UILabel!
    
    var contentPVC:ContentPVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblTitle.text = "\(self.contentPVC.titulo)"
        self.lblDescrip.text = "\(self.contentPVC.descrip)"
        self.imagPVC.downloadInURL(self.contentPVC.imagName)
    }
}

extension ContentPVCViewController{
    
    class func buildWithContentPVC(_ header: ContentPVC)->ContentPVCViewController {
        let storyBoard = UIStoryboard(name: "OnBoarding", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "ContentPVCViewController") as? ContentPVCViewController
        controller?.contentPVC = header
        return controller ?? ContentPVCViewController()
    }
}
