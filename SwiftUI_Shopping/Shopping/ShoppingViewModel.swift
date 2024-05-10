//
//  ShoppingViewModel.swift
//  SwiftUI_Shopping
//
//  Created by youngjoo on 5/10/24.
//

import Foundation
import Combine

final class ShoppingViewModel: ViewModelType {
    
    var cancellables: Set<AnyCancellable> = .init()
    
    var input: Input = .init()
    
    @Published
    var output: Output = .init()
    
    init() {
        transform()
    }
    
}

extension ShoppingViewModel {
    
    struct Input {
        let viewOnAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var searchItems: [Item] = []
    }
    
    func transform() {
        input.viewOnAppear
            .sink { [weak self] _ in
                guard let self else { return }
                Task {
                    try await self.fetchSearchList()
                }
            }
            .store(in: &cancellables)
    }
    
    func fetchSearchList() async throws {
        do {
            let searchData = try await NetworkManager.shared.callAPI(type: Search.self, text: "book", sort: "sim", start: 1)
            output.searchItems = searchData.items
        } catch {
            print(error.localizedDescription)
            output.searchItems = []
        }
    }
}
