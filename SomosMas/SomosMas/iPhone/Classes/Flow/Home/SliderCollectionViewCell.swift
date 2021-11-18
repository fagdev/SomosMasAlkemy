//
//  SliderCollectionViewCell.swift
//  Somosmas
//
//  Created by Ignacio Sosa on 10/25/21.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var sliderImage: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    var objTestimonial: Testimonial! {
        didSet { self.updateData() }
    }
    
    private func updateData() {
        self.lblDescription.text = self.objTestimonial.description
        self.lblName.text = self.objTestimonial.name
        self.sliderImage.downloadInURL(self.objTestimonial.urlImage)
    }
}
extension SliderCollectionViewCell {
    
    
    class func buildInCollectionView(_ collectionView: UICollectionView, indexPath: IndexPath, testimonial: Testimonial) -> SliderCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as? SliderCollectionViewCell
        cell?.objTestimonial = testimonial
        return cell ?? SliderCollectionViewCell()
    }
}
