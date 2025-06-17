class Personajes {
  const fuerza
  const inteligencia
  var property rol
  method potencialOfensivo(){
    return fuerza * 10 + rol.extra()
  }
  method esGroso(){
    return self.esInteligente() || rol.esGroso(self) //paso el personaje como parametro
  }
  method esInteligente() //al hacer un metodo abstracto la clase se vuelve abstracta lo que significa que no se pueden generar instancias de esa clase (no se puede hacer un new Personaje(...))
}

class Orco inherits Personajes {
  override method esInteligente(){
    return false
  }
  override method potencialOfensivo(){
    return
    if(rol == brujo){
      super() * 1.1
    }
    else{
      super()
    }
  }
}

class Humano inherits Personajes {
  override method esInteligente(){
    return inteligencia > 50
  }
}
 
object guerrero {
  method extra(){
    return 100
  }
  method esGroso(unPersonaje){
    return unPersonaje.fuerza() > 50
  }
}

class Cazador {
  const property mascota
  method extra() {
    return mascota.extra()
  }
  method esGroso(unPersonaje){
    return mascota.esLongeva()
  }
}

class Mascota {
  const property fuerza
  var edad
  method cumplirAños(){
    edad += 1
  }
  const property tieneGarras
  method extra() {
    if(tieneGarras){
      return fuerza * 2
    }
    else{
      return fuerza
    }
  }
  method esLongeva(){
    return edad > 10
  }
}

object brujo {
  method extra() {
    return 0
  }
  method esGroso(unPersonaje){
    return true
  }
}
class Localidad {
  var ejercito
  method ejercito(){
    return ejercito
  }
  method desalojar(){
    ejercito.clear()
  }
  method poderDefensivo(){
    return ejercito.potencialOfensivo()
  }
  method serOcupada(unEjercito){
    ejercito = unEjercito
  }
}
class Aldea inherits Localidad {
  const cantidadMaximaHabitantes
  override method serOcupada(unEjercito){
    if(unEjercito.personajes().size() > cantidadMaximaHabitantes){
      ejercito = unEjercito.ejercitoMasFuerte()
    }
  }
}

class Ciudad inherits Localidad {
  override method poderDefensivo(){
    return super() + 300
  }
}

class Ejercito {
  const property personajes = []
  method atacar(unaLocalidad){
    if(self.puedeTomar(unaLocalidad)){
      unaLocalidad.desalojar()
      unaLocalidad.serOcupada(personajes)
    }
  }
  method potencialOfensivo(){
    return personajes.sum({c=>c.potencialOfensivo()})
  }
  method puedeTomar(unaLocalidad){
    return self.potencialOfensivo() > unaLocalidad.poderDefensivo()
  }
  method ejercitoMasFuerte() {
    return self.masPoderosos().take(10)
  }
  method masPoderosos(){
    return personajes.sortBy({p1, p2 => p1.potencialOfensivo() > p2.potencialOfensivo()}) //ordena la lista personaje con los de mayor potencial como primeros elementos
  }
}