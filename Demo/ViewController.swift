//
//  ViewController.swift
//  Demo
//
//  Created by Javad Mammadbeyli on 2806//2019.
//  Copyright © 2019 Bank Respublika OJSC. All rights reserved.
//

import UIKit
import URLRouter

class ViewController: UIViewController {
    
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .red
        
        button.setTitle("Go To SecondVC", for: .normal)
        
        button.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 20),
            //button.widthAnchor.constraint(equalToConstant: 50)
            ])
    }
    

@objc
func navigate() {
    Router.shared.route(url: URL.secondVC.url(withParams: "id", "5", "state", "idle"))
}



}

