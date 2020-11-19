//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Marcus Vilhelmsson on 2020-10-28.
//

import UIKit
import CoreData

class QuestionViewController: UIViewController {

    @IBOutlet weak var buttonAnswerA: UIButton!
    @IBOutlet weak var buttonAnswerB: UIButton!
    @IBOutlet weak var buttonAnswerC: UIButton!
    @IBOutlet weak var buttonAnswerD: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    private var haveWon = false
    var questions: [Question] = []{
        didSet{
            question = questions.removeFirst()
        }
    }
    
    var question: Question?
    var numberOfQuestions = 0
    var numberOfrightAnswers = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.clipsToBounds = true
        questionLabel.layer.cornerRadius = 20
        
        var buttons = [buttonAnswerA, buttonAnswerB, buttonAnswerC, buttonAnswerD]
        
        buttons.forEach { (button) in
            button?.layer.cornerRadius = 20
            button?.titleLabel?.numberOfLines = 1
            button?.titleLabel?.adjustsFontSizeToFitWidth = true
            button?.titleLabel?.lineBreakMode = .byClipping //<-- MAGIC LINE
        }
        questionLabel.text = question?.question
        buttons.shuffle()
        let correctButton = buttons.removeFirst()
        correctButton?.setTitle(question?.correctAnswer, for: .normal)
        
        question?.incorrectAnswers.forEach({(answer) in
            let button = buttons.removeFirst()
            button?.setTitle(answer, for: .normal)
        })
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAnswerAHandler(_ sender: Any) {
        if buttonAnswerA.title(for: .normal) == question?.correctAnswer{
            showCorrectAnswerAlert(button: buttonAnswerA)
        } else {
            showWrongAnswerAlert(button: buttonAnswerA)
        }
    }
    
    @IBAction func buttonAnswerBHandler(_ sender: Any) {
        if buttonAnswerB.title(for: .normal) == question?.correctAnswer{
            showCorrectAnswerAlert(button: buttonAnswerB)
        } else {
            showWrongAnswerAlert(button: buttonAnswerB)
        }
    }
    
    @IBAction func buttonAnswerCHandler(_ sender: Any) {
        if buttonAnswerC.title(for: .normal) == question?.correctAnswer{
            showCorrectAnswerAlert(button: buttonAnswerC)
        } else {
            showWrongAnswerAlert(button: buttonAnswerC)
        }
    }
    
    @IBAction func buttonAnswerDHandler(_ sender: Any) {
        if buttonAnswerD.title(for: .normal) == question?.correctAnswer{
        showCorrectAnswerAlert(button: buttonAnswerD)
        } else {
        showWrongAnswerAlert(button: buttonAnswerD)
        }
    }
    
    func showWrongAnswerAlert(button: UIButton){
        haveWon = false
        button.backgroundColor = .red
        let alertController = UIAlertController.init(title: "WRONG 🤮", message: "Try again!", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:{ [weak self] (_) in
            self?.goToNextScreen()
        }))
        present(alertController, animated: true, completion: nil)
    }
    func showCorrectAnswerAlert(button: UIButton){
        haveWon = true
        button.backgroundColor = .green
        let alertController = UIAlertController.init(title: "Correct! 😋", message: "Well done!", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:{ [weak self] (_) in
            self?.goToNextScreen()
        }))
        numberOfrightAnswers = numberOfrightAnswers + 1
        present(alertController, animated: true, completion: nil)
    }
    
    private func goToNextScreen() {
        guard questions.isEmpty == false, let questionViewController = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController else{
                saveGameResult()
                performSegue(withIdentifier: "ResultView", sender: nil)
                return
        }
        
        questionViewController.questions = questions
        questionViewController.numberOfrightAnswers = numberOfrightAnswers
        questionViewController.numberOfQuestions = numberOfQuestions
        
        navigationController?.pushViewController(questionViewController, animated: true)
        
    }
    private func saveGameResult(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        

    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewController = segue.destination as? ResultViewController{
            
            resultViewController.resultView.resultLabel.text = "🤩 You answered \(numberOfrightAnswers) right from \(numberOfQuestions) questions"
        }
        
    }
    
}
