//
//  SliderTestimonialsViewCell.swift
//  Somosmas
//
//  Created by Flavio Gomez on 08/11/2021.
//

import UIKit

class SliderTestimonialsViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var sliderImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
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

extension SliderTestimonialsViewCell {
    
    
    class func buildInCollectionView(_ collectionView: UICollectionView, indexPath: IndexPath, testimonial: Testimonial) -> SliderTestimonialsViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderTestimonialViewCell", for: indexPath) as? SliderTestimonialsViewCell
        cell?.objTestimonial = testimonial
        return cell ?? SliderTestimonialsViewCell()
    }
}
