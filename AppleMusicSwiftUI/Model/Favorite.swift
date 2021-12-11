//
//  Favorite.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 11.12.2021.
//

import SwiftUI

struct Favorite: Hashable, Identifiable {

    var id = UUID()
    var category: String
    var title: String
    var subTitle: String?

    var imageName: String
    var image: Image {
        Image(imageName)
    }
}

var radioFavoriteList: [Favorite] = [

    Favorite(category: "Избранная радиостанция", title: "Хип-хоп на русском",subTitle: nil, imageName: "radioRusHipHop"),
    Favorite(category: "Избранная радиостанция", title: "Хиты на русском", subTitle: nil, imageName: "radioRusHit"),
    Favorite(category: "Избранная радиостанция", title: "Чиллаут", subTitle: "Электронная медитация.", imageName: "radioChill"),
    Favorite(category: "Избранная радиостанция", title: "Хип-хоп", subTitle: "Идеальные биты и рифмы.", imageName: "radioHipHop"),
    Favorite(category: "Избранная радиостанция", title: "Поп-музыка", subTitle: "Все топ-хиты.", imageName: "radioPop"),
    Favorite(category: "Избранная радиостанция", title: "Танцевальная музыка", subTitle: "Современные и будущие хиты.", imageName: "radioDance"),
    Favorite(category: "Избранная радиостанция", title: "Хиты", subTitle: "То, что слушаю прямо сейчас.", imageName: "radioHit")
]


var sampleFavorite = Favorite(category: "Только в Apple Music",
                              title: "Поп-звезда делится своей версией новогодней песни",
                              subTitle: nil,
                              imageName: "favoritePOP"
)
