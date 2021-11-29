import database from "../database/index.js"

class SemestreController{
    async index(request, response){
        const data = await database.select()
        // const data = await database.select('pre_req.*', 'disciplina.nome').table("matricula")
        // .join('curso', 'curso.codigo_curso', 'matricula.curso')
        // .join('estrutura_curricular', 'estrutura_curricular.codigo_curso', 'curso.codigo_curso')
        // .join('disciplina', 'disciplina.codigo_disciplina', 'estrutura_curricular.codigo_disciplina')
        // .join('pre_req', 'pre_req.codigo_requisito', 'disciplina.codigo_disciplina')
        // .where('matricula.id', request.userID)
        response.json(data)
    }
}

export default SemestreController