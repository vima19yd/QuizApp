//
//  ResultView.swift
//  QuizApp
//
//  Created by Marcus Vilhelmsson on 2020-11-02.
//

import UIKit

class ResultView: UIView {
    private let titleLabel = UILabel()
    let resultLabel = UILabel()
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = .red
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        
    }
}
