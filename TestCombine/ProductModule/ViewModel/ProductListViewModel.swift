//
//  ProductListViewModel.swift
//  TestCombine
//
//  Created by abdelbaqy yassin on 21/11/2022.
//

import Foundation
import Combine

class ProductListViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getProducts()
    }
    
    func getProducts() {
        
        guard let url = URL(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer") else { return  }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: ProductResponseModel.self, decoder: JSONDecoder())
            .sink { (completion) in
                print("Completion: \(completion)")
            } receiveValue: {[weak self] responseModel in
                if let products = responseModel.results, !products.isEmpty {
                    self?.products = products
                }
            }
            .store(in: &cancellables)
    }
}
