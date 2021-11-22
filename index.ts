const path = require('path')
require('dotenv').config({ path: path.resolve(__dirname, 'prisma.env') })

import { PrismaClient } from '@prisma/client'
import bcrypt from 'bcrypt';

const prisma = new PrismaClient()

async function main() {
  const admin = await prisma.users.findUnique({where: {email: "lex@drugsand.me"}});
  console.log(admin)

  console.log(bcrypt.compareSync("shadow", admin?.password_hash!));
}

main()
  .catch((e) => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })