import vine, {errors} from "@vinejs/vine";
import { patientSchema } from "../validations/PatientValidation.js";
import { patientSearchSchema } from "../validations/PatientSearchValidation.js";
import prisma from "../DB/db.config.js";
import { createInputDetailsPayload, createInputOutputDetailMappingPayload, createPatientPayload } from "../utils/helper.js";
import { getInputDetails } from "../models/inputDetail.js";
import { checkUserPatient } from "../models/patient.js";
import { getLogs } from "../models/inputOutputPatientMapping.js";

export default class PatientController {

    static async show(req, res) {
        try{
            const user = req.user;
            const body = req.query;
            const validator = vine.compile(patientSearchSchema);
            const payload = await validator.validate(body);
            const patient = await checkUserPatient(user, payload);
            if(!patient) return res.status(404).json({message: "Patient not found"});
            const logs = await getLogs(patient.id);
            return res.status(200).json({message: "Logs found", logs});
        }
        catch(error){
            console.log(error);
            if(error instanceof errors.E_VALIDATION_ERROR) {
                res.status(400).json({errors: error.messages});
            }
            else{
                res.status(500).json({message: "Something went wrong, Please try again later."});
            }
        }
    }

    static async store(req, res){
        try{
            const user = req.user;
            const body = req.body;
            const validator = vine.compile(patientSchema);
            const payload = await validator.validate(body);
            
            const patient_payload = createPatientPayload(payload);
            const input_details_payload = createInputDetailsPayload(payload);
            patient_payload.user_id = user.id;

            let patient = await prisma.patients.findUnique({
                where: { 
                    email: payload.email
                }
            })
            if(!patient) {
                patient = await prisma.patients.create({data:patient_payload});
            }
            else {
                //update patient
                patient = await prisma.patients.update({
                    where: { 
                        email: payload.email
                    },
                    data: {age: patient_payload.age}
                })
            }
            const inputDetail = await getInputDetails(input_details_payload);
            //const outputDetail = await getOutputDetails(inputDetail);
            const inputOutputPatientMappings_payload = createInputOutputDetailMappingPayload(patient, inputDetail);
            await prisma.inputOutputPatientMappings.create({data:inputOutputPatientMappings_payload});
            delete inputDetail.created_at;
            delete inputDetail.updated_at;
            return res.status(200).json({message: "patient created successfully", patient, inputDetail});
        }
        catch(error){
            console.log(error);
            if(error instanceof errors.E_VALIDATION_ERROR) {
                res.status(400).json({errors: error.messages});
            }
            else{
                res.status(500).json({message: "Something went wrong, Please try again later."});
            }
        }
    }

    static async update(){
        
    }

    static async destroy(){
        
    }
}
