//
//  Library.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 06.12.2021.
//

import SwiftUI

struct Library:Hashable, Identifiable  {
    var id = UUID()
    var name: String

    var iconName: String
    var icon: Image {
        Image(systemName: iconName)
    }
}

var libraryList: [Library] = [
    Library(name: "Плейлисты", iconName: "music.note.list"),
    Library(name: "Артисты", iconName: "music.mic"),
    Library(name: "Альбомы", iconName: "square.stack"),
    Library(name: "Песни", iconName: "music.note"),
    Library(name: "Телешоу и фильмы", iconName: "tv"),
    Library(name: "Видеоклипы", iconName: "music.note.tv"),
    Library(name: "Жанры", iconName: "guitars"),
    Library(name: "Сборники", iconName: "person.2.crop.square.stack"),
    Library(name: "Авторы", iconName: "music.quarternote.3"),
    Library(name: "Загружено", iconName: "arrow.down.circle"),
    Library(name: "Домашняя коллекция", iconName: "music.note.house"),
]

enum Music {
    static let songName = "Танцуйте"
    static let songArtist = "ATL"
    static let songTime = 330
}
