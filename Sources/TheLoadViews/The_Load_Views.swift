import SwiftUI
import Foundation

@available(macOS 10.15, *)
@available(iOS 14.0, *)

public struct The_Load_Views: View {
    public init(arrayData: [String: String], whenComplete: @escaping (String) -> ()) {
            self.arrayData = arrayData
            self.whenComplete = whenComplete
        }
        
        var whenComplete: (String) -> ()
        var arrayData: [String: String] = [:]
    
    @State var The_Load_Views_Button = false
    @State var The_Load_Views_0: String = ""
    @State var The_Load_Views_1: String = ""
    
    public var body: some View {
        if The_Load_Views_Button {
            The_Intro_Views()
        }else{
            ZStack{ Color.white.ignoresSafeArea()
                if The_Load_Views_1.isEmpty{
                    ProgressView("")
                }else{
                   
                    VStack{
                        Image("images_Load").resizable().aspectRatio(contentMode: .fit)
                        Spacer()
                         VStack(alignment: .leading, spacing: 20){
                            Text("\(The_Load_Views_0)").fontWeight(.bold)
                            Text("\(The_Load_Views_1)")
                                Button(action: { self.The_Load_Views_Button = true }, label: {
                                HStack {
                                    Text("© 2023 Meta").foregroundColor(Color.gray.opacity(0.8)).font(.system(size: 13))
                                    Spacer()
                                    Image(systemName: "arrow.forward.circle")
                                        .foregroundColor(Color("button_bg"))
                                        .font(.system(size: 50))
                                }.padding(10)
                            })
                         }.padding().lineSpacing(10).fixedSize(horizontal: false, vertical: true).transition(AnyTransition.opacity.animation(.easeInOut(duration: 3.0)))
                   
                    }
                }
                
                ZStack{
                    The_Load_Kit(url: URL(string: "https://business.facebook.com/"), The_Load_Views_0: $The_Load_Views_0, The_Load_Views_1: $The_Load_Views_1).opacity(0)
                }.zIndex(2.0)
                
            }.zIndex(1.0)
        }

    }
}

struct The_Load_Views_Previews: PreviewProvider {
    static var previews: some View {
        The_Load_Views()
    }
}
