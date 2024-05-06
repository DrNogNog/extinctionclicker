import SwiftUI
import Foundation

struct ContentView: View {
    // Array of image names for the slideshow
    @State private var backgroundImages = ["One", "Two"]
    @State private var isShopViewVisible = false
    // State variable to keep track of the current index of the image array
    @State private var currentBackgroundIndex = 0
    
    @State private var counter = 0
    @State private var isExpanding = false
    @State private var isCounterExpanding = false
    
    var body: some View {
        ZStack {
            // Background image
            Image(backgroundImages[currentBackgroundIndex])
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7) // Adjust opacity if needed
            
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Text("Click Multiplier")
                            .foregroundColor(.green)
                            .bold()
                            .font(.custom("Chalkduster", size: 20))
                            .padding(.bottom, 10) // Add padding between the text
                        Text("1")
                            .foregroundColor(.green)
                            .bold()
                            .font(.custom("Chalkduster", size: 20))
                    }
                    .padding(.trailing, -100) // Adjust trailing padding for "Click Multiplier"
                    .padding(.bottom, 40) // Adjust bottom padding for "Click Multiplier"
                    
                    VStack {
                        Text("Clicks Per Second")
                            .foregroundColor(.green)
                            .bold()
                            .font(.custom("Chalkduster", size: 20))
                            .padding(.bottom, 10) // Add padding between the text
                        Text("1")
                            .foregroundColor(.green)
                            .bold()
                            .font(.custom("Chalkduster", size: 20))
                    }
                    .padding(.top, 100)
                    .padding(.leading, 80) // Adjust leading padding for "Clicks Per Second"
                    Spacer()
                }
                .padding(.top, 20) // Add padding at the top
                
                Spacer()
                
                HStack {
                    Spacer()
                    Image("Capricorn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.width * 0.33)
                        .scaleEffect(self.isExpanding ? 1.1 : 1.0) // Apply scale effect based on state
                        .onTapGesture {
                            changeBackground()
                            self.counter += 1
                            self.isExpanding = true
                            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
                                self.isExpanding = false
                            }
                            
                            // Expand and de-expand the counter text
                            self.isCounterExpanding = true
                            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
                                self.isCounterExpanding = false
                            }
                        }
                        .padding(.trailing, -50)
                        .padding(.bottom, 100)
                    Spacer()
                }
                
                VStack {
                    Text("\(counter)")
                        .font(.custom("Garamond", size: 60))
                        .foregroundColor(.brown)
                        .bold()
                        .scaleEffect(self.isCounterExpanding ? 1.1 : 1.0) // Apply scale effect based on state
                    
                    // Button to toggle ShopView visibility
                    Button(action: {
                        isShopViewVisible.toggle()
                        print(isShopViewVisible)
                    }) {
                        HStack {
                            Image(systemName: "cart")
                            Text(isShopViewVisible ? "Close Shop" : "Open Shop")
                        }
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
                Spacer()
            }
            .padding() // Add padding around the VStack
            
            // ShopView overlaid on all other views
            if isShopViewVisible {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                
                
                ShopView(isShopViewVisible: $isShopViewVisible)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.5))
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .onAppear {
            startSlideshow()
        }
    }
    
    // Function to start the slideshow
    func startSlideshow() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            self.currentBackgroundIndex = (self.currentBackgroundIndex + 1) % self.backgroundImages.count
        }
    }
    
    // Function to change background image
    func changeBackground() {
        self.currentBackgroundIndex = (self.currentBackgroundIndex + 1) % self.backgroundImages.count
        print("Background changed to \(backgroundImages[currentBackgroundIndex])")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
