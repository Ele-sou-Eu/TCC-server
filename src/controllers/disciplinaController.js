import database from "../database/index.js"

class DisciplinaController{
    async index(request, response){
        const data = await database.select('disciplina.*', 'estrutura_curricular.semestre').table("matricula")
            .join('curso', 'curso.codigo_curso', 'matricula.curso')
            .join('estrutura_curricular', 'estrutura_curricular.codigo_curso', 'curso.codigo_curso')
            .join('disciplina', 'disciplina.codigo_disciplina', 'estrutura_curricular.codigo_disciplina')
            .where('matricula.id', request.userID)
        response.json(data)
    }
}

export default DisciplinaController