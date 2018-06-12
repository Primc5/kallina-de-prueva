//
//  Custom.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 11/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//

import UIKit

class  Custom: UIViewController , UITableViewDelegate, UITableViewDataSource, DataHolderDelegate{
    @IBOutlet var tbMiTabla:UITableView?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        Dataholder.sharedInstance.descargarCapuchas(delegate: self)
        
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DHDDescargaCiudadesCompleta(blnFin: Bool){
        if blnFin == true{
            self.refreshUI()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Dataholder.sharedInstance.arCapuchas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCCelula = tableView.dequeueReusableCell(withIdentifier: "micelda1")as! TVCCelula
        
        cell.lblNombre?.text = Dataholder.sharedInstance.arCapuchas[indexPath.row].sNombre
        cell.descargarImagenes(url: Dataholder.sharedInstance.arCapuchas[indexPath.row].sFoto!)
        
        return cell
        
        
    }
   
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.tbMiTabla?.reloadData()
        })
    }
    
}

