import express, {request} from "express"
import CursoController from "./controllers/cursoController.js"
import LoginController from "./controllers/loginController.js"
import RegisterController from "./controllers/registerController.js";
import DisciplinaController from "./controllers/disciplinaController.js";
import RequisitoController from "./controllers/requisitoController.js"
import SemestreController from "./controllers/semestreController.js";
import DiagramaDisciplinaController from "./controllers/diagramaDisciplinaController.js";

import verifyJWT from "./middleware/verifyJWT.js";

const routes = express.Router();

routes.get('/', (req, res) => {
    res.json()
})
routes.get('/cursos', verifyJWT, (new CursoController).index)
routes.post('/login', (new LoginController).store)
routes.post('/cadastro', (new RegisterController).store)
routes.get('/disciplinas', verifyJWT, (new DisciplinaController).index)
routes.get('/pre-requisitos', verifyJWT, (new RequisitoController).index)
routes.get('/semestre', verifyJWT, (new SemestreController).index)
routes.get('/disciplinas/diagrama', verifyJWT, (new DiagramaDisciplinaController).index)

export default routes