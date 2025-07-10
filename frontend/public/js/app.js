fetch("/animes")
  .then(res => res.json())
  .then(data => {
    const list = document.getElementById("anime-list");
    data.forEach(anime => {
      list.innerHTML += `<div>${anime.title} (Rating: ${anime.rating})</div>`;
    });
  });
