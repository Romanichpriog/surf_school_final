import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    var episodeManager: EpisodeManager = EpisodeManager()
    @State var episodes = ""
    var body: some View {
        ScrollView{
            VStack() {
                VStack(alignment: .center) {
                    AsyncImage(url: URL(string: character.image)) {
                        image  in image.resizable()
                    } placeholder: {
                        Color.red
                    }
                    .frame(width: 320, height: 320)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .padding(.top, 16)
                    .padding(.bottom, 12)
                    Text(character.status.statuStr).font(Font.custom("IBMPlexSans-SemiBold", size: 16))
                        .foregroundColor(Color.white)
                        .frame(width: 320, height: 42)
                        .background(character.status.statusColor)
                        .cornerRadius(15)
                        .padding(.bottom, 24)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Species: ").font(Font.custom("IBMPlexSans-SemiBold", size: 16)) +
                        Text(character.species).font(Font.custom("IBMPlexSans-Regular", size: 16))
                        Text("Gender: ").font(Font.custom("IBMPlexSans-SemiBold", size: 16)) +
                        Text(character.gender.getGenderStr).font(Font.custom("IBMPlexSans-Regular", size: 16))
                        Text("Episodes: ").font(Font.custom("IBMPlexSans-SemiBold", size: 16)) +
                        Text(episodes).font(Font.custom("IBMPlexSans-Regular", size: 16))
                        HStack(){Text("Last known location: ").font(Font.custom("IBMPlexSans-SemiBold", size: 16)) +
                            Text(character.location.name).font(Font.custom("IBMPlexSans-Regular", size: 16))}
                        .padding(.bottom, 16)
                        
                    }
                    .frame(width: 320,
                           alignment: .leading)
                    .foregroundColor(.white)
                }
                .task {
                    do {
                        self.episodes = try await episodeManager.GetEpisodeNamesStr(episodesNumbers: self.character.getEpisodesList())
                    } catch {
                        print("Something went wrong")
                    }
                }
                .padding(.horizontal, 16)
                .background(Color(red: 21/256, green: 21/256, blue: 23/256))
                .cornerRadius(15)
                
                Spacer()
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center
            )
        }

            .navigationTitle(character.name)
            .navigationBarTitleDisplayMode(.inline)
            
            .background(.black)
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: Character(id: 1, name: "Rick Sanchez", status: .Alive, gender: .Male, species: "Human", location: Location(name: "Earth"), episode: ["1", "2", "3"],image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
    }
}
