dangkyForm.addEventListener("submit", function(event) {
    // Prevent default form submission
    event.preventDefault();

    // Biểu thức chính quy để kiểm tra các trường hợp phức tạp hơn
    const specialCharsRegex = /[^a-zA-Z0-9]/g;
    const numberRegex = /\d/;
    const specialCharRegex = /[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]/;
    // Biểu thức chính quy mới để kiểm tra dấu tiếng Việt (bạn có thể điều chỉnh tùy theo bộ dấu mà bạn muốn kiểm tra)
    const vietnameseCharsRegex = /[àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹ]/g;

    // Validate form input
    if (dkusername.value === "") {
        alert("Vui lòng nhập tên tài khoản.");
    } else if (!/^[a-zA-Z0-9]+$/.test(dkusername.value)) {
        alert("Tên tài khoản chỉ được chứa chữ cái và số.");
    } else if (vietnameseCharsRegex.test(dkusername.value)) {
        alert("Tên tài khoản không được chứa dấu tiếng Việt.");
    } else if (dkpassword.value === "") {
        alert("Vui lòng nhập mật khẩu.");
    } else if (!/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]).{8,}$/.test(dkpassword.value)) {
        alert("Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ cái in hoa, chữ cái thường, số và ký tự đặc biệt.");
    } else if (repassword.value !== dkpassword.value) {
        alert("Mật khẩu nhập lại không trùng khớp.");
    } else if (hoten.value === "") {
        alert("Vui lòng nhập họ và tên.");
    } else if (diachi.value === "") {
        alert("Vui lòng nhập địa chỉ.");
    } else if (sdt.value === "") {
        alert("Vui lòng nhập số điện thoại.");
    } else if (!/^0\d{9}$/.test(sdt.value)) {
        alert("Số điện thoại phải bắt đầu bằng số 0 và có đúng 10 số.");
    } else {
        // Nếu tất cả các kiểm tra đều đúng, gửi form
        dangkyForm.submit();
    }
});