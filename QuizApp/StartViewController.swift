//
//  StartViewController.swift
//  QuizApp
//
//  Created by Marcus Vilhelmsson on 2020-11-04.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let questionViewController = segue.destination as? QuestionViewController{
            let question = Question(category: "Drinks", type: .multiple, difficulty:.easy, question: "What type of drink would I prefer", correctAnswer: "🥤", incorrectAnswers: ["🧃","🧉","🥃"])
            questionViewController.question = question
        }
    }
}
