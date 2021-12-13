import database from "../database/index.js"

class SemestreController{
    async index(request, response){
        const data = await database.select('estrutura_curricular.semestre').table('estrutura_curricular')
        .join('curso', 'curso.codigo_curso', 'estrutura_curricular.codigo_curso')
        .join('matricula', 'matricula.curso', 'curso.codigo_curso')
        .where('matricula.id', request.userID)
        response.json(data)
    }
}

export default SemestreController