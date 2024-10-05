import prisma from "../DB/db.config.js"

export const getInputDetails = async (input_details_payload) => {
    switch (true){
        case input_details_payload.age <= 30:
            input_details_payload.age = 25
            break;
        case input_details_payload.age <= 40:
            input_details_payload.age = 35
            break;
        case input_details_payload.age <= 50:
            input_details_payload.age = 45
            break;
        case input_details_payload.age <= 60:
            input_details_payload.age = 55
            break;
        case input_details_payload.age <= 70:
            input_details_payload.age = 65
            break;
        case input_details_payload.age > 70:
            input_details_payload.age = 75
            break;
    }
    const inputDetail =  await prisma.inputDetails.findFirst({ 
        where : {
            disease: input_details_payload.disease,
            sub_disease: input_details_payload.sub_disease,
            bio_markers: input_details_payload.bio_markers,
            age: input_details_payload.age,
            gender: input_details_payload.gender,
            race: input_details_payload.race,
        }
    }); 
    return inputDetail;
}