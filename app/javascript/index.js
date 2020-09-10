function price(){
//画面が読み込まれた時に動かす為の定義
const priceInput = document.getElementById('item-price');
const add_tax = document.getElementById('add-tax-price'); //手数料
const profit = document.getElementById('profit') //販売利益

//手数料と利益の計算式↓
priceInput.addEventListener('keyup',() => {
  const value = priceInput.value; //入力金額の定義をした（value）
  if (value >= 300 && value <= 9999999) {
    let fee = Math.floor(value * 0.1)
    let gains = value - fee
    add_tax.textContent = fee;
    profit.textContent = gains;
  } else {
    let fee = '-';
    let gains = '-';
    add_tax.textContent = fee;
    profit.textContent = gains;
  }
});

}
window.addEventListener('load', price);