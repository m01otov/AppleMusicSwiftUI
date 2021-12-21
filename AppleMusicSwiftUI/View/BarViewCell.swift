//
//  BarViewCell.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 21.12.2021.
//

import SwiftUI

struct BarViewCell: View {
    let tile: Bar
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            tile.image
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .frame(width: 185, height: 185)

                Text(tile.title)
                    .font(.title3)
                    .lineLimit(1)

                Text(tile.subTitle ?? " ")
                    .foregroundColor(.secondary)
                    .lineLimit(1)
        }
        .frame(width: 185)
    }
}

struct BarViewCell_Previews: PreviewProvider {
    static var previews: some View {
        GroupBox{
            BarViewCell(tile: sampleBar)
            BarViewCell(tile: sampleBar )
        }
    }
}
