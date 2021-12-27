//
//  MiniPlayer.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 27.12.2021.
//

import SwiftUI

struct MiniPlayerView: View {

    @Binding var isDeployed: Bool

    @State var songTimePosition: Int = 74

    @State private var volume = 75.0
    @State private var isPlaying = false

    @State var dragOffset = CGSize.zero

    let imageMaxWidth = UIScreen.main.bounds.width - 45
    let imageMinWidth = UIScreen.main.bounds.width - 145

    var body: some View {

        VStack {

            if isDeployed { Spacer() }

            HStack(spacing: 0) {

                if isDeployed { Spacer() }

                Image("atl.png")
                    .resizable()
                    .scaledToFill()
                    .frame(width: isDeployed ? (isPlaying ? imageMaxWidth : imageMinWidth) :  Metric.albumCoverHeight,
                           height: isDeployed ? (isPlaying ? imageMaxWidth : imageMinWidth) : Metric.albumCoverHeight
                    )
                    .cornerRadius(isDeployed ? Metric.albumCoverCornerRadiusExpand :  Metric.albumCoverCornerRadius)
                    .shadow(radius: isPlaying ? Metric.albumCoverShadowPlaying : Metric.albumCoverShadow)
                    .animation(.easeInOut, value: isPlaying)

                if !isDeployed {
                    Text(Music.songName)
                        .foregroundColor(.primary)
                        .padding(.leading, Metric.miniPlayerPaddingH)
                }

                Spacer()

                // Button in mini player:
                if !isDeployed {
                    Button(action: {}) {
                        Image(systemName: "play.fill")
                            .frame(width: Metric.miniPlayerMediaButtonHeight,
                                   height: Metric.miniPlayerMediaButtonHeight
                            )
                    }
                    .tint(Color(uiColor: .label))

                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                            .frame(width: Metric.miniPlayerMediaButtonHeight,
                                   height: Metric.miniPlayerMediaButtonHeight
                            )
                    }
                    .tint(Color(uiColor: .label))
                }
            }
            .padding(.horizontal, Metric.miniPlayerPaddingH)

            if isDeployed {
                Spacer()

                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(Music.songName)
                                .foregroundColor(.primary)
                                .font(.title2)
                                .bold()

                            Text(Music.songArtist)
                                .foregroundColor(.secondary)
                                .font(.title2)
                        }

                        Spacer()

                        Menu {
                            Button(role: .destructive) {
                            } label: {
                                Label("Удалить...", systemImage: "trash")
                            }

                            Divider()

                            Button {
                            } label: {
                                Label("Добавить в плейлист...", systemImage: "text.badge.plus")
                            }
                        } label: {
                            Circle()
                                .frame(width: 28, height: 28)
                                .foregroundColor(Color(uiColor: UIColor(white: 0.9, alpha: 0.05)))
                                .overlay {
                                    Image(systemName: "ellipsis")
                                }
                        }
                        .tint(.secondary)
                    }

                    //Need slider

                    //Buttons Player:

                    HStack(spacing: 55) {
                        Button {
                        } label: {
                            Image(systemName: "backward.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: Metric.playerButtonHeight)
                        }
                        .tint(Color(uiColor: .label))
                        .disabled(true)

                        Button {
                            isPlaying.toggle()
                        } label: {
                            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: Metric.playerButtonPlayHeight,
                                       height: Metric.playerButtonPlayHeight
                                )
                        }
                        .tint(Color(uiColor: .label))

                        Button {
                        } label: {
                            Image(systemName: "forward.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: Metric.playerButtonHeight)
                        }
                        .tint(Color(uiColor: .label))
                    }
                    .padding(.vertical, 50)

                    // Volume slider:
                    Slider(value: $volume, in: 0...100, step: 5) {
                        Text("Speed")
                    } minimumValueLabel: {
                        Image(systemName: "speaker.fill")
                    } maximumValueLabel: {
                        Image(systemName: "speaker.wave.2.fill")
                    } onEditingChanged: { _ in }
                    .tint(.white.opacity(0.6))

                    // Share buttons:
                    HStack(spacing: 80) {
                        Button {
                        } label: {
                            Image(systemName: "quote.bubble")
                                .frame(height: Metric.shareIconHeight)
                                .tint(.primary)
                        }

                        Button {
                        } label: {
                            Image(systemName: "airplayaudio")
                                .frame(height: Metric.shareIconHeight)
                                .tint(.primary)
                        }

                        Button {
                        } label: {
                            Image(systemName: "list.bullet")
                                .frame(height: Metric.shareIconHeight)
                                .tint(.primary)
                        }
                    }
                    .padding(.vertical, 40)
                }
                .padding(.horizontal, Metric.playerPaddingHorizontal)
            }
        }
        .frame(maxHeight: isDeployed ? .infinity : Metric.miniPlayerHeight)
        .background(
            VStack(spacing: 0) {
                ZStack {
                    if isDeployed {
                        Color(uiColor: .secondarySystemBackground)

                        Image("album_cover")
                            .resizable()
                            .scaledToFill()
                            .blur(radius: 100)
                    } else {
                        Rectangle()
                            .fill(.clear)
                            .background(.regularMaterial)
                    }
                }
                if !isDeployed { Divider() }
            }
            .onTapGesture {
                if !isDeployed { isDeployed.toggle() }
            }
        )
        .ignoresSafeArea()
        .safeAreaInset(edge: .top, spacing: 0) {
            if isDeployed {
                Capsule()
                    .foregroundColor(Color(uiColor: UIColor(white: 0.9, alpha: 0.05)))
                    .frame(width: 36, height: 5)
            }
        }
        .animation(.linear(duration: 0.1), value: isDeployed)
        .offset(y: dragOffset.height)
        .gesture(
            DragGesture(minimumDistance: 3, coordinateSpace: .local)
                .onEnded { value in
                    if value.translation.height > 0 && value.translation.width < 100 && value.translation.width > -100 {
                        dragOffset = .zero
                        isDeployed = false
                    }
                }
                .onChanged { value in
                    dragOffset = value.translation
                }
        )
    }
}

struct MiniPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MiniPlayerView(isDeployed: .constant(false))
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 400, height: 100))
            MiniPlayerView(isDeployed: .constant(true))
                .preferredColorScheme(.dark)
        }
    }
}

extension MiniPlayerView {
    enum Metric {
        static let albumCoverHeight: CGFloat = 45
        static let albumCoverCornerRadius: CGFloat = 8
        static let albumCoverCornerRadiusExpand: CGFloat = 15
        static let albumCoverShadow: CGFloat = 4
        static let albumCoverShadowPlaying: CGFloat = 16
        static let miniPlayerHeight: CGFloat =  64
        static let miniPlayerMediaButtonHeight: CGFloat = 36
        static let miniPlayerPaddingH: CGFloat = 16
        static let miniPlayerPaddingV: CGFloat = 10
        static let playerButtonHeight: CGFloat = 23
        static let playerButtonPlayHeight: CGFloat = 40
        static let playerPaddingHorizontal: CGFloat = 32
        static let shareIconHeight: CGFloat = 30
    }
}
