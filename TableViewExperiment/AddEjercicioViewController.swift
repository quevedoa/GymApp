//
//  AddEjercicioViewController.swift
//  TableViewExperiment
//
//  Created by Andres Quevedo on 10/5/19.
//  Copyright © 2019 Andres Quevedo. All rights reserved.
//

import UIKit

class AddEjercicioViewController: UIViewController, UINavigationControllerDelegate {

    var diaActual : Dia? = nil
    var ejercicioActual : Ejercicio!
    
    @IBOutlet weak var nombreEjercicioTextField: UITextField!
    @IBOutlet weak var numeroReps: UILabel!
    @IBOutlet weak var numeroSets: UILabel!
    @IBOutlet weak var numeroMax: UILabel!
    @IBOutlet weak var notasTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else
        {
            return
        }
        
        if (notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification) {
            view.frame.origin.y = -keyboardRect.height
        } else {
            view.frame.origin.y = 0
        }

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        var ej = Ejercicio(context: context)
        ejercicioActual = ej
    }
    
    @IBAction func stepperReps(_ sender: UIStepper) {
        let repsValue = Int16(sender.value)
        numeroReps.text = String(repsValue)
        ejercicioActual.reps = repsValue
    }
    @IBAction func stepperSets(_ sender: UIStepper) {
        let setsValue = Int16(sender.value)
        numeroSets.text = String(setsValue)
        ejercicioActual.sets = setsValue
    }
    @IBAction func stepperMax(_ sender: UIStepper) {
        let maxValue = Int32(sender.value)
        numeroMax.text = String(maxValue)
        ejercicioActual.max = maxValue
    }

    @IBAction func addEjercicio(_ sender: UIBarButtonItem) {
        ejercicioActual.notes = notasTextView.text!
        
        ejercicioActual.nombre = nombreEjercicioTextField.text
        diaActual?.addToEjercicios(ejercicioActual)

        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        //ejercicios = diaActual?.ejercicios?.allObjects as! [Ejercicio]
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
