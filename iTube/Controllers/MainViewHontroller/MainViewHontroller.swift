//
//  MainViewHontroller.swift
//  iTube
//
//  Created by Apple on 7/20/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class MainViewHontroller: UIViewController {
    
    var mainTabBarController = MainTabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewsConstraints()
    }
    
    let playerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        
        return view
    }()
    
    let tabBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        
        return view
    }()

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// View Extension ////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////

extension MainViewHontroller {
    
    fileprivate func setViewsConstraints() {
        addSubViewsInsideMainViews()
        setPlayerViewConstraints(control: playerView)
        setTabsViewConstraints(control: tabBarView)
    }
    
    private func addSubViewsInsideMainViews(){
        view.addSubview(playerView)
        view.addSubview(tabBarView)
//        tabBarView.addSubview(mainTabBarController)
        
    }
    
//    private func setMainTabsViewConstraints(control: MainTabBarController){
//        NSLayoutConstraint.activate([
//            control.topAnchor.constraint(equalTo: playerView.bottomAnchor),
//            control.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            control.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            control.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//            ])
//    }
    
    private func setTabsViewConstraints(control: UIView){
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: playerView.bottomAnchor),
            control.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            control.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            control.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ])
    }
    
    private func setPlayerViewConstraints(control: UIView){
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            control.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            control.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            control.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ])
    }
    
}
