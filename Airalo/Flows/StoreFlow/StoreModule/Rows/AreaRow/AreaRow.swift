//
//  StoreAreaRow.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import SwiftUI

struct AreaRow: View {
    
    let rowModel: AreaRowModel
    
    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: rowModel.imageURL) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 37, height: 28)
            
            Text(rowModel.title)
                .font(.medium(size: 15))
                .foregroundColor(.content1)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(Images.Common.arrowRight)
                .resizable()
                .frame(width: 7, height: 12)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, minHeight: 55)
        .background(
            RoundedRectangle(cornerRadius: 7)
                .fill(Color(.background1))
                .shadow(color: Color.black.opacity(0.15), radius: 30, y: 10)
        )
    }
}
