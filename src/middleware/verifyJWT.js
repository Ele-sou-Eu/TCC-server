import jwt from "jsonwebtoken"

function verifyJWT(request, response, next){
    const token = request.headers['x-access-token']
    if(!token || token.length < 10){
        return response.status(404).json('Token não enviado.')
    }
    jwt.verify(token, process.env.SECRET, function(error, decoded){
        console.log(error)
        if(error){
            return response.status(401).json('Token Inválido.')
        }
        request.userID = decoded.id
        next();
    })
}

export default verifyJWT