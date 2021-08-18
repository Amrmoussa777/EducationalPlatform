//
//  NetworkManager.swift
//  Educational
//
//  Created by Amr Moussa on 16/08/2021.
//

import Foundation
import AMCodeBase


class NetworkManager:AMNetworkManagerBase{
   
    let url:String = "ur"
    static let shared = NetworkManager()
    
    private init(){
        super.init(baseUrl: self.url)
    }
    
     
}






