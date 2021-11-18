//
//  LandingViewController.swift
//  Somosmas
//
//  Created by Flavio Gomez on 08/11/2021.
//

import Foundation
import UIKit

class LandingViewController: FrontRevealController, UICollectionViewDelegate {
    
    lazy var loading: LoadingView = {
        LoadingView.buildInView(self.view)
    }()
    
    private let viewModelTestimonials = HomeViewModel()
    private var arrayTestimonials = [Testimonial]()
    
    private let viewModelNews = NovedadesViewModel()
    private var arrayNews = [LatestNewsDTO]()
    
    @IBOutlet weak var CollectionTestimonialsView: UICollectionView!
    @IBOutlet weak var CollectionLatestView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionTestimonialsView.dataSource = self
        CollectionLatestView.dataSource = self
        CollectionTestimonialsView.delegate = self
        CollectionLatestView.delegate = self
        self.viewModelTestimonials.fetchData()
        self.viewModelNews.fetchData()
        setBinds()
    }
    
    @IBAction func goToNewsButton(_ sender: Any) {
        self.revealViewController().frontViewController = NovedadesViewController.buildController()
    }
    
    @IBAction func goToTestimonialsButton(_ sender: Any) {
        self.revealViewController().frontViewController = HomeViewController.buildController()

    }
    
// MARK: --> Seteo binds En ambas solicitudes
    
    private func setBinds() {
        self.viewModelTestimonials.bindErrorMessage = { (_ errorMessage: String) -> Void in
            self.showAlertWithTitle("Error", message: errorMessage)
        }
        
        self.viewModelTestimonials.bindTestimonials = { (_ arrayTestimonials: [Testimonial]) -> Void in
            let prefix = arrayTestimonials.prefix(4)
            self.arrayTestimonials = Array(prefix)
            self.CollectionTestimonialsView.reloadData()
        }
        
        self.viewModelNews.bindStartRequest = {()  in
           self.loading.starAnimating()
        }
        
        self.viewModelNews.bindRequestData = {(_ arrayLatestNews: [LatestNewsDTO]) -> Void in
            self.arrayNews = arrayLatestNews
            self.CollectionLatestView.reloadData()
                if arrayLatestNews.count == 0 {
                    Alert.apiAlert(on: self, messegeBtn: "Reintentar") { _ in
                        self.viewModelNews.fetchData()
                    }
                } else {
                    self.arrayNews = arrayLatestNews
                }
         }
        
        self.viewModelNews.bindErrorMessage = {(_ errorMessage) in
            Alert.apiAlert(on: self, messegeBtn: "Reintentar") { _ in
                self.viewModelNews.fetchData()
            }
        }
        
        self.viewModelNews.bindEndRequest = {()  in
           self.loading.endAnimating()
        }
    }
}

// MARK: --> IF DATASOURCE

extension LandingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == CollectionLatestView {
            return self.arrayNews.count
        } else {
            return self.arrayTestimonials.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == CollectionLatestView {
            return SliderLatestViewCell.buildInCollectionView(collectionView, indexPath: indexPath, latest: self.arrayNews[indexPath.row])
        } else {
            return SliderTestimonialsViewCell.buildInCollectionView(collectionView, indexPath: indexPath, testimonial: self.arrayTestimonials[indexPath.row])
        }
    }
}

extension LandingViewController {
    
    class func buildController() -> UIViewController {
        
        let story = UIStoryboard(name: "Menu", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "LandingViewController")
        return controller
    }
}
