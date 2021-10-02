//
//  EDHeadLabel.swift
//  Educational
//
//  Created by Amr Moussa on 30/09/2021.
//

import UIKit
import AMCodeBase

class EDHeadLabel: AMItemLable {
    
    init(text:String) {
        super.init(textAlignment: .right, NoOfLines: 1, size: 15)
        configureText(Tetx: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureText(Tetx:String){
        setText(text:Tetx )
        font = UIFont.systemFont(ofSize: 17, weight: .medium)
        textColor = .darkGray
    }
    
    
    
}

