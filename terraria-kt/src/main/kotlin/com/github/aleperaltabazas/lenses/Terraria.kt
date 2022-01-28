package com.github.aleperaltabazas.lenses

import arrow.optics.Lens
import arrow.optics.optics

@optics
data class Personaje(
    val nombre: String,
    val gafas: Gafas,
    val ropa: Ropa,
) {
    companion object
}

@optics
data class Ropa(
    val superior: String,
    val inferior: String,
    val calzado: String,
    val sombrero: String,
) {
    companion object
}

@optics
data class Gafas(
    val armazon: Armazon,
    val lentes: Lentes,
    val decoracion: Decoracion,
) {
    companion object
}

@optics
data class Lentes(
    val material: Material,
    val graduacion: Double,
) {
    companion object
}

enum class Armazon {
    HIERRO,
    ORO,
    PLATA,
}

enum class Decoracion {
    RUBI,
    ZAFIRO,
    ESMERALDA,
}

enum class Material {
    CRISTAL,
    VIDRIO,
    POLIMERO,
}

val graduacionPersonajeLens = Personaje.gafas compose Gafas.lentes compose Lentes.graduacion

val robert = Personaje(
    nombre = "Roberto",
    ropa = Ropa(
        superior = "Remera roja",
        inferior = "Jean azul",
        calzado = "Ojotas cancheras",
        sombrero = "Gorro de navidad",
    ),
    gafas = Gafas(
        armazon = Armazon.HIERRO,
        decoracion = Decoracion.ESMERALDA,
        lentes = Lentes(
            material = Material.POLIMERO,
            graduacion = 0.25,
        )
    )
)

val gafasLens = Lens(
    get = { p: Personaje -> p.gafas },
    set = { p: Personaje, g: Gafas -> p.copy(gafas = g) },
)

val lentesLens = Lens(
    get = { g: Gafas -> g.lentes },
    set = { g: Gafas, l: Lentes -> g.copy(lentes = l ) },
)

val graduacionLens = Lens(
    get = { l: Lentes -> l.graduacion },
    set = { l: Lentes, g: Double -> l.copy(graduacion = g) },
)

fun main() {
    val graduacion = graduacionPersonajeLens.get(robert)
    val nuevoRobert = graduacionPersonajeLens.set(robert, 2.0)

}
