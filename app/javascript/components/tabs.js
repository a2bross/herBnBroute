
// sélectionner les tabs
const tabs = document.querySelectorAll(".tab");
// boucler sur les tabs
tabs.forEach((tab) => {
  // poser un micro sur chaque tab (click)
  tab.addEventListener("click", (event) => {
    event.preventDefault();
    // supprimer la classe active des autres tabs
    tabs.forEach((item) => {
      item.classList.remove("active");
    });
    // ajouter la classe active au currentTarget
    event.currentTarget.classList.add("active");
    // ajouter la classe hidden aux autres div.tabcontent
    document.querySelectorAll('.tabcontent').forEach((div) => {
      div.classList.add("hidden");
    });
    // récupérer le href du currentTarget
    const id = event.currentTarget.href.split('#')[1];
    // recupérer la div correspondante
    const targetDiv = document.getElementById(id);
    // lui enlever la classe hidden
    targetDiv.classList.remove('hidden');
  })
});


if (window.location.href.split("=")[1]) {
  redirectDiv = document.getElementById(window.location.href.split("=")[1])
  document.querySelectorAll('.tabcontent').forEach((div) => {
    div.classList.add("hidden");
  });
  redirectDiv.classList.remove('hidden');

  const tabs = document.querySelectorAll(".tab");
  tabs.forEach((tab) => {
    tab.classList.remove("active");
    if (tab.href.split('#')[1] === window.location.href.split("=")[1]) {
      tab.classList.add("active");
    };
    });
};
