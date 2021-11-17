import express, {request} from "express"
import CursoController from "./controllers/cursoController.js"
import LoginController from "./controllers/loginController.js"
import RegisterController from "./controllers/registerController.js";

const routes = express.Router();

routes.get('/', (req, res) => {
    res.json()
})
routes.get('/cursos', (new CursoController).index)
routes.get('/login', (new LoginController).show)
routes.post('/cadastro', (new RegisterController).store)

export default routes