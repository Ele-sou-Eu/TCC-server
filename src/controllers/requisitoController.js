import database from "../database/index.js"

class RequisitoController{
    async index(request, response){
        const data = await database.select('pre_req.*', 'disciplina.Nome').table("matricula")
        .join('curso', 'curso.codigo_curso', 'matricula.Curso')
        .join('estrutura_curricular', 'estrutura_curricular.Código_curso', 'curso.codigo_curso')
        .join('disciplina', 'disciplina.codigo_disciplina', 'estrutura_curricular.Código_disciplina')
        .join('pre_req', 'pre_req.codigo_requisito', 'disciplina.codigo_disciplina')
        .where('matricula.id', request.userID)
        response.json(data)
    }
}

export default RequisitoController