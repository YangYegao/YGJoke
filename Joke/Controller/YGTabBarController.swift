//
//  YGTabBarController.swift
//  Joke
//
//  Created by 杨业高(外包) on 2018/5/30.
//  Copyright © 2018年 杨业高(外包). All rights reserved.
//

import UIKit

class YGTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latestVC = YGJokeViewController(type: .latest)
        latestVC.title = "最新"
        let latestNav = UINavigationController(rootViewController: latestVC)
        
        let suggestVC = YGJokeViewController(type: .suggest)
        suggestVC.title = "推荐"
        let suggestNav = UINavigationController(rootViewController: suggestVC)
        
        let imgrankVC = YGJokeViewController(type: .imgrank)
        imgrankVC.title = "有图"
        let imgrankNav = UINavigationController(rootViewController: imgrankVC)
        
        self.viewControllers = [latestNav,suggestNav,imgrankNav]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
