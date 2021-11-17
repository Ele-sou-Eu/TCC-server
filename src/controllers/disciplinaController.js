import database from "../database/index.js"

class DisciplinaController{
    async index(request, response){
        const data = await database.select('disciplina.*').table("matricula")
            .join('curso', 'curso.codigo_curso', 'matricula.Curso')
            .join('estrutura_curricular', 'estrutura_curricular.Código_curso', 'curso.codigo_curso')
            .join('disciplina', 'disciplina.Código_disciplina', 'estrutura_curricular.Código_disciplina')
            .where('matricula.id', request.userID)
        response.json(data)
    }
}

export default DisciplinaController