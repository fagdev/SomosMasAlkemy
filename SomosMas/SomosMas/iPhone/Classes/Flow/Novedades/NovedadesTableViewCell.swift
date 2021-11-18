//
//  NovedadesTableViewCell.swift
//  Somosmas
//
//  Created by Ignacio Sosa on 10/29/21.
//

import UIKit

class NovedadesTableViewCell: UITableViewCell {
    @IBOutlet private weak var newsImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    
    var objLatestNews: LatestNewsDTO! {
        didSet { self.updateData() }
    }
    
    private func updateData() {
        self.lblName.text = self.objLatestNews.name?.removeEspecialCharacters
        self.lblContent.text = self.objLatestNews.content?.removeEspecialCharacters
        self.newsImage.downloadInURL(self.objLatestNews.image ?? String())
    }
}

extension NovedadesTableViewCell {
    class func buildInTableView (_ tableView: UITableView, indexPath: IndexPath, latestNews: LatestNewsDTO) -> NovedadesTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NovedadesTableViewCell", for: indexPath) as? NovedadesTableViewCell
        cell?.objLatestNews = latestNews
        return cell ?? NovedadesTableViewCell()
    }
}
