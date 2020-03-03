const express = require("express"),
    router = express.Router(),
    ceoModel = require("../models/ceoModel");


router.get("/:id?", async (req, res) => {
    const { id } = req.params;
    let executiveData = [];

    if (!!id) {
        executiveData = await ceoModel.getById(id);
    }   else   {
        executiveData = await ceoModel.getAll();
    }
    res 
        .render("template", {
            locals: {
                title: "Restaurants",
                arrayOfData: executiveData
            },
            partials: {
                partial: "partial-ceos"
            }
        });
});

module.exports = router;