const express = require("express"),
    es6Renderer = require("express-es6-template-engine"),
    app = express();

app.engine("html", es6Renderer);
app.set("views", "views");
app.set("view engine", "html");

app.listen(3344, function(){
    console.log("Server running on port 3344")
});

const rootController = require("./routes/index"),
    restaurantsController = require("./routes/ceos");


app.use("/", rootController);
app.use("/ceos", restaurantsController);
