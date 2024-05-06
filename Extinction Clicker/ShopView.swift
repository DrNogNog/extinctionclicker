import SwiftUI

struct ShopView: View {
    @Binding var isShopViewVisible: Bool // Binding to control the visibility of ShopView
    
    let extinctAnimals = [
        "Baiji dolphin",
        "Pyrenean ibex",
        "Western black rhinoceros",
        "Pinta Island tortoise",
        "Japanese river otter",
        "Yangtze giant softshell turtle",
        "Spix's macaw",
        "Bramble Cay melomys",
        "Caribbean monk seal",
        "Guam flycatcher",
        "Tasmanian tiger",
        "Passenger pigeon",
        "Quagga",
        "Great auk",
        "Dusky seaside sparrow",
        "Tecopa pupfish",
        "Formosan clouded leopard",
        "Javan tiger",
        "Thylacine",
        "Golden toad"
    ]
    let numbers: [Double: String] = [
        1.0: "persecond",
        2.5: "multiplier",
        6.25: "multiplier",
        15.63: "persecond",
        39.06: "multiplier",
        97.66: "multiplier",
        244.14: "multiplier",
        610.35: "multiplier",
        1525.88: "multiplier",
        3814.70: "multiplier",
        9536.74: "multiplier",
        149011.61: "persecond",
        372529.03: "persecond",
        8000000.0: "multiplier",
        2328306.44: "multiplier",
        14551915.23: "multiplier",
        36379788.07: "multiplier",
        100000000.0: "multiplier",
        250000000.0: "multiplier",
        625000000.0: "multiplier",
        1562500000.0: "golden" //
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Button(action: {
                        isShopViewVisible = false // Close ShopView
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black) // Change the color to black or any other color
                    }
                    .padding()

                }
                ForEach(extinctAnimals.indices, id: \.self) { index in
                    let animal = extinctAnimals[index]
                    let number = Array(numbers.keys)[index]
                    AnimalRow(name: animal, number: number)
                }
            }
            .padding()
        }
        .background(
            Image("storeBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
        )
    }
}

struct AnimalRow: View {
    let name: String
    let number: Double
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .foregroundColor(.white)
                    .font(.headline)
                Text("\(number)")
                    .foregroundColor(.white)
                    .font(.subheadline)
            }
            
            Image(name)
                .resizable()
                .frame(width: 50, height: 50)
            
            Button(action: {
                // Add action for checkout
            }) {
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .background(Color.black.opacity(0.5))
        .cornerRadius(10)
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(isShopViewVisible: .constant(true))
    }
}
