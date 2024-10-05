import {Router} from "express"
import AuthController from "../controllers/AuthController.js";
import PatientController from "../controllers/PatientController.js";
import authMiddleware from "../middleware/Authenticate.js";

const router = Router();

router.post("/auth/register", AuthController.register)
router.post("/auth/login", AuthController.login)

//patient routes
router.post("/patient", authMiddleware, PatientController.store)
router.get("/patient", authMiddleware, PatientController.show)

export default router;