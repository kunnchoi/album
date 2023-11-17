//
//  AlbumListView.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import SwiftUI

struct AlbumListView: View {
    @EnvironmentObject var router: Router
    @StateObject var vm = AlbumListViewModel()
    
    fileprivate func listRow(_ album: Album,
                             tapped: @escaping (() -> Void)) -> some View {
        HStack{
            AsyncImage(
                url: URL(string: album.thumbnailUrl)!,
                placeholder: { Text("Loading...") },
                image: { Image(uiImage: $0).resizable() }
            )
            .frame(width: 150, height: 150 )
            Text("\(album.title)")
        }.gesture(
            TapGesture()
                .onEnded { _ in
                    tapped()
                }
        )
    }
    
    fileprivate func albumList() -> some View {
        NavigationView {
            List(vm.albums) { item in
                listRow(item, tapped: {
                    router.navigate(to: .albumDetail(album: item))
                })
            }
            .navigationTitle("Album List")
            .task {
               await vm.getAlbums()
            }
            .alert("Error", isPresented: $vm.hasError) {
            } message: {
                Text(vm.errorMessage)
            }
        }
    }
    
    var body: some View {
       albumList()
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AlbumListView()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
