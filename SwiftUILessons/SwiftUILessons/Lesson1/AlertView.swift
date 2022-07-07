import SwiftUI

struct AlertView: View {
    @State var isError = false
    
    var body: some View {
        showActionSheet()
    }
    
    fileprivate func showAlert() -> some View {
        return Button {
            self.isError = true
        } label: {
            Text("Вход")
        }
        .alert(isPresented: $isError) {
            Alert(title: Text("Загрузка"), message: Text("Вы уверены?"), primaryButton: .destructive(Text("Да"),
                    action: {
                        print("Загрузка активна")
                    }),
                secondaryButton: .cancel()
            )
        }
    }
    
    fileprivate func showActionSheet() -> some View {
        return Button {
            self.isError = true
        } label: {
            Text("Вход")
        }
        .actionSheet(isPresented: $isError) {
            ActionSheet(title: Text("Загрузка"), message: Text("Хотите загрузить фото?"), buttons: [.destructive(Text("Загрузка"),
                                       action: {
                                           print("пошла загрузка")
                                       }),
                          .cancel()])
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
