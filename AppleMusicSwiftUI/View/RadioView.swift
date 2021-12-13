//
//  RadioView.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 11.12.2021.
//

import SwiftUI

struct RadioView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                FavoriteView(favoriteList: radioFavoriteList)

                Divider()
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                ListBarView(title: "Станции", tileList: radioStationList)

            }
            .navigationTitle("Радио")
        }
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
