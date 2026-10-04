using Documenter
using HFTokenizers

makedocs(;
    sitename = "HFTokenizers.jl",
    authors = "Satoshi Terasaki",
    modules = [HFTokenizers],
    remotes = nothing,
    doctest = false,
    checkdocs = :none,
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        repolink = "https://github.com/AtelierArith/HFTokenizers.jl",
        edit_link = nothing,
    ),
    pages = ["Home" => "index.md", "API reference" => "api.md"],
)

if get(ENV, "CI", "false") == "true"
    deploydocs(;
        repo = "github.com/AtelierArith/HFTokenizers.jl.git",
        devbranch = "main",
        push_preview = false,
    )
end
