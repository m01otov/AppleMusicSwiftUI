//
//  ListTileView.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 11.12.2021.
//

import SwiftUI

struct ListTileView: View {
    let title: String
    let tileList: [Tile]

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
                    //      ListViewCell
                    }
            }
        }

    }
}

struct ListTileView_Previews: PreviewProvider {
    static var previews: some View {
        ListTileView()
    }
}
