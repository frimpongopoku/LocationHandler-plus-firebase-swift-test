
//  Created by frimpongOpokuAgyemang on 05/01/2021.
//

import SwiftUI

struct ContentView: View {
	@StateObject var locationHandler = LocationManager()
    var body: some View {
//			Text("This is my location -> \(locationHandler.lastLocation?.coordinate.latitude ?? 0), \(locationHandler.lastLocation?.coordinate.longitude ?? 0)")
//            .padding()
			
			LoginPage()
					
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			
    }
}
