//
//  SearchView.swift.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 22.12.2021.
//

import SwiftUI

let columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
]

struct SearchView_swift: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading) {
                    Divider()

                    Text("Поиск по категориям")
                        .font(.title2)
                        .bold()
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(searchList, id: \.self){
                            category in SearchViewCell(searchCategory: category)
                        }
                    }
                    Spacer(minLength: 70)
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("Поиск")
        }
    }
}

struct SearchView_swift_Previews: PreviewProvider {
    static var previews: some View {
        SearchView_swift()
    }
}
