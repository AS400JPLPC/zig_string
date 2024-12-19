const std = @import("std");

pub fn build(b: *std.Build) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const target   = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});


    // ===========================================================
     const zfield   = b.dependency("library", .{}).module("zfield");

    // Building the executable

    const Prog = b.addExecutable(.{
    .name = "Test",
    .root_source_file = b.path( "./Test.zig" ),
    .target = target,
    .optimize = optimize,
    });

    Prog.root_module.addImport("zfield", zfield);




    b.installArtifact(Prog);





}
