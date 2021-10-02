//
//  UIViewController+EXT.swift
//  Educational
//
//  Created by Amr Moussa on 24/08/2021.
//

import UIKit
import AMCodeBase

extension UIViewController {
    
    func presentEDLoginVC(delegateHandler:loginStatusProtocol){
        let loginVC  = EDLoginVC()
        loginVC.delegate = delegateHandler
        loginVC.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(loginVC, animated: true)
        }
        
    }
    
    
    func showEDRegisterVC(delegateHandler:loginStatusProtocol){
        let registerVC  = EDRegisterVC()
        registerVC.delegate = delegateHandler
        registerVC.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(registerVC, animated: true)
        }
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        
    }
    
    func rightAlignedLargeTitle(){
        navigationController?.navigationBar.subviews[1].semanticContentAttribute = .forceRightToLeft
    }
   
    
}

extension String{
    
    func getDate() -> Date? {
        let dateFormatter = DateFormatter()
//        2021-08-23T15:55:19.000Z
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from:self)
    }
    
}
