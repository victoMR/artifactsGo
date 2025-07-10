+++
title = "🎌 Anime Collection Manager - Aplicación CRUD"
date = "2025-07-10"
author = "Anime Collection Team"
description = "Gestiona tu colección de animes con esta aplicación web interactiva y moderna"
tags = ["anime", "collection", "crud", "webapp"]
+++

# 🎌 Gestor de Colección de Animes

¡Bienvenido al **Anime Collection Manager**! Una aplicación web moderna con interfaz terminal para gestionar tu colección personal de animes.

## 📊 Dashboard de Estadísticas

<div id="stats-dashboard" class="terminal-stats">
  <div class="stat-card">
    <span class="stat-number" id="total-animes">0</span>
    <span class="stat-label">Total Animes</span>
  </div>
  <div class="stat-card">
    <span class="stat-number" id="avg-rating">0</span>
    <span class="stat-label">Rating Promedio</span>
  </div>
  <div class="stat-card">
    <span class="stat-number" id="latest-anime">N/A</span>
    <span class="stat-label">Último Añadido</span>
  </div>
</div>

## 🎯 Gestión de Animes

### ➕ Agregar Nuevo Anime

<div id="add-anime-form" class="terminal-form">
  <div class="form-group">
    <label for="anime-title">📺 Título del Anime:</label>
    <input type="text" id="anime-title" placeholder="Ej: Attack on Titan" required>
  </div>
  
  <div class="form-group">
    <label for="anime-genre">🎭 Género:</label>
    <select id="anime-genre" required>
      <option value="">Selecciona un género</option>
      <option value="Acción">⚔️ Acción</option>
      <option value="Aventura">🗺️ Aventura</option>
      <option value="Drama">🎭 Drama</option>
      <option value="Comedia">😂 Comedia</option>
      <option value="Romance">💕 Romance</option>
      <option value="Fantasía">🦄 Fantasía</option>
      <option value="Ciencia Ficción">🚀 Ciencia Ficción</option>
      <option value="Thriller">😱 Thriller</option>
      <option value="Slice of Life">🌸 Slice of Life</option>
    </select>
  </div>
  
  <div class="form-group">
    <label for="anime-rating">⭐ Rating (1-10):</label>
    <input type="number" id="anime-rating" min="1" max="10" placeholder="8" required>
  </div>
  
  <div class="form-group">
    <label for="anime-status">📺 Estado:</label>
    <select id="anime-status" required>
      <option value="">Selecciona estado</option>
      <option value="Completado">✅ Completado</option>
      <option value="Viendo">👀 Viendo</option>
      <option value="Pausado">⏸️ Pausado</option>
      <option value="Abandonado">❌ Abandonado</option>
      <option value="Planificado">📅 Planificado</option>
    </select>
  </div>
  
  <button id="add-anime-btn" class="terminal-btn primary">🎌 Añadir Anime</button>
</div>

### 📋 Lista de Animes

<div id="anime-list" class="terminal-list">
  <div class="loading">🔄 Cargando animes...</div>
</div>

### ✏️ Editar Anime (Modal)

<div id="edit-modal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>✏️ Editar Anime</h2>
    <div id="edit-form" class="terminal-form">
      <input type="hidden" id="edit-anime-id">
      <div class="form-group">
        <label for="edit-anime-title">📺 Título:</label>
        <input type="text" id="edit-anime-title" required>
      </div>
      <div class="form-group">
        <label for="edit-anime-genre">🎭 Género:</label>
        <select id="edit-anime-genre" required>
          <option value="Acción">⚔️ Acción</option>
          <option value="Aventura">🗺️ Aventura</option>
          <option value="Drama">🎭 Drama</option>
          <option value="Comedia">😂 Comedia</option>
          <option value="Romance">💕 Romance</option>
          <option value="Fantasía">🦄 Fantasía</option>
          <option value="Ciencia Ficción">🚀 Ciencia Ficción</option>
          <option value="Thriller">😱 Thriller</option>
          <option value="Slice of Life">🌸 Slice of Life</option>
        </select>
      </div>
      <div class="form-group">
        <label for="edit-anime-rating">⭐ Rating:</label>
        <input type="number" id="edit-anime-rating" min="1" max="10" required>
      </div>
      <div class="form-group">
        <label for="edit-anime-status">📺 Estado:</label>
        <select id="edit-anime-status" required>
          <option value="Completado">✅ Completado</option>
          <option value="Viendo">👀 Viendo</option>
          <option value="Pausado">⏸️ Pausado</option>
          <option value="Abandonado">❌ Abandonado</option>
          <option value="Planificado">📅 Planificado</option>
        </select>
      </div>
      <div class="form-actions">
        <button id="update-anime-btn" class="terminal-btn primary">💾 Actualizar</button>
        <button id="cancel-edit-btn" class="terminal-btn secondary">❌ Cancelar</button>
      </div>
    </div>
  </div>
</div>

<style>
/* Estilos Terminal Mejorados */
.terminal-stats {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1rem;
  margin: 2rem 0;
  padding: 1rem;
  background: rgba(0, 255, 0, 0.1);
  border: 1px solid #00ff00;
  border-radius: 4px;
}

.stat-card {
  text-align: center;
  padding: 1rem;
  background: rgba(0, 0, 0, 0.3);
  border: 1px solid #00ff00;
  border-radius: 4px;
  transition: all 0.3s ease;
}

.stat-card:hover {
  background: rgba(0, 255, 0, 0.1);
  transform: translateY(-2px);
}

.stat-number {
  display: block;
  font-size: 2rem;
  font-weight: bold;
  color: #00ff00;
  text-shadow: 0 0 10px #00ff00;
}

.stat-label {
  display: block;
  font-size: 0.9rem;
  color: #ccc;
  margin-top: 0.5rem;
}

.terminal-form {
  background: rgba(0, 0, 0, 0.5);
  border: 1px solid #00ff00;
  border-radius: 4px;
  padding: 1.5rem;
  margin: 1rem 0;
}

.form-group {
  margin-bottom: 1rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  color: #00ff00;
  font-weight: bold;
}

.form-group input,
.form-group select {
  width: 100%;
  padding: 0.5rem;
  background: rgba(0, 0, 0, 0.7);
  border: 1px solid #00ff00;
  border-radius: 4px;
  color: #00ff00;
  font-family: 'Courier New', monospace;
}

.form-group input:focus,
.form-group select:focus {
  outline: none;
  border-color: #00ff00;
  box-shadow: 0 0 10px rgba(0, 255, 0, 0.3);
}

.terminal-btn {
  padding: 0.75rem 1.5rem;
  border: 1px solid #00ff00;
  background: rgba(0, 0, 0, 0.7);
  color: #00ff00;
  border-radius: 4px;
  font-family: 'Courier New', monospace;
  cursor: pointer;
  transition: all 0.3s ease;
  margin-right: 0.5rem;
}

.terminal-btn:hover {
  background: rgba(0, 255, 0, 0.2);
  transform: translateY(-1px);
  box-shadow: 0 2px 10px rgba(0, 255, 0, 0.3);
}

.terminal-btn.primary {
  background: rgba(0, 255, 0, 0.1);
}

.terminal-btn.secondary {
  border-color: #ff6b6b;
  color: #ff6b6b;
}

.terminal-btn.secondary:hover {
  background: rgba(255, 107, 107, 0.1);
}

.terminal-list {
  background: rgba(0, 0, 0, 0.5);
  border: 1px solid #00ff00;
  border-radius: 4px;
  padding: 1rem;
  margin: 1rem 0;
}

.anime-item {
  padding: 1rem;
  margin: 0.5rem 0;
  background: rgba(0, 0, 0, 0.3);
  border: 1px solid #00ff00;
  border-radius: 4px;
  transition: all 0.3s ease;
}

.anime-item:hover {
  background: rgba(0, 255, 0, 0.1);
  transform: translateX(5px);
}

.anime-title {
  font-size: 1.2rem;
  font-weight: bold;
  color: #00ff00;
  margin-bottom: 0.5rem;
}

.anime-details {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 0.5rem;
  margin: 0.5rem 0;
}

.anime-detail {
  color: #ccc;
  font-size: 0.9rem;
}

.anime-actions {
  margin-top: 1rem;
}

.btn-edit, .btn-delete {
  padding: 0.5rem 1rem;
  border: 1px solid;
  border-radius: 4px;
  cursor: pointer;
  margin-right: 0.5rem;
  transition: all 0.3s ease;
}

.btn-edit {
  background: rgba(0, 0, 255, 0.1);
  border-color: #4dabf7;
  color: #4dabf7;
}

.btn-edit:hover {
  background: rgba(0, 0, 255, 0.2);
}

.btn-delete {
  background: rgba(255, 0, 0, 0.1);
  border-color: #ff6b6b;
  color: #ff6b6b;
}

.btn-delete:hover {
  background: rgba(255, 0, 0, 0.2);
}

.modal {
  display: none;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.8);
}

.modal-content {
  background-color: rgba(0, 0, 0, 0.9);
  margin: 5% auto;
  padding: 2rem;
  border: 1px solid #00ff00;
  border-radius: 8px;
  width: 80%;
  max-width: 500px;
  color: #00ff00;
}

.close {
  color: #ff6b6b;
  float: right;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
}

.close:hover {
  color: #ff4757;
}

.loading {
  text-align: center;
  color: #00ff00;
  font-size: 1.2rem;
  padding: 2rem;
}

.form-actions {
  margin-top: 1rem;
  text-align: right;
}

@media (max-width: 768px) {
  .terminal-stats {
    grid-template-columns: 1fr;
  }
  
  .anime-details {
    grid-template-columns: 1fr;
  }
  
  .modal-content {
    width: 95%;
    margin: 10% auto;
  }
}
</style>

<script>
// Configuración de la API
const API_BASE_URL = 'https://anime-api-2r3soktbma-uc.a.run.app/api';
let currentAnimes = []; // Variable global para almacenar la lista actual
let nextId = 1;

// Función para mostrar notificaciones
function showNotification(message, type = 'success') {
  const notification = document.createElement('div');
  notification.className = `notification ${type}`;
  notification.textContent = message;
  notification.style.cssText = `
    position: fixed;
    top: 20px;
    right: 20px;
    padding: 1rem 1.5rem;
    border-radius: 4px;
    color: white;
    font-weight: bold;
    z-index: 1001;
    transition: all 0.3s ease;
    ${type === 'success' ? 'background: rgba(0, 255, 0, 0.8); border: 1px solid #00ff00;' : 'background: rgba(255, 0, 0, 0.8); border: 1px solid #ff6b6b;'}
  `;
  document.body.appendChild(notification);
  
  setTimeout(() => {
    notification.remove();
  }, 3000);
}

// Función para obtener todos los animes
async function fetchAnimes() {
  try {
    const response = await fetch(`${API_BASE_URL}/animes`);
    if (!response.ok) throw new Error('Error al obtener animes');
    const animes = await response.json();
    return animes || [];
  } catch (error) {
    console.error('Error:', error);
    showNotification('Error al cargar animes', 'error');
    return [];
  }
}

// Función para actualizar estadísticas
function updateStats(animes) {
  const totalAnimes = animes.length;
  const avgRating = animes.length > 0 ? 
    (animes.reduce((sum, anime) => sum + (anime.rating || 0), 0) / animes.length).toFixed(1) : '0';
  const latestAnime = animes.length > 0 ? 
    animes[animes.length - 1].title : 'N/A';
  
  document.getElementById('total-animes').textContent = totalAnimes;
  document.getElementById('avg-rating').textContent = avgRating;
  document.getElementById('latest-anime').textContent = latestAnime;
  
  // Efecto de animación para los números
  document.querySelectorAll('.stat-number').forEach(el => {
    el.style.animation = 'pulse 0.5s ease-in-out';
  });
}

// Función para renderizar la lista de animes
function renderAnimeList(animes) {
  const listContainer = document.getElementById('anime-list');
  
  if (animes.length === 0) {
    listContainer.innerHTML = '<div class="loading">📝 No hay animes en tu colección. ¡Añade algunos!</div>';
    return;
  }
  
  const animesHTML = animes.map(anime => `
    <div class="anime-item" data-id="${anime.id}">
      <div class="anime-title">${anime.title}</div>
      <div class="anime-details">
        <div class="anime-detail">🎭 <strong>Género:</strong> ${anime.genre}</div>
        <div class="anime-detail">⭐ <strong>Rating:</strong> ${anime.rating}/10</div>
        <div class="anime-detail">📺 <strong>Estado:</strong> ${anime.status}</div>
      </div>
      <div class="anime-actions">
        <button class="btn-edit" onclick="editAnime(${anime.id})">✏️ Editar</button>
        <button class="btn-delete" onclick="deleteAnime(${anime.id})">🗑️ Eliminar</button>
      </div>
    </div>
  `).join('');
  
  listContainer.innerHTML = animesHTML;
}

// Función para añadir un anime
async function addAnime() {
  const title = document.getElementById('anime-title').value.trim();
  const genre = document.getElementById('anime-genre').value;
  const rating = parseInt(document.getElementById('anime-rating').value);
  const status = document.getElementById('anime-status').value;
  
  if (!title || !genre || !rating || !status) {
    showNotification('Por favor, completa todos los campos', 'error');
    return;
  }
  
  const anime = {
    id: nextId++,
    title,
    genre,
    rating,
    status
  };
  
  try {
    const response = await fetch(`${API_BASE_URL}/animes`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(anime)
    });
    
    if (!response.ok) throw new Error('Error al añadir anime');
    
    showNotification('🎌 Anime añadido exitosamente!');
    
    // Limpiar formulario
    document.getElementById('anime-title').value = '';
    document.getElementById('anime-genre').value = '';
    document.getElementById('anime-rating').value = '';
    document.getElementById('anime-status').value = '';
    
    // Recargar lista
    loadAnimes();
    
  } catch (error) {
    console.error('Error:', error);
    showNotification('Error al añadir anime', 'error');
  }
}

// Función para editar un anime
function editAnime(id) {
  // Buscar el anime en la lista actual
  const anime = currentAnimes.find(a => a.id === id.toString());
  if (!anime) {
    showNotification('Anime no encontrado', 'error');
    return;
  }
  
  // Llenar formulario de edición
  document.getElementById('edit-anime-id').value = id;
  document.getElementById('edit-anime-title').value = anime.title;
  document.getElementById('edit-anime-genre').value = anime.genre;
  document.getElementById('edit-anime-rating').value = anime.rating;
  document.getElementById('edit-anime-status').value = anime.status || 'Viendo';
  
  // Mostrar modal
  document.getElementById('edit-modal').style.display = 'block';
}

// Función para actualizar un anime
async function updateAnime() {
  const id = document.getElementById('edit-anime-id').value;
  const title = document.getElementById('edit-anime-title').value.trim();
  const genre = document.getElementById('edit-anime-genre').value;
  const rating = parseInt(document.getElementById('edit-anime-rating').value);
  const status = document.getElementById('edit-anime-status').value;
  
  if (!title || !genre || !rating || !status) {
    showNotification('Por favor, completa todos los campos', 'error');
    return;
  }
  
  const anime = { id: id, title, genre, rating, status };
  
  try {
    const response = await fetch(`${API_BASE_URL}/animes/${id}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(anime)
    });
    
    if (!response.ok) throw new Error('Error al actualizar anime');
    
    showNotification('💾 Anime actualizado exitosamente!');
    
    // Cerrar modal
    document.getElementById('edit-modal').style.display = 'none';
    
    // Recargar lista
    loadAnimes();
    
  } catch (error) {
    console.error('Error:', error);
    showNotification('Error al actualizar anime', 'error');
  }
}

// Función para eliminar un anime
async function deleteAnime(id) {
  if (!confirm('¿Estás seguro de que quieres eliminar este anime?')) return;
  
  try {
    const response = await fetch(`${API_BASE_URL}/animes/${id}`, {
      method: 'DELETE'
    });
    
    if (!response.ok) throw new Error('Error al eliminar anime');
    
    showNotification('🗑️ Anime eliminado exitosamente!');
    
    // Recargar lista
    loadAnimes();
    
  } catch (error) {
    console.error('Error:', error);
    showNotification('Error al eliminar anime', 'error');
  }
}

// Función para cargar animes y actualizar la interfaz
async function loadAnimes() {
  const animes = await fetchAnimes();
  currentAnimes = animes; // Guardar la lista actual
  updateStats(animes);
  renderAnimeList(animes);
  
  // Actualizar nextId basado en el mayor ID existente
  if (animes.length > 0) {
    const maxId = Math.max(...animes.map(anime => anime.id || 0));
    nextId = maxId + 1;
  }
}

// Event listeners
document.addEventListener('DOMContentLoaded', function() {
  // Cargar animes al iniciar
  loadAnimes();
  
  // Añadir anime
  document.getElementById('add-anime-btn').addEventListener('click', addAnime);
  
  // Actualizar anime
  document.getElementById('update-anime-btn').addEventListener('click', updateAnime);
  
  // Cancelar edición
  document.getElementById('cancel-edit-btn').addEventListener('click', function() {
    document.getElementById('edit-modal').style.display = 'none';
  });
  
  // Cerrar modal
  document.querySelector('.close').addEventListener('click', function() {
    document.getElementById('edit-modal').style.display = 'none';
  });
  
  // Cerrar modal al hacer click fuera
  window.addEventListener('click', function(event) {
    const modal = document.getElementById('edit-modal');
    if (event.target === modal) {
      modal.style.display = 'none';
    }
  });
  
  // Permitir añadir anime con Enter
  document.getElementById('anime-title').addEventListener('keypress', function(e) {
    if (e.key === 'Enter') addAnime();
  });
});

// Animaciones CSS
const style = document.createElement('style');
style.textContent = `
  @keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
  }
  
  .notification {
    animation: slideIn 0.3s ease-out;
  }
  
  @keyframes slideIn {
    from { transform: translateX(100%); opacity: 0; }
    to { transform: translateX(0); opacity: 1; }
  }
`;
document.head.appendChild(style);
</script>
