//----------------------
//---test zoned field---
//----------------------



const std = @import("std");
const zfld = @import("zfield").ZFIELD;

const stdout = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();

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
stdout.writeAll("\x1b[2J") catch {};
stdout.writeAll("\x1b[3J") catch {};

var friend  = contact.initRecord();

    pause("start");

    friend.name.setZfld("AS400JPLPC");
    friend.prenom.setZfld("Jean-Pierre") ;
    friend.rue1.setZfld(" 01 rue du sud-ouest") ;
    friend.rue2.clear();
    friend.ville.setZfld("Narbonne");
    friend.pays.setZfld("France");
    pause("setp-1   INIT value"); 

    var xx = friend.name.string();
    pause(xx);
    xx = friend.prenom.string();
    pause(xx);
    xx = friend.rue1.string();
    pause(xx);
    xx = friend.rue2.string();
    pause(xx);
    xx = friend.ville.string();
    pause(xx);
    xx = friend.pays.string();
    pause(xx);
    

    pause("step-3  deinitRecord"); 
    friend.deinitRecord();
    // test error
    //friend.prenom.setZfld("Jean-Pierre") ;
    
    
    zfld.deinitZfld();
 
    pause("stop");
}




fn pause(text : [] const u8) void {
    std.debug.print("{s}\n",.{text});
   	var buf : [3]u8  =	[_]u8{0} ** 3;
	_= stdin.readUntilDelimiterOrEof(buf[0..], '\n') catch unreachable;

}
