//
//  ProfilVC.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 15/11/23.
//

import UIKit

class ProfilVC: UIViewController {

    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var editUserNameTF: UITextField!
    @IBOutlet weak var editCountryBtn: UITextField!
    @IBOutlet weak var editBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        editBtn.layer.cornerRadius = 15
    }

    @IBAction func logOutBtn(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Haqiqatdan ham ilovadan chiqib ketmoqchimisiz?", message: nil, preferredStyle: .alert)
        
        let ha = UIAlertAction(title: "Ha", style: .default) { _ in
            
            let vc = SingUPVC(nibName: "SingUPVC", bundle: nil)
            
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true)
        }
        
        let orqaga = UIAlertAction(title: "Orqaga", style: .cancel)
        
        alert.addAction(orqaga)
        alert.addAction(ha)
        
        self.present(alert, animated: true)
        
    }
    
    @IBAction func editBtn(_ sender: UIButton) {
    }
    
}
