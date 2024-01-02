//
//  ImageSetting.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 17/11/23.
//

import UIKit

extension UIImageView {
    
    func setImage(by url: URL?) {
        
        guard let url else { return }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data, error == nil else {
                return
            }
             let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.image = image
            }
            
        }.resume()
    }
}
