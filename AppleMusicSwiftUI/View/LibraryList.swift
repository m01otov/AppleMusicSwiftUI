//
//  LibraryList.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 06.12.2021.
//

import SwiftUI

struct LibraryList: View {

    //Для идентификации типов, интерфейсов и других элементов
    @State private var multiSelection = Set<UUID>()

    var body: some View {
        List(selection: $multiSelection) {
            ForEach(libraryList, id: \.self) { library in
                LibraryCell(library: library)
        }
            .onMove(perform: { _,_ in })
        }
    }
}

struct LibraryList_Previews: PreviewProvider {
    static var previews: some View {
        LibraryList()
    }
}
