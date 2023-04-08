import SwiftUI

/// A view that displays an error message with a sad cat emoji and a "Try again" button.
struct ErrorView: View {
    @ObservedObject var breedFetcher: BreedFetcher
    private let emojiSize: CGFloat = 80
    
    var body: some View {
        VStack {
            Text("😿")
                .font(.system(size: emojiSize))            
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
