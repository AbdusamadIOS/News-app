//
//  SeeNewsVC.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 17/11/23.
//

import UIKit

class SeeNewsVC: UIViewController {

    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var newTitleLbl: UILabel!
    @IBOutlet weak var newDescLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var disLikeBtn: UIButton!
    @IBOutlet weak var likeNumberLbl: UILabel!
    @IBOutlet weak var dislikeNumberLbl: UILabel!
    
    var seeArticle: Articles?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newImage.layer.cornerRadius = 15
        if let seeArticle {
            
            newDescLbl.text = seeArticle.description
            newTitleLbl.text = seeArticle.title
            newImage.setImage(by: URL(string: seeArticle.urlToImage ?? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fvector%2Fno-image-available-photo-coming-soon-gm1392182937-448510205&psig=AOvVaw3sFZNOTMmgbvG7zH3ZSkDc&ust=1700302080396000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCODtpP7kyoIDFQAAAAAdAAAAABAJ"))
        }
        
        likeBtn.layer.cornerRadius = 15
        disLikeBtn.layer.cornerRadius = 15
        
    }

    @IBAction func likeBtn(_ sender: Any) {
        
        if likeBtn.tintColor == UIColor.white {
            likeBtn.tintColor = UIColor.systemYellow
            let num = 0
            let numPlus = num + 1
            likeNumberLbl.text = String(numPlus)
            
        }else if likeBtn.tintColor == UIColor.systemYellow {
            likeBtn.tintColor = UIColor.white
            let num1 = Int(likeNumberLbl.text!)
            let numMinus = num1! - 1
            likeNumberLbl.text = String(numMinus)
           
            
        }
    }
    
    @IBAction func disLikeBtn(_ sender: UIButton) {
        
        if disLikeBtn.tintColor == UIColor.white {
            disLikeBtn.tintColor = UIColor.systemYellow
            let num = 0
            let numPlus = num + 1
            dislikeNumberLbl.text = String(numPlus)
        }else if disLikeBtn.tintColor == UIColor.systemYellow {
            disLikeBtn.tintColor = UIColor.white
            disLikeBtn.tintColor = UIColor.white
            let num1 = Int(dislikeNumberLbl.text!)
            let numMinus = num1! - 1
            dislikeNumberLbl.text = String(numMinus)
        }
    }
    
    @IBAction func disBtn(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
}
