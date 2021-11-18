//
//  SliderLatestViewCell.swift
//  Somosmas
//
//  Created by Flavio Gomez on 08/11/2021.
//

import UIKit

class SliderLatestViewCell: UICollectionViewCell {
    

    @IBOutlet weak var sliderImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var objNews: LatestNewsDTO! {
        didSet { self.updateData() }
    }
    
    private func updateData() {
        self.lblDescription.text = self.objNews.content
        self.lblName.text = self.objNews.name
        self.sliderImage.downloadInURL(self.objNews.image ?? "")
    }
}

extension SliderLatestViewCell {

    class func buildInCollectionView(_ collectionView: UICollectionView, indexPath: IndexPath, latest: LatestNewsDTO) -> SliderLatestViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderLatestViewCell", for: indexPath) as? SliderLatestViewCell
        cell?.objNews = latest
        return cell ?? SliderLatestViewCell()
    }
}
