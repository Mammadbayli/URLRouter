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
    
    /**
     Use for adding query parameters to a URL.
     Add parameter names and values consecuetively.
     
     - Parameter params: List of parameters.
     
     - Returns: Void
     */
    func url(withParams params: String...) -> URL {
        
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
    private let params = NSMutableDictionary()
    
    
    public var queryParams: NSMutableDictionary {
       return params
    }
    
    /// Registers view controllers with the routes.
    ///
    /// - Parameters:
    ///   - vc: the vc for the url
    ///   - forURL: the url to navigate to
    public func register(vc: Routable.Type, forURL url: URL) {
        routingTable[url.relativePath] = vc
    }
    
    
    /**
     Routes to the desired url.
     
     - Parameter url: The person being greeted.
     
     - Returns: Void
     */
    public func route(url: URL) {
        let path = url.relativePath
        
        self.queryParams.removeAllObjects()
        
        DispatchQueue.main.async { [weak self] in
            if let vc = self?.routingTable[path] as? UIViewController.Type, let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                
                
                let query = url.query ?? ""
                
                let pairs = query.split(separator: "&")
                
                pairs.forEach { [weak self] pair in
                    let nameValue = pair.split(separator: "=")
                    self?.params[nameValue[0]] = nameValue[1]
                }
                
                let vcInStack = navigationController.viewControllers.first { $0.isKind(of: vc) }
                
                //If the view controller exists in current stack pop to that controller, else push the new controller on top.
                if vcInStack != nil {
                    navigationController.popToViewController(vcInStack!, animated: true)
                } else {
                    navigationController.pushViewController(vc.init(), animated: true)
                }
            }
        }
    }
}
