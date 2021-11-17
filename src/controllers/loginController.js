import database from "../database/index.js"
import bcrypt, { hash } from "bcrypt"
import jwt from "jsonwebtoken"

class LoginController{
    async store(request, response){
        const {matricula, senha} = request.body
        try{
            const data = await database("matricula").where("matricula", "=", matricula).first()

            if(!data){
                response.status(404).json("não existe matrícula")
                return
            }
            const senha_verdadeira = await bcrypt.compare(senha, data.senha)
            if(!senha_verdadeira){
                response.status(401).json("senha incorreta")
                return
            }
            const token = jwt.sign({
                id: data.id
            },
            process.env.SECRET,
            {
                expiresIn: 900
            })
            response.json(token)
        }catch(error){
            console.log(error)
            response.status(400).json("erro do servidor")
        }
    }
}

export default LoginController