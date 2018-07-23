//
//  FavouriteCell.swift
//  iTube
//
//  Created by Apple on 7/23/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class FavouriteCell: UICollectionViewCell {
    
    var currentObject: Video? {
        didSet {
            guard let unwrappedObject = currentObject  else { return }
            celltImage.image = unwrappedObject.thumb
            cellTitle.text = unwrappedObject.name
            cellSubtitle.text = unwrappedObject.channel
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewsConstraints()
    }
    
    lazy var actionButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "circles"), for: .normal)
        return view
    }()
    
    let cellSubtitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Values.cellSubTitleColor
        
        return view
    }()
    
    let cellTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Values.cellTitleColor
        
        return view
    }()
    
    lazy var celltImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = (self.frame.height * 0.75) / 2
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FavouriteCell {
    
    fileprivate func setViewsConstraints() {
        self.backgroundColor = Values.darkColor
        addSubViewsInsideMainViews()
        setCellImageViewConstraints(control: celltImage)
        setCellTitleLabelViewConstraints(control: cellTitle)
        setCellSubTitleLabelViewConstraints(control: cellSubtitle)
        setActionButtonViewConstraints(control: actionButton)
    }
    
    private func addSubViewsInsideMainViews(){
        addSubview(celltImage)
        addSubview(cellTitle)
        addSubview(cellSubtitle)
        addSubview(actionButton)
    }
    
    private func setActionButtonViewConstraints(control: UIButton){
        NSLayoutConstraint.activate([
            control.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),
            control.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
            control.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            control.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Values.defaultPadding * -1)
            ])
    }
    
    private func setCellSubTitleLabelViewConstraints(control: UILabel){
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: self.centerYAnchor, constant: Values.defaultPadding),
            control.leadingAnchor.constraint(equalTo: celltImage.trailingAnchor, constant: Values.defaultPadding),
            control.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            control.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.20)
            ])
    }
    
    private func setCellTitleLabelViewConstraints(control: UILabel){
        NSLayoutConstraint.activate([
            control.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            control.leadingAnchor.constraint(equalTo: celltImage.trailingAnchor, constant: Values.defaultPadding),
            control.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            control.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25)
            ])
    }
    
    private func setCellImageViewConstraints(control: UIImageView){
        NSLayoutConstraint.activate([
            control.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            control.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            control.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            control.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Values.defaultPadding)
            ])
    }
    
}


