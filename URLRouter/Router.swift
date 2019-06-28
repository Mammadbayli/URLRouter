//
//  Router.swift
//  RouterTest
//
//  Created by Javad Mammadbeyli on 2806//2019.
//  Copyright © 2019 Bank Respublika OJSC. All rights reserved.
//

import Foundation
import UIKit

public extension URL {
     static var secondVC = URL(string: "/secondVC")!
    
    func url(withParam params: String...) -> URL {
        
        let queryItems = NSMutableArray()
        
        var iterator = params.makeIterator()
        
        while(true) {
            if let name = iterator.next(), let value = iterator.next() {
                queryItems.add(URLQueryItem(name: name, value: value))
            }
            else{
                break
            }
        }
        
        
        var urlComps = URLComponents(string: self.relativePath)!
        
        urlComps.queryItems = queryItems as? [URLQueryItem]
        
        return urlComps.url!
    }
}

public protocol Routable {
    init()
}

extension UIViewController: Routable {
    
}


public class Router {
    
    private init() {}
    public static let shared = Router()
    private let routingTable = NSMutableDictionary()
    private var params = NSDictionary()
    
    public func register(vc: Routable.Type, forURL url: URL) {
        routingTable[url.relativePath] = vc
    }
    
    public func route(url: URL, params: NSDictionary? = nil) {
        let path = url.relativePath
        
        if let params = params {
            self.params = params
        }
        
        DispatchQueue.main.async { [weak self] in
            if  let vc = self?.routingTable[path] as? UIViewController.Type, let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                navigationController.pushViewController(vc.init(), animated: true)
            }
        }
    }
}
