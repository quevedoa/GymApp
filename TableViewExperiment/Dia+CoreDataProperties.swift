//
//  Dia+CoreDataProperties.swift
//  TableViewExperiment
//
//  Created by Andres Quevedo on 10/14/19.
//  Copyright © 2019 Andres Quevedo. All rights reserved.
//
//

import Foundation
import CoreData


extension Dia {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dia> {
        return NSFetchRequest<Dia>(entityName: "Dia")
    }

    @NSManaged public var nombre: String?
    @NSManaged public var ejercicios: NSSet?

}

// MARK: Generated accessors for ejercicios
extension Dia {

    @objc(addEjerciciosObject:)
    @NSManaged public func addToEjercicios(_ value: Ejercicio)

    @objc(removeEjerciciosObject:)
    @NSManaged public func removeFromEjercicios(_ value: Ejercicio)

    @objc(addEjercicios:)
    @NSManaged public func addToEjercicios(_ values: NSSet)

    @objc(removeEjercicios:)
    @NSManaged public func removeFromEjercicios(_ values: NSSet)

}
