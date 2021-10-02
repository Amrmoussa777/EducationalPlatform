//
//  NotifacationsVC.swift
//  Educational
//
//  Created by Amr Moussa on 25/08/2021.
//

import UIKit
import AMCodeBase

class NotifacationsVC: AMCollectionViewController<notificationCell,notifcation> {
    
    static let shared  = NotifacationsVC()
    
    let contentView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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


extension NotifacationsVC:UIGestureRecognizerDelegate{
    
    private func configureDissmis(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmisVC))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    //AVoid dissmissing view gtom content view
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == gestureRecognizer.view
    }
}
