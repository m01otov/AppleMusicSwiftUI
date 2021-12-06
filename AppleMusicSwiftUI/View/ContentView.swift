//
//  ContentView.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 06.12.2021.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView {
                LibraryView()
                    .tabItem{
                        Label("Медиатека", systemImage: "square.stack.fill")
                }
                Text("Здесь появится купленная вами музыка")

                        .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Радио")
                }
                Text("Здесь появится купленная вами музыка")

                        .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Поиск")
                        .foregroundColor(.red)
                }
            }
            .accentColor(.red)
            Player()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
