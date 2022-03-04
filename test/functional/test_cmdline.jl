using Test, MPI

@testset "cmdline" begin
    mpiexec() do runcmd
        juliacmd = `julia --project=.`

        @test run(
            Cmd(`$runcmd -n 4 $juliacmd riopa.jl --hello`),
        ).exitcode == 0

        @test run(
            Cmd(`$runcmd -n 4 $juliacmd riopa.jl --generate-config`),
        ).exitcode == 0
    end
end
