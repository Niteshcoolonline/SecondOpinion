import prisma from "../DB/db.config.js"
export const checkUserPatient = async (user, payload) => {
    if(payload.email){
        return await prisma.patients.findUnique({
            where: {
                user_id: user.id,
                email: payload.email    
            },
        });
    }
    else{
        console.log("payload", payload)
        return await prisma.patients.findUnique({
            where: {
                user_id: user.id,
                phone: JSON.stringify(payload.phone)
            },
        });
    }
}