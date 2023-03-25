

import SwiftUI

struct BreedRow: View {
    let breed: Breed
    let imageSize: CGFloat = 120
    
    var body: some View {
        HStack (spacing: 20){
            
            
            if breed.image?.url != nil {
                AsyncImage (url: URL(string: breed.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill ()
                            .frame (width: imageSize, height: imageSize)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                        
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                            .frame (width: imageSize, height: imageSize)
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                        
                    } else {
                        ProgressView()
                            .frame (width: imageSize, height: imageSize)
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                    }
                }
            } else {
                Color.gray.frame(width: imageSize, height: imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            
            
            
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name)
                    .font(.headline)
                    .foregroundColor(.green)
                    .fontWeight(.bold)
                Text(breed.temperament)
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
