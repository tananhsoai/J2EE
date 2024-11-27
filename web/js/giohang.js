// Giả sử dữ liệu sản phẩm được lưu trong một mảng
const cartItems = [
    { id: 1, name: 'Sản phẩm 1', price: 100000, image: 'product1.jpg' },
    { id: 2, name: 'Sản phẩm 2', price: 150000, image: 'product2.jpg' },
    { id: 3, name: 'Sản phẩm 3', price: 200000, image: 'product3.jpg' },
];

const cartItemsList = document.getElementById('cart-items');

// Hàm để tạo một phần tử HTML đại diện cho một sản phẩm
function createCartItem(item) {
    const li = document.createElement('li');
    li.classList.add('cart-item');
    li.innerHTML = `
        <img src="${item.image}" alt="${item.name}">
        <div>
            <p>${item.name}</p>
            <p>${item.price}đ</p>
        </div>
    `;
    return li;
}

// Hiển thị các sản phẩm trong giỏ hàng
cartItems.forEach(item => {
    cartItemsList.appendChild(createCartItem(item));
});
// ... phần code trước đó

