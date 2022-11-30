import database from "../database/index.js"

class DiagramaDisciplinaController{
    async index(request, response){
        // const semestreAtual = new Date().getFullYear() + "." + new Date().getMonth()>6 ?2:1
        const disciplinas = await database.select('disciplina.*', 'estrutura_curricular.semestre').table("matricula")
            .join('curso', 'curso.codigo_curso', 'matricula.curso')
            .join('estrutura_curricular', 'estrutura_curricular.codigo_curso', 'curso.codigo_curso')
            .join('disciplina', 'disciplina.codigo_disciplina', 'estrutura_curricular.codigo_disciplina')
            .where('matricula.id', request.userID)

            const preRequisitos = await database.select('pre_req.*', 'disciplina.nome').table("matricula")
            .join('curso', 'curso.codigo_curso', 'matricula.curso')
            .join('estrutura_curricular', 'estrutura_curricular.codigo_curso', 'curso.codigo_curso')
            .join('disciplina', 'disciplina.codigo_disciplina', 'estrutura_curricular.codigo_disciplina')
            .join('pre_req', 'pre_req.codigo_requisito', 'disciplina.codigo_disciplina')
            .where('matricula.id', request.userID)

            const desempenho = await database.select('desempenho.*').table("desempenho")
            .join('matricula', 'desempenho.matricula', 'matricula.matricula')
            .where('matricula.id', request.userID)

            let ligacoesDisciplinas = []
            let semestres = []
            const modelsDisciplinas = disciplinas.map(function(disciplina){
                if(!semestres[disciplina.semestre]){
                    semestres[disciplina.semestre] = []
                }
                semestres[disciplina.semestre] = [disciplina, ...semestres[disciplina.semestre]]
                const ypos = (disciplina.semestre * 200) + 500
                const xpos = (semestres[disciplina.semestre].length * 200) + -500
                const cor = getStatusDisciplina(desempenho, disciplina)
                return {
                key: disciplina.nome, color: cor, loc: `${xpos} ${ypos}`, text: disciplina.nome
                }
            })

            disciplinas.forEach(disciplina => {
                ligacoesDisciplinas = [...ligacoesDisciplinas, ...preRequisitos.filter(preRequisito =>{
                    if(preRequisito.codigo_disciplina === disciplina.codigo_disciplina){
                        return true
                    }
                    return false
                }).map((preRequisito, key) => {
                    return {
                        from: preRequisito.nome, to: disciplina.nome, fromEndSegmentLength: 25 - key, toEndSegmentLength: 0
                    }
                })]
            });
        response.json({
            modelsDisciplinas, ligacoesDisciplinas
        })
    }
}

function getStatusDisciplina(desempenhos, disciplina){
    const desempenho = desempenhos.find(desempenho => desempenho.codigo_disciplina == disciplina.codigo_disciplina)
    if(!desempenho){
        return "gray"
    }
    const desempenhoSemestre = desempenho.semestre.split(".")
    const semestre = new Date().getMonth()>6?2:1
    if(desempenhoSemestre[0] < new Date().getFullYear && desempenhoSemestre[1] == semestre){
        return "lightblue"
    }
    return "lightgreen"
}

export default DiagramaDisciplinaController