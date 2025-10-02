import SwiftUI
import SwiftData

struct MovieList: View {
    @Query(sort: \Movie.title) private var movies: [Movie]
    @Environment(\.modelContext) private var context
    @State private var newMovie: Movie?
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) { movie in
                    NavigationLink(movie.title) {
                        MovieDetail(movie)
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
            .sheet(item: $newMovie){ movie in
                NavigationStack{
                    MovieDetail(movie, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func addMovie(){
        let newMovie = Movie(title: "", releaseDate: Date())
        context.insert(newMovie)
        self.newMovie = newMovie
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
