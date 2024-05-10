//
//  RowVie.swift
//  SwiftUI_Shopping
//
//  Created by youngjoo on 5/10/24.
//

import SwiftUI

struct rowView: View {
    
    let data: Item
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            AsyncImage(url: URL(string: data.image)) { image in
                image
                    .resizable()
                    .frame(width: .infinity, height: 100)
            } placeholder: {
                Image(systemName: "star")
                    .frame(width: .infinity, height: 100)
            }
                
            Text(data.brand)
                .fontWeight(.bold)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
        .frame(maxWidth: .infinity, maxHeight: 130)
        .background(.yellow)
       
    }
}
