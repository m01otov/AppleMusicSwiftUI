//
//  Player.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 06.12.2021.
//

import SwiftUI

struct Player: View {
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image ("atl.png")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55 )
                    .cornerRadius(15)
                Text ("ATL")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer (minLength: 0)

                Button (action:{}, label: {
                    Image(systemName: "play.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
                Button (action:{}, label: {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
            }
            .padding(.horizontal)
        }
        .frame(height: 80)
        .background(.white)
        .offset(y: -48)
        .shadow(radius: 10)
    }
}

struct Player_Previews: PreviewProvider {
    static var previews: some View {
        Player()
    }
}
