import Foundation
import Puissance4


print("Welcome the the Swissance4!\n")

var choice = -1
var game: Game
var players: [Player]

var nbR = 6
var nbC = 7
var nbP = 4
var rules: [LegacyRule] = [CheckRows(), CheckColumns(), CheckDiagonals()]
var displayer = CommandLineToolDisplayer()
var reader = Reader()

while choice != 9 {
    printMenu()
    choice = getInt()
    switch choice {
    case 1:
        players = [Human(Id: 1, Name: "Player 1", Scanner: reader), Human(Id: 2, Name: "Player 2", Scanner: reader)]
        game = Game(NumberRows: nbR, NumberColumns: nbC, NumberPieceToAlign: nbP, Players: players, Rules: rules, Displayer: displayer)!
        game.playGame()
    case 2:
        players = [Human(Id: 1, Name: "Player 1", Scanner: Reader()), AI(Id: 2, Name: "AI 1")]
        game = Game(NumberRows: nbR, NumberColumns: nbC, NumberPieceToAlign: nbP, Players: players, Rules: rules, Displayer: displayer)!
        game.playGame()
    case 3:
        players = [AI(Id: 1, Name: "AI 1"), AI(Id: 2, Name: "AI 2")]
        game = Game(NumberRows: nbR, NumberColumns: nbC, NumberPieceToAlign: nbP, Players: players, Rules: rules, Displayer: displayer)!
        game.playGame()
    case 4:
        players = [AI(Id: 1, Name: "AI 1"), AdvancedAI(Id: 2, Name: "Advanced AI 1")]
        game = Game(NumberRows: nbR, NumberColumns: nbC, NumberPieceToAlign: nbP, Players: players, Rules: rules, Displayer: displayer)!
        game.playGame()
    case 5:
        players = [AdvancedAI(Id: 1, Name: "Advanced AI 1"), AdvancedAI(Id: 2, Name: "Advanced AI 2")]
        game = Game(NumberRows: nbR, NumberColumns: nbC, NumberPieceToAlign: nbP, Players: players, Rules: rules, Displayer: displayer)!
        game.playGame()
    case 6:
        multiplayer()
        waitAndGo()
    case 7:
        editSettings()
        waitAndGo()
    case 8:
        print("\nThanks for readin this ;)")
        print("")
        print("This project was fun to drive and I hope you like it!")
        print("Made with love <3\nHandyS11")
        waitAndGo()
    default:
        print("Unknow option!")
    }
}

print("See you next time ;)")


func printMenu() {
    print("\n\n")
    print(" ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――")
    print("│                                                                │")
    print("│                        - Swissance 4 -                         │")
    print("│                                                                │")
    print("│ 1) - Classique Mode        (Human vs Human)                    │")
    print("│ 2) - Beginner Mode         (Human vs Beginner IA)              │")
    print("│ 3) - Demo Mode             (Beginner AI vs Beginner AI)        │")
    print("│ 4) - Are they smart?       (Beginner AI vs Advanced AI)        │")
    print("│ 5) - The world is ending!  (Advanced AI vs Advanced AI)        │")
    print("│ 6) - Multiplayers Mode     (Custom number of Players)          │")
    print("│                                                                │")
    print("│ 7) - Edit Settings                                             │")
    print("│ 8) - Credits                                                   │")
    print("│                                                                │")
    print("│ 9) - Leave the game                                            │")
    print("│                                                                │")
    print(" ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――")
}

func waitAndGo() {
    print("\n\nTap a key to leave")
    _ = readLine()
}

func getInt() -> Int {
    print("Choice: ")
    let choice = Int(readLine()!)
    while(choice == nil) {
        print("You should enter an integer!")
        return getInt()
    }
    return choice!
}

func editSettings() {
    var ch = -1
    while ch != 9 {
        printSettingsMenu()
        ch = getInt()
        switch ch {
        case 1:
            print("Choose a row number (it shall be >= 3, default is 6)")
            nbR = getInt()
            while nbR < 3 {
                print("This entry ins't possible!")
                nbR = getInt()
            }
        case 2:
            print("Choose a column number (it shall be >= 3, default is 7)")
            nbC = getInt()
            while nbC < 3 {
                print("This entry ins't possible!")
                nbC = getInt()
            }
        case 3:
            print("Choose a number of piece to align to win (it shall be >= 3 and match the grid size, default is 4)")
            print("The grid size is curently: \(nbR) rows & \(nbC) columns.")
            nbP = getInt()
            while nbP < 3 && (nbP <= nbC && nbP <= nbC) {
                print("This entry ins't possible!")
                nbP = getInt()
            }
        default:
            print("Unknow option!")
        }
    }
}

func printSettingsMenu() {
    
}

func multiplayer() {
    
}
