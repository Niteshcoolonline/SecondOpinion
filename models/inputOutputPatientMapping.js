import prisma from "../DB/db.config.js";

export const getLogs = async (patientId) => {
    return await prisma.inputOutputPatientMappings.findMany({
        where: {
            patient_id: patientId
        },
        select: {patient: {select: {
            age: true,
            email: true,
            gender: true,
            phone: true,
            race: true,
            first_name: true,
            last_name: true,
        }}, input_detail: {
            select: {
            ae: true,
            ae_management: true,
            alternate_drug: true,
            guideline_link: true,
            preferred_drug: true,
            payer_pathway: true,
            overall_survival: true
        }}},
        orderBy: {
            id: 'desc',
        },
    });
}