//
//  QuestionsResult.swift
//  QuizApp
//
//  Created by Marcus Vilhelmsson on 2020-11-19.
//

import Foundation

struct QuestionsResult: Decodable {
    let results: [Question]
}
