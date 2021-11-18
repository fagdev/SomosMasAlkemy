//
//  AboutUsVC.swift
//  Somosmas
//
//  Created by Lucas Di Lorenzo on 28/10/2021.
//

import Foundation
import UIKit
class AboutUsViewController: FrontRevealController {
    
    @IBOutlet weak var aboutUsTableView: UITableView!
    private let viewModel = AboutUsViewModel()
    private var arrayAboutUs = [AboutUs]()
    private var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.setBinds()
        self.viewModel.fetchData()
    }
    
    private func configureTableView() {
        self.aboutUsTableView?.dataSource = self
        self.aboutUsTableView?.delegate = self
    }
    
    private func setBinds() {
        self.viewModel.bindErrorMessage = { (_ errorMessage: String) -> Void in
            // ---- LLAMADA AL METODO DE FLA
            // self.showAlertWithTitleRetry("Error API", message: "Ha ocurrido un error obteniendo la información", handler:self.viewDidLoad())
            // ---- LLAMAD VIEJA
            //self.showAlertWithTitle("Error dasdas", message: errorMessage)
            // ---- LLAMADA AL ALERT
                Alert.apiAlert(on: self, messegeBtn: "RETRY") { _ in
                    self.viewDidDisappear(true)
                }
            }
        self.viewModel.bindAboutUs = { (_ arrayAboutUs: [AboutUs]) -> Void in
            self.arrayAboutUs = arrayAboutUs
            self.aboutUsTableView?.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let memberId = self.id ?? 0
        let detailView = segue.destination as! MemberDetailViewController
        detailView.id = memberId
    }
}

extension AboutUsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayAboutUs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        AboutUsCell.buildInTableView(tableView, indexPath: indexPath, aboutUs: self.arrayAboutUs[indexPath.row])
    }
}
  
extension AboutUsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if id != 0 {
            self.id = self.arrayAboutUs[indexPath.row].id
            self.performSegue(withIdentifier: "MemberDetailViewController", sender: nil)
        } else {
            self.showAlertWithTitle("Error", message: "Intenta nuevamente")
        }
    }
}

extension AboutUsViewController {
    
    class func buildController() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Nosotros", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AboutUsVC")
        return controller
    }
}
