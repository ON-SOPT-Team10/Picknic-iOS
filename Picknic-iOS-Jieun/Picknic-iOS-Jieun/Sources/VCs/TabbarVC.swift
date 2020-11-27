//
//  TabbarVC.swift
//  Picknic-iOS-Jieun
//
//  Created by 황지은 on 2020/11/27.
//

import UIKit

class TabbarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        // Do any additional setup after loading the view.
    }
    
    
    func setTabBar() {
        
        self.tabBar.tintColor = UIColor.black
        
        // 1
        let Homes = UIStoryboard.init(name: "Home", bundle: nil)
        guard let firstTab = Homes.instantiateViewController(identifier: "HomeVC")
                as? HomeVC  else {
            return
        }
        
        firstTab.tabBarItem.image = UIImage(named: "tabbarIcnHomeUnselected")
        firstTab.tabBarItem.selectedImage = UIImage(named: "tabbarIcnHomeSelected")
        
        // 2
        let Picklist = UIStoryboard.init(name: "Picklist", bundle: nil)
        guard let secondTab = Picklist.instantiateViewController(identifier: "PicklistVC")
                as? PicklistVC  else {
            return
        }
        
        secondTab.tabBarItem.image = UIImage(named: "tabbarIcnListUnselected")
        secondTab.tabBarItem.selectedImage = UIImage(named: "tabbarIcnListSelected")
        
        //3
        let Profile = UIStoryboard.init(name: "Profile", bundle: nil)
        guard let thirdTab = Profile.instantiateViewController(identifier: "ProfileVC")
                as? ProfileVC  else {
            return
        }
        
        thirdTab.tabBarItem.image = UIImage(named: "tabbarIconProfileUnselected")
        thirdTab.tabBarItem.selectedImage = UIImage(named: "tabbarIconProfileSelected")
        
        
        let tabs =  [firstTab, secondTab, thirdTab]
        
        tabBar.layer.shadowOpacity = 0.1
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        tabBar.layer.shadowRadius = 3
        self.setViewControllers(tabs, animated: false)
    }
    
}
