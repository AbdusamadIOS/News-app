//
//  ProfilVC.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 15/11/23.
//

import UIKit

class ProfilVC: UIViewController {

 
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func logOutBtn(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Haqiqatdan ham ilovadan chiqib ketmoqchimisiz?", message: nil, preferredStyle: .alert)
        
        let ha = UIAlertAction(title: "Ha", style: .default) { _ in
            UserDefaults.standard.removeObject(forKey: "isLogin")
            let vc = SingIn(nibName: "SingIn", bundle: nil)
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true)
   
        }
        
        let orqaga = UIAlertAction(title: "Orqaga", style: .cancel)
        
        alert.addAction(orqaga)
        alert.addAction(ha)
        
        self.present(alert, animated: true)
        
    }
    
   
}
