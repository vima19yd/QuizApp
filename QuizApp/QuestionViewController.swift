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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [buttonAnswerA, buttonAnswerB, buttonAnswerC, buttonAnswerD].forEach { (button) in
            button?.layer.cornerRadius = 20
        }

        // Do any additional setup after loading the view.
    }
    func showWrongAnswerAlert(button: UIButton){
        button.backgroundColor = .red
        let alertController = UIAlertController.init(title: "WRONG 🤮", message: "Try again!", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:{ (_) in self.performSegue(withIdentifier: "ResultView", sender: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
    func showCorrectAnswerAlert(button: UIButton){
        button.backgroundColor = .green
        let alertController = UIAlertController.init(title: "Correct! 😋", message: "Well done!", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:{ (_) in self.performSegue(withIdentifier: "ResultView", sender: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func buttonAnswerAHandler(_ sender: Any) {
        print("Martini")
        showWrongAnswerAlert(button: buttonAnswerA)
    }
    
    @IBAction func buttonAnswerBHandler(_ sender: Any) {
        print("Wine")
        showWrongAnswerAlert(button: buttonAnswerB)
    }
    
    @IBAction func buttonAnswerCHandler(_ sender: Any) {
        print("Apple Juice")
        showWrongAnswerAlert(button: buttonAnswerC)
    }
    
    @IBAction func buttonAnswerDHandler(_ sender: Any) {
        print("Beer")
        showCorrectAnswerAlert(button: buttonAnswerD)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
