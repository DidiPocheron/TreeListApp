//
//  TreeViewModel.swift
//  TreeListApp
//
//  Created by Didi on 25/02/2022.
//

import Foundation

class TreeViewModel: ObservableObject {
    @Published var trees = [Fields]()
    @Published var dataLoaded: Bool = false
    
    func getTrees() async {
        let parameters = [URLQueryItem(name: Constants.ParamsKey.dataset, value: "les-arbres"),
                          URLQueryItem(name: Constants.ParamsKey.rows, value: "20")]
        guard let result = await ApiManager.shared.sendRequest(model: TreeList.self, with: Constants.Urls.searchPath, requestType: .getRequest, body: [:], parameters: parameters) else {
            return
        }
        switch result {
        case .success(let response):
            DispatchQueue.main.async {
                self.trees = response.records
                self.dataLoaded = true
            }
        case .failure(let error):
            DispatchQueue.main.async {
                self.dataLoaded = true
                print("Error on getTrees => \(error.localizedDescription)")
            }
        }
    }
}
