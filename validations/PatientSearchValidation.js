import vine from "@vinejs/vine";
import { CustomErrorReporter } from "./CustomErrorReporter.js";

vine.errorReporter = () => new CustomErrorReporter()

export const patientSearchSchema = vine.object({
    email: vine.string().email().optional(),
    phone: vine.number().withoutDecimals().optional(),
})