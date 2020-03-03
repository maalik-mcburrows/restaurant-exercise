
const options = {
    host: 'localhost', 
    database: 'restaurant'
};

const pgp = require("pg-promise")({
    query: function(e) {
        console.log("QUERY: ", e.query);
    }
});

const db = pgp(options);

module.exports = db;