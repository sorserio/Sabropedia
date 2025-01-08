const express = require("express");
const mysql = require("mysql2");
const bodyParser = require("body-parser");
const cors = require("cors");
require("dotenv").config();

const app = express();
const PORT = process.env.PORT || 5500;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Configuración de la base de datos
const db = mysql.createConnection({
    host: process.env.DB_HOST || "localhost",
    user: process.env.DB_USER || "root",
    password: process.env.DB_PASSWORD || "",
    database: process.env.DB_NAME || "sabropedia",
});

// Verificar conexión
db.connect((err) => {
    if (err) throw err;
    console.log("Conexión exitosa a la base de datos.");
});

// Ruta para obtener todas las reseñas
app.get("/reviews", (req, res) => {
    const sql = "SELECT * FROM reviews";
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Ruta para crear una nueva reseña
app.post("/reviews", (req, res) => {
    const { comment, rating } = req.body;
    const sql = "INSERT INTO reviews (comment, rating) VALUES (?, ?)";
    db.query(sql, [comment, rating], (err, result) => {
        if (err) throw err;
        res.json({ id: result.insertId, comment, rating });
    });
});

// Ruta para actualizar una reseña
app.put("/reviews/:id", (req, res) => {
    const { id } = req.params;
    const { comment, rating } = req.body;
    const sql = "UPDATE reviews SET comment = ?, rating = ? WHERE id = ?";
    db.query(sql, [comment, rating, id], (err) => {
        if (err) throw err;
        res.json({ message: "Reseña actualizada" });
    });
});

// Ruta para borrar una reseña
app.delete("/reviews/:id", (req, res) => {
    const { id } = req.params;
    const sql = "DELETE FROM reviews WHERE id = ?";
    db.query(sql, [id], (err) => {
        if (err) throw err;
        res.json({ message: "Reseña eliminada" });
    });
});

// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
