import {PrismaClient} from "@prisma/client"

const prisma = new PrismaClient({
    log: ["query", "error"],
})

const testConnection = async () => {
    try {
        // Run a simple query to check the connection
        await prisma.$connect();
        console.log('Database connected successfully!');
        
        // Optionally, try a simple query (e.g., count rows in a table)
        const count = await prisma.inputDetails.count();
        console.log(`Number of records in inputDetails: ${count}`);
        
    } catch (error) {
        console.error('Database connection failed:', error);
    } finally {
        await prisma.$disconnect();
    }
};

testConnection();

export default prisma;
