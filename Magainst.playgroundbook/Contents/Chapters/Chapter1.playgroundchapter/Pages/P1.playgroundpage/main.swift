//#-hidden-code
import SwiftUI
import AVFoundation
import PlaygroundSupport
//#-end-hidden-code
/*:
 **Well Done!**
 
 It seems that you have basically mastered the gameplay of this playground.
 
 >  In this page, you can set the challenge difficulty and challenge it!
 
    Challenge difficulty(1,2,3) 1 easiest， 3 most difficult
 */
var difficulty = /*#-editable-code*/2/*#-end-editable-code*/

/*:
> You can edit the following arithmetic symbols to adjust the content of arithmetic question
 */
var o = [/*#-editable-code*/ "+","-","×","÷" /*#-end-editable-code*/]
//"+","-","×","÷"(You can copy these operators)
//#-hidden-code

// Background Music
var backgroundMusic: AVAudioPlayer?
var tapMusic: AVAudioPlayer?
var correctMusic: AVAudioPlayer?
var errorMusic: AVAudioPlayer?
var victoryMusic: AVAudioPlayer?

let path = Bundle.main.path(forResource: "bgm.mp3", ofType: nil)!
let path2 = Bundle.main.path(forResource: "7571.mp3", ofType: nil)!
let path3 = Bundle.main.path(forResource: "correct.mp3", ofType: nil)!
let path4 = Bundle.main.path(forResource: "error.mp3", ofType: nil)!
let path5 = Bundle.main.path(forResource: "victory.mp3", ofType: nil)!

let url = URL(fileURLWithPath: path)
let url2 = URL(fileURLWithPath: path2)
let url3 = URL(fileURLWithPath: path3)
let url4 = URL(fileURLWithPath: path4)
let url5 = URL(fileURLWithPath: path5)

tapMusic = try AVAudioPlayer(contentsOf: url2)
tapMusic?.volume = 1

correctMusic = try AVAudioPlayer(contentsOf: url3)
correctMusic?.volume = 1

errorMusic = try AVAudioPlayer(contentsOf: url4)
errorMusic?.volume = 2

victoryMusic = try AVAudioPlayer(contentsOf: url5)
victoryMusic?.volume = 1


        do{
            backgroundMusic = try AVAudioPlayer(contentsOf: url)
            backgroundMusic?.volume = 0.2
            backgroundMusic?.play()
        }catch{
            
        }




var Number = [0,1,2,3,4,5,6,7,8,9]
var Number2 = [1,2,3,4,5,6,7,8,9]
var r = 1.0
var r2 = 2.0 * r - 2.0


var o2 = o.randomElement()!

var c = Int()
var d = Int()
var k2 = Int()



if o2 == "+"{
    c = Number.randomElement()!
    d = Number.randomElement()!
}else if o2 == "-"{
    c = Number.randomElement()!
    d = Number.randomElement()!
    while c<d {
        d = Number.randomElement()!
    }
} else if o2 == "×"{
    c = Number.randomElement()!
    d = Number.randomElement()!
} else if o2 == "÷"{
    k2 = Number.randomElement()!
    d = Number2.randomElement()!
    c = k2 * d
}
var td = Double()




if difficulty == 1{
td = 3
}else if difficulty == 2{
td = 2
}else if difficulty == 3{
td = 1
}

struct ProgressView: View {
    
    
    
    @State var key2:Int? = nil
    @State var space1 =  UIScreen.main.bounds.height - 600
    @State var space2 = 0
    @State var time = 60
    @State var drawSpacing = UIScreen.main.bounds.height + 200
    @State var timeSpacing = 0.35 * UIScreen.main.bounds.width
    @State var yoffset = 0.3 * UIScreen.main.bounds.height
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State var r = 1.0
    var n1 = 1
  
    
    
    
    
    
    let timer2 = Timer.publish(every: td, on: .main, in: .common).autoconnect()
    
    
    var body: some View{
        
        ZStack{
            
            VStack(spacing: 0){
                Circle()
                    .fill(Color(#colorLiteral(red: -0.17884957790374756, green: 0.3879967927932739, blue: 1.0338830947875977, alpha: 1.0)))
                    .frame(width: CGFloat(2.0 - r)  * UIScreen.main.bounds.height, height:CGFloat(2.0 - r) *  UIScreen.main.bounds.height)
                    .offset(y: CGFloat(r2) * 0.25 * UIScreen.main.bounds.height)
                    .onReceive(timer2){ r in
                        if self.r >= 0.6 && self.r <=  1.4{
                            withAnimation{
                                self.r -= 0.05
                            }
                        }else if self.r > 1.4{
                            withAnimation{
                                space2 = -300
                                yoffset = UIScreen.main.bounds.height + 200
                                timeSpacing = 1.1 * UIScreen.main.bounds.width
                                
                            }
                        }else{
                            withAnimation{
                                space2 = 300
                                yoffset = UIScreen.main.bounds.height + 200
                                timeSpacing = 1.1 * UIScreen.main.bounds.width
                                errorMusic?.play()
                            }
                        }
                    }
                
                Circle()
//#-end-hidden-code
                    
/*:
> You can set it to your favorite color
 */
.fill(Color(/*#-editable-code*/ #colorLiteral(red: 1.000000238418579, green: 0.25098052620887756, blue: 0.08235291391611099, alpha: 1.0) /*#-end-editable-code*/))
//#-hidden-code
                    .frame(width: CGFloat(r) * UIScreen.main.bounds.height, height: CGFloat(r) * UIScreen.main.bounds.height)
                    .offset(y: CGFloat(r2) * 0.25 * UIScreen.main.bounds.height)
                
            }
            
            HStack(spacing: timeSpacing){
                Text(String(time)+"S")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight:.bold, design:.rounded))
                    .padding(20)
                    
                
                
                Text(String(time)+"S")
                    .foregroundColor(.black)
                    .font(.system(size: 40, weight:.bold, design:.rounded))
                    .padding(20)
                
                
            }
            .onReceive(timer) { time in
                if self.time > 0 {
                    self.time -= 1
                }else{
                    outer:
                    if r > 1{
                        withAnimation{
                            r = 1.5
                            yoffset = UIScreen.main.bounds.height + 200
                            space2 = -300
                            timeSpacing = 1.1 * UIScreen.main.bounds.width
                        }
                        break outer
                    }else if r < 1{
                        withAnimation{
                            r = 0.5
                            yoffset = UIScreen.main.bounds.height + 200
                            space2 = 300
                            timeSpacing = 1.1 * UIScreen.main.bounds.width
                            errorMusic?.play()
                        }
                        break outer
                    }else{
                        withAnimation{
                            yoffset = UIScreen.main.bounds.height + 200
                            drawSpacing = UIScreen.main.bounds.height - 300
                            timeSpacing = 1.1 * UIScreen.main.bounds.width
                            errorMusic?.play()
                        }
                        
                        break outer
                    }
                    
                }
            }
            
            VStack(spacing:UIScreen.main.bounds.height + 100){
                Text("Common, try again!")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight:.bold, design:.rounded))
                   
                
                Text("Wow, you are awesome!")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight:.bold, design:.rounded))
            }
            .offset(y: CGFloat(space2))
            
            VStack(spacing:drawSpacing){
                Text("Draw")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight:.bold, design:.rounded))
                    .rotationEffect(.degrees(180))
                
                Text("Draw")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight:.bold, design:.rounded))
            }
            
            VStack(alignment: .trailing){
                
                
                VStack(spacing: 0){
                    ZStack{
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.white)
                            .frame(width: 300, height: 80)
                        
                        
                        HStack(spacing:20){
                            Text(String(c))
                                .font(.system(size: 50, weight:.bold, design:.rounded))
                                .foregroundColor(.black)
                            Text(o2)
                                .font(.system(size: 50, weight:.bold, design:.rounded))
                                .foregroundColor(.black)
                            Text(String(d))
                                .font(.system(size: 50, weight:.bold, design:.rounded))
                                .foregroundColor(.black)
                            Text("=")
                                .font(.system(size: 50, weight:.bold, design:.rounded))
                                .foregroundColor(.black)
                            if key2 == nil {
                                
                            }else{
                                Text(String(key2!))
                                    .foregroundColor(.black)
                                    .font(.system(size: 50, weight:.bold, design:.rounded))
                            }
                        }
                        .padding(10)
                        
                    }
                    
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color(#colorLiteral(red: 0.09802495688199997, green: 0.09804921597242355, blue: 0.09802179783582687, alpha: 1.0)))
                                .frame(width: 120, height: 50)
                                
                            
                            Button(action: reset2){
                                Text("Reset")
                                    .foregroundColor(.white)
                                    .font(.system(size: 35, weight:.bold, design:.rounded))
                            }
                        }
                        .offset(x: 230)
                        
                        HStack{
                            
                            ZStack{
                                Circle()
                                    .fill(Color(#colorLiteral(red: 0.09802495688199997, green: 0.09804921597242355, blue: 0.09802179783582687, alpha: 1.0)))
                                    .frame(width: 50, height: 50)
                                Button(action: typeb1){
                                    Text("1")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40, weight:.bold, design:.rounded))
                                }
                            }
                            ZStack{
                                Circle()
                                    .fill(Color(#colorLiteral(red: 0.09802495688199997, green: 0.09804921597242355, blue: 0.09802179783582687, alpha: 1.0)))
                                    .frame(width: 50, height: 50)
                                Button(action: typeb2){
                                    Text("2")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40, weight:.bold, design:.rounded))
                                }
                            }
                            ZStack{
                                Circle()
                                    .fill(Color(#colorLiteral(red: 0.09802495688199997, green: 0.09804921597242355, blue: 0.09802179783582687, alpha: 1.0)))
                                    .frame(width: 50, height: 50)
                                Button(action: typeb3){
                                    Text("3")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40, weight:.bold, design:.rounded))
                                }
                            }
                            ZStack{
                                Circle()
                                    .fill(Color(#colorLiteral(red: 0.09802495688199997, green: 0.09804921597242355, blue: 0.09802179783582687, alpha: 1.0)))
                                    .frame(width: 50, height: 50)
                                Button(action: typeb4){
                                    Text("4")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40, weight:.bold, design:.rounded))
                                }
                            }
                            ZStack{
                                Circle()
                                    .fill(Color(#colorLiteral(red: 0.09802495688199997, green: 0.09804921597242355, blue: 0.09802179783582687, alpha: 1.0)))
                                    .frame(width: 50, height: 50)
                                Button(action: typeb5){
                                    Text("5")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40, weight:.bold, design:.rounded))
                                }
                            }
                            ZStack{
                                Circle()
                                    .fill(Color(#colorLiteral(red: 0.09802495688199997, green: 0.09804921597242355, blue: 0.09802179783582687, alpha: 1.0)))
                                    .frame(width: 50, height: 50)
                                Button(action: typeb6){
                                    Text("6")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40, weight:.bold, design:.rounded))
                                }
                            }
                            ZStack{
                                Circle()
                                    .fill(Color(#colorLiteral(red: 0.09802495688199997, green: 0.09804921597242355, blue: 0.09802179783582687, alpha: 1.0)))
                                    .frame(width: 50, height: 50)
                                Button(action: typeb7){
                                    Text("7")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40, weight:.bold, design:.rounded))
                                }
                            }
                            ZStack{
                                Circle()
                                    .fill(Color(#colorLiteral(red: 0.09802495688199997, green: 0.09804921597242355, blue: 0.09802179783582687, alpha: 1.0)))
                                    .frame(width: 50, height: 50)
                                Button(action: typeb8){
                                    Text("8")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40, weight:.bold, design:.rounded))
                                }
                            }
                            ZStack{
                                Circle()
                                    .fill(Color(#colorLiteral(red: 0.09802495688199997, green: 0.09804921597242355, blue: 0.09802179783582687, alpha: 1.0)))
                                    .frame(width: 50, height: 50)
                                Button(action: typeb9){
                                    Text("9")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40, weight:.bold, design:.rounded))
                                }
                            }
                            ZStack{
                                Circle()
                                    .fill(Color(#colorLiteral(red: 0.09802495688199997, green: 0.09804921597242355, blue: 0.09802179783582687, alpha: 1.0)))
                                    .frame(width: 50, height: 50)
                                Button(action: typeb0){
                                    Text("0")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40, weight:.bold, design:.rounded))
                                }
                            }
                            
                            
                        }
                    }
                    .padding(20)
                }
                
            }
            .offset(y:yoffset)
            
        }
        
        
    }
    
    
    
    
    
    
    func change2() {
        correctMusic?.play()
        key2 = nil
        o2 = o.randomElement()!
        if o2 == "+"{
            c = Number.randomElement()!
            d = Number.randomElement()!
        }else if o2 == "-"{
            c = Number.randomElement()!
            d = Number.randomElement()!
            while c<d {
                d = Number.randomElement()!
            }
        } else if o2 == "×"{
            c = Number.randomElement()!
            d = Number.randomElement()!
        } else if o2 == "÷"{
            k2 = Number.randomElement()!
            d = Number2.randomElement()!
            c = k2 * d
        }
    }
    
    func reset2(){
        tapMusic?.play()
        key2 = nil
    }
    
    
    func typeb1(){
        if key2 == nil{
            key2 = 1
        }else if key2! < 10{
            key2 = key2!*10+1
        }else{
            errorMusic?.play()
            key2 = 1
        }
        if o2 == "+"{
            if key2 == c+d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "-"{
            if key2 == c-d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "×"{
            if key2 == c*d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        } else if o2 == "÷"{
            if key2 == k2{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }
    }
    func typeb2(){
        if key2 == nil{
            key2 = 2
        }else if key2! < 10{
            key2 = key2!*10+2
        }else{
            errorMusic?.play()
            key2 = 2
        }
        if o2 == "+"{
            if key2 == c+d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "-"{
            if key2 == c-d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "×"{
            if key2 == c*d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        } else if o2 == "÷"{
            if key2 == k2{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }
    }
    func typeb3(){
        if key2 == nil{
            key2 = 3
        }else if key2! < 10{
            key2 = key2!*10+3
        }else{
            errorMusic?.play()
            key2 = 3
        }
        if o2 == "+"{
            if key2 == c+d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "-"{
            if key2 == c-d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "×"{
            if key2 == c*d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        } else if o2 == "÷"{
            if key2 == k2{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }
    }
    func typeb4(){
        if key2 == nil{
            key2 = 4
        }else if key2! < 10{
            key2 = key2!*10+4
        }else{
            errorMusic?.play()
            key2 = 4
        }
        if o2 == "+"{
            if key2 == c+d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "-"{
            if key2 == c-d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "×"{
            if key2 == c*d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        } else if o2 == "÷"{
            if key2 == k2{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }
    }
    func typeb5(){
        if key2 == nil{
            key2 = 5
        }else if key2! < 10{
            key2 = key2!*10+5
        }else{
            errorMusic?.play()
            key2 = 5
        }
        if o2 == "+"{
            if key2 == c+d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "-"{
            if key2 == c-d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "×"{
            if key2 == c*d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        } else if o2 == "÷"{
            if key2 == k2{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }
    }
    func typeb6(){
        if key2 == nil{
            key2 = 6
        }else if key2! < 10{
            key2 = key2!*10+6
        }else{
            errorMusic?.play()
            key2 = 6
        }
        if o2 == "+"{
            if key2 == c+d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "-"{
            if key2 == c-d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "×"{
            if key2 == c*d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        } else if o2 == "÷"{
            if key2 == k2{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }
    }
    func typeb7(){
        if key2 == nil{
            key2 = 7
        }else if key2! < 10{
            key2 = key2!*10+7
        }else{
            errorMusic?.play()
            key2 = 7
        }
        if o2 == "+"{
            if key2 == c+d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "-"{
            if key2 == c-d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "×"{
            if key2 == c*d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        } else if o2 == "÷"{
            if key2 == k2{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }
    }
    func typeb8(){
        if key2 == nil{
            key2 = 8
        }else if key2! < 10{
            key2 = key2!*10+8
        }else{
            errorMusic?.play()
            key2 = 8
        }
        if o2 == "+"{
            if key2 == c+d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "-"{
            if key2 == c-d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "×"{
            if key2 == c*d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        } else if o2 == "÷"{
            if key2 == k2{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }
    }
    func typeb9(){
        if key2 == nil{
            key2 = 9
        }else if key2! < 10{
            key2 = key2!*10+9
        }else{
            errorMusic?.play()
            key2 = 9
        }
        if o2 == "+"{
            if key2 == c+d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "-"{
            if key2 == c-d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "×"{
            if key2 == c*d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        } else if o2 == "÷"{
            if key2 == k2{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }
    }
    func typeb0(){
        if key2 == nil{
            key2 = 0
        }else if key2! < 10{
            key2 = key2!*10+0
        }else{
            errorMusic?.play()
            key2 = 0
        }
        if o2 == "+"{
            if key2 == c+d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "-"{
            if key2 == c-d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }else if o2 == "×"{
            if key2 == c*d{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        } else if o2 == "÷"{
            if key2 == k2{
                change2()
                red()
            }else{
                tapMusic?.play()
            }
        }
    }
    
    
    func red() {
        withAnimation{
            self.r += 0.05
            if r > 1.4{
                space2 = -300
                yoffset = UIScreen.main.bounds.height + 200
                timeSpacing = 1.1 * UIScreen.main.bounds.width
                victoryMusic?.play()
            }
        }
    }
    
    
}

PlaygroundPage.current.setLiveView(ProgressView())

//#-end-hidden-code

//: **If you pass the challenge, you can go to the**
//: **[next page](@next)**
