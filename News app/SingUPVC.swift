//
//  SingUPVC.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 20/11/23.
//

import UIKit

class SingUPVC: UIViewController {

    @IBOutlet weak var conteneirView: UIView!
    @IBOutlet weak var fullnameTF: UITextField!
    @IBOutlet weak var CountryTF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.layer.cornerRadius = 15
        conteneirView.layer.cornerRadius = 15
    }

    @IBAction func nextbtn(_ sender: UIButton) {
        
        let vc = TabbarVC()
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
        
    }
    
 

}
