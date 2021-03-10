window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

   //ここまでで出品金額を取得している

   const addTaxDom = document.getElementById("add-tax-price");
   addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
  
   //ここまでで販売手数料の表示及び取得が完了している

   const salesProfit = document.getElementById("profit");
   salesProfit.innerHTML = inputValue - addTaxDom.innerHTML 

　});


})