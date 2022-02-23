# 3 LAYERS ARCHITECTURE

## What is 3 layers?

3 layers là một kiến trúc phần mềm phổ biến. Định hướng chính của kiến trúc này là phân chia ứng dụng thành các phần theo chức năng - vai trò đặc trưng luôn luôn có trong một ứng dụng. 

## Why is 3 layers?

Một ứng dụng luôn phải có ít nhất một kiến trúc để đảm bảo chắc chắn về source code logic, có khả năng test và bảo trì. - trích: https://developer.android.com/topic/architecture

Trong một kiến trúc luôn cần đảm bảo các giá trị sau:

- Tách biệt các mối quan hệ giữa các thành phần: Nghĩa là thành phần có vai trò nào chỉ làm đúng vai trò đó, như UI chỉ nên có logic tương tác trực tiếp người dùng không nên chứa các logic xử lý dữ liệu hoặc hệ thống phức tạp. Bằng cách tinh gọn các thành phần hết mức có thể, giúp tránh những vấn đề liên quan đến quản lý vòng đời của ứng dụng cũng như tăng khả năng test các thành phần.

- Drive UI from data models (tạm dịch: Nên xây UI từ dữ liệu các models cung cấp): Data models thể hiện trực quan dữ liệu của ứng dụng. Nó tách biệt hoàn toàn với UI và các thành phần khác của ứng dụng. Điều này có nghĩa Data models không phải chịu sự ảnh hưởng từ UI hoặc các thành phần khác. Lý do:

-- Người dùng sẽ không bị mất dữ liệu khi ứng dụng giải phóng resource.

-- Ứng dụng có thể hoạt động ổn trong tình trạng internet mất ổn định.

trích: https://developer.android.com/jetpack/guide

## UI layer

Nhiệm vụ chính là hiển thị dữ liệu lên màn hình. Bất cứ khi nào dữ liệu bị thay đổi, bởi người dùng tương tác hoặc external input (như kết quả dữ liệu từ request network), UI phải thay đổi chính xác theo dữ liệu.

UI layer có 2 bộ phận chính: 
- UI elements dùng để render data lên màn hình.
- State holders (ViewModel là một ví dụ) có nhiệm vụ nắm dữ liệu, truyền đến UI và handle logic.


![App UI](/images/3-layer-1.png)

## Domain Layer

Đây là layer tùy chọn, không bắt buộc phải có trong ứng dụng. Layer này nằm giữa UI Layer và Data Layer.

Nhiệm vụ chính của domain layer là đóng gói những logic phức tạp hoặc có thể là logic đơn giản nhưng xuất hiện ở nhiều ViewModel. Nếu ưu tiên độ tái sử dụng source code thì nên có Layer này. 

![App UI](/images/3-layer-2.png)

Những class thuộc Layer này thường là use case hoặc interactors. Mỗi use case chịu trách nhiệm tuyệt đối cho một nhiệm vụ duy nhất. 

## Data Layer

Data layer có chứa Bussiness Logic. Bussiness Logic ở đây là thứ gì mang lại dữ liệu cho ứng dụng - trả lời cho câu hỏi bằng cách nào ứng dụng có thể create, store, change data.

Data layer thực chất xây dựng từ Repository bao gồm 1 hoặc nhiều Data source. Tốt nhất nên tạo repository riêng biệt cho mỗi loại dữ liệu.

![App UI](/images/3-layer-3.png)

Các class repository đảm bảo các nhiệm vụ sau:

- Chuyển đổi data thành data có ý nghĩa cho cả ứng dụng
- Là nơi xử lý thay đổi dữ liệu giữa app và nơi lưu trữ
- Giải quyết conflict giữa những data source
- Abstract source of data cho toàn bộ ứng dụng
- Bussiness logic 

Mỗi data source class chỉ chịu trách nhiệm và một nguồn data (đó có thể là file, network source, local database).