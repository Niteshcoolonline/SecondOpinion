import prisma from "../DB/db.config.js";
import vine, {errors} from "@vinejs/vine";
import { loginSchema, registerSchema } from "../validations/AuthValidation.js";
import bcrypt from "bcryptjs"
import jwt from "jsonwebtoken";

export default class AuthController {
    static async register(req, res) {
        try{
            const body = req.body;
            console.log(body)
            const validator = vine.compile(registerSchema)
            const payload = await validator.validate(body);

            //check if email exists
            const findUser = await prisma.users.findUnique({
                where: { 
                    email: payload.email
                }
            })
            if(findUser){
                res.status(400).json({errors: {
                    email: "Email already exists, Please use another email address"
                }})
            }

            const salt = bcrypt.genSaltSync(10);
            payload.password = bcrypt.hashSync(payload.password, salt)
            const user = await prisma.users.create({
                data: payload
            })

            return res.status(200).json({message: "User created successfully", user})
        }
        catch(error){
            if(error instanceof errors.E_VALIDATION_ERROR) {
                res.status(400).json({errors: error.messages});
            }
            else{
                res.status(500).json({message: "Something went wrong, Please try again later."});
            }
        }
    }

    static async login(req, res) {
        try{
            const body = req.body;
            const validator = vine.compile(loginSchema);
            const payload = await validator.validate(body);

            const findUser = await prisma.users.findUnique({
                where: { 
                    email: payload.email
                }
            })

            if(findUser){
                if(!bcrypt.compareSync(payload.password, findUser.password)){
                    return res.status(400).json({errors: {
                        email: "Invalid Credentials",
                    }});
                }
                // Generate token to user
                const payloadData = {
                    id: findUser.id,
                    name: findUser.name,
                    email: findUser.email,
                    profile: findUser.profile
                }
                const token = jwt.sign(payloadData, process.env.JWT_SECRET, {expiresIn: "365d"})

                return res.status(200).json({message: "Login successful", access_token: `Bearer ${token}`})
            }

            return res.status(400).json({errors: {
                email: "No user found"
            }});
        }
        catch(error){
            if(error instanceof errors.E_VALIDATION_ERROR) {
                res.status(400).json({errors: error.messages});
            }
            else{
                res.status(500).json({message: "Something went wrong, Please try again later."});
            }
        }
        
    }
}
