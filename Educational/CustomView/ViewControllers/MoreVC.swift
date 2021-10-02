//
//  ProfileVC.swift
//  Educational
//
//  Created by Amr Moussa on 23/08/2021.
//


import UIKit
import AMCodeBase
import SafariServices

class MoreVC: AMCollectionViewController<MoreCell,MoreItem> {
    
    var data:[(String,String,()->())] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        configureLayout()
//        configureDissmis()
        configureLayout()
        rightAlignedLargeTitle()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        EDNetworkManager.shared.currentRootVC = self
    }
    private func setData(){
        data = [
            (EDStrings.profile,iconName.profile,editProfile),
            (EDStrings.about,iconName.about,viewAbout),
            (EDStrings.rating ,iconName.rate,addRating),
            (EDStrings.share,iconName.share,shareApp),
            (EDStrings.logOut,iconName.logOut,logOut)
        ]
    }
    func configureLayout(){
        view.backgroundColor = .systemGray6
        view.addSubview(AMCollectionView)
        let safeArea  = view.safeAreaLayoutGuide
        let outterPadding:CGFloat = 20
        NSLayoutConstraint.activate([
            AMCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: outterPadding),
            AMCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: outterPadding*2),
            AMCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -outterPadding),
            AMCollectionView.heightAnchor.constraint(equalTo: AMCollectionView.widthAnchor),
        ])
        AMCollectionView.RoundCorners()
        AMCollectionView.AddStroke(color: .systemGray5)
        AMCollectionView.backgroundColor = .systemGray6
        AMCollectionView.isScrollEnabled = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = AMCollectionView.dequeueReusableCell(withReuseIdentifier: MoreCell.cellID, for: indexPath) as! MoreCell
        let item = MoreItem(imagePath: data[indexPath.row].1, Label:  data[indexPath.row].0)
        cell.updateItem(item: item)
        return cell
    }
    
    override func chanegCellSize() {
        self.cellSize = .init(width: AMCollectionView.frame.width, height: AMCollectionView.frame.height / CGFloat(data.count))
    }
   
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(2)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
        data[indexPath.row].2()
    }
    
    private func editProfile()->(){
        let editVC = EditProfileVC()
        navigationController?.pushViewController(editVC, animated: true)
    }
   
    private func viewAbout(){
        shareApp()
    }
   
    private func addRating(){
        shareApp()
    }
    
    private func shareApp(){
        guard let url = URL(string: EDStrings.appStoreLink) else {
            return
        }
        let svc = SFSafariViewController(url: url)
        present(svc, animated: true, completion: nil)
    }
    
    private func logOut(){
        guard EDNetworkManager.shared.logOut() == true else{return}
        tabBarController?.selectedIndex = 0
        let HomeNavigationConroller = tabBarController?.viewControllers?.first as? UINavigationController
        
        HomeNavigationConroller?.popToRootViewController(animated: true)
        let home =  HomeNavigationConroller?.viewControllers.first as? HomeVC

        home?.loadLessons()
    }



}





