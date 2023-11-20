const express = require("express");
const { PrismaClient } = require("@prisma/client");
const jwt= require("jsonwebtoken");

const prisma = new PrismaClient();
const router = express.Router();
const secretKey = "OJqijsijdlj";
router.post("/login", async (req, res) => {
  const { email, password } = req.body;
  try {
    console.log(email, password);
    const user = await prisma.user.findUnique({
      where: { email },
    });

    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    if (user.password === password) {
      const token = jwt.sign({ email: user.email }, secretKey);
      res.status(200).json({ email, token });
    } else {
      res.status(401).json({ error: "Wrong password" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

module.exports = router;
