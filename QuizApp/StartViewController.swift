//
//  StartViewController.swift
//  QuizApp
//
//  Created by Marcus Vilhelmsson on 2020-11-04.
//

import UIKit

class StartViewController: UIViewController {
    
    var questions: [Question] = []
    
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        
        startButton.isEnabled = false
        downloadQuesitons(amount: 5)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func highscoreButtonHandler(_ sender: Any) {
        let highscoreTableViewController = HighscoreTableViewController()
        navigationController?.pushViewController(highscoreTableViewController, animated: true)
        
    }
    
    private func downloadQuesitons(amount: Int){
        guard let url = URL(string:"https://opentdb.com/api.php?amount=\(amount)&type=multiple") else{
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
                self?.startButton.isEnabled = true
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
