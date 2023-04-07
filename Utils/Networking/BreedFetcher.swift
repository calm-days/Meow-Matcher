

import Foundation

class BreedFetcher: ObservableObject {

    @Published var breeds = [Breed]()
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllBreeds()
    }
    
    func fetchAllBreeds() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://api.thecatapi.com/v1/breeds?limit=9?api_key=live_Yrty47veVOby0dmQazKqi0D6O1Ifd3PcwN6q9DVgHi8ukHtw4RgTR9SozpovY9kR")
        service.fetchBreeds(url: url) { [unowned self] result in
           
            DispatchQueue.main.async {
                 
                self.isLoading = false
                
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                case .success(let breeds):
                    self.breeds = breeds
                    
                }
            } 
        }
    }
    
    // MARK: preview helpers
    
    static func errorState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.breeds = [Breed.example1(), Breed.example2()]
        
        return fetcher
    }
}
