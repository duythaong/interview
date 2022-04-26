1/ Cho contract NFT đã được cài đặt sẵn (Trong file NFT.sol). 

a) Hãy override các hàm transfer sao cho: nếu người gửi thuộc whitelist addresses thì sẽ chuyển NFT bình thường, còn nếu không thuộc whitelist addresses thì sẽ bị thu phí token(ERC20). Việc cấu hình whitelist address, phí chuyển NFT và người nhận phần phí do contract owner quyết định.

b/ Viết hàm rescueToken, nhận tham số là địa chỉ address token ERC, chỉ Owner mới được quyền gọi hàm này. Khi gọi hàm này owner sẽ rút toàn bộ token balance có trong contract và chuyển về ví của mình. Nếu là address 0 thì rút native coin trên chain đó.

2/ Viết một contract mới(hoặc viết trực tiếp trên contract NFT) và bổ sung thêm Package. Thông tin của một package gồm: giá của package, số lượng NFT trong package, và danh sách token(ERC20) có thể dùng để mua package này. Viết các hàm sau:

a) setPackage: Tạo mới/ cập nhật lại thông tin package đã có, bao gồm danh sách token được phép dùng để mua loại package này, và tương ứng với mỗi token là giá mua. Chỉ owner có thể gọi hàm này

b) buyPackage: User truyền vào loại package muốn mua, address token mà user sẽ trả để mua package. Nếu thoả các điều kiện(về giá, về tính hợp lệ của token) thì mint ra cho user tương ứng số lượng NFT của loại Package đó.

c) deletePaymentMethods: Huỷ bỏ không còn chấp nhận cho phép mua Package bằng token đã xét trước đó. Chỉ owner có thể gọi hàm này.

3/ Contract SaveMoney.sol có tính năng cho phép user gửi tiền vào trong contract, và sau đó là rút tiền đã gửi về lại address của mình. Hiện phần cài đặt contract này có mắc lỗi gì không? Nếu có hãy chỉ ra lỗi đó.
