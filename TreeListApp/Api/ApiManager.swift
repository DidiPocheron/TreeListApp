//
//  ApiManager.swift
//  TreeListApp
//
//  Created by Didi on 25/02/2022.
//

import Foundation

enum RequestType: String {
    case getRequest = "GET"
    case postRequest = "POST"
    case putRequest = "PUT"
    case deleteRequest = "DELETE"
}

class ApiManager {
    let baseURL = Constants.Urls.opendataUrl
    static var shared = ApiManager()
    private var request: URLRequest?
    private init () {}
    
    private func createGetRequestWithURLComponents(url:URL,
                                                   body: [String:Any],
                                                   parameters: [URLQueryItem],
                                                   requestType: RequestType) -> URLRequest? {
        var components = URLComponents(string: url.absoluteString)!
        components.queryItems = body.map { (key, value) in
            URLQueryItem(name: key, value: "\(value)")
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        components.queryItems = parameters
        var request = URLRequest(url: components.url ?? url)
        request.httpMethod = requestType.rawValue
        return request
    }
    
    private func getParameterBody(with body: [String:Any]) -> Data? {
        guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted) else {
            return nil
        }
        return httpBody
    }
    
    private func createRequest(with url: URL, requestType: RequestType, body: [String: Any], parameters: [URLQueryItem]) -> URLRequest? {
        
        // TO DO: Add other http method !
        
//        if requestType == .getRequest {
            return createGetRequestWithURLComponents(url: url,
                                                     body: body,
                                                     parameters: parameters,
                                                     requestType: requestType)
//        }
    }
    
    func sendRequest<T:Codable>(model: T.Type,
                                with endpoint: String,
                                requestType: RequestType,
                                body: [String:Any],
                                parameters: [URLQueryItem]) async -> Result<T, Error>? {
        if #available(iOS 15.0, *) {
            do {
                let url = URL(string: baseURL + endpoint)!
                guard let urlRequest = createRequest(with: url,
                                                     requestType: requestType,
                                                     body: body,
                                                     parameters: parameters) else {
                    return nil
                }
                let (data, _) = try await URLSession.shared.data(for: urlRequest)
                let parsedData = try JSONDecoder().decode(model.self, from: data)
                return .success(parsedData)
            }
            catch {
                return .failure(error)
            }
        }
        return nil
    }
    
}
