//
//  ResultViewController.swift
//  QuizApp
//
//  Created by Marcus Vilhelmsson on 2020-11-02.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let resultView  = ResultView()
    
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
