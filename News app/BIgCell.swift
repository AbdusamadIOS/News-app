//
//  BIgCell.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 15/11/23.
//

import UIKit

class BIgCell: UICollectionViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        newsImage.layer.cornerRadius = 15
    }
//    func updateCell(articles: Articles) {
//        
//        titleLbl.text = articles.title
//        descLbl.text = articles.description
//        
//       // weatherImage.setImage(by: URL(string: "https:" + day.day.condition.icon))
//    }

}
