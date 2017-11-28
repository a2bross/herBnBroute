function hideFlashAfter5sec() {
  const alert = document.querySelector(".alert-dismissible");
  if (alert) {
    setTimeout(() => {alert.style.display = "none"}, 3000);
  }
};

export { hideFlashAfter5sec };
