//
//  StoreView.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import SwiftUI

struct StoreView: View {
    
    @ObservedObject var viewModel: StoreViewModel
    
    var onOffsetChange: (CGFloat) -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                OffsetReader()
                SegmentedControl(selectedTab: $viewModel.selectedTab)
                Group {
                    switch viewModel.selectedTab {
                    case .local:
                        AreasView(title: "Popular Countries",
                                  rowModels: viewModel.localRowModels,
                                  onTapArea: viewModel.onTapLocalArea)
                    case .regional:
                        AreasView(title: "Regions",
                                  rowModels: viewModel.regionalRowModels,
                                  onTapArea: viewModel.onTapRegionalArea)
                    case .global:
                        GlobalPackagesView(rowModels: viewModel.globalRowModels)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 25)
            }
        }
        .coordinateSpace(name: OffsetReader.coordinateSpace)
        .onPreferenceChange(OffsetPreferenceKey.self, perform: onOffsetChange)
    }
}

extension StoreView {
    
    struct SegmentedControl: View {
        
        @Binding var selectedTab: StoreTab
        
        private let tabs: [StoreTab] = StoreTab.allCases
        
        var body: some View {
            HStack(spacing: 1) {
                ForEach(tabs) { tab in
                    Text(tab.title)
                        .font(.medium(size: 13))
                        .foregroundColor(tab == selectedTab ? .content1 : .content2)
                        .frame(maxWidth: .infinity, minHeight: 28)
                        .background(tab == selectedTab ? Color.background2 : Color.background1)
                        .cornerRadius(7)
                        .onTapGesture {
                            selectedTab = tab
                        }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
            .background(
                Color.background1
                    .shadow(color: Color.black.opacity(0.15), radius: 30, y: 10)
            )
        }
    }
}

extension StoreView {
    
    struct AreasView: View {
        
        var title: String
        var rowModels: [AreaRowModel]
        var onTapArea: (AreaRowModel) -> Void
        
        var body: some View {
            VStack(spacing: 24) {
                Text(title)
                    .font(.semiBold(size: 19))
                    .foregroundColor(.content1)
                    .kerning(-0.2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVStack(spacing: 10) {
                    ForEach(rowModels) { rowModel in
                        AreaRow(rowModel: rowModel)
                            .onTapGesture {
                                onTapArea(rowModel)
                            }
                    }
                }
            }
        }
    }
    
    struct GlobalPackagesView: View {
        
        var rowModels: [PackageRowModel]
        
        var body: some View {
            LazyVStack(spacing: 20) {
                ForEach(rowModels) { rowModel in
                    PackageRow(rowModel: rowModel)
                }
            }
        }
    }
}
