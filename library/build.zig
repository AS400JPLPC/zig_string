	///-----------------------
	/// build (library)
	/// zig 0.12.0 dev
	///-----------------------

const std = @import("std");


pub fn build(b: *std.Build) void {



	const zfield_mod = b.addModule("zfield", .{
		.root_source_file = b.path( "./zfield/zfield.zig" ),
	});





	
	const library_mod = b.addModule("library", .{
		.root_source_file = b.path( "library.zig" ),
		.imports = &.{
		.{ .name = "zfield",	.module = zfield_mod },
		},
	});






	
	_ = library_mod;


}
