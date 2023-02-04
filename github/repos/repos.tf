locals {
  repos = concat([
    {
      name: "infra",
      description: "Infrastructure as Code with Terraform & GitHub Actions",
    },
    {
      name: "infra-roadmap"
      description: "Infrastructure roadmap",
    },
    {
      name: "chatgpt"
      description: "ChatGPT Web API for Bytefloat",
    },
    {
      name: "bionic-mini"
      description: "Bionic Mini App",
    }
  ])
}
