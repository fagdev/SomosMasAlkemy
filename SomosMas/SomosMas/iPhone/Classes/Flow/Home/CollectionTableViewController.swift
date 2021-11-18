//
//  CollectionTableViewController.swift
//  Somosmas
//
//  Created by Ignacio Sosa on 10/25/21.
//

import UIKit

class CollectionTableViewController: FrontRevealController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let viewModel = HomeViewModel()
    private var arrayTestimonials = [Testimonial]()
    
    @IBOutlet weak var nextPageButton: UIButton!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.viewModel.fetchData()
        setBinds()
    }
    
    private func setBinds() {
        self.viewModel.bindErrorMessage = { (_ errorMessage: String) -> Void in
            self.showAlertWithTitle("Error", message: errorMessage)
        }
        
        self.viewModel.bindTestimonials = { (_ arrayTestimonials: [Testimonial]) -> Void in
            let prefix = arrayTestimonials.prefix(4)
            self.arrayTestimonials = Array(prefix)
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayTestimonials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        SliderCollectionViewCell.buildInCollectionView(collectionView, indexPath: indexPath, testimonial: self.arrayTestimonials[indexPath.row])
    }
    
}

extension CollectionTableViewController {
    
    class func buildController() -> UIViewController {
        
        let story = UIStoryboard(name: "Testimonials", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "CollectionTableViewController")
        return controller
    }
}
