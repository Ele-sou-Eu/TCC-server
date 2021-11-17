import database from "../database/index.js"
import bcrypt from "bcrypt"

class LoginController{
    async show(request, response){
        const {matricula, senha} = request.query
        try{
            const data = await database("matricula").where("matricula", "=", matricula).first()
            console.log(data)
            if(data === null){
                response.json("não existe matrícula")
                return
            }
            const senha_verdadeira = await bcrypt.compare(senha, data.senha)
            if(!senha_verdadeira){
                response.json("senha incorreta")
                return
            }
        }catch(error){
            console.log(error)
            response.json("erro do servidor")
        }
        // response.json(data)
        response.json(true)
    }
}

export default LoginController