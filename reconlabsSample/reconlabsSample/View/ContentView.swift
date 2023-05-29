//
//  ContentView.swift
//  reconlabsSample
//
//  Created by 크림버드공주 on 2023/05/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
   
    @State private var action : Int? = 0
    @State private var isPresented = false

    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: ImageData.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)]) var imageData : FetchedResults<ImageData>

    @StateObject private var imageVM = ImageDataModel()
    
    var body: some View {
        let colums = [ GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
        
        NavigationView{
            VStack
            {
                Button(action: {  isPresented.toggle()
                })
                {
                    HStack{
                        Image("PhotoCameraIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30 , height: 30)
                        Text("AR Camera")
                    }
                }
                .frame(width: 250, height: 60)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(20)
                .fullScreenCover(isPresented: $isPresented, content: MyARView.init)
                
                ScrollView{
                    LazyVGrid(columns: colums)
                    {
                        ForEach(imageVM.data ?? [])
                        {
                            item in
                        
                            if let image = item.image
                            {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: UIScreen.screenWidth/3 , height: UIScreen.screenHeight/3)
                            }
                            
                            
                        }
                    }
                }
                
                
            }
        }.onAppear{
            imageVM.getData()
            print("APPEAR")
        }
        .onChange(of: self.isPresented)
        {
            value in
            if !value
            {
                imageVM.getData()
            }
        }
        
    }
        
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
