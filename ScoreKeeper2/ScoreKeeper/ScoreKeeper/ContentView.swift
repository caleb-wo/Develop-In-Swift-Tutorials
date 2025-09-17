import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    @State var startingPoints = 0

    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            SettingsView(startingPoints: $startingPoints,
                         doesHighestScoreWin: $scoreboard.doesHighScoreWin)
            .disabled(scoreboard.state != .setup)

            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                        .opacity(scoreboard.state == .setup ? 0 : 1)
                }
                .font(.headline)

                ForEach($scoreboard.players) { $player in
                    GridRow {
                        HStack {
                            if scoreboard.winners.contains(player){
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(.yellow)
                            }
                            TextField("Name", text: $player.name)
                        }
                        Text("\(player.score)")
                            .opacity(scoreboard.state == .setup ? 0 : 1)
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                            .opacity(scoreboard.state == .setup ? 0 : 1)
                    }
                }
            }
            .padding(.vertical)

            Button("Add Player", systemImage: "plus") {
                scoreboard.players.append(Player(name: "", score: 0))
            }.opacity(scoreboard.state != .setup ? 0 : 1)

            Spacer()
            
            
            HStack{
                Spacer()
                switch scoreboard.state {
                    case .setup:
                        Button("Start Game", systemImage: "play.fill"){
                            scoreboard.state = .playing
                            scoreboard.resetScores(to: startingPoints)
                        }
                    case .playing:
                        Button("End Game", systemImage: "stop.fill"){
                            scoreboard.state = .gameOver
                        }
                    case .gameOver:
                        Button("Reset Game", systemImage: "arrow.counterclockwise"){
                            scoreboard.state = .setup
                        }
                }
                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
