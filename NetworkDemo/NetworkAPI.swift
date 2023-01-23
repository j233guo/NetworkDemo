//
//  NetworkAPI.swift
//  NetworkDemo
//
//  Created by Jiaming Guo on 2023-01-22.
//

import Alamofire
import Foundation

class NetworkAPI {
    
    private static func parseData<T: Decodable>(_ data: Data) -> Result<T, Error> {
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            let error = NSError(domain: "NetworkAPIError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Cannot parse data"])
            return .failure(error)
        }
        return .success(decodedData)
    }
    
    static func recommendPostList(completion: @escaping(Result<PostList, Error>) -> Void) {
        NetworkManager.shared.requestGet(path: "PostListData_recommend_1.json", parameters: nil) { result in
            switch result {
            case let .success(data):
                let parsedResult: Result<PostList, Error> = self.parseData(data)
                completion(parsedResult)
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    static func hotPostList(completion: @escaping(Result<PostList, Error>) -> Void) {
        NetworkManager.shared.requestGet(path: "PostListData_hot_1.json", parameters: nil) { result in
            switch result {
            case let .success(data):
                let parsedResult: Result<PostList, Error> = self.parseData(data)
                completion(parsedResult)
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    static func createPost(text: String, completion: @escaping (Result<Post, Error>) -> Void) {
        NetworkManager.shared.requestGet(path: "createpost", parameters: ["text": text]) { result in
            switch result {
            case let .success(data):
                let parsedResult: Result<Post, Error> = self.parseData(data)
                completion(parsedResult)
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
