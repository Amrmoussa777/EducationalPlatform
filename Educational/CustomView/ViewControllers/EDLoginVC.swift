//
//  EDLoginVC.swift
//  Educational
//
//  Created by Amr Moussa on 24/08/2021.
//

import UIKit
import AMCodeBase



 class EDLoginVC: UIViewController {
    
    let imageView = AvatarImageView()
    
    let loginHeader = AMItemLable(textAlignment: .right, NoOfLines: 1, size: 15)
    
    let phoneLabel = AMItemLable(textAlignment: .right, NoOfLines: 1, size: 17)
    let emaiphoneTextFeild = EDTextFEild(placeHolder: EDStrings.teleNumberPlaceHolder, placeholderImage: Images.emailImage! )
    
    let passLabel = AMItemLable(textAlignment: .right, NoOfLines: 1, size: 17)
    let passwordText =  EDTextFEild(placeHolder: EDStrings.passwordPLaceHolder, placeholderImage: Images.passwordImage!)
    let loginButton = AMButton(text: EDStrings.loginButtonText, bGColor: .black, iconImage: AlertImages.unlockImage)
    let seconderyLabel = AMItemLable(textAlignment: .left, NoOfLines: 1, size: 17)
    let registerButton = AMButton(text:EDStrings.registerButtonText, bGColor: .systemBackground, iconImage: nil)

    var delegate:loginStatusProtocol?
    var headImageimage:UIImage?
    var imageWidthConstrains:NSLayoutConstraint?

    let imageViewHeight:CGFloat = DeviceTypes.isSmallSEAndMini ? 150:200
    

    override public func  viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureLoginButton()
        configureRegisterButton()
        // Do any additional setup after loading the view.
    }
    
    
    
   public  init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func configureLayout(){
        
        
        let padding:CGFloat = 5
        let outterPadding:CGFloat = 20
        let safeAre = view.safeAreaLayoutGuide
        
        view.backgroundColor = .systemBackground
        view.onTapDissmisKeyboard(VC: self)
        
        view.addSubViews(imageView,loginHeader,phoneLabel,emaiphoneTextFeild,
                         passLabel,passwordText,loginButton,registerButton,seconderyLabel)
        
        imageView.image = EDImages.loginAvatar
        imageView.contentMode = .scaleAspectFit
        
        loginHeader.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        loginHeader.setText(text: EDStrings.loginHeadLabel)
        
        emaiphoneTextFeild.autocorrectionType = .no
        emaiphoneTextFeild.keyboardType = .phonePad
        emaiphoneTextFeild.autocapitalizationType = .none
        passwordText.isSecureTextEntry = true
        passwordText.autocorrectionType = .no
        
        phoneLabel.setText(text: EDStrings.teleNumberPlaceHolder)
        phoneLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        phoneLabel.textColor = .darkGray
        passLabel.setText(text: EDStrings.passwordPLaceHolder)
        passLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        passLabel.textColor = .darkGray
        
        seconderyLabel.text = EDStrings.dontHaveAccount
        registerButton.setTitleColor(.systemGreen.withAlphaComponent(0.5), for: .normal)
        registerButton.contentHorizontalAlignment = .right
        
        imageWidthConstrains =  imageView.widthAnchor.constraint(equalToConstant: imageViewHeight)
        imageWidthConstrains?.isActive = true
       
        
        
        
       
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAre.topAnchor, constant: padding),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            loginHeader.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: -10),
            loginHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outterPadding),
            loginHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outterPadding),
            loginHeader.heightAnchor.constraint(equalToConstant: 80),
            
            phoneLabel.topAnchor.constraint(equalTo: loginHeader.bottomAnchor, constant: outterPadding),
            phoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outterPadding),
            phoneLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outterPadding),
            phoneLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            emaiphoneTextFeild.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: padding),
            emaiphoneTextFeild.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outterPadding),
            emaiphoneTextFeild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outterPadding),
            emaiphoneTextFeild.heightAnchor.constraint(equalToConstant: 50),
            
            passLabel.topAnchor.constraint(equalTo: emaiphoneTextFeild.bottomAnchor, constant: outterPadding),
            passLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outterPadding),
            passLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outterPadding),
            passLabel.heightAnchor.constraint(equalToConstant: 30),
            
            passwordText.topAnchor.constraint(equalTo: passLabel.bottomAnchor, constant: padding),
            passwordText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outterPadding),
            passwordText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outterPadding),
            passwordText.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: outterPadding),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outterPadding),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outterPadding),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -outterPadding),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outterPadding),
            registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            registerButton.heightAnchor.constraint(equalToConstant: 30),
            
            seconderyLabel.centerYAnchor.constraint(equalTo:registerButton.centerYAnchor),
            seconderyLabel.leadingAnchor.constraint(equalTo: registerButton.trailingAnchor, constant: 5),
            seconderyLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            seconderyLabel.heightAnchor.constraint(equalToConstant: 30),
            
//
//            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -outterPadding),
//            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outterPadding),
//            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outterPadding),
//            registerButton.heightAnchor.constraint(equalToConstant: 50),
//
//            seconderyLabel.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -padding),
//            seconderyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outterPadding),
//            seconderyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outterPadding),
//            seconderyLabel.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    @objc func keyboardWillShow(notification: Notification){
        var height:CGFloat = 10
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        height = keyboardViewEndFrame.height
        imageWidthConstrains?.constant = imageViewHeight/4
        
        self.view.layoutIfNeeded()
        
    }
    
    @objc func keyboardWillHide(notification: Notification){
        imageWidthConstrains?.constant = imageViewHeight
        view.layoutIfNeeded()
    }
    

}


extension EDLoginVC{
    
    private func configureLoginButton(){
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
    }
    
    @objc func loginTapped(){
        (emaiphoneTextFeild.text?.isValidPhoneNumber ?? false && !(passwordText.text?.isEmpty ?? true)) ?
            SigninUser():showAlert(message:EDStrings.passValidEmail)
    }
    
    private func SigninUser(){
        let loadingScreen = showLoadingView()
        EDNetworkManager.shared.signInUSer(email: emaiphoneTextFeild.text ?? "", pass: passwordText.text ?? "" ) {[weak self] isSignedIn in
            guard let self = self else {return}
            DispatchQueue.main.async {
                loadingScreen.removeFromSuperview()
                isSignedIn ? self.dismissAndHandledelegate():self.showAlert(message:EDStrings.noRecordOfyouurData)
          }
        }
    }
    
    private func dismissAndHandledelegate(){
        dismiss(animated: true) {
            self.delegate?.userLoginStatusChanged(ststus: .loggedin)
        }
    }
    
    private func showAlert(message:String){
        view.showAlertView(avatarImage: AlertImages.lockImage!, Message: message, buttonLabel: EDStrings.ok, buttonImage: Images.nextButton!,actionButtonColor: .blue)
    }
    
    private func configureRegisterButton(){
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
    }
    
    @objc func registerTapped(){
        dismiss(animated: true) { [self] in
            delegate?.userLoginStatusChanged(ststus: .tappedRegisterButton)
        }
       
    }
    
    // keyboard handling
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}


