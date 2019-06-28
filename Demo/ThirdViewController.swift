//
//  ThirdViewController.swift
//  Demo
//
//  Created by Javad Mammadbeyli on 2806//2019.
//  Copyright © 2019 Bank Respublika OJSC. All rights reserved.
//

import UIKit
import URLRouter

class ThirdViewController: UIViewController {

    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .green
        
        button.setTitle("Go To FirstVC", for: .normal)
        
        print(Router.shared.queryParams)
        
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
        Router.shared.route(url: .firstVC)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
