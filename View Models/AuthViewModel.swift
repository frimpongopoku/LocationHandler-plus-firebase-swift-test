
import Foundation
import Firebase
class AuthViewModel : ObservableObject {
		
	@Published var mode = "Registration Mode"
	@Published var email : String = ""
	@Published var password : String  = ""
	@Published var hasError = false
	@Published var error = ""
	@Published var regMode = false
//	{
//		didSet{
//			if(regMode){
//				self.mode = "LoginMode"
//			}else{
//				self.mode = "Login"
//			}
//		}
//	}
	
	
	func authenticate(){
		Auth.auth().signIn(withEmail: self.email, password: self.password) { [weak self] response, error in
			guard error == nil  else {
				self!.hasError = true
				self!.error = error?.localizedDescription ?? "An error occured"
				print (error?.localizedDescription ?? "Something happened here bro")
				return
			}
			print("Successfully signed in bro! ")
			print("Je suis le response ----> \(String(describing: response))")
			
		}
	
	}
	
}
