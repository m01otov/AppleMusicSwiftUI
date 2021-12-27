//
//  SearchCategoryView.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 21.12.2021.
//

import SwiftUI

struct SearchCategoryView: View {
    var searchCategory: SearchCategory

    var body: some View {

        ScrollView {
            FavoriteView(favoriteList: searchCategory.favoriteList)
            Divider()
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            Spacer()
            PlaylistView(title: "Плейлисты", playlist: searchCategory.playList)
            Spacer()
        }
        .navigationTitle(searchCategory.title)
    }
}

struct SearchCategoryView_Previews:PreviewProvider {
    static var previews: some View {
        SearchCategoryView(searchCategory: sampleSearchCategory)
    }
}
