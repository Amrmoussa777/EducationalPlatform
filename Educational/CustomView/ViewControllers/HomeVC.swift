//
//  HomeVC.swift
//  Educational
//
//  Created by Amr Moussa on 16/08/2021.
//

import UIKit
import AMCodeBase


class HomeVC: AMCollectionViewController<unitCell, Unit>{
    

    let headlineLabel = AMItemLable(textAlignment: .right, NoOfLines: 1, size: 20)
    

    
    var emptyState:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EDNetworkManager.shared.currentRootVC = self
        configureLayout()
        configureHeadline()
        loadLessons()
        rightAlignedLargeTitle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        EDNetworkManager.shared.currentRootVC = self
    }
    override func chanegCellSize() {
        self.cellSize = .init(width: AMCollectionView.bounds.width, height: 100)
    }
    
    
    
    private func configureLayout(){
        let padding:CGFloat = 10
        view.addSubViews(/* leftOffView ,*/ headlineLabel,AMCollectionView)
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
          
           
            headlineLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            headlineLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
            headlineLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            headlineLabel.heightAnchor.constraint(equalToConstant: 30),
            
            AMCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            AMCollectionView.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: padding),
            AMCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            AMCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -padding),
            
        ])
        
        
    }
    
    
    private func configureHeadline(){
        headlineLabel.configureAsProfileHeadline()
        headlineLabel.textColor = .systemGreen
        let tap = UITapGestureRecognizer(target: self, action: #selector(titleImageTapped))
        tap.cancelsTouchesInView = false
        headlineLabel.addGestureRecognizer(tap)

    }
     func loadLessons(){
        let loadingView = view.showLoadingView()
        
        headlineLabel.text = EDStrings.units
        EDNetworkManager.shared.getUnits {[weak self] units in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.emptyState?.removeFromSuperview()

                loadingView.removeFromSuperview()
                units.isEmpty ? self.showemptyState(): self.UpadateItem(items: units)
            }
        }
        
    }
    
    private func showemptyState(){
        emptyState =  view.showEmptyState(img: EDImages.largeLogo!, message: EDStrings.noLessonsAvailable)
    }
    
    @objc func notficationTapped(){print("newww")}
    
    @objc func titleImageTapped(){
        AMCollectionView.scrollToTop()

    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let unit = items[indexPath.row]
        let lessonVC = unitLessonsVC()
        lessonVC.items = unit.lessons
        
        
        navigationController?.pushViewController(lessonVC, animated: true)
         
    }
    
   
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    }
    
    
}


extension HomeVC {

    private func animateLayoutChange(with duration:Double){
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    
    
}
