//
//  PackagesView.swift
//  Airalo
//
//  Created by Alex Sarkisov on 28.02.23.
//

import SwiftUI

struct PackagesView: View {
    
    @ObservedObject var viewModel: PackagesViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(viewModel.packageRowModels) { rowModel in
                    PackageRow(rowModel: rowModel)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 25)
        }
    }
}
