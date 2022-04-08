import Foundation

class IPApi {
    public func getInfo(ipAddress: String, completion: @escaping (IP?) -> () ) {
        let url = URL(string: "https://ipapi.co/\(ipAddress)/json/")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request , completionHandler : { data, response, error in
            if let error = error {
                completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let responseIp = try JSONDecoder().decode(IP.self, from: data)
                    completion(responseIp)
                } catch let error {
                    print(error)
                    completion(nil)
                }
            }
        })
        task.resume()
    }
}
