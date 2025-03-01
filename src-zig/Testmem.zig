//----------------------
//---test zoned field---
//----------------------



const std = @import("std");
const zfld = @import("zfield");

const stdout = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();

pub const contact = struct {
  name      : zfld.ZFIELD  ,
  prenom    : zfld.ZFIELD  ,
  rue1      : zfld.ZFIELD  ,
  rue2      : zfld.ZFIELD  ,
  ville     : zfld.ZFIELD  ,
  pays      : zfld.ZFIELD  ,
  

  // defined structure and set ""
    pub fn initRecord() contact {

        
        const rcd = contact {
            .name   = zfld.ZFIELD.init(30) ,
            .prenom = zfld.ZFIELD.init(20) ,
            .rue1   = zfld.ZFIELD.init(30) ,
            .rue2   = zfld.ZFIELD.init(30) ,
            .ville  = zfld.ZFIELD.init(20) ,
            .pays   = zfld.ZFIELD.init(15) ,
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

var work:zfld.ZFIELD = zfld.ZFIELD.init(30);
var friend  = contact.initRecord();

    pause("start");

    friend.name.setZfld("AS400JPLPC");
    friend.prenom.setZfld("Jean-Pierre") ;
    friend.rue1.setZfld(" 01 rue du sud-ouest") ;
    friend.ville.setZfld("Narbonne");
    friend.pays.setZfld("France");
    pause("setp-1   INIT value"); 

    var xx = friend.name.string();
    pause(xx);
    xx = friend.prenom.string();
    pause(xx);
    xx = friend.rue1.string();
    pause(xx);
    xx = friend.ville.string();
    pause(xx);
    xx = friend.pays.string();
    pause(xx);
    
    pause("step-2");

    friend.name.uppercase();
    xx = friend.name.string();
    pause(xx);

    friend.name.debugContext();

    friend.name.clear();
    friend.name.debugContext();
    pause("step-X");
    friend.name.setZfld("AS400JPLPC");

    std.debug.print("{} cmpeql\n",.{friend.name.cmpeqlStr("test")});
    
    std.debug.print("{} cmpxx\n",.{friend.name.cmpxxStr("test")});
   
    work.substr(friend.prenom,1,4) ;
    std.debug.print("{s}  substr:{s} \n",.{work.string(), friend.prenom.string()});

    friend.ville.concatStr(" 11100");

    std.debug.print("{s} ville\n",.{friend.ville.string() });
    friend.ville.debugContext();
      

    friend.prenom.debugContext();
     _=friend.prenom.replace("Jean",friend.name.string());
    friend.prenom.debugContext();
    std.debug.print("{s}  prenom \n",.{friend.prenom.string()});
    //the string normalize function always
    xx = friend.prenom.string();
    pause(xx);
    friend.prenom.setZfld("Jean-Pierre") ;



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
