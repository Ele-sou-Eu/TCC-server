import database from "../database/index.js"
import bcrypt from "bcrypt"
import CursoController from "./cursoController.js"

class RegisterController{
    async store(request, response){
        const {matricula, senha} = request.body
        const senha_crypt = await bcrypt.hash(senha, 10)
        try{
            const trx = await database.transaction()
        await trx("matricula").insert({
            matricula,
            senha: senha_crypt,
            Cpf_aluno: "07639173469",
            Curso: "1",
            Semestre_entrada: "2021-2"
        })
        await trx.commit()
        }catch(error){
            response.status(400).json(error)
        }
        response.json(true)
    }
}

export default RegisterController