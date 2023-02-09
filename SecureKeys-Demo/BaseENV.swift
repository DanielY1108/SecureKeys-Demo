//
//  BaseENV.swift
//  SecureKeys-Demo
//
//  Created by JINSEOK on 2023/02/10.
//

import UIKit

class BaseENV {
    
    let dict: NSDictionary
    
    init(resourceName: String) {
        guard let filePath = Bundle.main.path(forResource: resourceName, ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Couldn't find file '\(resourceName).plist'.")
        }
        self.dict = plist
    }
}

// API Key를 추가 시킬 때마다 속성을 추가하기(이름은 원하는대로 가능)
protocol APIKeyable {
    var SERVICE_API_KEY: String { get }
    var SERVICE_CLIENT_ID: String { get }
}

class DebugENV: BaseENV, APIKeyable {
    
    init() {
        super.init(resourceName: "DEBUG-Keys")
    }
    
    // 키는 plist의 dic에 저장된 속성의 이름을 정확히 써야된다.
    // 딕셔너리에 직접 값을 넣어서 받아도 되고 object 메서드를 사용해도 된다.
    var SERVICE_API_KEY: String {
        dict["SERVICE_API_KEY"] as? String ?? ""
    }
    var SERVICE_CLIENT_ID: String {
        dict.object(forKey: "SERVICE_CLIENT_ID") as? String ?? ""
    }
}

class ProdENV: BaseENV, APIKeyable {
    
    init() {
        super.init(resourceName: "PROD-Keys")
    }
    
    var SERVICE_API_KEY: String {
        dict.object(forKey: "SERVICE_API_KEY") as? String ?? ""
    }
    
    var SERVICE_CLIENT_ID: String {
        dict.object(forKey: "SERVICE_CLIENT_ID") as? String ?? ""
    }
}
