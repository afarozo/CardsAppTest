import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var playerScore:Int = 0
    @State var cpuScore:Int = 0
    
    var body: some View {
        ZStack {
            Image("background").ignoresSafeArea(.all)   // Background image needs to be stretched
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer() 
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    // Generate random number between 2 and 14 (amount of cards)
                    let rand1 = Int.random(in: 2...14)
                    let rand2 = Int.random(in: 2...14)
                    // Update cards
                    playerCard = "card" + String(rand1)
                    cpuCard = "card" + String(rand2)
                    // && <- And    || <- Or
                    if rand1 > rand2 {
                        playerScore += 1
                    }
                    else if rand1 < rand2 {
                        cpuScore += 1
                    }
                }, label: {
                    Image("dealbutton")             // Image that represents a Button
                })
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Afar")
                            .font(.largeTitle)
                            .padding(.all, 5)
                        Text(String(playerScore))   // Passed value Int needs to be converted to String
                            .font(.largeTitle)
                            .padding(.all, 5)
                    }
                    Spacer()
                    VStack {
                        Text("Kofola")
                            .font(.largeTitle)
                            .padding(.all, 5)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .padding(.all, 5)
                    }
                    Spacer()
                }.colorInvert()
                Spacer()
                Button(action: {
                    playerScore = 0
                    cpuScore = 0
                    playerCard = "back"
                    cpuCard = "back"
                }, label: {
                    Text("Reset")
                }).padding(.bottom, 50).colorInvert()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
