//
//  LoginPage.swift
//  GenerateLocation
//
//  Created by frimpongOpokuAgyemang on 06/01/2021.
//

import SwiftUI

struct LoginPage: View {
	
	@StateObject var viewModel : AuthViewModel = AuthViewModel()
	var body: some View {
		VStack{
			Rectangle()
				.frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
				.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
				.overlay(
					Text("KalaBule")
						.font(.system(size:50))
						.foregroundColor(.white)
						.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
				)
			Spacer()
				.frame(height:30)
			VStack(alignment:.leading){
				Toggle(viewModel.mode, isOn: $viewModel.regMode)
				if(viewModel.hasError){
					Text(viewModel.error)
						.frame(maxWidth:.infinity)
						.font(.caption)
						.foregroundColor(Color("error-text"))
						.padding()
						.background(Color("error-red"))
						.cornerRadius(5)
				}
				
				if(viewModel.regMode){
					Text("Enter Email").font(.caption).foregroundColor(.secondary)
					TextField("Email...", text: $viewModel.email)
						.textFieldStyle(RoundedBorderTextFieldStyle())
					Text("Enter Password").font(.caption).foregroundColor(.secondary)
					SecureField("Password...", text: $viewModel.password)
						.textFieldStyle(RoundedBorderTextFieldStyle())
					
					
					Button(action:{
						viewModel.registerWithEmailAndPassword()
					}){
						Text("REGISTER")
							.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
							.frame(maxWidth:.infinity)
							.padding(15)
							.background(Color.green)
							.foregroundColor(.white)
							.cornerRadius(6)
					}
				}else{
					Text("Enter Email").font(.caption).foregroundColor(.secondary)
					TextField("Email...", text: $viewModel.email)
						.textFieldStyle(RoundedBorderTextFieldStyle())
					Text("Enter Password").font(.caption).foregroundColor(.secondary)
					SecureField("Password...", text: $viewModel.password)
						.textFieldStyle(RoundedBorderTextFieldStyle())
					
					
					Button(action:{
						viewModel.authenticate()
					}){
						Text("LOGIN")
							.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
							.frame(maxWidth:.infinity)
							.padding(15)
							.background(Color.blue)
							.foregroundColor(.white)
							.cornerRadius(6)
					}
				}
			}.padding()
			Spacer()
			
		}.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
	}
}

struct LoginPage_Previews: PreviewProvider {
	static var previews: some View {
		LoginPage()
	}
}
