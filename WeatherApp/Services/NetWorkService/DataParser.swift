//
//  DataParser.swift
//  WeatherApp
//
//  Created by zyad Baset on 25/08/2024.
//

import Foundation
class DataParser{
    func parsingData<ClassType : Decodable>(ClassType : ClassType.Type,handler:@escaping(_ decodedData:ClassType)->Void){
        NetWorkService().fetchData { data in
            do{
                let decodedData = try JSONDecoder().decode(ClassType.self, from: data)
                handler(decodedData)
            }
            catch {
                print("error in decoding data")
            }
        }
    }
}
