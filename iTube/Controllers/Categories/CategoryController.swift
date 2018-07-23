//
//  CategoryController.swift
//  iTube
//
//  Created by Apple on 7/20/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class CategoryController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewsConstraints()
//        view.backgroundColor = .red
    }
    
    lazy var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.register(CategoryCell.self, forCellWithReuseIdentifier: Values.CellId.categoryCellId)
//        view.backgroundColor = .red
        return view
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
}

extension CategoryController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 19
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Values.CellId.categoryCellId, for: indexPath) as! CategoryCell
        Method.addShadowAndCornerRadiasTo(cell: cell, cornerRadias: 10, borderWidth: 2, borderColor: UIColor.clear.cgColor, shadowColor: UIColor.clear.cgColor, shadowOffsetWidth: 3, shadowOffsetHeight: 5, shadowRadius: 10)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3.2, height: view.frame.width / 3.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

extension CategoryController {
    
    fileprivate func setViewsConstraints() {
        addSubViewsInsideMainViews()
        setCategoryCollectionViewConstraints(control: categoriesCollectionView)
    }
    
    private func addSubViewsInsideMainViews(){
        view.addSubview(categoriesCollectionView)
    }
    
    private func setCategoryCollectionViewConstraints(control: UICollectionView){
        NSLayoutConstraint.activate([
            control.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Method.calculateTabBarHeight(tabController: tabBarController) * -1),
            control.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            control.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            control.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ])
    }
    
}
