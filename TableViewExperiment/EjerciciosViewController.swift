//
//  EjerciciosViewController.swift
//  TableViewExperiment
//
//  Created by Andres Quevedo on 10/5/19.
//  Copyright © 2019 Andres Quevedo. All rights reserved.
//

import UIKit
import CoreData

class EjerciciosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var titleName = ""
    var diaActual : Dia? = nil
    var ejercicios : [Ejercicio] = []
    var indexActual = 0;
    
    @IBOutlet weak var tableViewEjercicios: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ejercicios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let elemento = ejercicios[indexPath.row]
        cell.textLabel?.text = elemento.nombre
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sendEj = ejercicios[indexPath.row]
        indexActual = indexPath.row
        performSegue(withIdentifier: "ejerciciosAShowEjercicio", sender: sendEj)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ejerciciosAShowEjercicio") {
            var vc = segue.destination as! ShowEjercicioViewController
            vc.titleName = ejercicios[indexActual].nombre!
            vc.ejercicioActual = sender as? Ejercicio
        } else {
            var vc = segue.destination as! AddEjercicioViewController
            vc.diaActual = diaActual
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = titleName
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //(UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        do {
            ejercicios = diaActual?.ejercicios?.allObjects as! [Ejercicio]
            tableViewEjercicios.reloadData()
        } catch {
            print("Quebro en el catch wey")
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            context.delete(ejercicios[indexPath.row])
            ejercicios.remove(at: indexPath.row)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            tableViewEjercicios.reloadData()
        }
    }
    
    @IBAction func editEjercicios(_ sender: UIBarButtonItem)
    {
        self.tableViewEjercicios.isEditing = !self.tableViewEjercicios.isEditing
        sender.title = (self.tableViewEjercicios.isEditing) ? "Done" : "Edit"
    }
    
    /*
    
 
    */
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
