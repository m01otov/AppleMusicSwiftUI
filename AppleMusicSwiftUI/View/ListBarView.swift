//
//  ListTileView.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 11.12.2021.
//

import SwiftUI

struct ListBarView: View {
    let title: String
    let tileList: [Bar]

    let columns = [
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text(title)
                    .font(.title)
                    .bold()
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(tileList, id: \.self) { tile in
                        ListBarViewCell(bar: tile)
                    }
                }
            }

        }
    }
}
struct ListTileView_Previews: PreviewProvider {
    static var previews: some View {
        ListBarView(title: "Станция", tileList: radioStationList)
    }
}
