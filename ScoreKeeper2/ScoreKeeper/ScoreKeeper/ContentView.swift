import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    @State var startingPoints = 0
    @State var roundCount = 0

    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            SettingsView(startingPoints: $startingPoints,
                         doesHighestScoreWin: $scoreboard.doesHighScoreWin,
                         roundCount: $roundCount)
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
            
            VStack {
                if roundCount != 0 && scoreboard.state == .playing{
                    HStack{
                        Text("Remaing Rounds: \(roundCount)")
                            .padding()
                            .foregroundStyle(.white)
                            .background(.tint, in: RoundedRectangle(cornerRadius: 10))
                            .font(.title2)
                    }
                }
                HStack{
                    switch scoreboard.state {
                        case .setup:
                            Spacer()
                            Button("Start Game", systemImage: "play.fill"){
                                scoreboard.state = .playing
                                scoreboard.resetScores(to: startingPoints)
                            }
                            Spacer()
                        case .playing:
                            if roundCount == 0 {
                                Spacer()
                                Button("End Game", systemImage: "stop.fill"){
                                    scoreboard.state = .gameOver
                                }
                                Spacer()
                            } else {
                                Button("End Game", systemImage: "stop.fill"){
                                    scoreboard.state = .gameOver
                                }
                                Spacer()
                                Button("Next Round", systemImage: "arrowshape.right.fill"){
                                    roundCount -= 1
                                    if roundCount == 0 {
                                        scoreboard.state = .gameOver
                                    }
                                }
                            }
                        case .gameOver:
                            Spacer()
                            Button("Reset Game", systemImage: "arrow.counterclockwise"){
                                scoreboard.state = .setup
                            }
                            Spacer()
                    }
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .tint(.blue)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
