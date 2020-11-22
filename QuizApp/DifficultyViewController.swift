//
//  DifficultyViewController.swift
//  QuizApp
//
//  Created by Marcus Vilhelmsson on 2020-11-22.
//

import UIKit

class DifficultyViewController: UIViewController {
    
    var questions: [Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hardButtonHandler(_ sender: Any) {
        downloadQuesitons(amount: 5, difficulty: "hard")
    }
    
    @IBAction func mediumButtonHandler(_ sender: Any) {
        downloadQuesitons(amount: 5, difficulty: "medium")
    }
    
    @IBAction func easyButtonHandler(_ sender: Any) {
        downloadQuesitons(amount: 5, difficulty: "easy")
        
    }
    
    
    
    private func downloadQuesitons(amount: Int, difficulty: String){
        guard let url = URL(string:"https://opentdb.com/api.php?amount=\(amount)&difficulty=\(difficulty)") else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] (data, _, error) in
            guard let data = data else{
                print(error)
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let questionsResult = try? decoder.decode(QuestionsResult.self, from: data)
            self?.questions = questionsResult?.results ?? []
            
            DispatchQueue.main.async {
    
            }
            
        }
        task.resume()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let questionViewController = segue.destination as? QuestionViewController{
            questionViewController.questions = questions
            questionViewController.numberOfQuestions = questions.count
        }
    }

}
