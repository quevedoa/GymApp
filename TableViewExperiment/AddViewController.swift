//
//  AddViewController.swift
//  TableViewExperiment
//
//  Created by Andres Quevedo on 10/4/19.
//  Copyright © 2019 Andres Quevedo. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController, UINavigationControllerDelegate{

    @IBOutlet weak var textField: UITextField!
    
    var entidad : Dia? = nil
    
    @IBOutlet weak var addDayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addButton(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let entidad = Dia(context: context)
        entidad.nombre = textField.text
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
