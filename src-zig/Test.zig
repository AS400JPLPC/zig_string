//----------------------
//---test zoned field---
//----------------------



const std = @import("std");
const zfld = @import("zfield").ZFIELD;

//============================================================================================
var stdin = std.fs.File.stdin();
var stdout = std.fs.File.stdout().writerStreaming(&.{});


inline fn Print( comptime format: []const u8, args: anytype) void {
    stdout.interface.print(format, args) catch  {} ;
}
inline fn WriteAll( args: anytype) void {
    stdout.interface.writeAll(args) catch {} ;
}

fn Pause(msg : [] const u8 ) void{

    Print("\nPause  {s}\r\n",.{msg});
    var buf: [16]u8 = undefined;
    var c  : usize = 0;
    while (c == 0) {
        c = stdin.read(&buf) catch unreachable;
    }
}
//============================================================================================

pub const contact = struct {
  name      : zfld ,
  prenom    : zfld ,
  rue1      : zfld ,
  rue2      : zfld ,
  ville     : zfld ,
  pays      : zfld ,
  

  // defined structure and set ""
    pub fn initRecord() contact {

        
        const rcd = contact {
            .name   = zfld.init(30) ,
            .prenom = zfld.init(20) ,
            .rue1   = zfld.init(30) ,
            .rue2   = zfld.init(30) ,
            .ville  = zfld.init(20) ,
            .pays   = zfld.init(15) ,
        };
        return rcd;      
    }

    pub fn deinitRecord( r : *contact) void {
        r.name.deinit();
        r.prenom.deinit();
        r.rue1.deinit();
        r.rue2.deinit();
        r.ville.deinit();
        r.pays.deinit();
        
    }

};
    
pub fn main() !void {
WriteAll("\x1b[2J");
WriteAll("\x1b[3J");

var friend  = contact.initRecord();

    Pause("start");

    friend.name.setZfld("AS400JPLPC");
    friend.prenom.setZfld("Jean-Pierre") ;
    friend.rue1.setZfld(" 01 rue du sud-ouest") ;
    friend.rue2.clear();
    friend.ville.setZfld("Narbonne");
    friend.pays.setZfld("France");
    Pause("setp-1   INIT value"); 

    var xx = friend.name.string();
    Pause(xx);
    xx = friend.prenom.string();
    Pause(xx);
    xx = friend.rue1.string();
    Pause(xx);
    xx = friend.rue2.string();
    Pause(xx);
    xx = friend.ville.string();
    Pause(xx);
    xx = friend.pays.string();
    Pause(xx);
    

    Pause("step-3  deinitRecord"); 
    friend.deinitRecord();
    // test error
    //friend.prenom.setZfld("Jean-Pierre") ;
    
    
    zfld.deinitZfld();
 
    Pause("stop");
}
