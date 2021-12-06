//
//  LibraryView.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 06.12.2021.
//

import SwiftUI


struct LibraryView: View {

    @State var isEditing = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Ищите свою музыку?")
                    .bold()
                    .font(.title3)
                    .padding(.bottom, 1)
                Text("Здесь появится купленная Вами в iTunes Store музыка.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing], 20)
            }
            .navigationTitle("Медиатека")
            .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
            .toolbar {
                ToolbarItem() {
                    Button {
                        self.isEditing.toggle()
                        } label: {
                            Text(isEditing ? "Готово" : "Править")
                                .frame(width: 80, height: 40)
                                .foregroundColor(Color.red)
                        }
                }  }
        }
        .tint(Color.accentColor)
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
