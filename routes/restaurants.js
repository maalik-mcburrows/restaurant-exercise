const express = require("express"),
    router = express.Router(),
    restaurantModel = require("../models/restaurantModel");


router.get("/:id?", async (req, res) => {
    const { id } = req.params;
    let executiveData = [];

    if (!!id) {
        executiveData = await restaurantModel.getById(id);
    }   else   {
        executiveData = await restaurantModel.getAll();
    }
    res 
        .render("template", {
            locals: {
                title: "Restaurants",
                arrayOfData: executiveData
            },
            partials: {
                partial: "partial-restaurant"
            }
        });
});

module.exports = router;