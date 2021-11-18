//
//  NovedadesViewController.swift
//  Somosmas
//
//  Created by Nahuel Paez on 27/10/2021.
//

import Foundation
import UIKit

class NovedadesViewController : FrontRevealController, UITableViewDelegate{
    
    @IBOutlet private weak var newsTableView: UITableView!
    
    private let viewModel = NovedadesViewModel()
    private var data:[LatestNewsDTO] = []
    lazy var loading: LoadingView = {
        LoadingView.buildInView(self.view)
    }()
    
    //MARK:- lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        setBids()
        configureTableView()
    }
    
    private func configureTableView() {
        self.newsTableView.dataSource = self
        self.newsTableView.delegate = self
        
    }
    
    func setBids (){
        self.viewModel.bindStartRequest = {()  in
           self.loading.starAnimating()
        }
        
        self.viewModel.bindRequestData = {(_ arrayLatestNews: [LatestNewsDTO]) -> Void in
            self.data = arrayLatestNews
            self.newsTableView.reloadData()
                if arrayLatestNews.count == 0 {
                    Alert.apiAlert(on: self, messegeBtn: "Reintentar") { _ in
                        self.viewModel.fetchData()
                    }
                } else {
                    self.data = arrayLatestNews
                }
         }
        
        self.viewModel.bindErrorMessage = {(_ errorMessage) in
            Alert.apiAlert(on: self, messegeBtn: "Reintentar") { _ in
                self.viewModel.fetchData()
            }
        }
        
        self.viewModel.bindEndRequest = {()  in
           self.loading.endAnimating()
        }
    }
}

extension NovedadesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NovedadesTableViewCell.buildInTableView(newsTableView, indexPath: indexPath, latestNews: self.data[indexPath.row])
    }
}

extension NovedadesViewController {
    
    class func buildController() -> UIViewController {
        
        let story = UIStoryboard(name: "Novedades", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "NovedadesViewController")
        return controller
    }
}
