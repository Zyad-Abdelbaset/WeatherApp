//
//  MockNWService.swift
//  WeatherAppTests
//
//  Created by zyad Baset on 27/08/2024.
//

import Foundation
@testable import WeatherApp
class MockNWService{
    var shouldReturnError:Bool
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    let fakeJsonObj:[String:Any]=[
        "location":[
            "name":"Talkha",
            "region":"Ad Daqahliyah",
            "country":"Egypt",
            "lat":31.04,
            "lon":31.38,
            "localtime_epoch":1724714552,
        ]]
    
    
    func getData(handler:@escaping(Location?,Error?)->Void) {
        var res:Location = Location ()
        var err:Error!
        do{
            let data = try JSONSerialization.data(withJSONObject: fakeJsonObj)
            res = try JSONDecoder().decode(Location.self, from: data)
        }catch let error{
            
            err=error
        }
        if shouldReturnError{
            handler(nil,err)
        }else{
            handler(res,nil)
        }
    }
}
