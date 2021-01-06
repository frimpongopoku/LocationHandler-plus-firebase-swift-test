
import Foundation
import Firebase
class AuthViewModel : ObservableObject {
		
	@Published var mode : String = "Login Mode" 
	@Published var email : String = ""
	@Published var password : String  = ""
	@Published var hasError = false
	@Published var error = ""
	@Published var regMode = false
	{
		didSet{
			if(regMode){
				self.mode = "Registration Mode"
			}else{
				self.mode = "Login Mode"
			}
		}
	}
	
	
	func authenticate(){
		Auth.auth().signIn(withEmail: self.email, password: self.password) { [weak self] response, error in
			guard error == nil  else {
				self!.hasError = true
				self!.error = error?.localizedDescription ?? "An error occured"
				print (error?.localizedDescription ?? "Something happened here bro")
				return
			}
			print("Successfully signed in bro! ")
			print("Je suis le response ----> \(String(describing: response.currentUser()))")
			
		}
	
	}
	
	func registerWithEmailAndPassword(){
		Auth.auth().createUser(withEmail: email, password: password) { [weak self] (response, error) in
		
			guard error == nil  else {
				self!.hasError = true
				self!.error = error?.localizedDescription ?? "An error occured"
				print (error?.localizedDescription ?? "Something happened here bro")
				return
			}
			print("Successfully Created User in bro! ")
			print("Je suis register  le response ----> \(String(describing: response))")
			
		}
	
	}
	
}
