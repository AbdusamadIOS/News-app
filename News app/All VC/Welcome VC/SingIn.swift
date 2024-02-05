//
//  SingIn.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 05/02/24.
//

import UIKit

class SingIn: UIViewController {
    
    @IBOutlet weak var conteneirView: UIView!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.layer.cornerRadius = 15
        conteneirView.layer.cornerRadius = 15
       
    }

    @IBAction func singUpBtn(_ sender: UIButton) {
        
        let login = SingUp(nibName: "SingUp", bundle: nil)
        login.modalTransitionStyle = .coverVertical
        login.modalPresentationStyle = .fullScreen
        
        self.present(login, animated: true)
        
    }
    @IBAction func nextBtn(_ sender: UIButton) {
        let vc1 = TabbarVC()
        
        vc1.modalTransitionStyle = .coverVertical
        vc1.modalPresentationStyle = .fullScreen
        self.present(vc1, animated: true)
    }
    
}
