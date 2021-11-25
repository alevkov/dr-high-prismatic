import { PrismaClient, Prisma } from '@prisma/client'
import { create } from 'domain'
const prisma = new PrismaClient()

let drug: Prisma.SubstanceCreateInput = {
  primary_name: "Methamphetamine",
  primary_form: "Crystal",
  names: {
    createMany: {
      data: [
        {name: "Crystal"},
        {name: "Meth"},
        {name: "Desoxyn"},
        {name: "Ice"},
        {name: "Methedrine"}
      ]
    }
  },
  type: 'Stimulants',
  toxicities: ['Neural'],
  forms: ['Crystal', 'Pill'],
  interactions: {
    "": ""
  },
  cross_tolerances: {
    "": ""
  },
  summary: 'A dopaminergic-noradrenergic stimulant of the Amphetamine class.',
  addiction_potential: 5,
  chemicals: {
    create: [
      { 
        chemical: { 
          create: {
            name: "N-methylamphetamine",
            isomer: "(dl)-Methamphetamine",
            salt: "hydrochloride",
            formula: "C10H15N",
          }
        },
      },
    ]
  },
  roas: {
    create: [
      {
        dose: { 
          create: { 
            threshold: 		{ "v": 0, "u": 0 },
            heavy: 				{ "v": 0, "u": 0 },
            common: 			{"mn": 0, "mx": 0, "u": "" },
            weak: 				{"mn": 0, "mx": 0, "u": "" },
            strong: 			{"mn": 0, "mx": 0, "u": "" },
          }
        },
        duration: {
          create: {
              afterglow: 	{"mn": 0, "mx": 0, "u": "" },
              comeup: 		{"mn": 0, "mx": 0, "u": "" },
              duration:  	{"mn": 0, "mx": 0, "u": "" },
              offset:    	{"mn": 0, "mx": 0, "u": "" },
              onset:     	{"mn": 0, "mx": 0, "u": "" },
              peak:      	{"mn": 0, "mx": 0, "u": "" },
              total:     	{"mn": 0, "mx": 0, "u": "" },
          }
        },
        bioavailability: 	{"mn": 0, "mx": 0, "u": "" },
        half_life: 				{"mn": 0, "mx": 0, "u": "" }
      }
    ]
  }
}

async function main() {
    const result = await prisma.substance.create({ data: drug });
    console.log(result);
}

main()
  .catch((e) => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })