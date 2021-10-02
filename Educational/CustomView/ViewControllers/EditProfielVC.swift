//
//  EditProfielVC.swift
//  Educational
//
//  Created by Amr Moussa on 29/09/2021.
//

import UIKit
import AMCodeBase

class EditProfileVC: UIViewController {
    let nameLabel = AMItemLable(textAlignment: .right, NoOfLines: 1, size: 17)
    let nameTF = EDTextFEild(placeHolder: EDStrings.userNamePlaceHolder, placeholderImage: Images.userNameImage!)
    
    let emailLabel = AMItemLable(textAlignment: .right, NoOfLines: 1, size: 17)
    let emailTF = EDTextFEild(placeHolder: EDStrings.emailPLaceHolder, placeholderImage: Images.emailImage!)
    
    let mobileLabel = AMItemLable(textAlignment: .right, NoOfLines: 1, size: 17)
    let mobileTf = EDTextFEild(placeHolder: EDStrings.teleNumberPlaceHolder, placeholderImage: Images.phoneImage!)
    
    let editYearLabel = AMItemLable(textAlignment: .right, NoOfLines: 1, size: 17)
    let editYearID = AMButton(text: EDStrings.chooseYearID, bGColor: .systemGreen, iconImage: nil)
    var yearIDMenu:UIMenu!
    
    let editButton =  AMButton(text: EDStrings.editProfile, bGColor: .black, iconImage: Images.checkMarkImage)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureYearIDMenu()
        configureEdit()
        getUser()
    }
    
    private func configureLayout(){
        title = EDStrings.editProfile
        view.backgroundColor = .systemBackground
        view.onTapDissmisKeyboard(VC: self)
        view.addSubViews(nameTF,emailTF,mobileTf,editYearID,editButton,
            nameLabel,emailLabel,mobileLabel,editYearLabel)
        mobileTf.keyboardType = .phonePad
        editYearID.contentHorizontalAlignment = .right
        editYearID.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let safeAre = view.safeAreaLayoutGuide
        let padding:CGFloat = 20
        NSLayoutConstraint.activate([
            
            nameLabel.leadingAnchor.constraint(equalTo: safeAre.leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: safeAre.topAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: safeAre.trailingAnchor,constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nameTF.leadingAnchor.constraint(equalTo: safeAre.leadingAnchor, constant: padding),
            nameTF.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            nameTF.trailingAnchor.constraint(equalTo: safeAre.trailingAnchor,constant: -padding),
            nameTF.heightAnchor.constraint(equalToConstant: 50),
            
            emailLabel.leadingAnchor.constraint(equalTo: safeAre.leadingAnchor, constant: padding),
            emailLabel.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: padding),
            emailLabel.trailingAnchor.constraint(equalTo: safeAre.trailingAnchor,constant: -padding),
            emailLabel.heightAnchor.constraint(equalToConstant: 30),
            
            emailTF.leadingAnchor.constraint(equalTo: safeAre.leadingAnchor, constant: padding),
            emailTF.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            emailTF.trailingAnchor.constraint(equalTo: safeAre.trailingAnchor,constant: -padding),
            emailTF.heightAnchor.constraint(equalToConstant: 50),
            
            mobileLabel.leadingAnchor.constraint(equalTo: safeAre.leadingAnchor, constant: padding),
            mobileLabel.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: padding),
            mobileLabel.trailingAnchor.constraint(equalTo: safeAre.trailingAnchor,constant: -padding),
            mobileLabel.heightAnchor.constraint(equalToConstant: 30),
            
            mobileTf.leadingAnchor.constraint(equalTo: safeAre.leadingAnchor, constant: padding),
            mobileTf.topAnchor.constraint(equalTo: mobileLabel.bottomAnchor),
            mobileTf.trailingAnchor.constraint(equalTo: safeAre.trailingAnchor,constant: -padding),
            mobileTf.heightAnchor.constraint(equalToConstant: 50),
            
            editYearLabel.leadingAnchor.constraint(equalTo: safeAre.leadingAnchor, constant: padding),
            editYearLabel.topAnchor.constraint(equalTo: mobileTf.bottomAnchor, constant: padding),
            editYearLabel.trailingAnchor.constraint(equalTo: safeAre.trailingAnchor,constant: -padding),
            editYearLabel.heightAnchor.constraint(equalToConstant: 30),
            
            editYearID.leadingAnchor.constraint(equalTo: safeAre.leadingAnchor, constant: padding),
            editYearID.topAnchor.constraint(equalTo: editYearLabel.bottomAnchor),
            editYearID.trailingAnchor.constraint(equalTo: safeAre.trailingAnchor,constant: -padding),
            editYearID.heightAnchor.constraint(equalToConstant: 50),
            
            editButton.leadingAnchor.constraint(equalTo: safeAre.leadingAnchor, constant: padding),
            editButton.bottomAnchor.constraint(equalTo: safeAre.bottomAnchor, constant: -padding),
            editButton.trailingAnchor.constraint(equalTo: safeAre.trailingAnchor,constant: -padding),
            editButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
        nameLabel.setText(text: EDStrings.userNamePlaceHolder)
        emailLabel.setText(text: EDStrings.emailPLaceHolder)
        mobileLabel.setText(text: EDStrings.teleNumberPlaceHolder)
        editYearLabel.setText(text: EDStrings.yearIDText)
        
    }
    
    private func configureYearIDMenu(){
        var children:[UIMenuElement]  = []
        for year in Yearlevels.levels{
            let action = UIAction(title: year.value) { action in
                self.editYearID.setTitle(year.value, for:.normal)
                self.editYearID.tag = year.key
            }
            children.append(action)
        }
        
        yearIDMenu = UIMenu(title: EDStrings.yearIDText,  children: children)
        if #available(iOS 14.0, *) {
            editYearID.menu = yearIDMenu
            editYearID.showsMenuAsPrimaryAction = true
        } else {
            // Fallback on earlier versions
            
            
        }
    }
    // keyboard handling
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    private func configureEdit(){
        editButton.addTarget(self, action: #selector(editTapped), for: .touchUpInside)
    }
    
    @objc func editTapped(){
        guard let user = EDNetworkManager.shared.currentUser else {
            return
        }
        let newUser = User(userId: user.userId, name: nameTF.text ?? "", userRating: 0, avatarUrl: "", email: emailTF.text ?? "", phone: mobileTf.text ?? "", yearId: editYearID.tag, token: user.token)
        
        let loadingView = showLoadingView()
        EDNetworkManager.shared.editUser(user: newUser) {[weak self] isSaved in
            guard let self = self else {return}
            DispatchQueue.main.async {
                loadingView.removeFromSuperview()
                switch(isSaved){
                case true:
                    self.showToast(message: EDStrings.editingDone)
                    self.navigationController?.popViewController(animated: true)
                case false:
                    self.view.showAlertView(Message: EDStrings.errorSaving, buttonLabel: EDStrings.ok)
                }
            }
          
        }
        
    }
    
    func  getUser(){
        guard let user = EDNetworkManager.shared.currentUser else {
            return
        }
        nameTF.text = user.name
        emailTF.text = user.email
        mobileTf.text = user.phone
        editYearID.setTitle(Yearlevels.levels[user.yearId], for: .normal)
        editYearID.tag = user.yearId
    }
}
