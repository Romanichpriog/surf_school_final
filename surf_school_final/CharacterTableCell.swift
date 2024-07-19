import SwiftUI

struct CharacterTableCell: View {
    let character: Character
    var body: some View {
        VStack(alignment: .center){
            HStack() {
                AsyncImage(url: URL(string: character.image)) {
                    image  in image.resizable()
                } placeholder: {
                    Color.red.opacity(0)
                }
                .frame(width: 84, height: 64)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .padding(16)
                VStack(alignment: .leading, spacing: 6) {
                    Text(character.name).font(Font.custom("IBMPlexSans-Medium", size: 18))
                    Group {
                        Text(character.status.statuStr).foregroundColor(character.status.statusColor) +
                        Text(" • " + character.species)
                    }.font(Font.custom("IBMPlexSans-SemiBold", size: 12))
                    Text(character.gender.getGenderStr).font(Font.custom("IBMPlexSans-Regular", size: 12))
                }
                .foregroundColor(Color.white)
                Spacer()
                
            }
           
            
        }
        .background(Color(red: 21/256, green: 21/256, blue: 23/256))
        .cornerRadius(10)
        .padding(.horizontal, 20)
        .padding(.vertical, 4)
    }
}

struct CharacterTableCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterTableCell(character: Character(id: 1, name: "Rick Sanchez", status: .Alive, gender: .Male, species: "Human", location: Location(name: "Earth"), episode: ["1", "2", "3"],image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
    }
}
