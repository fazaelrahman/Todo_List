//
//  ContentView.swift
//  Todo List Challenge
//
//  Created by Faza Elrahman on 06/04/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo : String = ""
    
    var searchBar : some View {
        HStack{
            TextField("Masukkan kegiatan baru", text: self.$newToDo)
                .padding([.top, .leading, .bottom], 7.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                
            Button(action: self.addNewTodo, label: {
                Text("Tambah")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.all, 7.0)
                    .accentColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    
            })
        }
    }
    
    func addNewTodo()  {
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1)
                                        , toDoItem: newToDo))
    //otomatis menambah id
        
        self.newToDo = ""
        //agar text didalam textfield dihapus setelah menekan tombol
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                searchBar.padding()
                List{
                    ForEach (self.taskStore.tasks){
                        task in
                        Text(task.toDoItem)
                    }.onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                    
                }
                .background(Color.black)
                .navigationBarTitle("Todo List")
                .navigationBarItems(trailing: EditButton())
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                
                
                
                
                
                
                
                
                
                
            }
            
        }
        .accentColor(.black)
        
        
    }
    
    func move(from source: IndexSet,to destination : Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets : IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
