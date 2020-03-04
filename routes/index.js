

const express = require("express"),
    router = express.Router();

// const rootController = (req, res) => {
//     const snippet = "<h1>Hello World</h1>"
//     res 
//         .status(200)
//         .send(snippet)
//         .end();
// }

router.get("/", (req, res, next) => {
    const snippet = "<h1>Hello Mars</h1>";
    res.render("template", {
       locals: {
           title: snippet
       },
       partials: {
           partial: "partial-index"
       } 
    });
});

module.exports = router;