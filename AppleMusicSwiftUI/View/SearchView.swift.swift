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

    @ObservedObject var barSearchList = ContainerBar()

    @State private var searchPlaceholder: String = "Ваша медиатека"

    @State private var selectedSearch = 1

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
            .searchable(text: $barSearchList.searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: self.$searchPlaceholder.wrappedValue) {
                VStack(alignment: .leading, spacing: 15){
                    Picker("SearchSource", selection: $selectedSearch) {
                        Text("Apple Music").tag(0)
                        Text("Ваша медиатека").tag(1)
                    }
                    .onChange(of: selectedSearch) { tag in
                        if tag == 0 {
                            barSearchList.getAppleMusicData()
                            searchPlaceholder = "Артисты, песни, тексты и др."
                        } else {
                            barSearchList.getOwnData()
                            searchPlaceholder = "Ваша медиатека"
                        }
                    }
                    .pickerStyle(.segmented)
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible())], alignment: .leading ){
                            ForEach(barSearchList.filterBars, id: \.self) {
                                bar in ListBarViewCell(bar: bar)
                                    .searchCompletion(bar.title)
                                    .tint(.primary)
                        }
                    }
                }
            }

        }
    }
  }
}
struct SearchView_swift_Previews: PreviewProvider {
    static var previews: some View {
        SearchView_swift()
    }
}
