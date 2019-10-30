//
//  Ejercicio+CoreDataProperties.swift
//  TableViewExperiment
//
//  Created by Andres Quevedo on 10/29/19.
//  Copyright © 2019 Andres Quevedo. All rights reserved.
//
//

import Foundation
import CoreData


extension Ejercicio {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ejercicio> {
        return NSFetchRequest<Ejercicio>(entityName: "Ejercicio")
    }

    @NSManaged public var max: Int32
    @NSManaged public var nombre: String?
    @NSManaged public var reps: Int16
    @NSManaged public var sets: Int16
    @NSManaged public var notes: String?
    @NSManaged public var dia: Dia?

}
