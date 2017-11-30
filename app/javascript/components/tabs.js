
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
