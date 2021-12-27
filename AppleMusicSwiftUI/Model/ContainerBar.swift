//
//  ContainerBar.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 22.12.2021.
//

import SwiftUI
import Combine

class ContainerBar : ObservableObject {

    private var bars = [Bar]()
    var filterBars = [Bar]()

    var publisher: AnyCancellable?
    @Published var searchText = ""

    init() {

        getOwnData()
        publisher = $searchText
            .receive(on: RunLoop.main)
            .sink(receiveValue: { txt in
                if !self.searchText.isEmpty {
                    self.filterBars = self.bars.filter { $0.title.localizedCaseInsensitiveContains(txt) }
                } else {
                    self.filterBars = self.bars
                }
            })
    }

    func getOwnData() {
        bars = radioStationList
        filterBars = bars
    }

    func getAppleMusicData() {
        bars = appleMusicNewYear + appleMusicHipHop
        filterBars = bars
    }
}
