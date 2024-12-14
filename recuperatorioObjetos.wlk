class Mago {
  const nombre = ""
  var poderInnato = 0
  var resistenciaMagica = 0
  var energiaMagica = 0
  var categoria = null
  var objetosMagicos = []

  method esVencidoPor(poderAtacante) {
    return categoria.esVencidoPor(poderAtacante, resistenciaMagica)
  }

  method perderEnergia(atacante) {
    return categoria.perderEnergia(self)
  }
   method poderTotal() {
    var poderObjetos = objetosMagicos.sum({ obj => obj.poder(self) })
    return poderObjetos * poderInnato
  }
  method desafiar(oponente) {
  if (oponente.esVencidoPor(poderTotal())) {
    energiaMagica = energiaMagica + oponente.perderEnergia(self)
  }
}
}

object categoriaAprendiz {
  method esVencidoPor(poderAtacante, resistenciaMagica) {
    return poderAtacante > resistenciaMagica
  }

  method perderEnergia(mago) {
    mago.energiaMagica -= mago.energiaMagica / 2
    return mago.energiaMagica / 2
  }
}

object categoriaVeterano {
  method esVencidoPor(poderAtacante, resistenciaMagica) {
    return poderAtacante >= resistenciaMagica * 1.5
  }

  method perderEnergia(mago) {
    mago.energiaMagica -= mago.energiaMagica / 4
    return mago.energiaMagica / 4
  }
}

object categoriaInmortal {
  method esVencidoPor(poderAtacante, resistenciaMagica) {
    return false 
  }

  method perderEnergia(mago) {
    return 0 
  }
}

  class ObjetoMagico {
  method poder(mago)
}
class Varita inherits ObjetoMagico {
  const poderBase = 0

 override method poder(mago) {
    return if (mago.nombre.size % 2 == 0) poderBase * 1.5 else poderBase
  }
}

class TunicaComun inherits ObjetoMagico {
 override method poder(mago) {
    return mago.resistenciaMagica * 2
  }
}

class TunicaEpica inherits ObjetoMagico {
 override method poder(mago) {
    return mago.resistenciaMagica * 2 + 10
  }
}

class Amuleto inherits ObjetoMagico {
 override method poder(mago) {
    return 200
  }
}

class OjotaMagica inherits ObjetoMagico {
 override method poder(mago) {
    return mago.nombre.size * 10
  }
}

class Gremio {
  var miembros = []

  method poderTotal() {
    return miembros.sum({ miembro => miembro.poderTotal() })
  }
  method resistenciaMagicaTotal() {
    return miembros.sum({ miembro => miembro.resistenciaMagica() }) + lider().resistenciaMagica()
  }
  method energiaMagicaTotal() {
    return miembros.sum({ miembro => miembro.energiaMagica() })
  }
  method lider() {}

}