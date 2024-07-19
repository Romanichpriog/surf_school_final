import Foundation



class EpisodeManager {
    func GetEpisodeNamesStr(episodesNumbers: String) async throws -> String {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {fatalError("Wrong url")}
        let appended = url.appendingPathComponent(episodesNumbers)
        let urlRequest = URLRequest(url: appended)
        let (data, res) = try await URLSession.shared.data(for: urlRequest)
        guard (res as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Bed Response")}
        let decodedData = try JSONDecoder().decode([episode].self, from: data)
        print(decodedData.count)
        var ans = ""
        for ep in decodedData {
            ans += ep.name + ", "
        }
        ans.remove(at: ans.index(before: ans.endIndex))
        ans.remove(at: ans.index(before: ans.endIndex))
        return ans
    }
    
}




struct episode: Decodable{
    let name: String
}
