import SwiftUI

/// A view that displays an error message with a sad cat emoji and a "Try again" button.
struct ErrorView: View {
    @ObservedObject var breedFetcher: BreedFetcher
    
    var body: some View {
        VStack {
            Text("😿")
                .font(.system(size: 80))            
            Text(breedFetcher.errorMessage ?? "")
            Button {
                breedFetcher.fetchAllBreeds()
            } label: {
                Text("Try again")
            }
        } 
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedFetcher: BreedFetcher())
    }
}
