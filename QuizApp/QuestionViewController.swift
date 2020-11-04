//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Marcus Vilhelmsson on 2020-10-28.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var buttonAnswerA: UIButton!
    @IBOutlet weak var buttonAnswerB: UIButton!
    @IBOutlet weak var buttonAnswerC: UIButton!
    @IBOutlet weak var buttonAnswerD: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    private var haveWon = false
    var question: Question?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var buttons = [buttonAnswerA, buttonAnswerB, buttonAnswerC, buttonAnswerD]
        
        buttons.forEach { (button) in
            button?.layer.cornerRadius = 20
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
    func showWrongAnswerAlert(button: UIButton){
        haveWon = false
        button.backgroundColor = .red
        let alertController = UIAlertController.init(title: "WRONG 🤮", message: "Try again!", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:{ (_) in self.performSegue(withIdentifier: "ResultView", sender: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
    func showCorrectAnswerAlert(button: UIButton){
        haveWon = true
        button.backgroundColor = .green
        let alertController = UIAlertController.init(title: "Correct! 😋", message: "Well done!", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:{ (_) in self.performSegue(withIdentifier: "ResultView", sender: nil)
        }))
        present(alertController, animated: true, completion: nil)
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
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewController = segue.destination as? ResultViewController{
            
            resultViewController.resultView.resultLabel.text = haveWon ? "🥳":"☹️"
        }
        
    }
    
}
