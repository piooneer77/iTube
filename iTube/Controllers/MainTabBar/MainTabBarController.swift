//
//  MainTabBarController.swift
//  iTube
//
//  Created by Apple on 7/20/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var currentVideo: Video? {
        didSet {
            guard let unwrappedObject = currentVideo else { return }
            cellTitle.text = unwrappedObject.name
            cellSubtitle.text = unwrappedObject.channel
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        setViewsConstraints()
        view.backgroundColor = .black
        tabBar.tintColor = Values.tintColor
        tabBar.barStyle = UIBarStyle.black
    }
    
    let favouriteButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "favourateIcon-Small"), for: .normal)
        //        view.backgroundColor = .red
        return view
    }()
    
    let cellSubtitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Values.cellSubTitleColor
        
        return view
    }()
    
    let cellTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Values.cellTitleColor
        
        return view
    }()
    
    let shareButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "shareIcon-Small"), for: .normal)
//        view.backgroundColor = .red
        return view
    }()
    
    let controlsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Values.darkColor
        
        return view
    }()
    
    let playerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        
        return view
    }()
    
    private func setupControllers(){
        setTabImagesAndTitles()
        viewControllers = [Object.Controllers.categoryController, Object.Controllers.favouriteController]
    }
    
    private func setTabImagesAndTitles(){
        Object.Controllers.categoryController.tabBarItem.title = "Channels"
        Object.Controllers.categoryController.tabBarItem.image = UIImage(named: "gridIcon-Small")

        Object.Controllers.favouriteController.tabBarItem.title = "Favourites"
        Object.Controllers.favouriteController.tabBarItem.image = UIImage(named: "starIcon-Small")

//        SharedObject.orderCollectionViewController.tabBarItem.title = SharedValues.OrderController.tabbarTitle
//        SharedObject.orderCollectionViewController.tabBarItem.image = SharedValues.OrderController.tabbarIcon
//
//        SharedObject.providerViewController.tabBarItem.title = SharedValues.ProviderController.tabbarTitle
//        SharedObject.providerViewController.tabBarItem.image = SharedValues.ProviderController.tabbarIcon
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
}

extension MainTabBarController {
    
    fileprivate func setViewsConstraints() {
        addSubViewsInsideMainViews()
        setPlayerViewConstraints(control: playerView)
        setControlsViewConstraints(control: controlsView)
        setShareButtonViewConstraints(control: shareButton)
        setfavouriteButtonViewConstraints(control: favouriteButton)
        setCellSubTitleLabelViewConstraints(control: cellSubtitle)
        setCellTitleLabelViewConstraints(control: cellTitle)
    }
    
    private func addSubViewsInsideMainViews(){
        view.addSubview(playerView)
        view.addSubview(controlsView)
        controlsView.addSubview(shareButton)
        controlsView.addSubview(cellTitle)
        controlsView.addSubview(cellSubtitle)
        controlsView.addSubview(favouriteButton)
    }
    
    private func setfavouriteButtonViewConstraints(control: UIButton){
        NSLayoutConstraint.activate([
            control.widthAnchor.constraint(equalTo: controlsView.heightAnchor, multiplier: 0.4),
            control.heightAnchor.constraint(equalTo: controlsView.heightAnchor, multiplier: 0.4),
            control.centerYAnchor.constraint(equalTo: controlsView.centerYAnchor),
            control.trailingAnchor.constraint(equalTo: controlsView.trailingAnchor, constant: Values.defaultPadding * -1)
            ])
    }
    
    private func setCellSubTitleLabelViewConstraints(control: UILabel){
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: controlsView.centerYAnchor),
            control.centerXAnchor.constraint(equalTo: controlsView.centerXAnchor),
            control.widthAnchor.constraint(equalTo: controlsView.widthAnchor, multiplier: 0.4),
            control.heightAnchor.constraint(equalTo: controlsView.heightAnchor, multiplier: 0.2)
            ])
    }
    
    private func setCellTitleLabelViewConstraints(control: UILabel){
        NSLayoutConstraint.activate([
            control.bottomAnchor.constraint(equalTo: controlsView.centerYAnchor),
            control.centerXAnchor.constraint(equalTo: controlsView.centerXAnchor),
            control.widthAnchor.constraint(equalTo: controlsView.widthAnchor, multiplier: 0.6),
            control.heightAnchor.constraint(equalTo: controlsView.heightAnchor, multiplier: 0.3)
            ])
    }
    
    private func setShareButtonViewConstraints(control: UIButton){
        NSLayoutConstraint.activate([
            control.widthAnchor.constraint(equalTo: controlsView.heightAnchor, multiplier: 0.35),
            control.heightAnchor.constraint(equalTo: controlsView.heightAnchor, multiplier: 0.35),
            control.centerYAnchor.constraint(equalTo: controlsView.centerYAnchor),
            control.leadingAnchor.constraint(equalTo: controlsView.leadingAnchor, constant: Values.defaultPadding)
            ])
    }
    
    private func setControlsViewConstraints(control: UIView){
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: playerView.bottomAnchor),
            control.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            control.heightAnchor.constraint(equalToConstant: Values.defaultCellHeight),
            control.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ])
    }
    
    private func setPlayerViewConstraints(control: UIView){
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            control.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            control.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.30),
            control.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ])
    }
    
}
