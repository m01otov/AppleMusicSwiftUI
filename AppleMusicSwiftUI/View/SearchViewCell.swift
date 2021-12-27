//
//  SearchViewCell.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 21.12.2021.
//

import SwiftUI

struct SearchViewCell: View {
    let searchCategory: SearchCategory
    var body: some View {
        NavigationLink {
            SearchCategoryView(searchCategory: searchCategory)
        } label: {
            ZStack(alignment: .bottomLeading) {
                searchCategory.image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 180, height: 125)

                Text(searchCategory.title)
                    .font(.body)
                    .bold()
                    .foregroundColor(.white)
                    .padding(10)
            }
        }
        }
}

struct SearchViewCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewCell(searchCategory: sampleSearchCategory)
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
