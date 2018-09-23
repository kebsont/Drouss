//
//  BaseTabBarViewController.swift
//  Dourouss
//
//  Created by Moustapha Kebe on 23/09/2018.
//  Copyright © 2018 KEBE. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {
//    @IBInspectable var defaultIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 1
        // Do any additional setup after loading the view.
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
