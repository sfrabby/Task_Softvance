plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.task_soft"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        // Desugaring এনাবল করা হলো
        isCoreLibraryDesugaringEnabled = true

        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        // নতুন ফরম্যাটে jvmTarget সেট করা হলো
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.example.task_soft"
        // Min SDK অবশ্যই ২১ বা তার বেশি হতে হবে
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // ডেসুগারিং লাইব্রেরি যোগ করা হলো
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.3")
}
