//
//  PlaylistView.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 21.12.2021.
//

import SwiftUI

struct PlaylistView: View {

    var title: String
    let playlist: [Bar]

    let maxCountTile = 10

    let rows = [
        GridItem(.fixed(250)),
        GridItem(.fixed(250)),
    ]

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.title2)
                    .bold()
                Spacer()

                NavigationLink {
                    ListBarView(title: title, tileList: playlist)
                }
                label: {
                    Text("См. все")
                }
                .navigationBarTitle(title)
            }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, alignment: .top) {
                        ForEach(playlist.prefix(maxCountTile), id: \.self) { bar in
                            BarViewCell(tile:bar)
                        }
                    }
                }
            Spacer(minLength: 70)
            }
        .padding(.horizontal, 20)
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView(title: "Плейлисты", playlist: appleMusicNewYear)
    }
}
