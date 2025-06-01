PROJECT = "latex-templates"

target "base" {
    dockerfile = "./.docker/Dockerfile.base"
    tags = [
        "${PROJECT}-base"
    ]
    output = [
        { type: "cacheonly" }
    ]
}

target "dev" {
    dockerfile = "./.docker/Dockerfile.dev"
    contexts = {
        base = "target:base"
    }
    tags = [
        "${PROJECT}-dev"
    ]
}

target "build" {
    dockerfile = "./.docker/Dockerfile.build"
    contexts = {
        base = "target:base"
    }
    tags = [
        "${PROJECT}-build"
    ]
    output = [
        { type: "docker" }
    ]
}

target "dist" {
    dockerfile = "./.docker/Dockerfile.dist"
    tags = [
        "${PROJECT}-dist"
    ]
    output = [
        { type: "docker" }
    ]
}

group "all" {
    targets = [ "build", "dist" ]
}
