//
//  ImageDownloader.swift
//  Somosmas
//
//  Created by Lulu Sorbelli on 10/18/21.
//

import Foundation
import Alamofire
import UIKit

extension UIImageView {
    
    typealias ImageDownloadHandler = (_ image: UIImage?, _ urlDownload: String) -> Void
    
    func downloadInURL(_ urlString: String, placeHolder: UIImage? = nil, completionHandler: ImageDownloadHandler? = nil) {
        
        self.image = placeHolder
        
        AF.request(urlString).response { dataResponse in
            
            guard let data = dataResponse.data else {
                
                if let completionHandler = completionHandler {
                    completionHandler(placeHolder, dataResponse.request?.url?.absoluteString ?? "")
                } else {
                    self.image = placeHolder
                }
                return
            }
            
            DispatchQueue.global(qos: .background).async {
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    
                    if let completionHandler = completionHandler {
                        completionHandler(image, dataResponse.request?.url?.absoluteString ?? "")
                    } else {
                        self.image = image
                    }
                }
            }
        }
    }
}
