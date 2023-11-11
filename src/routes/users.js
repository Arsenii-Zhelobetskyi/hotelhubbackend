/* const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

class UserService {
  //класи запропонував ДЖПТІШКА, по суті хз можна відразу робить у index js різні шляхи  й там долбіть прізму, але хз
  async createUser(data) {
    const user = await prisma.user.create({
      data,
    });
    return user;
  }

  async getUserById(id) {
    const user = await prisma.user.findUnique({
      where: { id },
    });
    return user;
  }

  async getAllUsers() {
    const users = await prisma.user.findMany();
    return users;
  }
}

const userInstance = new UserService();

module.exports = userInstance;
 */
const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/", async (req, res) => {
  const users = await prisma.user.findMany();
  res.json(users);
});
router.get("/user/:id", async (req, res) => {
  const user = await prisma.user.findUnique({
    where: { id: parseInt(req.params.id) },
  });
  res.json(users);
});
router.get("/create", async (req, res) => {
  const user = await prisma.user.create({
    data: req.body,
  });
  res.json(user);
});

module.exports = router;
