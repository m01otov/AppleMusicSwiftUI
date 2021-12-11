//
//  FavoriteViewCell.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 11.12.2021.
//

import SwiftUI

struct FavoriteViewCell: View {
    let favorite: Favorite
    @State private var titleHeight: CGFloat = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Divider()
                .padding(.bottom,10)
            Text(favorite.category)
                .textCase(.uppercase)
                .font(.system(size: 11,weight: .semibold))
                .foregroundColor(.gray)
                .padding(.bottom,2)

            VStack(alignment: .leading, spacing: 0){
                Text(favorite.title)
                    .foregroundColor(Color(UIColor.label))
                    .font(.title2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 40, alignment: .leading)
                    .padding(.bottom, 8)
                    .overlay(
                        GeometryReader { proxy in
                            Color.clear.onAppear {
                                titleHeight = proxy.size.height
                            }
            })

        }
            .frame(minHeight: titleHeight, alignment: .leading)

            favorite.image
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .frame(width: UIScreen.main.bounds.width - 40)
    }
}

struct FavoriteViewCell_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteViewCell(favorite:sampleFavorite)
            .previewLayout(.fixed(width: 600, height: 400))
    }
}

}
