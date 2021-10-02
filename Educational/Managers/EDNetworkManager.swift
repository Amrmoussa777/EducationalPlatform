//
//  EDNetworkManager.swift
//  Educational
//
//  Created by Amr Moussa on 24/08/2021.
//

import UIKit
import AMCodeBase


class EDNetworkManager: AMNetworkManagerBase {
    static let shared = EDNetworkManager()
    
    var currentUser:User?
    let bseUrl = "https://students-01.herokuapp.com/api/student/"
    private init(){
        super.init(baseUrl: bseUrl)
        getCurrentUser()
    }
    
    
    override func signUpUser(user: User, password: String, completed: @escaping (Bool) -> ()) {
        let requestHeader:[String:String] = ["Content-Type":"application/x-www-form-urlencoded"]
        
        var requestComponents = URLComponents()
        requestComponents.queryItems = [
            URLQueryItem(name: SignUpHeaderKeys.name, value: user.name),
            URLQueryItem(name: SignUpHeaderKeys.email, value: user.email),
            URLQueryItem(name: SignUpHeaderKeys.phone, value: user.phone),
            URLQueryItem(name: SignUpHeaderKeys.yearId, value: String(user.yearId)),
            URLQueryItem(name: SignUpHeaderKeys.password, value: password),
            URLQueryItem(name: SignUpHeaderKeys.image, value: user.avatarUrl),
        ]
        
        guard let url = URL(string: baseUrl + "signup") else {
            completed(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = requestHeader
        request.httpBody = requestComponents.query?.data(using: .utf8)
        
        
        let task = URLSession.shared.dataTask(with: request) { [weak self](data, response, error) in
            guard let self = self else {return}
            if let _ = error {
                completed(false)
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(false)
                return
            }
            
            self.signInUSer(email: user.phone, pass: password, completed: completed)
        }
        
        task.resume()
    }
    
     func editUser(user: User, completed: @escaping (Bool) -> ()) {
        let requestHeader:[String:String] = ["Content-Type":"application/x-www-form-urlencoded",getUnitsKey.Authorization:"Bearer " + user.token]
        
        var requestComponents = URLComponents()
        requestComponents.queryItems = [
            URLQueryItem(name: SignUpHeaderKeys.name, value: user.name),
            URLQueryItem(name: SignUpHeaderKeys.email, value: user.email),
            URLQueryItem(name: SignUpHeaderKeys.yearId, value: String(user.yearId)),
        ]
        
        guard let url = URL(string: baseUrl + "profile") else {
            completed(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = requestHeader
        request.httpBody = requestComponents.query?.data(using: .utf8)
        
        
        let task = URLSession.shared.dataTask(with: request) { [weak self](data, response, error) in
            guard let self = self else {return}
            if let _ = error {
                completed(false)
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(false)
                return
            }
            
            let user = User(userId: user.userId, name: user.name, userRating: 0, avatarUrl: "", email: user.email, phone: user.phone, yearId: user.yearId, token: user.token)
            self.saveUserIndefaults(user: user, completed: completed)
           
        }
        
        task.resume()
    }
    override func signInUSer(email: String, pass: String, completed: @escaping (Bool) -> ()) {
        let requestHeader:[String:String] = ["Content-Type":"application/x-www-form-urlencoded"]
        
        var requestComponents = URLComponents()
        requestComponents.queryItems = [
            URLQueryItem(name: SignUpHeaderKeys.phone, value: email),
            URLQueryItem(name: SignUpHeaderKeys.password, value: pass),
            
        ]
        
        guard let url = URL(string: baseUrl + "login") else {
            completed(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = requestHeader
        request.httpBody = requestComponents.query?.data(using: .utf8)
        
        
        let task = URLSession.shared.dataTask(with: request) { [weak self](data, response, error) in
            guard let self = self else {return}
            if let _ = error {
                completed(false)
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                completed(false)
                return
            }
        
            guard let data = data else {
                completed(false)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(SignInUserData.self, from: data)
                let user = User(userId: userData.userId, name: userData.name, userRating: 0, avatarUrl: "", email: userData.email, phone: userData.phone, yearId: userData.yearId, token: userData.token)
                    self.saveUserIndefaults(user: user, completed: completed)
            } catch {
                completed(false)
            }
        }
        
        task.resume()
    }
    
    func getUnits(completed:@escaping([Unit])->()){
        if let _ = currentUser {
            getUserUnits(completed: completed)
        }else{
            authenticateUser {[weak self] auth in
                guard let self = self else {return}
                auth ?  self.getUserUnits(completed: completed):completed([])
            }
        }
    }
    
    private func getUserUnits(completed:@escaping([Unit])->()){
        getCurrentUser()
        guard let user = currentUser else {
            completed([])
            return
        }
        
        let requestHeader:[String:String] = ["Content-Type":"application/x-www-form-urlencoded",getUnitsKey.Authorization:"Bearer " + user.token]
        
        guard let url = URL(string: baseUrl + "units") else {
            completed([])
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = requestHeader
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let _ = error {
                completed([])
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                completed([])
                return
            }
        
            guard let data = data else {
                completed([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let units = try decoder.decode(Units.self, from: data)
                completed(units.units)
            } catch {
                completed([])
            }
        }
        
        task.resume()
    }
    
    func getVideoIDFromLesson(lesson:lesson)->String{
        if let range = lesson.link.range(of: "v=") {
            let videoID = lesson.link[range.upperBound...]
            return String(videoID)
        }
        return ""
    }
    
    func saveLatsVideo(lesson:lesson){
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(lesson)
            UserDefaults.standard.set(data, forKey: UserDefaultKeys.lastVide)
        } catch {
            print("Unable to Encode user (\(error))")
        }
    }
    func getLatsVideo()->lesson?{
        if let data = UserDefaults.standard.data(forKey: UserDefaultKeys.lastVide) {
            do {
                let decoder = JSONDecoder()
                let lesson = try decoder.decode(lesson.self, from: data)
                return lesson
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }else{
            return nil
        }
        return nil
    }
    
    private func getCurrentUser(){
        if let data = UserDefaults.standard.data(forKey: UserDefaultKeys.currentUserKey) {
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: data)
                currentUser = user
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
    }
    
    
    private func saveUserIndefaults(user:User,completed:@escaping(Bool)->()){
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)
            UserDefaults.standard.set(data, forKey: UserDefaultKeys.currentUserKey)
            getCurrentUser()
            completed(true)
        } catch {
            completed(false)
            print("Unable to Encode user (\(error))")
        }
    }
    
    private func saveUserIndefaults(userData:Data,completed:@escaping(Bool)->()){
            UserDefaults.standard.set(userData, forKey: UserDefaultKeys.currentUserKey)
            completed(true)
    }
    
     func logOut()->Bool{
        UserDefaults.standard.removeObject(forKey: UserDefaultKeys.currentUserKey)
        currentUser = nil
        return true
    }
     
    override func authenticateUser(completion: @escaping (Bool) -> ()) {
        self.userAuthCompletionHandler = completion
        currentRootVC?.presentEDLoginVC(delegateHandler: self)
    }
    
    override func userLoginStatusChanged(ststus: userLoginStatus) {
        switch (ststus) {
        case .loggedin:
            self.userAuthCompletionHandler?(true)
        case .tappLogin:
            currentRootVC?.presentEDLoginVC(delegateHandler: self)
        case .tappedRegisterButton:
            currentRootVC?.showEDRegisterVC(delegateHandler: self)
        case .registered:
            self.userAuthCompletionHandler?(true)
        // handle action veforesign up
        }
    }
    
    
}




