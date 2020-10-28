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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonAnswerA.layer.cornerRadius = 20
        buttonAnswerB.layer.cornerRadius = 20
        buttonAnswerC.layer.cornerRadius = 20
        buttonAnswerD.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    func wrongAnswer(){
        let alertController = UIAlertController.init(title: "WRONG 🤮", message: "Try again!", preferredStyle: UIAlertController.Style.alert)
        present(alertController, animated:true, completion: nil)
        alertController.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:{(_) in alertController.dismiss(animated: true, completion: nil)}))
    }
    func correctAnswer(){
        let alertController = UIAlertController.init(title: "Correct! 😋", message: "Well done!", preferredStyle: UIAlertController.Style.alert)
        present(alertController, animated:true, completion: nil)
        alertController.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:{(_) in alertController.dismiss(animated: true, completion: nil)}))
    }
    
    @IBAction func buttonAnswerAHandler(_ sender: Any) {
        print("Martini")
        buttonAnswerA.backgroundColor = .red
        wrongAnswer()
    }
    
    @IBAction func buttonAnswerBHandler(_ sender: Any) {
        print("Wine")
        buttonAnswerB.backgroundColor = .red
        wrongAnswer()
    }
    
    @IBAction func buttonAnswerCHandler(_ sender: Any) {
        print("Apple Juice")
        buttonAnswerC.backgroundColor = .red
        wrongAnswer()
    }
    
    @IBAction func buttonAnswerDHandler(_ sender: Any) {
        print("Beer")
        buttonAnswerD.backgroundColor = .green
        correctAnswer()
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
