const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/:id", async (req, res) => {
    const { user_id } = req.params;
    if (!user_id) {
        return res.status(400).json({ error: "Missing user_id parameter" });
    }

    const data = await prisma.order_history.findMany({ where: { user_id: parseInt(req.params.user_id) } });
    res.json(data);
});


module.exports = router;
