const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/:id", async (req, res) => {
  const data = await prisma.hotels_comments.findMany({
    take: 5,
    where: {
      hotel_id: parseInt(req.params.id),
    },
  });
  res.json(data);
});
module.exports = router;
