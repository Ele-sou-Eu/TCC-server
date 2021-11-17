import express, {request} from "express"
import CursoController from "./controllers/cursoController.js"
import LoginController from "./controllers/loginController.js"
import RegisterController from "./controllers/registerController.js";
import DisciplinaController from "./controllers/disciplinaController.js";

import verifyJWT from "./middleware/verifyJWT.js";

const routes = express.Router();

routes.get('/', (req, res) => {
    res.json()
})
routes.get('/cursos', (new CursoController).index)
routes.post('/login', (new LoginController).store)
routes.post('/cadastro', (new RegisterController).store)
routes.get('/disciplinas', verifyJWT, (new DisciplinaController).index)

export default routes