//
//  AboutUsCell.swift
//  Somosmas
//
//  Created by Lucas Di Lorenzo on 28/10/2021.
//

import Foundation
import UIKit


class AboutUsCell: UITableViewCell{
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var testImage: UIImageView!
    
   var objAboutUs: AboutUs! {
        didSet { self.updateData() }
    }
    
    private func updateData() {
        
        self.lblName.text = self.objAboutUs.name
        self.lblDescription.text = self.objAboutUs.description.removeEspecialCharacters
        self.testImage.downloadInURL(self.objAboutUs.image)
    }
    
}

extension AboutUsCell {
    
    class func buildInTableView(_ tableView: UITableView, indexPath: IndexPath, aboutUs: AboutUs) -> AboutUsCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutUsCell", for: indexPath) as? AboutUsCell
        cell?.objAboutUs = aboutUs
        return cell ?? AboutUsCell()
    }
}
