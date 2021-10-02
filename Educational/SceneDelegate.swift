//
//  SceneDelegate.swift
//  Educational
//
//  Created by Amr Moussa on 16/08/2021.
//

import UIKit
import AMCodeBase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = createTabView()
        window.overrideUserInterfaceStyle = .light
        window.makeKeyAndVisible()
        self.window = window
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    private func createTabView() -> UITabBarController{
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .systemGreen
        tabBar.viewControllers = [createHomeVC(),createExamsVC(),createMoreVC()]
        tabBar.tabBar.semanticContentAttribute = .forceRightToLeft
        configureNavigationBar()
        
        return tabBar
        
    }
    
    private func createMoreVC()->UINavigationController{
        let profile = MoreVC()
        profile.title = EDStrings.more
        profile.tabBarItem = .init(title:EDStrings.more, image: EDImages.moreIcon, tag: 0)
        
        let profileNC = UINavigationController(rootViewController: profile)
        profileNC.navigationBar.isTranslucent = true
        profileNC.navigationBar.prefersLargeTitles = true
        return profileNC
        
    }
    
    private func createExamsVC()->UINavigationController{
        let examVC = ExamsVC()
        examVC.title = EDStrings.exams
        examVC.tabBarItem = .init(title: EDStrings.exams, image: EDImages.testIcon, tag: 1)
        
        let examNC = UINavigationController(rootViewController: examVC)
        examNC.navigationBar.isTranslucent = true
        examNC.navigationBar.prefersLargeTitles = true
        return examNC
    }
   
    
    private func createHomeVC()->UINavigationController{
        let homeVC = HomeVC()
        homeVC.title = EDStrings.mainScreen
        homeVC.tabBarItem = .init(title: EDStrings.mainScreen, image: TabbarImages.homeTabbarItemImage, tag: 2)
        let homeNC = UINavigationController(rootViewController: homeVC)
        homeNC.navigationBar.isTranslucent = true
        homeNC.navigationBar.prefersLargeTitles = true
        
        Configurebarbutton(in: homeVC)
        return homeNC
    }
    

    
    fileprivate func configureNavigationBar() {
        if #available(iOS 13.0, *){
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .systemBackground
           
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = .right
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.label,.paragraphStyle:paragraph]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label,.paragraphStyle:paragraph]
            UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).tintColor = .label
            UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).standardAppearance = navBarAppearance
            UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).scrollEdgeAppearance = navBarAppearance
            
        }
        
    }
    
    private func  Configurebarbutton(in viewContoller:HomeVC){
        let imgView = UIImageView(image: EDImages.largeLogo)
        imgView.contentMode = .scaleAspectFit
        viewContoller.navigationItem.titleView = imgView
        let tap = UITapGestureRecognizer(target: viewContoller, action: #selector(viewContoller.titleImageTapped))
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(tap)
            
//        let notificationButton = UIButton()
//        notificationButton.tintColor = UIColor.systemGreen
//        notificationButton.backgroundColor = .clear
//        notificationButton.setImage(TabbarItemImage.notificationImage, for: .normal)
//        notificationButton.contentVerticalAlignment = .fill
//        notificationButton.contentHorizontalAlignment = .fill
//        notificationButton.addTarget(viewContoller, action: #selector(viewContoller.notficationTapped), for: .touchUpInside)
//
        
//        let imageSize:CGFloat = 25
//        guard let navigationBar = viewContoller.navigationController?.navigationBar else {return }
//        navigationBar.addSubview(notificationButton)
//        notificationButton.layer.cornerRadius = imageSize / 2
//        notificationButton.clipsToBounds = true
//        notificationButton.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                notificationButton.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -10),
//                notificationButton.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -10),
//                notificationButton.heightAnchor.constraint(equalToConstant: imageSize),
//                notificationButton.widthAnchor.constraint(equalTo: notificationButton.heightAnchor)
//                ])
       }
    
    
}

