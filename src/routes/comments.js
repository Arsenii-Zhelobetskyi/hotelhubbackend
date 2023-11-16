const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/", async (req, res) => {
  const data = await prisma.hotels_comments.findMany({
    take: 10,
  });
  res.json(data);
});
module.exports = router;
