const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

require("dotenv").config();

const app = express();
app.use(express.json()); // parses incoming requests with JSON payloads

app.use(cors());

//create connection to database
const db = mysql.createPool({
  host: process.env.DB_HOST, //localhost
  user: process.env.DB_USER, //root
  password: process.env.DB_PASSWORD, //password
  database: process.env.DB, //ravenbooks
});


// GET request for book_reviews table
app.get("/reviews", (req, res) => {
  db.query("SELECT * FROM book_reviews", (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});


// POST request for youtube_collection table
// {
//     "youtube_title": "title",
//     "youtube_text": "long text. feed snippet",
//     "youtube_url": "url"
// }
app.post("/youtube", (req, res) => {
  const insertQuery = "INSERT INTO youtube_collection SET ?";
  db.query(insertQuery, req.body, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send("video added to youtube_collection table");
    }
  });
});
app.get("/youtube", (req, res) => {
  db.query("SELECT * FROM youtube_collection ORDER BY id DESC LIMIT 3", (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});


// ! get request for latest bg img
app.get("/bgImg", (req, res) => {
  db.query("SELECT img_url FROM img_collection ORDER BY id DESC LIMIT 1", (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});

// POST request for book_reviews table
// {
//     "book_title": "title",
//     "book_review": "review",
//     "book_rating": 0
// }
app.post("/reviews", (req, res) => {
  const insertQuery = "INSERT INTO book_reviews SET ?";
  db.query(insertQuery, req.body, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send("Review Added to Database");
    }
  });
});


// PUT request for book_reviews table
// allows book_review and book_rating to be changed
app.put("/reviews", (req, res) => {
  const updateQuery =
    "UPDATE book_reviews SET book_review = ?, book_rating = ? WHERE id = ?";
  db.query(
    updateQuery,
    [req.body.book_review, req.body.book_rating, req.body.id],
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send(result);
      }
    }
  );
});

// DELETE request for book_reviews table
// deletes according to id
app.delete("/reviews/:id", (req, res) => {
  db.query(
    "DELETE FROM book_reviews WHERE id = ?",
    req.params.id,
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send(result);
      }
    }
  );
});

// console log after connection to db
const listener = app.listen(process.env.PORT || 3000, () => {
    console.log('App is listening on port ' + listener.address().port)
})
