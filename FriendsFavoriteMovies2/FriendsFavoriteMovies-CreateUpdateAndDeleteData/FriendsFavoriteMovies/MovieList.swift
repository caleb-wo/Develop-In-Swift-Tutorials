import SwiftUI
import SwiftData

struct MovieList: View {
    @Query(sort: \Movie.title) private var movies: [Movie]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) { movie in
                    NavigationLink(movie.title) {
                        MovieDetail(movie: movie)
                    }
                }
                .onDelete(perform: deleteMovie(indexes:))
            }
            .navigationTitle("Movies")
            .toolbar{
                ToolbarItem{
                    Button("Add Movie",
                           systemImage: "plus",
                           action: addMovie)
                }
                ToolbarItem(placement: .topBarTrailing){
                    EditButton()
                }
            }
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func addMovie(){
        context.insert(Movie(title: "New Movie!",
                             releaseDate: Date()))
    }
    
    private func deleteMovie(indexes: IndexSet){
        for i in indexes{
            context.delete(movies[i])
        }
    }
    
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
