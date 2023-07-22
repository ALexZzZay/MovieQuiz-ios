//
//  NetworkClient.swift
//  MovieQuiz
//
//  Created by ALeXzZzAy on 18.07.23.
//

import Foundation

struct NetworkClient {
    
    private enum NetworkError: Error {
        case codeError
    }
    
    func fetch(url: URL, handler: @escaping (Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Check did the error occur
            if let error = error {
                handler(.failure(error))
                return
            }
            
            // Check that the repsonse is success
            if let response = response as? HTTPURLResponse,
               response.statusCode < 200 || response.statusCode >= 300 {
                handler(.failure(NetworkError.codeError))
                return
            }
            // return the data
            guard let data = data else { return }
            handler(.success(data))
        }
        task.resume()
    }
}
