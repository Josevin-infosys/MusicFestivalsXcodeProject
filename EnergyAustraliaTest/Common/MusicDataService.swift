//
//  MusicDataService.swift
//  EnergyAustraliaTest
//
//  Created by Josevin.Johny on 22/01/23.
//

import Foundation

struct MusicDataService {
    
    /// Method called by view model to fetch remote API Data
    /// - Parameters:
    ///   - urlString: API URL String
    ///   - completionHandler: Completion handler to return respose
    func getMusicFestivalData(from urlString: String, completionHandler: @escaping (Result<[[String: Any]]?,APIError>) -> Void) {
        
        guard let validURL = validateURL(urlString: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        fetchAPIJSON(baseURL: validURL) { response, error in
            guard let responseData = response else {
                
                if let apiError = error {
                    completionHandler(.failure(apiError))
                    return
                } else {
                    completionHandler(.failure(.unknown))
                    return
                }
            }
            
            guard let musicFestivalData = decodeJSONStringToModel(apiResponse: responseData) else { completionHandler(.failure(.decodeError))
                return
            }
            completionHandler(.success(musicFestivalData))
        }
    }
    
    /// Function to validate URL
    /// - Parameter urlString: URL String
    /// - Returns: URL
    func validateURL(urlString: String = "") -> URL? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        return url
    }
    
    /// Function to create URLSession task
    /// - Parameters:
    ///   - url: URL
    ///   - completionhandler: response on completion
    func fetchAPIJSON(baseURL url: URL, completionhandler: @escaping (_ apiResponse: Data?, _ error: APIError?) -> Void) {
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let httpResponse = response else {
                completionhandler(nil, .networkError)
                return
            }
            print(httpResponse.description)
            
            guard let data = data else {
                completionhandler(nil, .unableToFectchData)
                return }
            completionhandler(data, nil)
            
        }.resume()
    }
    
    /// Converting text json to Array of Dicitonary
    /// - Parameter data: raw data
    /// - Returns: array of dictionary 
    func decodeJSONStringToModel(apiResponse data:Data) -> [[String: Any]]? {
        do {
            let result = try data.convertToJSON()
            return result
        }
        catch let error{
            debugPrint("error occured while decoding = \(error.localizedDescription)")
            return nil
        }
    }
}
