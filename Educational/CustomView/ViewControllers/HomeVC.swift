//
//  HomeVC.swift
//  Educational
//
//  Created by Amr Moussa on 16/08/2021.
//

import UIKit
import AMCodeBase

class HomeVC: UIViewController{
    
    var homeScrollView:AMScrollView!
 
    let leftOffView = LeftOffView()
    
    let headlineLabel = AMItemLable(textAlignment: .left, NoOfLines: 1, size: 20)
    
    var coursesCollectionView:UICollectionView!
    let layout = UICollectionViewFlowLayout()
    
    var lessons:[Lesson] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemBackground
        configureScrollView()
        configureCourseCV()
        configureLayout()
        configureHeadline()
        loadLessons()
    }
    
    private func configureScrollView(){
        let heiht = view.frame.size.height - additionalSafeAreaInsets.bottom
        let width:CGFloat = 0
        let size = CGSize(width: view.frame.width, height: heiht + width)
        homeScrollView = AMScrollView(contentViewSize :size)
        view.addSubview(homeScrollView)
        homeScrollView.pinToSuperViewSafeArea(in: view)
        homeScrollView.backgroundColor = .systemBackground
        homeScrollView.showsVerticalScrollIndicator = false
    }
    
    
    private func configureCourseCV(){
        coursesCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        coursesCollectionView.register(CourseCell.self, forCellWithReuseIdentifier: CourseCell.cellID)
        coursesCollectionView.delegate = self
        coursesCollectionView.dataSource = self
        coursesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        coursesCollectionView.backgroundColor = .systemBackground
//        homeScrollView.bringSubviewToFront(coursesCollectionView)
        #warning("added to scence delegate")
        
    }
    
    private func configureLayout(){
        let contentView = homeScrollView.contentView
        homeScrollView.contentView.addSubViews(leftOffView,headlineLabel,coursesCollectionView)
        
        let padding:CGFloat = 10
        NSLayoutConstraint.activate([
            leftOffView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            leftOffView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            leftOffView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            leftOffView.heightAnchor.constraint(equalTo: leftOffView.widthAnchor, multiplier: 0.7),
            
            headlineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            headlineLabel.topAnchor.constraint(equalTo: leftOffView.bottomAnchor, constant: padding),
            headlineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            headlineLabel.heightAnchor.constraint(equalToConstant: 30),
            
            coursesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            coursesCollectionView.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: padding),
            coursesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            coursesCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
        ])
       
    }
    private func configureHeadline(){
        headlineLabel.configureAsProfileHeadline()
        headlineLabel.textColor = .systemGreen
    }
    private func loadLessons(){
        let loadingView = view.showLoadingView()
        leftOffView.setData()
        headlineLabel.text = "الدروس"
        lessons.append(contentsOf: MockData.lessons)
        lessons.append(contentsOf: MockData.lessons)
        loadingView.removeFromSuperview()
        coursesCollectionView.reloadData()
    }

    
    
    @objc func notficationTapped(){print("newww")}
    
    @objc func titleImageTapped(){
        coursesCollectionView.scrollToTop()
        homeScrollView.scrollToTop()
    }
    
}


extension HomeVC :UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = coursesCollectionView.dequeueReusableCell(withReuseIdentifier: CourseCell.cellID, for: indexPath) as! CourseCell
        cell.addCourse(course: lessons[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let lesson = lessons[indexPath.row]
        let detailedView = DetaieldLessonVC()
        detailedView.lesson = lesson

        navigationController?.pushViewController(detailedView, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = coursesCollectionView.frame.size
        return CGSize(width: size.width, height: 150)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let offsetY = scrollView.contentOffset.y
        let inset  = scrollView.contentInset.bottom
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
//        print(offsetY, inset, contentHeight, height)
        
        if offsetY > contentHeight - height + inset {
            lessons.append(contentsOf:MockData.lessons)
            coursesCollectionView.reloadData()
            coursesCollectionView.insertItems(at: [])
        }
        
        offsetY > 0 ? scrollToBottom():scrollToTop()
    }
    
    private func scrollToTop(){
        homeScrollView.scrollToTop()
    }
    
    private func scrollToBottom(){
        homeScrollView.scrollToBottom()
    }
    
}




