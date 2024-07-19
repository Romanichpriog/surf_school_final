import SwiftUI

struct CharacterListView: View {
    var characterManager: CharactersManager
    @State var response: ApiCharacterResponse?
    @State var characters: [Character] = []
    var body: some View {
        NavigationView() {
            List(characters, id: \.id) { character in CharacterTableCell(character: character)
                    .task {
                        if (character.id == characters.last?.id) {
                            if let next = response?.info.next{
                                do {
                                    self.response = try await characterManager.GetCharacters(strUrl: next)
                                    self.characters += response?.results ?? []
                                }
                                catch {
                                    print("something went wrong")
                                }
                            }
                        }
                    }
                    .background(
                        NavigationLink("", destination: CharacterDetailView(character: character).toolbarRole(.editor))
                            .opacity(0)
                    )
                    .background(Color(red: 0, green: 0, blue: 0))
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
            }
            
            .listStyle(.plain)
            
            .scrollContentBackground(.hidden)
            .background(Color(red: 0, green: 0, blue: 0))
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Rick & Morty Characters")
                    
            
        }.tint(.white)
        
            .task {
                do {
                    response = try await characterManager.GetCharacters()
                    self.characters = response?.results ?? []
                }
                catch {
                    print("something went wrong")
                }
            }
        
        .tint(.white)
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(characterManager: CharactersManager(), characters: [Character(id: 1, name: "Rick Sanchez", status: .Alive, gender: .Male, species: "Human", location: Location(name: "Earth"), episode: ["1", "2", "3"],image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), Character(id: 1, name: "Rick Sanchez", status: .Alive, gender: .Male, species: "Human", location: Location(name: "Earth"), episode: ["1", "2", "3"],image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), Character(id: 1, name: "Rick Sanchez", status: .Alive, gender: .Male, species: "Human", location: Location(name: "Earth"), episode: ["1", "2", "3"],image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), Character(id: 1, name: "Rick Sanchez", status: .Alive, gender: .Male, species: "Human", location: Location(name: "Earth"), episode: ["1", "2", "3"],image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), Character(id: 1, name: "Rick Sanchez", status: .Alive, gender: .Male, species: "Human", location: Location(name: "Earth"), episode: ["1", "2", "3"],image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")])
    }
}
