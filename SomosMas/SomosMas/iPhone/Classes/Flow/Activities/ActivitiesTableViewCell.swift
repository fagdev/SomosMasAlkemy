//
//  ActivitiesViewCell.swift
//  Somosmas
//
//  Created by Artekium on 22/10/2021.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var activitiImage: UIImageView!
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var lblDescription: UILabel!
    
    var activityDetail: Activity! {
        didSet { self.configureCell() }
    }
    
    private func configureCell() {
        self.lblTitle.text = self.activityDetail.name
        self.lblDescription.text = self.activityDetail.description
        self.activitiImage.downloadInURL(self.activityDetail.image)
    }
}

extension ActivitiesTableViewCell {
    
    class func buildCellInTable(_ tableView: UITableView, indexPath: IndexPath, activity: Activity) -> ActivitiesTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivitiesTableViewCell", for: indexPath) as? ActivitiesTableViewCell
        cell?.activityDetail = activity
        return cell ?? ActivitiesTableViewCell()
    }
}
