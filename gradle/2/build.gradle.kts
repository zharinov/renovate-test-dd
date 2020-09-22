import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    id("org.jetbrains.kotlin.jvm")
    id("org.ajoberstar.reckon")
    id("com.github.ben-manes.versions")
    id("io.gitlab.arturbosch.detekt")
}

group = "com.github.jcornaz"

reckon {
    scopeFromProp()
    stageFromProp("alpha", "beta", "rc", "final")
}

allprojects {
    repositories {
        mavenCentral()
        jcenter()
        maven { url = uri("https://dl.bintray.com/kwik/preview") }
    }
}

subprojects {
    apply(plugin = "org.jetbrains.kotlin.jvm")

    dependencies {
        implementation(kotlin("stdlib"))
        testImplementation(kotlin("test"))

        implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.3.5")
        implementation("org.jetbrains.kotlinx:kotlinx-coroutines-javafx:1.3.5")
        
        testImplementation("com.github.jcornaz.kwik:kwik-evaluator-jvm:0.4.0")
        testImplementation("com.github.jcornaz.kwik:kwik-generator-stdlib-jvm:0.4.0")

        testImplementation("org.amshove.kluent:kluent:1.60")

        testImplementation("org.spekframework.spek2:spek-dsl-jvm:2.0.10")
        testRuntimeOnly("org.spekframework.spek2:spek-runner-junit5:2.0.10")
    }

    tasks {
        withType<Test> {
            useJUnitPlatform {
                includeEngines("spek2")
            }
        }

        withType<KotlinCompile> {
            kotlinOptions {
                freeCompilerArgs += "-Xuse-experimental=kotlin.Experimental"
            }
        }
    }
}
