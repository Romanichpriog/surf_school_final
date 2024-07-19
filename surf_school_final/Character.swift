import Foundation
import SwiftUI


enum Gender: String, Decodable {
    case Male
    case Female
    case Genderless
    case unknown
}

enum Status: String, Decodable {
    case Alive
    case Dead
    case unknown
}


extension Gender {
    var getGenderStr: String {
        switch self {
        case .Male:
            return "Male"
        case .Female:
            return "Female"
        case .Genderless:
            return "Genderless"
        case .unknown:
            return "unknown"
        }
    }
}


extension Status {
    var statusColor: Color {
        switch self {
        case .Alive:
            return Color(red: 25/256, green: 135/256, blue: 55/256)
        case .Dead:
            return Color(red: 214/256, green: 35/256, blue: 0)
        case .unknown:
            return Color(red: 104/256, green: 104/256, blue: 116/256)
        }
    }
    
    var statuStr: String {
        switch self {
        case .Alive:
            return "Alive"
        case .Dead:
            return "Dead"
        case .unknown:
            return "Unknown"
        }
    }
}

struct Character: Decodable {
    let id: Int
    let name: String
    let status: Status
    let gender: Gender
    let species: String
    let location: Location
    let episode: [String]
    let image: String
    
    
    func getEpisodesList() -> String {
        var ans = " "
        for ep in episode{
            let splitEpisod = ep.split(separator: "/")
            ans += (splitEpisod[4] + ", ")
        }
        ans.remove(at: ans.index(before: ans.endIndex))
        ans.remove(at: ans.index(before: ans.endIndex))
        
        return ans
    }
    
}


struct Location: Decodable{
    let name: String
}

