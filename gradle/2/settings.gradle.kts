pluginManagement {
    plugins {
        id("org.jetbrains.kotlin.jvm") version "1.3.71"
        id("org.ajoberstar.reckon") version "0.12.0"
        id("com.github.ben-manes.versions") version "0.28.0"
        id("io.gitlab.arturbosch.detekt") version "1.7.2"
    }
}

rootProject.name = "template"

include("core")
