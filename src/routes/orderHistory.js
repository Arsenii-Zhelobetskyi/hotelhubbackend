const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/:user_id", async (req, res) => {
    const { user_id } = req.params;
    console.log(user_id);
    const data = await prisma.order_history.findMany(
        { where: { user_id: parseInt(user_id) } });
    res.json(data);
    console.log(data);
});


module.exports = router;
