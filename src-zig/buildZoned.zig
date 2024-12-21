const std = @import("std");

pub fn build(b: *std.Build) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const target   = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});


    // ===========================================================
    // 
    // Resolve the 'library' dependency.
    const zenlib_dep = b.dependency("library", .{});
    
    // Building the executable

    const Prog = b.addExecutable(.{
    .name = "Zoned",
    .root_source_file = b.path( "./Zoned.zig" ),
    .target = target,
    .optimize = optimize,
    });

 
    Prog.root_module.addImport("zfield", zenlib_dep.module("zfield"));
    Prog.root_module.addImport("decimal", zenlib_dep.module("decimal"));
    
    b.installArtifact(Prog);





}
