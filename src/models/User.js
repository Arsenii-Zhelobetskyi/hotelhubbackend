const { PrismaClient } = require("@prisma/client");

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
