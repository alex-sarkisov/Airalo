//
//  PackageRow.swift
//  Airalo
//
//  Created by Alex Sarkisov on 28.02.23.
//

import SwiftUI

struct PackageRow: View {
    
    let rowModel: PackageRowModel
    
    private var gradient: Gradient {
        Gradient(colors: [.hex(rowModel.gradientStartHex), .hex(rowModel.gradientEndHex)])
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 0) {
                HeaderView(title: rowModel.title,
                           subtitle: rowModel.subtitle,
                           style: rowModel.style)

                Spacer()
                
                SeparatorView(style: rowModel.style)

                DetailsView(imageName: Images.Package.data,
                            title: "DATA",
                            details: rowModel.data,
                            style: rowModel.style)

                SeparatorView(style: rowModel.style)

                DetailsView(imageName: Images.Package.validity,
                            title: "VALIDITY",
                            details: rowModel.validity,
                            style: rowModel.style)

                SeparatorView(style: rowModel.style)
                
                BuyPackageView(title: rowModel.buyButtonTitle, style: rowModel.style)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing)
                    .cornerRadius(7)
                    .shadow(color: Color.black.opacity(0.15), radius: 30, y: 10)
            )
            .padding(.top, 20)
            
            EsimImage(url: rowModel.imageURL)
                .padding(.trailing, 20)
        }
        .frame(maxWidth: .infinity, minHeight: 308)
    }
}

extension PackageRow {
    
    struct EsimImage: View {
        
        let url: URL?
        
        var body: some View {
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 140, height: 88)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .shadow(color: Color.black.opacity(0.15), radius: 30, y: 10)
            )
        }
    }
    
    struct HeaderView: View {
        
        let title: String
        let subtitle: String
        let style: OperatorStyle
        
        var body: some View {
            VStack(alignment: .leading, spacing: 5.5) {
                Text(title)
                    .font(.semiBold(size: 19))
                    .foregroundColor(style.color)
                    .kerning(-0.2)
                
                HStack(spacing: 5) {
                    Text(subtitle)
                        .font(.medium(size: 13))
                        .foregroundColor(style.color)
                    
                    Image(Images.Package.arrow)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(style.color)
                        .frame(width: 12, height: 12)
                }
            }
            .padding(20)
        }
    }
    
    struct DetailsView: View {
        
        let imageName: String
        let title: String
        let details: String
        let style: OperatorStyle
        
        var body: some View {
            HStack(spacing: 13) {
                Image(imageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(style.color)
                    .frame(width: 16, height: 16)
                
                Text(title)
                    .font(.semiBold(size: 11))
                    .foregroundColor(style.color)
                    .kerning(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(details)
                    .font(.medium(size: 17))
                    .foregroundColor(style.color)
                    .kerning(-0.1)
            }
            .frame(maxWidth: .infinity, minHeight: 56)
            .padding(.horizontal, 20)
        }
    }
    
    struct SeparatorView: View {
        
        let style: OperatorStyle
        
        var body: some View {
            Group {
                switch style {
                case .light:
                    Color.background2
                case .dark:
                    Color.hex("232323")
                }
            }
            .frame(height: 1)
            .opacity(0.1)
        }
    }
    
    struct BuyPackageView: View {
        
        let title: String
        let style: OperatorStyle
        
        var body: some View {
            Button(title) {
                
            }
            .buttonStyle(ConfirmationButtonStyle(color: style.color))
            .padding(20)
        }
    }
}

private extension OperatorStyle {
    
    var color: Color {
        switch self {
        case .dark:
            return .content1
        case .light:
            return .content3
        }
    }
}
