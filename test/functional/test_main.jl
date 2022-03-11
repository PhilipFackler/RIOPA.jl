
using Test, MPI, ArgParse

include("../../src/main.jl")

@testset "main" begin
    @test main(["hello"]) == 0
    filename = "testcase-temp-config.yaml"
    @test main(["-c", filename, "generate-config"]) == 0
    @test ispath(filename)
    rm(filename)
end
