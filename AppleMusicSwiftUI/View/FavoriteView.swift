//
//  FavoriteView.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 13.12.2021.
//

import SwiftUI

struct FavoriteView: View {

    var favoriteList: [Favorite]
    let row = [GridItem(.flexible())]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: row, alignment: .top, spacing: 10){
                ForEach(favoriteList, id: \.self) { favorite in
                    FavoriteViewCell(favorite: favorite)
                }
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(favoriteList: radioFavoriteList)
    }
}
