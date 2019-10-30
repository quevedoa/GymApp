//
//  ShowEjercicioViewController.swift
//  TableViewExperiment
//
//  Created by Andres Quevedo on 10/5/19.
//  Copyright © 2019 Andres Quevedo. All rights reserved.
//

import UIKit

class ShowEjercicioViewController: UIViewController {

    var titleName = ""
    var ejercicioActual : Ejercicio? = nil
    
    @IBOutlet weak var ejercicioLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    
    var finalReps : Int16 = 0
    var finalSets : Int16 = 0
    var finalMax : Int32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //ejercicioLabel.text = titleName
        ejercicioLabel.text = ejercicioActual?.nombre
        
        finalReps = ejercicioActual!.reps
        finalSets = ejercicioActual!.sets
        finalMax = ejercicioActual!.max
        
        repsLabel.text = String(ejercicioActual!.reps)
        setsLabel.text = String(ejercicioActual!.sets)
        maxLabel.text = String(ejercicioActual!.max)
        notesTextView.text = ejercicioActual?.notes
    }
    
    @IBAction func repsStepper(_ sender: UIStepper) {
        let repsActuales = ejercicioActual!.reps
        
        repsLabel.text = String(Int(sender.value + Double(repsActuales)))
        finalReps = Int16(sender.value + Double(repsActuales))
        /*
        ejercicioActual?.reps = Int16(sender.value + Double(repsActuales))
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
 */
    }
    @IBAction func setsStepper(_ sender: UIStepper) {
        let setsActuales = ejercicioActual!.sets
        
        setsLabel.text = String(Int(sender.value + Double(setsActuales)))
        finalSets = Int16(sender.value + Double(setsActuales))
        
        /*
        ejercicioActual?.sets = Int16(sender.value + Double(setsActuales))
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
 */
    }
    @IBAction func maxStepper(_ sender: UIStepper) {
        let maxActual = ejercicioActual!.max
       
        maxLabel.text = String(Int(sender.value + Double(maxActual)))
        finalMax = Int32(sender.value + Double(maxActual))
        /*
        ejercicioActual?.max = Int32(sender.value + Double(maxActual))
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
 */
    }
    
    @IBAction func saveEjercicio(_ sender: UIBarButtonItem) {
        ejercicioActual?.reps = finalReps
        ejercicioActual?.sets = finalSets
        ejercicioActual?.max = finalMax
        ejercicioActual?.notes = notesTextView.text
        
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
