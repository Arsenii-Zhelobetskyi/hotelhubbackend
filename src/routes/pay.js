const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/:reservation_id", async (req, res) => {
    // const { reservation_id } = req.params;
    // console.log(reservation_id);
    // const data = await prisma.reservation.findMany(
    //     { where: { reservation_id: parseInt(reservation_id) } });
    // res.json(data);
    // console.log(data);
});


module.exports = router;