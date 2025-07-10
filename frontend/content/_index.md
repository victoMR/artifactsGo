---
title: "Anime Collection Manager"
date: 2025-07-10
draft: false
---

# 🎌 Anime Collection Manager

> Gestiona tu colección de animes favoritos con estilo terminal

<div id="app">
  <!-- Dashboard Stats -->
  <div class="stats-container">
    <div class="stat-card">
      <h3>📊 Total Animes</h3>
      <span id="total-animes">0</span>
    </div>
    <div class="stat-card">
      <h3>⭐ Rating Promedio</h3>
      <span id="avg-rating">0</span>
    </div>
    <div class="stat-card">
      <h3>🎭 Género Popular</h3>
      <span id="popular-genre">-</span>
    </div>
  </div>

  <!-- Add Anime Form -->
  <div class="form-container">
    <h2>➕ Agregar Nuevo Anime</h2>
    <form id="add-anime-form">
      <div class="form-group" style="display: none;">
        <label for="anime-id">ID:</label>
        <input type="text" id="anime-id" readonly>
      </div>
      <div class="form-group">
        <label for="anime-title">Título:</label>
        <input type="text" id="anime-title" required placeholder="Ej: Attack on Titan">
      </div>
      <div class="form-group">
        <label for="anime-genre">Género:</label>
        <select id="anime-genre" required>
          <option value="">Seleccionar...</option>
          <option value="Action">Action</option>
          <option value="Adventure">Adventure</option>
          <option value="Comedy">Comedy</option>
          <option value="Drama">Drama</option>
          <option value="Fantasy">Fantasy</option>
          <option value="Horror">Horror</option>
          <option value="Mystery">Mystery</option>
          <option value="Romance">Romance</option>
          <option value="Sci-Fi">Sci-Fi</option>
          <option value="Slice of Life">Slice of Life</option>
          <option value="Sports">Sports</option>
          <option value="Supernatural">Supernatural</option>
          <option value="Thriller">Thriller</option>
        </select>
      </div>
      <div class="form-group">
        <label for="anime-rating">Rating (1-5):</label>
        <input type="number" id="anime-rating" min="1" max="5" required placeholder="5">
      </div>
      <button type="submit">🎌 Agregar Anime</button>
    </form>
  </div>

  <!-- Messages -->
  <div id="message" class="message"></div>

  <!-- Anime List -->
  <div class="anime-list-container">
    <h2>📋 Lista de Animes</h2>
    <div id="anime-list" class="anime-grid"></div>
  </div>
</div>

<style>
/* Estilos adaptados al tema Terminal */
:root {
  --primary-color: #ff6347;
  --secondary-color: #ff4757;
  --accent-color: #ff3838;
  --success-color: #2ed573;
  --text-color: #ffffff;
  --text-light: #a4b0be;
  --bg-color: #1e1e1e;
  --card-bg: #2f3542;
  --border-color: #57606f;
  --shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
  --shadow-hover: 0 8px 25px rgba(0, 0, 0, 0.4);
}

* {
  box-sizing: border-box;
}

#app {
  max-width: 1200px;
  margin: 0 auto;
  padding: 40px 20px;
  color: var(--text-color);
}

.stats-container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 30px;
  margin-bottom: 50px;
}

.stat-card {
  background: var(--card-bg);
  padding: 30px;
  border-radius: 8px;
  text-align: center;
  box-shadow: var(--shadow);
  transition: all 0.3s ease;
  position: relative;
  border: 1px solid var(--border-color);
}

.stat-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 3px;
  background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
}

.stat-card:hover {
  transform: translateY(-8px);
  box-shadow: var(--shadow-hover);
  border-color: var(--primary-color);
}

.stat-card h3 {
  margin: 0 0 15px 0;
  font-size: 1.1rem;
  color: var(--text-light);
  font-weight: 600;
  font-family: 'Fira Mono', monospace;
}

.stat-card span {
  font-size: 2.8rem;
  font-weight: 800;
  display: block;
  color: var(--primary-color);
  font-family: 'Fira Mono', monospace;
}

.form-container {
  background: var(--card-bg);
  padding: 40px;
  border-radius: 8px;
  box-shadow: var(--shadow);
  margin-bottom: 40px;
  border: 1px solid var(--border-color);
}

.form-container h2 {
  margin-top: 0;
  color: var(--text-color);
  font-size: 1.8rem;
  font-weight: 700;
  margin-bottom: 30px;
  font-family: 'Fira Mono', monospace;
}

.form-group {
  margin-bottom: 25px;
}

.form-group label {
  display: block;
  margin-bottom: 8px;
  font-weight: 600;
  color: var(--text-light);
  font-size: 1rem;
  font-family: 'Fira Mono', monospace;
}

.form-group input,
.form-group select {
  width: 100%;
  padding: 15px;
  border: 2px solid var(--border-color);
  border-radius: 4px;
  font-size: 16px;
  transition: all 0.3s ease;
  background: var(--bg-color);
  color: var(--text-color);
  font-family: 'Fira Mono', monospace;
}

.form-group input:focus,
.form-group select:focus {
  outline: none;
  border-color: var(--primary-color);
  box-shadow: 0 0 0 3px rgba(255, 99, 71, 0.2);
}

.form-group input::placeholder {
  color: var(--text-light);
}

button {
  background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
  color: white;
  padding: 15px 40px;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  font-family: 'Fira Mono', monospace;
}

button:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-hover);
  background: var(--accent-color);
}

button:active {
  transform: translateY(0);
}

.message {
  padding: 15px;
  margin: 20px 0;
  border-radius: 4px;
  font-weight: 600;
  text-align: center;
  display: none;
  border-left: 4px solid;
  font-family: 'Fira Mono', monospace;
}

.message.success {
  background: rgba(46, 213, 115, 0.1);
  color: var(--success-color);
  border-left-color: var(--success-color);
}

.message.error {
  background: rgba(255, 56, 56, 0.1);
  color: var(--accent-color);
  border-left-color: var(--accent-color);
}

.anime-list-container h2 {
  color: var(--text-color);
  margin-bottom: 20px;
  font-family: 'Fira Mono', monospace;
  font-size: 1.8rem;
}

.anime-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 20px;
}

.anime-card {
  background: var(--card-bg);
  border-radius: 8px;
  padding: 20px;
  box-shadow: var(--shadow);
  transition: all 0.3s ease;
  border: 1px solid var(--border-color);
}

.anime-card:hover {
  transform: translateY(-5px);
  border-color: var(--primary-color);
  box-shadow: var(--shadow-hover);
}

.anime-card h3 {
  margin-top: 0;
  color: var(--primary-color);
  font-size: 1.3rem;
  font-family: 'Fira Mono', monospace;
}

.anime-card p {
  margin: 10px 0;
  color: var(--text-light);
  font-family: 'Fira Mono', monospace;
}

.anime-card .rating {
  color: var(--accent-color);
  font-weight: bold;
}

.anime-card .genre {
  background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
  color: white;
  padding: 5px 15px;
  border-radius: 4px;
  font-size: 0.9rem;
  display: inline-block;
  margin: 10px 0;
  font-family: 'Fira Mono', monospace;
}

.delete-btn {
  background: var(--accent-color);
  color: white;
  border: none;
  padding: 8px 15px;
  border-radius: 4px;
  cursor: pointer;
  font-size: 14px;
  transition: all 0.3s ease;
  font-family: 'Fira Mono', monospace;
}

.delete-btn:hover {
  background: #ff2f2f;
  transform: translateY(-2px);
}

/* Responsive Design */
@media (max-width: 768px) {
  .stats-container {
    grid-template-columns: 1fr;
  }
  
  .anime-grid {
    grid-template-columns: 1fr;
  }
  
  #app {
    padding: 20px 10px;
  }
  
  .form-container {
    padding: 20px;
  }
}
</style>

<script>
// API Configuration
const API_BASE_URL = '/animes';

// DOM Elements
const addAnimeForm = document.getElementById('add-anime-form');
const animeList = document.getElementById('anime-list');
const messageDiv = document.getElementById('message');
const totalAnimesSpan = document.getElementById('total-animes');
const avgRatingSpan = document.getElementById('avg-rating');
const popularGenreSpan = document.getElementById('popular-genre');

// Initialize App
document.addEventListener('DOMContentLoaded', function() {
    loadAnimes();
    setupEventListeners();
    generateNextId();
});

// Event Listeners
function setupEventListeners() {
    addAnimeForm.addEventListener('submit', handleAddAnime);
}

// Generate next available ID
async function generateNextId() {
    try {
        const response = await fetch(API_BASE_URL);
        const animes = await response.json();
        
        // Find the highest ID and add 1
        let maxId = 0;
        animes.forEach(anime => {
            const id = parseInt(anime.id);
            if (!isNaN(id) && id > maxId) {
                maxId = id;
            }
        });
        
        const nextId = maxId + 1;
        document.getElementById('anime-id').value = nextId.toString();
    } catch (error) {
        // If API fails, use timestamp as ID
        const timestampId = Date.now().toString().slice(-6);
        document.getElementById('anime-id').value = timestampId;
    }
}

// Load and Display Animes
async function loadAnimes() {
    try {
        const response = await fetch(API_BASE_URL);
        const animes = await response.json();
        
        displayAnimes(animes);
        updateStats(animes);
    } catch (error) {
        showMessage('Error loading animes: ' + error.message, 'error');
    }
}

// Display Animes
function displayAnimes(animes) {
    animeList.innerHTML = '';
    
    animes.forEach(anime => {
        const animeCard = document.createElement('div');
        animeCard.className = 'anime-card';
        animeCard.innerHTML = `
            <h3>${anime.title}</h3>
            <p><strong>ID:</strong> ${anime.id}</p>
            <p><strong>Genre:</strong> <span class="genre">${anime.genre}</span></p>
            <p><strong>Rating:</strong> <span class="rating">${'⭐'.repeat(anime.rating)}</span> (${anime.rating}/5)</p>
            <button class="delete-btn" onclick="deleteAnime('${anime.id}')">🗑️ Delete</button>
        `;
        animeList.appendChild(animeCard);
    });
}

// Update Statistics
function updateStats(animes) {
    const total = animes.length;
    const avgRating = total > 0 ? (animes.reduce((sum, anime) => sum + anime.rating, 0) / total).toFixed(1) : 0;
    
    // Find most popular genre
    const genreCount = {};
    animes.forEach(anime => {
        genreCount[anime.genre] = (genreCount[anime.genre] || 0) + 1;
    });
    
    const popularGenre = Object.keys(genreCount).reduce((a, b) => 
        genreCount[a] > genreCount[b] ? a : b, 'N/A');
    
    totalAnimesSpan.textContent = total;
    avgRatingSpan.textContent = avgRating;
    popularGenreSpan.textContent = total > 0 ? popularGenre : 'N/A';
}

// Add New Anime
async function handleAddAnime(event) {
    event.preventDefault();
    
    const anime = {
        id: document.getElementById('anime-id').value,
        title: document.getElementById('anime-title').value,
        genre: document.getElementById('anime-genre').value,
        rating: parseInt(document.getElementById('anime-rating').value)
    };
    
    try {
        const response = await fetch(API_BASE_URL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(anime)
        });
        
        if (response.ok) {
            showMessage('✅ Anime agregado exitosamente!', 'success');
            addAnimeForm.reset();
            loadAnimes();
            generateNextId(); // Generate new ID for next anime
        } else {
            throw new Error('Error al agregar anime');
        }
    } catch (error) {
        showMessage('❌ Error al agregar anime: ' + error.message, 'error');
    }
}

// Delete Anime
async function deleteAnime(id) {
    if (!confirm('¿Estás seguro de que quieres eliminar este anime?')) return;
    
    try {
        const response = await fetch(`${API_BASE_URL}/${id}`, {
            method: 'DELETE'
        });
        
        if (response.ok) {
            showMessage('✅ Anime eliminado exitosamente!', 'success');
            loadAnimes();
        } else {
            throw new Error('Error al eliminar anime');
        }
    } catch (error) {
        showMessage('❌ Error al eliminar anime: ' + error.message, 'error');
    }
}

// Show Message
function showMessage(text, type) {
    messageDiv.textContent = text;
    messageDiv.className = `message ${type}`;
    messageDiv.style.display = 'block';
    
    setTimeout(() => {
        messageDiv.style.display = 'none';
    }, 5000);
}
</script>
