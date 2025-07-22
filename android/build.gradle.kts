// Top-level build file where you can add configuration options common to all sub-projects/modules.
plugins {
    id("com.android.application") version "8.9.1" apply false
    id("org.jetbrains.kotlin.android") version "2.1.0" apply false
    id("com.android.library") version "8.9.1" apply false
    id("com.gradleup.nmcp") version "0.0.4" apply true
    id("com.google.devtools.ksp") version "2.1.0-1.0.29" apply false
    id("com.github.willir.rust.cargo-ndk-android") version "0.3.4" apply false
    id("org.jetbrains.kotlin.plugin.compose") version "2.1.0"
}