//
//  P1.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 8/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//

import UIKit

class P1: UIViewController {
    @IBOutlet var btnAttack:UIButton?
    @IBOutlet var btnDefence:UIButton?
    @IBOutlet var btnEnd:UIButton?
    override func viewDidLoad() {
        
        super.viewDidLoad()
       // btnEnd?.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickAttack(_ sender: Any) {
        btnDefence?.isEnabled = false
        btnDefence?.adjustsImageWhenHighlighted = false
    }
    
    @IBAction func clickDefence(_ sender: Any) {
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
