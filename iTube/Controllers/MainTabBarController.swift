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
    }
    
    private func setupControllers(){
        setTabImagesAndTitles()
//        viewControllers = [RegisterController(), SharedObject.offerCollectionViewController, SharedObject.orderCollectionViewController, SharedObject.providerViewController]
    }
    
    private func setTabImagesAndTitles(){
//        SharedObject.basketCollectionViewController.tabBarItem.title = SharedValues.BasketController.tabbarTitle
//        SharedObject.basketCollectionViewController.tabBarItem.image = SharedValues.BasketController.tabbarIcon
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
    
}
