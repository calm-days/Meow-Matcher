import SwiftUI

/// A view that displays a list of cat breeds, showing a loading or error view when necessary.
struct ContentView: View {
    @StateObject var breedFetcher = BreedFetcher()
    
    var body: some View {
        mainContent
    }
    
    @ViewBuilder private var mainContent: some View {
        if breedFetcher.isLoading {
            LoadingView()
        } else if breedFetcher.errorMessage != nil {
            ErrorView(breedFetcher: breedFetcher)
        } else {
            BreedListView(breeds: breedFetcher.breeds)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
