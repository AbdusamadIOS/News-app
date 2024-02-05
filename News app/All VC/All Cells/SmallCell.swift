//
//  SmallCell.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 15/11/23.
//

import UIKit

class SmallCell: UICollectionViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
      
        newsImage.layer.cornerRadius = 15
    }

}
