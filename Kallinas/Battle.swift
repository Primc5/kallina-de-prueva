//
//  Battle.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 8/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//

import UIKit

class Battle: UIViewController {
    @IBOutlet var P1HP:UITextField?
    @IBOutlet var P2HP:UITextField?
    
    @IBOutlet var btnNext:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.btnNext?.setTitle("SEE RESULTS", for: .normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    var open:Int = 0
    @IBAction func next(_ sender: Any){
        if(open == 0){
            self.btnNext?.setTitle("NEXT", for: .normal)
            open = 1
        }
        else{
            self.performSegue(withIdentifier: "reset", sender: self)
        }
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
