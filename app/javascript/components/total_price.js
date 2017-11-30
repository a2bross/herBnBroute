const showPrice = (duration) => {
  const price = document.getElementById('total_price');
  const daily_price = price.dataset.dailyprice;
  price.innerText = `Total price: ${daily_price * (duration + 1)}€`;
};

const calculatePrice = (event) => {
  const start_date = document.getElementById('booking_start_date');
  const end_date = document.getElementById('booking_end_date');
  if (start_date.value !== "" && end_date.value !== "") {
    const duration = (Date.parse(end_date.value) - Date.parse(start_date.value)) / 1000 / 3600 / 24 ;
    showPrice(duration);
  }
};


const displayPrice = () => {
  const price = document.getElementById('total_price');
  if (price) {
    const start_date = document.getElementById('booking_start_date');
    const end_date = document.getElementById('booking_end_date');
    start_date.addEventListener('change', calculatePrice);
    end_date.addEventListener('change', calculatePrice);
  }
}


export { displayPrice };
