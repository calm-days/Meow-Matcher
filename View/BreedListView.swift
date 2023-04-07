

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    @State private var searchText = ""
    let gradient = LinearGradient(gradient: Gradient(colors: [.green, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    @State private var showingSheet = false
    
    
    var filteredBreeds: [Breed] {
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
            
            //.navigationTitle("Meow Matcher")
            .searchable(text: $searchText)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Meow Matcher")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundStyle(gradient)
                        //.padding(30)
                        
                    }
                    
                }
                
            }
            
            
            .preferredColorScheme(.dark)
            .accentColor(.purple)
            .toolbar {
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "info.circle")
                        .foregroundColor(.purple)
                }
            }
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
