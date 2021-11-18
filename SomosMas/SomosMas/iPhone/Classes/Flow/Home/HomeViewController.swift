//
//  HomeViewController.swift
//  Somosmas
//
//  Created by Ignacio Sosa on 10/14/21.
//

import UIKit

class HomeViewController: FrontRevealController {
    
    @IBOutlet weak private var homeTableView: UITableView!
    
    private let viewModel = HomeViewModel()
    private var arrayTestimonials = [Testimonial]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.setBinds()
        self.viewModel.fetchData()
    }
    
    private func configureTableView() {
        self.homeTableView?.dataSource = self
        self.homeTableView?.delegate = self
    }
    
    private func setBinds() {
        self.viewModel.bindErrorMessage = { (_ errorMessage: String) -> Void in
            self.showAlertWithTitle("Error", message: errorMessage)
        }
        
        self.viewModel.bindTestimonials = { (_ arrayTestimonials: [Testimonial]) -> Void in
            self.arrayTestimonials = arrayTestimonials
            self.homeTableView?.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayTestimonials.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        HomeTableViewCell.buildInTableView(tableView, indexPath: indexPath, testimonial: self.arrayTestimonials[indexPath.row])
    }
}
  
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("taptap")
    }
}

extension HomeViewController {
    
    class func buildController() -> UIViewController {
        
        let story = UIStoryboard(name: "Testimonials", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "HomeViewController")
        return controller
    }
}
