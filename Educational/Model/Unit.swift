//
//  Course.swift
//  Educational
//
//  Created by Amr Moussa on 17/08/2021.
//

import Foundation


struct Units:Codable {
    let units:[Unit]
}

struct Unit :Codable{
    let id:Int
    let name:String
    let yearId:Int
    let lessons:[lesson]
    let createdAt:String
    let image:String
    let active:Bool
    let disc:String

}


struct lesson:Codable {
    let id:Int
    let name:String
    let unitId:Int
    let link:String
    let youtubeId:String
    let createdAt:String
}
