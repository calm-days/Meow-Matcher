import SwiftUI

/// A view that displays a row with breed information.
struct BreedRow: View {
    let breed: Breed
    let imageSize: CGFloat = 120
    
    var body: some View {
        HStack (spacing: 20){
            
            breedImageView
            
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name)
                    .font(.headline)
                    .foregroundColor(.green)
                    .fontWeight(.bold)
                Text(breed.temperament)
            }
        }
    }
    
    private var breedImageView: some View {
        Group {
            if let urlString = breed.image?.url, let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    case .failure(let error):
                        Text(error.localizedDescription)
                            .foregroundColor(Color.pink)
                            .frame(width: imageSize, height: imageSize)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    default:
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                }
            } else {
                Color.gray.frame(width: imageSize, height: imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.example1())
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
