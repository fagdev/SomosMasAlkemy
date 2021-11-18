//
//  ActivitiesViewController.swift
//  Somosmas
//
//  Created by Artekium on 21/10/2021.
//

import UIKit

class ActivitiesViewController: FrontRevealController {
    
    @IBOutlet weak private var activitiesTable: UITableView!
    private let viewModel = ActivitiesViewModel()
    
    lazy var loading: LoadingView = {
        LoadingView.buildInView(self.view)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.setBinding()
        self.viewModel.getActivities()
    }
    
    private func configureView() {
        self.activitiesTable?.delegate = self
        self.activitiesTable?.dataSource = self
    }
    
    private func setBinding() {
        
        self.viewModel.bindInitRequest = { () in
            self.loading.starAnimating()
        }
        
        self.viewModel.bindEndRequest = { () in
            self.loading.endAnimating()
//            self.showAlertWithTitle("Seccion:", message: "Actividades")
        }
        
        self.viewModel.genericError = { (errorMessage) in
            self.showAlertWithTitle("Error", message: errorMessage)
        }
        
        self.viewModel.bindingRefreshData = { (_ activity) -> Void in
            DispatchQueue.main.async {
                self.activitiesTable.reloadData()
            }
        }
    }
}

extension ActivitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.activitiesResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        ActivitiesTableViewCell.buildCellInTable(tableView, indexPath: indexPath,
                                                 activity: self.viewModel.activitiesResult[indexPath.row]
                                                )
    }
}

extension ActivitiesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Probando click")
    }
}

extension ActivitiesViewController {
    
    class func buildController() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Activities", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ActivitiesViewController")
        return controller
    }
}
