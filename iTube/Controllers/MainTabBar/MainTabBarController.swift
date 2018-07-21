//
//  MainTabBarController.swift
//  iTube
//
//  Created by Apple on 7/20/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        setViewsConstraints()
        view.backgroundColor = .black
        tabBar.tintColor = Values.tintColor
        tabBar.barStyle = UIBarStyle.black
    }
    
    let playerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        
        return view
    }()
    
    private func setupControllers(){
        setTabImagesAndTitles()
        viewControllers = [Object.Controllers.categoryController]
    }
    
    private func setTabImagesAndTitles(){
        Object.Controllers.categoryController.tabBarItem.title = "Channels"
        Object.Controllers.categoryController.tabBarItem.image = UIImage(named: "gridIcon-Small")
//
//        SharedObject.offerCollectionViewController.tabBarItem.title = SharedValues.OfferController.tabbarTitle
//        SharedObject.offerCollectionViewController.tabBarItem.image = SharedValues.OfferController.tabbarIcon
//
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
    }
    
    private func addSubViewsInsideMainViews(){
        view.addSubview(playerView)
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
