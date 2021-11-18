//
//  CreateAccountViewController.swift
//  Somosmas
//
//  Created by Artekium on 06/10/2021.
//

import UIKit

class CreateAccountViewController: UIViewController {
    @IBOutlet private weak var anchorBottomScroll: NSLayoutConstraint!
    @IBOutlet private weak var txtName: UITextField!
    @IBOutlet private weak var txtEmail: UITextField!
    @IBOutlet private weak var txtPassword1: UITextField!
    @IBOutlet private weak var txtPassword2: UITextField!
    @IBOutlet private weak var lblErrorMessage: UILabel!
    @IBOutlet private weak var signUpButton: UIButton!
    
    private var viewModel = SignUpViewModel()
    
    lazy var loading: LoadingView = {
        LoadingView.buildInView(self.view)
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBinds()
        self.signUpButton.isEnabled = false
        self.lblErrorMessage.isHidden = true
        self.txtPassword2.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotifications()
    }
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        self.viewModel.createNewUser(name: self.txtName.text ?? "", email: self.txtEmail.text ?? "", password1: self.txtPassword1.text ?? "", password2: self.txtPassword2.text ?? "")
    }
    
    private func setBinds() {
        self.viewModel.genericError = { (errorMessage) in
            self.showAlertWithTitle("Error", message: errorMessage)
        }
        
        self.viewModel.startRequest = { () in
            self.loading.starAnimating()
        }
        
        self.viewModel.endRequest = { () in
            self.loading.endAnimating()
        }
        
        self.viewModel.createNewUser = { (session) in
            self.performSegue(withIdentifier: "MainViewController", sender: nil)
        }
    }
}

extension CreateAccountViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let password2 = ((txtPassword2.text ?? "") as NSString).replacingCharacters(in: range, with: string)
        
        if password2.passwordsMatches(self.txtPassword1.text ?? "", password2) {
            self.signUpButton.isEnabled = true
            self.lblErrorMessage.isHidden = true
        } else {
            self.signUpButton.isEnabled = false
            self.lblErrorMessage.isHidden = false
        }
        return true
    }
}

extension CreateAccountViewController {
    
    private func registerKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func unregisterKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration){
            self.anchorBottomScroll.constant = keyboardFrame.height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.anchorBottomScroll.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
