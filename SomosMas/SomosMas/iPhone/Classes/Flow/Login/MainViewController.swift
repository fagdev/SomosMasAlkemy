//
//  LoginViewController.swift
//  Somosmas
//
//  Created by Coti on 28/09/2021.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    //MARK:- ViewModel
    var viewModel = MainViewModel()
    
    //MARK:- conection ui
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var signUpButton: ButtonSecondary!
    @IBOutlet private weak var emailTextField: UITextField?
    @IBOutlet private weak var passTextField: UITextField?
    @IBOutlet private weak var errorEmail: UILabel!
    @IBOutlet private weak var errorPassword: UILabel!
    @IBOutlet private weak var bottomSignUp: NSLayoutConstraint!
    @IBAction func tapCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    lazy var loading: LoadingView = {
        LoadingView.buildInView(self.view)
    }()
    
    private var emailOk = false
    private var passOk = false
    
    @IBAction func btnLoginEvent(_ sender: Any) {
        validation()
    }
    func validation() {
        
        let user = User(email: self.emailTextField?.text, password: self.passTextField?.text)
        viewModel.statusByLogin(user: user)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBinds()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        self.emailTextField?.delegate = self
        self.passTextField?.delegate = self
        self.disableOrEnable(false)
        errorEmail.isHidden = true
        errorPassword.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotificationes()
    }
    
    private func disableOrEnable(_ boolValue:Bool) {
        self.loginButton?.isUserInteractionEnabled = boolValue
        self.loginButton?.alpha = boolValue ? 1 : 0.5
    }
    
    private func setBinds() {
        
        self.viewModel.showUserError = { (show) in
            self.errorEmail.isHidden = !show
        }
        
        self.viewModel.showPasswordError = { (show) in
            self.errorEmail.isHidden = !show
        }
    
        self.viewModel.genericError = { (errorMessage) in
            self.showAlertWithTitle("Error", message: errorMessage)
        }
        
        self.viewModel.startRequest = { () in
            self.loading.starAnimating()
        }
        
        self.viewModel.newUserSession = { (session) in
            self.performSegue(withIdentifier: "HomeViewController", sender: nil)
        }
        
        self.viewModel.endRequest = { () in
            self.loading.endAnimating()
        }
    }
}

extension MainViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
        
        switch textField {
            case self.emailTextField: self.emailOk = !text.isEmpty && text.isValidEmail
            case self.passTextField: self.passOk = !text.isEmpty && text.validPassword
            default: print("No se encontra la caja de texto")
        }
        
        self.disableOrEnable(self.emailOk && self.passOk)
        
        return true
    }
}

extension MainViewController {
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self .keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self .keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func unregisterKeyboardNotificationes() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.bottomSignUp.constant = keyboardFrame.height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.bottomSignUp.constant = 50
            self.view.layoutIfNeeded()
        }
    }
}



