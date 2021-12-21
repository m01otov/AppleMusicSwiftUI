//
//  SearchCategory.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 20.12.2021.
//

import SwiftUI

struct SearchCategory: Hashable, Identifiable {
    var id = UUID()
    var title: String
    var favoriteList = [Favorite]()
    var playList = [Bar]()

    var imageName: String
    var image: Image {
        Image(imageName)
    }

}

var searchList: [SearchCategory] = [
    SearchCategory( title: "Новый Год", favoriteList: searchFavoriteListHipHop, playList: appleMusicNewYear, imageName: "searchNY"),
    SearchCategory( title: "Поп на русском", favoriteList: searchFavoriteListHipHop, playList: appleMusicNewYear, imageName: "searchRuPop"),
    SearchCategory( title: "Хип-Хоп", favoriteList: searchFavoriteListHipHop, playList: appleMusicNewYear, imageName: "searchHipHop"),
    SearchCategory( title: "Альтернатива", favoriteList: searchFavoriteListHipHop, playList: appleMusicNewYear, imageName: "searchAlternative"),
    SearchCategory( title: "Пространственное звучание", favoriteList: searchFavoriteListHipHop, playList: appleMusicNewYear, imageName: "searchSpace"),
    SearchCategory( title: "Хип-хоп на русском", favoriteList: searchFavoriteListHipHop, playList: appleMusicNewYear, imageName: "searchRuHipHop"),
    SearchCategory( title: "Хиты", favoriteList: searchFavoriteListHipHop, playList: appleMusicNewYear, imageName: "searchHit"),
    SearchCategory( title: "Хорошее настроение", favoriteList: searchFavoriteListHipHop, playList: appleMusicNewYear, imageName: "searchGood"),
    SearchCategory( title: "Хиты на русском", favoriteList: searchFavoriteListHipHop, playList: appleMusicNewYear, imageName: "searchRuHit"),
    SearchCategory( title: "Рок на русском", favoriteList: searchFavoriteListHipHop, playList: appleMusicNewYear, imageName: "searchRuRock"),
    SearchCategory( title: "Чарты", favoriteList: searchFavoriteListHipHop, playList: appleMusicNewYear, imageName: "searchCharts"),
    SearchCategory( title: "DJ-миксы", favoriteList: searchFavoriteListHipHop, playList: appleMusicNewYear, imageName: "searchDJmix")
]

var sampleSearchCategory = SearchCategory( title: "Хип-Хоп", favoriteList: searchFavoriteListHipHop, playList: appleMusicNewYear, imageName:"searchHipHop")
