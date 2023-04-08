import SwiftUI

struct FAQView: View {
    @State private var contentOffset = CGFloat(0)
    
    var body: some View {
        ZStack(alignment: .top) {
            
            // Using TrackableScrollView to track scrolling offset
            TrackableScrollView(offsetChanged: { offsetPoint in
                contentOffset = offsetPoint.y
            }) { content }
            
            VisualEffectBlur (blurStyle: .systemMaterial)
                // Using ternary operator for better readability
                .opacity(contentOffset < -16 ? 1 : 0)
                .animation (.easeIn)
                .ignoresSafeArea ()
                .frame (height: 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("FAQ")
    }
}

var content: some View {
    VStack(alignment: .leading, spacing: 16.0) {
        ForEach(faqData, id: \.id) { faq in
            FAQRow(faq: faq)
        }
        Text("Have any question?")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.subheadline)
            .opacity(0.7)
        Link(destination: URL(string: "mailto:r.liukevich@gmail.com")!, label: {
            PrimaryButton()
                .padding(.top, 16)
        })
    }
    .padding(.horizontal, 20)
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
