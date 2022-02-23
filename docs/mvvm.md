# MVVM architecture SwiftUI

## What is MVVM?

MVVM là thiết kế kiến trúc mà ở đó tách biệt các thành phần thành 3 nhóm cụ thể:

- Model: giữ application data, thường thì sẽ là struct hoặc một class đơn giản.

- View: hiển thị UI elements và kiểm soát tương tác người dùng. 

- ViewModel: dùng để chuyển đổi dữ liệu sang dữ liệu có thể hiển thị được qua View.

## Why is MVVM?

Sử dụng MVVM khi cần chuyển đổi models đến UI của View mà cần xử lý logic. Ví dụ khi chuyển Date đến View mà date trong View là String còn Date models là DateTime.

Khi so sánh với MVC, nếu không có ViewModel, toàn bộ code trên cần đẩy vào Controller, lúc này Controllder ngoài xử lý những logic khác còn phải thêm những logic ViewModel, to lên và khó kiểm soát.

## How to use it in SwiftUI?

View trong SwiftUI được thiết kế @State có thể đảm nhận vai trò của ViewModel, bao hàm và cung cấp cơ chế lắng nghe (Binding) để làm mới UI mỗi khi state thay đổi.

Nhưng trong tình huống phức tạp, View phải lắng nghe ra bên ngoài, nơi có trách nhiệm cụ thể về xử lý dữ liệu hơn, lúc này View sẽ dùng ObservableObject lắng nghe đến ViewModel.

Ví dụ:

- Model (a data container):

```Swift
struct Task {
    let title: String
}
```

- View (a SwiftUI view):

```Swift
struct TaskList: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List(viewModel.tasks) { task in
            Text(task.title)
        }
        .onAppear {
            self.viewModel.loadTasks()
        }
    }
}
```
- ViewModel: là ObservableObject có nhiệm vụ đóng gói logic để View tham chiếu dữ liệu

```Swift
extension TaskList {
    class ViewModel: ObservableObject {
        @Published private(set) var tasks: [Task] = []
        
        private let service: WebService
        
        func loadTasks() {
            service.getTasks { [weak self] result in
                self?.tasks = result.value ?? []
            }
        }
    }
}
```
Trong ví dụ đơn giản này, khi View được render lên màn hình, onAppear callback gọi đến loadCountries() của ViewModel. ViewModel lúc này xử lý logic lấy dữ liệu bằng cách yêu cầu đến Data layer (repository).