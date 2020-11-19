//
//  GameResult+CoreDataProperties.swift
//  QuizApp
//
//  Created by Marcus Vilhelmsson on 2020-11-19.
//
//

import Foundation
import CoreData


extension GameResult {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameResult> {
        return NSFetchRequest<GameResult>(entityName: "GameResult")
    }

    @NSManaged public var numberOfQuestions: Int32
    @NSManaged public var numberOfRightAnswers: Int32
    @NSManaged public var date: Date?

}

extension GameResult : Identifiable {

}
