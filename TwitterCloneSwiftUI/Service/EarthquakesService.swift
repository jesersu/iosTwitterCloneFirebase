//
//  EarthquakesService.swift
//  NTTTestiOS
//
//  Created by Jesus Ervin Chapi Suyo on 7/11/23.
//

import Foundation
import Alamofire
struct EarthquakesService {

    func fetchEarthquakes(startDate: Date, endDate: Date, completion: @escaping(EarthquakesModel) -> Void) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let formattedStartDate = dateFormatter.string(from: startDate)
        let formattedEndDate = dateFormatter.string(from: endDate)
        

        let url = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=\(formattedStartDate)&endtime=\(formattedEndDate)"
        print("call service URL : \(url)")
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response{responce in
            switch responce.result{
            case .success(let data):
                do{
                    let jsondata = try JSONDecoder().decode(EarthquakesModel.self, from: data!)
                    completion(jsondata)
                }catch{
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}

