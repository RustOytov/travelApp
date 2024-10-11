import Foundation

struct Mountain: Decodable {
    let name: String
    let location: String
    let mountain_img: String
    let altitude: String
    let country_flag_img: String
    let description: String
}

class MountApi {
    var mountainsRes: [Mountain] = []
    
    func fetchMountains(completion: @escaping () -> Void) {
        let headers = [
            "x-rapidapi-key": "08b597a7c0msh506ad2ea79c7bc0p1c6313jsn6b1a6087ab57",
            "x-rapidapi-host": "mountain-api1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://mountain-api1.p.rapidapi.com/api/mountains/")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            do {
                let decoder = JSONDecoder()
                
                self.mountainsRes = try decoder.decode([Mountain].self, from: data)
                
                DispatchQueue.main.async {
                    completion()
                }
            } catch {
                print("Error parsing data: \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
