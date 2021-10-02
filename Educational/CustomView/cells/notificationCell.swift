//
//  notificarionCell.swift
//  Educational
//
//  Created by Amr Moussa on 25/08/2021.
//

import UIKit

import AMCodeBase

class notificationCell: AMCollectionViewCell {
    static var cellID: String = "notificationCell"
    
    let contentVeiw = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateItem(item: Codable) {
        
    }
    
    
}
