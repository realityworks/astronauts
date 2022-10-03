//
//  RealAPIService.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

class RealAPIService: APIService {
    
    private func success(with data: Data?, _ response: URLResponse?, _ error: Error?) -> Data? {
        guard let httpURLResponse = response as? HTTPURLResponse,
              httpURLResponse.statusCode == 200,
              error == nil else {
            return nil
        }

        return data
    }

    func loadAstronoutsList(completionHandler: @escaping (AstronautList?, Error?) -> Void) {
        // GET http://spacelaunchnow.me/api/3.5.0/astronaut/

        guard let url = URL(string: "http://spacelaunchnow.me/api/3.5.0/astronaut/") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = self.success(with: data, response, error) else {
                completionHandler(nil, error)
                return
            }

            do {
                let decoder = JSONDecoder()
                let astronauts = try decoder.decode(AstronautList.self, from: data)
            } catch {
                completionHandler(nil, error)
            }
        }.resume()
    }

    func loadAstronautDetail(for astronautId: Astronaut.ID, completionHandler: @escaping (AstronautDetail?, Error?) -> Void) {
        // GEThttp://spacelaunchnow.me/api/3.5.0/astronaut/<astronautId>
        guard let url = URL(string: "http://spacelaunchnow.me/api/3.5.0/astronaut/") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = self.success(with: data, response, error) else {
                completionHandler(nil, error)
                return
            }

            do {
                let decoder = JSONDecoder()
                let astronauts = try decoder.decode(AstronautDetail.self, from: data)
            } catch {
                completionHandler(nil, error)
            }
        }.resume()
    }
}
