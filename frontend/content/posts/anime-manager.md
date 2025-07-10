+++
title = "🎌 Anime Collection Manager"
date = "2025-07-10"
author = "Anime Collection Team"
description = "Gestiona tu colección de animes con esta aplicación web interactiva"
+++

# Gestiona tu colección de animes favoritos

> Una aplicación web moderna con interfaz de terminal para gestionar tu colección de animes.

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
  --terminal-primary: #ff6347;
  --terminal-secondary: #ff4757;
  --terminal-accent: #ff3838;
  --terminal-success: #2ed573;
  --terminal-bg: var(--background);
  --terminal-card: var(--accent);
  --terminal-border: var(--accent);
  --terminal-text: var(--color);
}

#app {
  max-width: 1200px;
  margin: 2rem auto;
  padding: 0 1rem;
}

.stats-container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.stat-card {
  background: var(--terminal-card);
  padding: 1.5rem;
  border-radius: 4px;
  text-align: center;
  border: 1px solid var(--terminal-border);
  transition: all 0.3s ease;
}

.stat-card:hover {
  transform: translateY(-2px);
  border-color: var(--terminal-primary);
}

.stat-card h3 {
  margin: 0 0 1rem 0;
  font-size: 1rem;
  opacity: 0.8;
  font-family: 'Fira Code', monospace;
}

.stat-card span {
  font-size: 2rem;
  font-weight: bold;
  display: block;
  color: var(--terminal-primary);
  font-family: 'Fira Code', monospace;
}

.form-container {
  background: var(--terminal-card);
  padding: 2rem;
  border-radius: 4px;
  margin-bottom: 2rem;
  border: 1px solid var(--terminal-border);
}

.form-container h2 {
  margin-top: 0;
  font-family: 'Fira Code', monospace;
  color: var(--terminal-primary);
}

.form-group {
  margin-bottom: 1.5rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: 600;
  font-family: 'Fira Code', monospace;
}

.form-group input,
.form-group select {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid var(--terminal-border);
  border-radius: 4px;
  background: var(--terminal-bg);
  color: var(--terminal-text);
  font-family: 'Fira Code', monospace;
}

.form-group input:focus,
.form-group select:focus {
  outline: none;
  border-color: var(--terminal-primary);
}

button {
  background: var(--terminal-primary);
  color: var(--terminal-bg);
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 4px;
  font-weight: 600;
  cursor: pointer;
  font-family: 'Fira Code', monospace;
  transition: background 0.3s ease;
}

button:hover {
  background: var(--terminal-secondary);
}

.message {
  padding: 1rem;
  margin: 1rem 0;
  border-radius: 4px;
  text-align: center;
  display: none;
  font-family: 'Fira Code', monospace;
}

.message.success {
  background: rgba(46, 213, 115, 0.1);
  color: var(--terminal-success);
  border: 1px solid var(--terminal-success);
}

.message.error {
  background: rgba(255, 56, 56, 0.1);
  color: var(--terminal-accent);
  border: 1px solid var(--terminal-accent);
}

.anime-list-container h2 {
  font-family: 'Fira Code', monospace;
  color: var(--terminal-primary);
}

.anime-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 1rem;
}

.anime-card {
  background: var(--terminal-card);
  border-radius: 4px;
  padding: 1.5rem;
  border: 1px solid var(--terminal-border);
  transition: all 0.3s ease;
}

.anime-card:hover {
  border-color: var(--terminal-primary);
  transform: translateY(-2px);
}

.anime-card h3 {
  margin-top: 0;
  color: var(--terminal-primary);
  font-family: 'Fira Code', monospace;
}

.anime-card p {
  margin: 0.5rem 0;
  font-family: 'Fira Code', monospace;
}

.anime-card .rating {
  color: var(--terminal-accent);
  font-weight: bold;
}

.anime-card .genre {
  background: var(--terminal-primary);
  color: var(--terminal-bg);
  padding: 0.25rem 0.75rem;
  border-radius: 4px;
  font-size: 0.8rem;
  display: inline-block;
  margin: 0.5rem 0;
  font-family: 'Fira Code', monospace;
}

.delete-btn {
  background: var(--terminal-accent);
  color: var(--terminal-bg);
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  cursor: pointer;
  font-size: 0.8rem;
  font-family: 'Fira Code', monospace;
  transition: background 0.3s ease;
}

.delete-btn:hover {
  background: #ff2f2f;
}

@media (max-width: 768px) {
  .stats-container {
    grid-template-columns: 1fr;
  }
  
  .anime-grid {
    grid-template-columns: 1fr;
  }
  
  .form-container {
    padding: 1rem;
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
