//
//  ContentView.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 06.12.2021.
//

import SwiftUI


struct ContentView: View {
    @State var isDeployed = false

    var body: some View {



        ZStack(alignment: .bottom) {
            TabView {
                LibraryView()
                    .tabItem{
                        Label("Медиатека", systemImage: "square.stack.fill")
                }
                RadioView()

                        .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Радио")
                }
//                SearchView_swift()
                SearchViewUI()
                        .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Поиск")
                        .foregroundColor(.red)
                }
            }
            .accentColor(.red)
            MiniPlayerView(isDeployed: $isDeployed)
                .offset(y: isDeployed ? 0 : -48)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
