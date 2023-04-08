import SwiftUI

/// A view that displays a list of cat breeds with search functionality.
struct BreedListView: View {
    let breeds: [Breed]
    
    @State private var showingSheet = false
    @State private var searchText = ""
    private let gradient = LinearGradient(gradient: Gradient(colors: [.green, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    private var filteredBreeds: [Breed] {
        if searchText.count == 0 {
            return breeds
        } else {
            return breeds.filter {
                $0.name.contains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach (filteredBreeds) { breed in
                    NavigationLink {
                        BreedDetailView(breed: breed)
                    } label: {
                        BreedRow(breed: breed)
                    }
                    
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $searchText)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Meow Matcher")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundStyle(gradient)
                }
                
                ToolbarItem {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                            .foregroundColor(.purple)
                    }
                }
            }
            .preferredColorScheme(.dark)
            .accentColor(.purple)
            .sheet(isPresented: $showingSheet) {
                VStack {
                    InfoSideView()
                }
            }
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: BreedFetcher.successState().breeds)
    }
}
