//
//  ListBarViewCell.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 12.12.2021.
//

import SwiftUI

struct ListBarViewCell: View {
    let bar : Bar
    var body: some View {
        VStack(alignment: .leading,spacing: 8){
            HStack{
                bar.image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading){
                    Text(bar.title)
                        .font(.title3)
                }
                .padding(.leading, 6)
            }
            Divider()
                .padding(.leading,115)
    }

}

struct ListBarViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ListBarViewCell(bar:sampleBar)
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
}
