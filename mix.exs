defmodule CodeHygiene.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/riebeekn/elixir_code_hygiene"

  def project do
    [
      app: :code_hygiene,
      version: @version,
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:boundary, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      name: "Code Hygiene example app",
      docs: docs()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {CodeHygiene.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:bcrypt_elixir, "~> 3.0"},
      {:phoenix, "~> 1.6.6"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.6"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.17.5"},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.6"},
      {:esbuild, "~> 0.3", runtime: Mix.env() == :dev},
      {:swoosh, "~> 1.3"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.14", only: [:dev, :test], runtime: false},
      {:git_hooks, "~> 0.5", only: [:test, :dev], runtime: false},
      {:boundary, "~> 0.9.0", runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"],
      "assets.deploy": ["esbuild default --minify", "phx.digest"],
      check: ["format", "credo --strict", "compile --warnings-as-errors", "dialyzer", "docs"]
    ]
  end

  defp docs do
    [
      main: "CodeHygiene",
      assets: "docs/assets",
      logo: "docs/assets/images/logo.svg",
      source_ref: "v#{@version}",
      source_url: @source_url,
      formatters: ["html"],
      groups_for_modules: groups_for_modules()
    ]
  end

  defp groups_for_modules do
    [
      API: [
        CodeHygiene,
        CodeHygiene.Products,
        CodeHygiene.Repo
      ],
      Accounts: [
        CodeHygiene.Accounts,
        CodeHygiene.Accounts.UserNotifier,
        CodeHygiene.Accounts.UserToken,
        CodeHygiene.Accounts.User
      ],
      "Accounts - Frontend": [
        CodeHygieneWeb.UserAuth,
        CodeHygieneWeb.UserConfirmationController,
        CodeHygieneWeb.UserRegistrationController,
        CodeHygieneWeb.UserResetPasswordController,
        CodeHygieneWeb.UserSessionController,
        CodeHygieneWeb.UserSettingsController
      ],
      Phoenix: [
        CodeHygieneWeb,
        CodeHygieneWeb.Endpoint,
        CodeHygieneWeb.ErrorHelpers,
        CodeHygieneWeb.Gettext,
        CodeHygieneWeb.LiveHelpers,
        CodeHygieneWeb.Router,
        CodeHygieneWeb.Router.Helpers
      ],
      Schemas: [
        CodeHygieneSchema,
        CodeHygieneSchema.Product
      ]
    ]
  end
end
