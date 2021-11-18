//
//  MemberDetailViewController.swift
//  Somosmas
//
//  Created by Artekium on 27/10/2021.
//

import UIKit

class MemberDetailViewController: UIViewController {
    @IBOutlet weak private var lblName: UILabel!
    @IBOutlet weak private var lblDescription: UILabel!
    @IBOutlet weak private var memberImage: UIImageView!
    
    private var viewModel = MemberDetailViewModel()
    var id: Int?
    private var linkedinUrl: String?
    private var facebookUrl: String?
    
    lazy var loading: LoadingView = {
        LoadingView.buildInView(self.view)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getMemberDetail(id: self.id ?? 0)
        self.setBinding()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func goToFacebook(_ sender: UIButton) {
        let urlFacebook = self.facebookUrl
        guard let url = URL(string: urlFacebook ?? ""), UIApplication.shared.canOpenURL(url)
        else {
            self.showAlertWithTitle("Error", message: "Hubo un error con la dirección")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func goToLinkedIn(_ sender: UIButton) {
        let urlLinkedin = self.linkedinUrl
        guard let url = URL(string: urlLinkedin ?? ""), UIApplication.shared.canOpenURL(url)
        else {
            self.showAlertWithTitle("Error", message: "Hubo un error con la dirección")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    private func setBinding(){
        self.viewModel.bindInitRequest = { () in
            self.loading.starAnimating()
        }
        
        self.viewModel.bindEndRequest = { () in
            self.loading.endAnimating()
        }
        
        self.viewModel.showError = { (errorMessage) in
            self.showAlertWithTitle("Error", message: errorMessage)
        }
        
        self.viewModel.bindMemberResult = { member in
            self.lblName.text = member.name
            self.lblDescription.text = member.description.removeEspecialCharacters
            self.memberImage.downloadInURL(member.image)
            self.facebookUrl = member.facebookUrl
            self.linkedinUrl = member.linkedinUrl
        }
    }
}
