const db = require("./conn");

class ExecutiveList {
    constructor(id, name, category, distance, stars, fav_dish, does_takeout, prev_trip){
        this.id = id;
        this.name = name;
        this.address = address;
        this.category = category;
        this.distance = distance;
        this.stars = stars;
        this.fav_dish = fav_dish;
        this.does_takeout = does_takeout;
        this.prev_trip = prev_trip;
    }
  
    static async getAll() {
        try{
            const response = await db.any(`SELECT * FROM restaurant;`);
            console.log(response);
            return response;
        } catch(error) {
            console.error("ERROR:", error);
            return error;
        }
    }

    static async getById(id) {
        try {
            const response = await db.any(`SELECT * FROM restaurant WHERE id = ${id};`);
            console.log(response);
            return response;
        }   catch(error) {
            console.error("ERROR:", error);
            return error;
        }
    }
};


module.exports = ExecutiveList;


