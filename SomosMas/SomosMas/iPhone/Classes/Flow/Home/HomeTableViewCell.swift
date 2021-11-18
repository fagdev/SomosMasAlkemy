//
//  HomeTableViewCell.swift
//  Somosmas
//
//  Created by Ignacio Sosa on 10/18/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var testImage: UIImageView!
    @IBOutlet weak private var lblName: UILabel!
    @IBOutlet weak private var lblDescription: UILabel!

    var objTestimonial: Testimonial! {
        didSet { self.updateData() }
    }
    
    private func updateData() {
        
        self.lblName.text = self.objTestimonial.name
        self.lblDescription.text = self.objTestimonial.description
        self.testImage.downloadInURL(self.objTestimonial.urlImage)
    }
}

extension HomeTableViewCell {
    
    class func buildInTableView(_ tableView: UITableView, indexPath: IndexPath, testimonial: Testimonial) -> HomeTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell
        cell?.objTestimonial = testimonial
        return cell ?? HomeTableViewCell()
    }
}
