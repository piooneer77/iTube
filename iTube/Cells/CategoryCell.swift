//
//  CategoryCell.swift
//  iTube
//
//  Created by Apple on 7/20/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    var currentObject: Category? {
        didSet {
            guard let unwrappedObject = currentObject  else { return }
            categoryDescription.text = unwrappedObject.description
            categoryImage.image = unwrappedObject.image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewsConstraints()
    }
    
    let categoryDescription: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    let actionButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    let categoryImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CategoryCell {
    
    fileprivate func setViewsConstraints() {
        self.backgroundColor = Values.darkColor
        addSubViewsInsideMainViews()
        setActionButtonViewConstraints(control: actionButton)
        setCategoryImageViewConstraints(control: categoryImage)
        setCategoryDescriptionViewConstraints(control: categoryDescription)
    }
    
    private func addSubViewsInsideMainViews(){
        addSubview(actionButton)
        addSubview(categoryImage)
        addSubview(categoryDescription)
    }
    
    private func setCategoryDescriptionViewConstraints(control: UILabel){
        NSLayoutConstraint.activate([
            control.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            control.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            control.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            control.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
            ])
    }
    
    private func setCategoryImageViewConstraints(control: UIImageView){
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: self.topAnchor, constant: Values.defaultPadding),
            control.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25),
            control.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Values.defaultPadding),
            control.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25)
            ])
    }
    
    private func setActionButtonViewConstraints(control: UIButton){
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: self.topAnchor, constant: Values.defaultPadding),
            control.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            control.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Values.defaultPadding * -1),
            control.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2)
            ])
    }
    
}
