//
//  unitLessonsVC.swift
//  Educational
//
//  Created by Amr Moussa on 25/08/2021.
//

import UIKit

import AMCodeBase

class unitLessonsVC: AMCollectionViewController<LessonCell,lesson> {
    
    var emptyState:UIView?
    let padding:CGFloat = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        updateLesson()
    }
    
    
    
    private func configureLayout(){
        view.addSubViews(AMCollectionView)
        
        AMCollectionView.pinToSuperViewSafeArea(in: view)
        title = EDStrings.lessonHeadline
        
    }

    private func updateLesson(){
        guard !items.isEmpty else {
            emptyState = view.showEmptyState(img: EDImages.largeLogo!, message: EDStrings.noLessonsForUnit)
            return
        }
        emptyState?.removeFromSuperview()
        UpadateItem(items: items)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let detailedView = DetaieldLessonVC()
        detailedView.lesson = item
        detailedView.modalPresentationStyle = .fullScreen
        present(detailedView, animated: true)
    }
    
    
    override func chanegCellSize() {
        let cellWidth:CGFloat = (AMCollectionView.frame.size.width - padding * 3)/2
        self.cellSize = .init(width: cellWidth, height: cellWidth + 40)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }

}
