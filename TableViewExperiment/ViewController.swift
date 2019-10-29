//
//  ViewController.swift
//  TableViewExperiment
//
//  Created by Andres Quevedo on 10/4/19.
//  Copyright © 2019 Andres Quevedo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var dias : [Dia] = []
    var indexActual = 0
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let elemento = dias[indexPath.row]
        cell.textLabel?.text = elemento.nombre
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            dias = try context.fetch(Dia.fetchRequest())
            tableView.reloadData()
        } catch {
            print("Quebro en el catch wey")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /*
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObjTemp = dias[sourceIndexPath.item]
        
    }
    */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sendEnt = dias[indexPath.row]
        indexActual = indexPath.row
        if(self.tableView.isEditing) {
            
        } else {
            performSegue(withIdentifier: "diaAEjercicio", sender: sendEnt)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "diaAEjercicio") {
            let vc = segue.destination as! EjerciciosViewController
            vc.titleName = dias[indexActual].nombre!
            vc.diaActual = sender as? Dia
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            context.delete(dias[indexPath.row])
            dias.remove(at: indexPath.row)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
 
            tableView.reloadData()
 
        }
    }
    
    @IBAction func editAction(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing
        sender.title = (self.tableView.isEditing) ? "Done" : "Edit"
    }
    

}

