const db = require("./conn");

class ExecutiveList {
    constructor(Name, Address, Category){
        this.Name = Name;
        this.Address = Address;
        this.Category = Category;
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