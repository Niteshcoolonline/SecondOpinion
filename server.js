import express from "express"
import "dotenv/config"
import cors from "cors"
const app = express()
const port = process.env.PORT || 3001

app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cors())

app.get("/", (req, res) =>{
    res.json({message: "Hello world!"})
})

import ApiRoutes from "./routes/api.js";
app.use("/api", ApiRoutes);

app.listen(port, () => console.log("Server listening on: " + port));