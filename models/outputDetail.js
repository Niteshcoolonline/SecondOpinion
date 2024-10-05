import prisma from "../DB/db.config.js"
export const getOutputDetails = async (inputDetail) => {
    return await prisma.outputDetails.findUnique({
        where: {
            input_detail_id: inputDetail.id,
      },
    });
}