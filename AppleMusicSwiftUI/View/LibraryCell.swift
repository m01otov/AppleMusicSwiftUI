//
//  LibraryCell.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 06.12.2021.
//

import SwiftUI

struct LibraryCell: View {

    var library: Library

    var body: some View {
        HStack {
            library.icon
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(Color.red)
            Text(library.name)
                .padding(.leading,6)
                .font(.title2)
            Spacer()
        }
        .frame(height: 42)
    }
}

struct LibraryCell_Previews: PreviewProvider {
    static var previews: some View {
        LibraryCell(library: Library(name: "Плейлисты", iconName: "music.note.list"))
            .previewLayout(.fixed(width: 400, height: 70))
    }
}
