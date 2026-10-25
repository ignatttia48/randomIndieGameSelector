//
//  ContentView.swift
//  RandomSelector
//
//  Created by 115-1student16 on 2026/10/25.
//

import SwiftUI
import UIKit

// MARK: - Model

struct Game: Identifiable, Equatable {
    let name: String
    let nameZH: String
    let imageName: String
    let year: String
    let developers: String
    let description: String
    /// 每款遊戲的代表色，用來變換背景與按鈕
    let accent: Color

    var id: String { name }
}

// MARK: - View

struct ContentView: View {
    let games = [
        Game(
            name: "Undertale",
            nameZH: "傳說之下",
            imageName: "undertale",
            year: "2015",
            developers: "Toby Fox",
            description: "一名墜入地下世界的人類，與怪物們展開一段關於善意、選擇與命運的旅程。",
            accent: Color(hex: 0xE5484D)
        ),
        Game(
            name: "Stardew Valley",
            nameZH: "星露谷物語",
            imageName: "svalley",
            year: "2016",
            developers: "ConcernedApe",
            description: "來到鄉間繼承農場並重新建立家園，在小鎮的人情與四季流轉中尋找生活的意義。",
            accent: Color(hex: 0x3FA34D)
        ),
        Game(
            name: "Hollow Knight",
            nameZH: "空洞騎士",
            imageName: "hknight",
            year: "2017",
            developers: "Team Cherry",
            description: "一名神祕旅行者深入衰敗的地下王國，揭開埋藏於古老廢墟中的秘密。",
            accent: Color(hex: 0x4F6BED)
        ),
        Game(
            name: "Cuphead",
            nameZH: "茶杯頭",
            imageName: "cuphead",
            year: "2017",
            developers: "Studio MDHR",
            description: "與魔鬼的交易讓兄弟踏上冒險，為了償還債務，他們必須四處追討其他欠債者的靈魂契約。",
            accent: Color(hex: 0xE08A00)
        ),
        Game(
            name: "Celeste",
            nameZH: "蔚藍",
            imageName: "celeste",
            year: "2018",
            developers: "Maddy Makes Games",
            description: "一名少女決心登山，在充滿考驗的旅途中面對內心的恐懼，逐漸學會接納自己。",
            accent: Color(hex: 0xD6479B)
        ),
        Game(
            name: "Dead Cells",
            nameZH: "死亡細胞",
            imageName: "dcells",
            year: "2018",
            developers: "Motion Twin",
            description: "一名不死的囚犯在遭受瘟疫侵蝕的島嶼上甦醒，試圖揭開王國崩壞的真相與自身的謎團。",
            accent: Color(hex: 0xF0623A)
        ),
        Game(
            name: "Slay the Spire",
            nameZH: "殺戮尖塔",
            imageName: "sspire",
            year: "2019",
            developers: "Mega Crit",
            description: "冒險者們為了各自的目的挑戰神祕高塔，在層層攀升的過程中揭開尖塔深處的黑暗秘密。",
            accent: Color(hex: 0x8E5CD9)
        ),
        Game(
            name: "A Short Hike",
            nameZH: "短途旅行",
            imageName: "shike",
            year: "2019",
            developers: "adamgryu",
            description: "一隻小鳥來到山間公園度假，並在前往山頂的途中與形形色色的旅人相遇。",
            accent: Color(hex: 0x14A5A5)
        ),
    ]

    @State private var selectedGameIndex = 0
    @State private var isShuffling = false

    var body: some View {
        let game = games[selectedGameIndex]

        ZStack {
            background(for: game)

            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    header

                    gameCard(for: game)
                        .id(game.id)
                        .transition(
                            .asymmetric(
                                insertion: .scale(scale: 0.94).combined(with: .opacity),
                                removal: .opacity
                            )
                        )
                }
                .padding(.horizontal, 24)
                .padding(.top, 12)
                .padding(.bottom, 24)
            }
        }
        .safeAreaInset(edge: .bottom) {
            randomButton(for: game)
                .padding(.horizontal, 24)
                .padding(.top, 8)
                .padding(.bottom, 8)
        }
        .preferredColorScheme(.light)
    }

    // MARK: Subviews

    private var header: some View {
        VStack(spacing: 4) {
            Text("今天玩什麼？")
                .font(.system(.title, design: .rounded).weight(.heavy))
                .foregroundColor(Color(white: 0.15))
            Text("我的獨立遊戲收藏 · 共 \(games.count) 款")
                .font(.system(.footnote, design: .rounded))
                .foregroundColor(Color(white: 0.4))
        }
    }

    private func background(for game: Game) -> some View {
        LinearGradient(
            colors: [
                game.accent.opacity(0.35),
                Color(hex: 0xFFF8EE),
                game.accent.opacity(0.15),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
        .animation(.easeInOut(duration: 0.5), value: game.id)
    }

    private func gameCard(for game: Game) -> some View {
        VStack(spacing: 0) {
            // 封面：固定 3:4 比例，圖片填滿後裁切
            Color.clear
                .aspectRatio(3.0 / 4.0, contentMode: .fit)
                .overlay(
                    Image(game.imageName)
                        .resizable()
                        .scaledToFill()
                )
                .clipped()

            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(game.name)
                        .font(.system(.title, design: .rounded).weight(.bold))
                        .foregroundColor(Color(white: 0.12))
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)
                    Text(game.nameZH)
                        .font(.system(.title3, design: .rounded))
                        .foregroundColor(game.accent)
                }

                HStack(spacing: 8) {
                    chip(game.year, systemImage: "calendar", color: game.accent)
                    chip(game.developers, systemImage: "person.fill", color: game.accent)
                }

                Text(game.description)
                    .font(.system(.callout, design: .rounded))
                    .foregroundColor(Color(white: 0.3))
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        .shadow(color: game.accent.opacity(0.35), radius: 24, x: 0, y: 12)
    }

    private func chip(_ text: String, systemImage: String, color: Color) -> some View {
        Label(text, systemImage: systemImage)
            .font(.system(.footnote, design: .rounded).weight(.semibold))
            .foregroundColor(Color(white: 0.25))
            .lineLimit(1)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(color.opacity(0.15))
            .clipShape(Capsule())
    }

    private func randomButton(for game: Game) -> some View {
        Button {
            shuffle()
        } label: {
            HStack(spacing: 10) {
                Image(systemName: "dice.fill")
                    .rotationEffect(.degrees(isShuffling ? 360 : 0))
                    .animation(
                        isShuffling
                            ? .linear(duration: 0.6).repeatForever(autoreverses: false)
                            : .default,
                        value: isShuffling
                    )
                Text(isShuffling ? "抽選中…" : "隨機抽一款")
            }
            .font(.system(.title3, design: .rounded).weight(.bold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(game.accent)
            .clipShape(Capsule())
            .shadow(color: game.accent.opacity(0.45), radius: 12, x: 0, y: 6)
        }
        .disabled(isShuffling)
        .animation(.easeInOut(duration: 0.3), value: game.id)
    }

    // MARK: Logic

    /// 快速輪播幾款遊戲後停在最終結果（保證不會停在原本那一款）
    private func shuffle() {
        guard !isShuffling else { return }
        isShuffling = true

        let original = selectedGameIndex
        let feedback = UIImpactFeedbackGenerator(style: .light)
        let steps = 8

        Task { @MainActor in
            var last = original
            for step in 0..<steps {
                var next = Int.random(in: games.indices)
                while next == last || (step == steps - 1 && next == original) {
                    next = Int.random(in: games.indices)
                }
                last = next
                withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                    selectedGameIndex = next
                }
                feedback.impactOccurred()
                try? await Task.sleep(nanoseconds: 110_000_000)
            }
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            isShuffling = false
        }
    }
}

// MARK: - Helpers

extension Color {
    /// 以 0xRRGGBB 建立顏色
    init(hex: UInt32) {
        self.init(
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255
        )
    }
}

#Preview {
    ContentView()
}
