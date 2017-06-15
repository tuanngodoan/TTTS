# Thông tin tuyển sinh Đại học - TTTS
Ứng dụng cho phép sử dụng **id Cá nhân** để xem, kiểm tra các thông tin liên quan đến việc tuyển sinh của trường ĐH.


## Ngôn ngữ, công cụ

* Swift 3.0
* Xcode 8

## Tính năng

### Đang có
*  Load thông tin từ api.
  * Xem thông tin thông tin tuyển sinh đang có
  * Kiểm tra các nguyện vọng(Vị trí, mức độ an toàn thể hiện qua 3 màu)
  * Xem thông tin tư vấn

### Sẽ update
- Thông báo Realtime khi có thông tin mới hoặc kết quả tuyển sinh

## Note

### Setup Json-server: Tạo api server tại local
   - Di chuyển tới thư mục json-server bằng terminal
      `npm install -g json-server`
   - Để bắt đầu sử dụng server api tại local
     `json-server --watch db.json`
   - Check trên trình duyệt
      - http://localhost:3000/
   - [JsonServer](https://github.com/typicode/json-server)

### ID cá nhân
   - THPT_Thanh
   - 123456789123

## Framework

- [Menu Reveal](https://github.com/John-Lluch/SWRevealViewController)
- [AFNetworking](https://github.com/AFNetworking/AFNetworking)
- [SDWebImage](https://github.com/rs/SDWebImage)
