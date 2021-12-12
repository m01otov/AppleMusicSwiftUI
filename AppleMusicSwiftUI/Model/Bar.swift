//
//  Bar.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 12.12.2021.
//

import SwiftUI

struct Bar: Hashable, Identifiable {
    var id = UUID()
    var title: String
    var subTitle: String?

    var imageName: String
    var image: Image {
        Image(imageName)
    }
}

var radioStationList: [Bar] = [

    Bar(title: "Хиты на русском", subTitle: nil, imageName: "stationRuHit"),
    Bar(title: "Чиллаут", subTitle: "Электронная медитация", imageName: "stationChill"),
    Bar(title: "Поп-музыка", subTitle: "Все топ-хиты.", imageName: "stationPop"),
    Bar(title: "Хип-хоп на русском", subTitle: nil, imageName: "stationRuHipHop"),
    Bar(title: "Классика рока", subTitle: "Гении гитарного звука.", imageName: "stationClassicRock"),
    Bar(title: "Поп на русском", subTitle: nil, imageName: "stationRuPop"),
    Bar(title: "Детские песни на русском", subTitle: nil, imageName: "stationRuChild"),
    Bar(title: "Хип-хоп", subTitle: "Идеальные биты и рифмы.", imageName: "stationHipHop"),
    Bar(title: "Рок на русском", subTitle: nil, imageName: "stationRuRock"),
    Bar(title: "Классика", subTitle: "Выдающиеся образцы жанра.", imageName: "stationClassic")
]
var sampleBar = Bar(title: "Хип-хоп",
                      subTitle: "Apple Music Хип-хоп",
                      imageName: "atl.png"
)
