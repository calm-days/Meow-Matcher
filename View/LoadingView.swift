import SwiftUI

/// A view that displays a loading indicator with a cute cat emoji and a progress indicator.
struct LoadingView: View {
    private let emojiSize: CGFloat = 40
    
    var body: some View {
        VStack {
            Text("😸")
                .font(.system(size: emojiSize))
            ProgressView()
            Text("Getting the cats...")
                .foregroundColor(.gray)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
