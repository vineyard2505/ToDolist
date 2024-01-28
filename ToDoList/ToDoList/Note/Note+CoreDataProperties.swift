//
//  Note+CoreDataProperties.swift
//  ToDoList
//
//  Created by Екатерина Свиридо on 28.01.24.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: String?
    @NSManaged public var text: String?
    @NSManaged public var title: String?
    @NSManaged public var date: Date?

}

extension Note : Identifiable {
    
    func updateNote(newTitle: String, newText: String){
        self.title = newTitle
        self.text = newText
        self.date = Date()
        
        try? managedObjectContext?.save()
    }
    
    func deleteNote(){
        managedObjectContext?.delete(self)
        
        try? managedObjectContext?.save()
    }

}
