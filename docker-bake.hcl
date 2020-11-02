variable "OWNER" {
  default = "visualon"
}
variable "FILE" {}

group "default" {
  targets = ["build_ghcr", "build_docker"]
}

group "build" {
  targets = ["build_ghcr", "build_docker"]
}

group "push" {
  targets = ["push_ghcr", "push_docker"]
}

group "test" {
  targets = ["test_docker"]
}

target "settings" {
  context    = "./docker/${FILE}"
  inherits   = ["settings"]
  cache-from = ["type=registry,ref=ghcr.io/${OWNER}/cache:${FILE}"]
}

target "build_ghcr" {
  inherits = ["settings"]
  output   = ["type=registry"]
  tags     = ["ghcr.io/${OWNER}/cache:${FILE}"]
  cache-to = ["type=inline,mode=max"]
}

target "build_docker" {
  inherits = ["settings"]
  output   = ["type=docker"]
  tags     = ["${OWNER}/${FILE}", "ghcr.io/${OWNER}/${FILE}"]
}

target "test_docker" {
  inherits = ["settings"]
  output   = ["type=docker"]
  tags     = ["${OWNER}/${FILE}", "ghcr.io/${OWNER}/${FILE}"]
}

target "push_ghcr" {
  inherits = ["settings"]
  output   = ["type=registry"]
  tags     = ["ghcr.io/${OWNER}/${FILE}"]
}

target "push_docker" {
  inherits = ["settings"]
  output   = ["type=registry"]
  tags     = ["${OWNER}/${FILE}"]
}
