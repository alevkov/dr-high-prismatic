import { PrismaClient, Prisma } from '@prisma/client'
import { create } from 'domain'
const prisma = new PrismaClient()

let user: Prisma.UserCreateInput = {
    email: 'alevkov@pm.me',
    password_hash: 'shadow',
    username: 'sarpahara',
    biometrics: {
        create: {
            sex: "Male",
            weight: 73,
            height: 181
        }
    },
    birthday: '1995-07-14'
}

async function main() {
    prisma.user.create({ data: user });
}

main()
  .catch((e) => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })