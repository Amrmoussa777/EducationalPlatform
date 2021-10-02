//
//  EDRegisterVC.swift
//  Educational
//
//  Created by Amr Moussa on 24/08/2021.
//


import UIKit
import AMCodeBase

class EDRegisterVC: UIViewController {
    let imageView = AvatarImageView()
    let registerLabel = AMItemLable(textAlignment: .right, NoOfLines: 1, size: 15)
    let registerButton = AMButton(text: EDStrings.registerButtonText, bGColor: .black, iconImage: Images.checkMarkImage)
    
    let loginLabel = AMItemLable(textAlignment: .left, NoOfLines: 1, size: 15)
    let loginButton = AMButton(text: EDStrings.loginButtonText, bGColor: .clear, iconImage: nil)
    
    let emailHedaer = EDHeadLabel(text: EDStrings.emailPLaceHolder)
    let emailFeild = EDTextFEild(placeHolder: EDStrings.emailPLaceHolder, placeholderImage: Images.emailImage!)
    
    let passHedaer = EDHeadLabel(text: EDStrings.passwordPLaceHolder)
    let passwordFeild = EDTextFEild(placeHolder: EDStrings.passwordPLaceHolder, placeholderImage: Images.passwordImage!)
    
    let repassHedaer = EDHeadLabel(text: EDStrings.passwordPLaceHolder)
    let rePasswordFeild = EDTextFEild(placeHolder: EDStrings.passwordPLaceHolder, placeholderImage: Images.passwordImage!)
 
    let userNameHedaer = EDHeadLabel(text: EDStrings.userNamePlaceHolder)
    let userNameFeild  = EDTextFEild(placeHolder: EDStrings.userNamePlaceHolder, placeholderImage: Images.userNameImage!)
    
    //3
    let mobileHedaer = EDHeadLabel(text: EDStrings.teleNumberPlaceHolder)
    let mobileFeild = EDTextFEild(placeHolder: EDStrings.teleNumberPlaceHolder, placeholderImage: Images.phoneImage!)
    
    let chooseYearHedaer = EDHeadLabel(text: EDStrings.yearIDText)
    let chooseYearID = AMButton(text: EDStrings.chooseYearID, bGColor: .systemBackground, iconImage: nil)
    
    var yearIDMenu:UIMenu!
    //
    var delegate:loginStatusProtocol?
    
    var imageWidthConstrains:NSLayoutConstraint?
    var imageViewTopConstrain:NSLayoutConstraint?
    
    var topImagePadding:CGFloat = 10

//    var counter = 0
    let padding:CGFloat = DeviceTypes.isSmallSEAndMini ? 1:5
    let outerPadding:CGFloat = DeviceTypes.isSmallSEAndMini ? 10:20
    let imageViewHeight:CGFloat = DeviceTypes.isSmallSEAndMini ? 50:80

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureViews()
     
        configureRegisterButton()
        configureYearIDMenu()
        // Do any additional setup after loading the view.
    }
    public init (){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    private func configureLayout(){
        view.backgroundColor = .systemBackground
        view.onTapDissmisKeyboard(VC: self)
        view.addSubViews(imageView,registerLabel,registerButton,loginLabel,loginButton)
        
        registerLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        registerLabel.setText(text:EDStrings.loginHeadLabel)
        loginButton.setTitleColor(.systemGreen.withAlphaComponent(0.5), for: .normal)
        loginLabel.setText(text: EDStrings.alredyHAveAccoutn)
        passwordFeild.tag = 5
        rePasswordFeild.tag = 6
       
        
//        imagePicker.delegate = self
        
        imageView.image = EDImages.loginAvatar
        let safeArea = view.safeAreaLayoutGuide
        
        imageWidthConstrains =  imageView.widthAnchor.constraint(equalToConstant: imageViewHeight)
        imageWidthConstrains?.isActive = true
        
        imageViewTopConstrain =  imageView.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: topImagePadding)
        imageViewTopConstrain?.isActive = true

        NSLayoutConstraint.activate([
           
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            
            registerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            registerLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: padding),
            registerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            registerLabel.heightAnchor.constraint(equalToConstant: 30),
            
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -outerPadding),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outerPadding),
            loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            loginButton.heightAnchor.constraint(equalToConstant: 30),
            
            loginLabel.centerYAnchor.constraint(equalTo:loginButton.centerYAnchor),
            loginLabel.leadingAnchor.constraint(equalTo: loginButton.trailingAnchor, constant: 5),
            loginLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            loginLabel.heightAnchor.constraint(equalToConstant: 30),
            
            registerButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -outerPadding),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outerPadding),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
    
    private func configureViews(){
        emailFeild.autocorrectionType = .no
        emailFeild.autocapitalizationType = .none
        
        passwordFeild.autocorrectionType = .no
        passwordFeild.autocorrectionType = .no
        passwordFeild.isSecureTextEntry = true
        rePasswordFeild.isSecureTextEntry = true
        rePasswordFeild.autocorrectionType = .no
        rePasswordFeild.autocorrectionType = .no
        mobileFeild.keyboardType = .phonePad
        
        chooseYearID.AddStroke(color: .lightGray.withAlphaComponent(0.3))
        chooseYearID.setTitleColor(.label, for: .normal)
        chooseYearID.tintColor = .systemGray6
        chooseYearID.contentHorizontalAlignment = .right
        chooseYearID.titleEdgeInsets = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
        
        loginButton.contentHorizontalAlignment = .right
        
        view.addSubViews(userNameHedaer,emailHedaer,mobileHedaer,chooseYearHedaer,passHedaer,repassHedaer)
        view.addSubViews(userNameFeild,emailFeild,mobileFeild,chooseYearID,passwordFeild,rePasswordFeild)

        NSLayoutConstraint.activate([
            
            userNameHedaer.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: outerPadding),
            userNameHedaer.topAnchor.constraint(equalTo: registerLabel.bottomAnchor,constant: padding),
            userNameHedaer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            userNameHedaer.heightAnchor.constraint(equalToConstant: 30),
            
            userNameFeild.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: outerPadding),
            userNameFeild.topAnchor.constraint(equalTo: userNameHedaer.bottomAnchor,constant: padding),
            userNameFeild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            userNameFeild.heightAnchor.constraint(equalToConstant: 40),
            
            emailHedaer.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            emailHedaer.topAnchor.constraint(equalTo: userNameFeild.bottomAnchor,constant: padding),
            emailHedaer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            emailHedaer.heightAnchor.constraint(equalToConstant: 30),
            
            emailFeild.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: outerPadding),
            emailFeild.topAnchor.constraint(equalTo: emailHedaer.bottomAnchor,constant: padding),
            emailFeild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            emailFeild.heightAnchor.constraint(equalToConstant: 40),
            
            mobileHedaer.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: outerPadding),
            mobileHedaer.topAnchor.constraint(equalTo: emailFeild.bottomAnchor,constant: padding),
            mobileHedaer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            mobileHedaer.heightAnchor.constraint(equalToConstant: 30),
            
            mobileFeild.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: outerPadding),
            mobileFeild.topAnchor.constraint(equalTo: mobileHedaer.bottomAnchor,constant: padding),
            mobileFeild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            mobileFeild.heightAnchor.constraint(equalToConstant: 40),
            
            chooseYearHedaer.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: outerPadding),
            chooseYearHedaer.topAnchor.constraint(equalTo: mobileFeild.bottomAnchor,constant: padding),
            chooseYearHedaer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            chooseYearHedaer.heightAnchor.constraint(equalToConstant: 30),
            
            chooseYearID.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: outerPadding),
            chooseYearID.topAnchor.constraint(equalTo: chooseYearHedaer.bottomAnchor,constant: padding),
            chooseYearID.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            chooseYearID.heightAnchor.constraint(equalToConstant: 40),
            
            passHedaer.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: outerPadding),
            passHedaer.topAnchor.constraint(equalTo: chooseYearID.bottomAnchor,constant: padding),
            passHedaer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            passHedaer.heightAnchor.constraint(equalToConstant: 30),
            
            passwordFeild.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: outerPadding),
            passwordFeild.topAnchor.constraint(equalTo: passHedaer.bottomAnchor,constant: padding),
            passwordFeild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            passwordFeild.heightAnchor.constraint(equalToConstant: 40),
            
            repassHedaer.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: outerPadding),
            repassHedaer.topAnchor.constraint(equalTo: passwordFeild.bottomAnchor,constant: padding ),
            repassHedaer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            repassHedaer.heightAnchor.constraint(equalToConstant: 30),
            
            rePasswordFeild.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: outerPadding),
            rePasswordFeild.topAnchor.constraint(equalTo: repassHedaer.bottomAnchor,constant: padding),
            rePasswordFeild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            rePasswordFeild.heightAnchor.constraint(equalToConstant: 40),
             
        ])
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//        configurePasswordTapepd()
        passwordFeild.addTarget(self, action: #selector(passTapped), for: .touchDown)
        rePasswordFeild.addTarget(self, action: #selector(passTapped), for: .touchDown)
    }
    
    
    @objc func keyboardWillShow(notification: Notification){
        var height:CGFloat = 10
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        height = keyboardViewEndFrame.height
        imageWidthConstrains?.constant = 1
        imageViewTopConstrain?.constant = topImagePadding
        self.view.layoutIfNeeded()
        
    }
    
    @objc func keyboardWillHide(notification: Notification){
        imageWidthConstrains?.constant = imageViewHeight
        imageViewTopConstrain?.constant = padding
        topImagePadding = padding
        imageViewTopConstrain?.constant = topImagePadding
        view.layoutIfNeeded()
    }
    

    
    
    private func configureRegisterButton(){
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    private func configureYearIDMenu(){
        var children:[UIMenuElement]  = []
        for year in Yearlevels.levels{
            let action = UIAction(title: year.value) { action in
                self.chooseYearID.setTitle(year.value, for:.normal)
                self.chooseYearID.tag = year.key
            }
            children.append(action)
        }
        
        yearIDMenu = UIMenu(title: EDStrings.yearIDText,  children: children)
        if #available(iOS 14.0, *) {
            chooseYearID.menu = yearIDMenu
            chooseYearID.showsMenuAsPrimaryAction = true
        } else {
            // Fallback on earlier versions
            
            
        }
    }
    // MARK: - check pages and states
    
    @objc func registerTapped(){
        checkEmailAndPassword() ?
            (checkPasswordMatch() ?
            (checkUserName() ?
            (CheckMobile() ? registerUserInDB():showALert(message: EDStrings.validtelephone))
            :showALert(message: EDStrings.validUserName))
            :showALert(message:  EDStrings.passNotMatch))
            :showALert(message:  EDStrings.passValidEmail)
    }
    
    
    private func checkEmailAndPassword()->Bool{
        (emailFeild.text?.isValidEmail ?? false && (passwordFeild.text?.isValidPassword ??  false))
    }
    
    private func checkPasswordMatch()->Bool{
        passwordFeild.text == rePasswordFeild.text
    }
    
    private func checkUserName()-> Bool{
        !userNameFeild.text!.isEmpty
    }
    
    private func CheckMobile()->Bool{
        mobileFeild.text!.isValidPhoneNumber && chooseYearID.tag != 0
    }
    
    
    
    @objc func loginTapped(){
        dismiss(animated: true) {
            self.delegate?.userLoginStatusChanged(ststus: .tappLogin)
        }
    }
    
   
   
    private func showALert(message:String){
        view.showAlertView(avatarImage: AlertImages.lockImage!, Message: message , buttonLabel: EDStrings.ok, buttonImage: Images.nextButton!,actionButtonColor: .blue)
    }
    
    // keyboard handling
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    open func registerUserInDB(){
        guard let pass = passwordFeild.text else {
            return
        }
        let user = User(userId: 0, name: userNameFeild.text ?? "", userRating: 0, avatarUrl: "", email: emailFeild.text ?? "", phone: mobileFeild.text ?? "", yearId: chooseYearID.tag, token: "")
        let loadingView = view.showLoadingView()
        EDNetworkManager.shared.signUpUser(user: user, password: pass ) {[weak self] regsitered in
            guard let self = self else {return}
            DispatchQueue.main.async {
                loadingView.removeFromSuperview()
                regsitered ?  self.dismissAndHandleDelegate():self.handleFailedStatus()
            }
        }
    }
    
    private func showalert(message:String){
        self.view.showAlertView(avatarImage: AlertImages.lockImage!, Message: message, buttonLabel:EDStrings.ok, buttonImage: Images.nextButton!,actionButtonColor: .blue)
    }
    
    private func dismissAndHandleDelegate(){
        dismiss(animated: true) {
            self.delegate?.userLoginStatusChanged(ststus: .registered)
        }
    }
    
    
    private func handleFailedStatus(){
        self.showalert(message: EDStrings.pleaseReEnterData)
    }
    
   
}






extension EDRegisterVC{
    @objc func passTapped(){
        topImagePadding = -50
    }

}
