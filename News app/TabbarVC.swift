//
//  TabbarVC.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 15/11/23.
//

import UIKit

class TabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let home = HomeVC(nibName: "HomeVC", bundle: nil)
        home.tabBarItem.title = "Home"
        home.tabBarItem.image = UIImage(systemName: "house")
        
        let profil = ProfilVC(nibName: "ProfilVC", bundle: nil)
        profil.tabBarItem.title = "Profile"
        profil.tabBarItem.image = UIImage(systemName: "person")
        
        viewControllers = [home, profil]
        
        tabBar.tintColor = .systemIndigo
      
       
      
        
        
    }
    

    

}
