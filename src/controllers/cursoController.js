import database from "../database/index.js"

class CursoController{
    async index(request, response){
        const data = await database.select().table("curso")
        response.json(data)
    }
}

export default CursoController