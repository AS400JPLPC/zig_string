//----------------------
//---date text----------
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

pub fn main() !void {



var nom = zfld.init(30) ;
var nom2 = zfld.init(10) ;
var xx : [] const u8 = undefined;

        nom.setZfld("早上好 test 🔥");

        
        Print("setZfld nom >{s}<  count:{d}  capacity:{d}   nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        nom.setZfld("té€34567890123456789012345678Z");
        Print("setZfld nom >{s}<  count:{d}  capacity:{d}   nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        xx = nom.string();
        Print("string nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}  \n\rXX:>{s}<\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), xx});



// clear
        nom.clear();
        Print("clear nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        nom.setZfld("t€é123456789012345678901234567Z");


// clone     
var nom3 =  nom.clone();
        Print("clone nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\rnom:>{s}<\n\r",
            .{nom.string(), nom3.count(), nom3.capacity(),  nom3.getnbc(), nom3.string()});


// copy
        nom3.setZfld("abcd");
        Print("setZfld nom3 >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});
        nom3.copy(nom);
        Print("copy nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\rnom3:>{s}<\n\r",
            .{nom.string(), nom3.count(), nom3.capacity(),  nom3.getnbc(), nom3.string()});

// pop
        nom3.pop();
        Print("pop nom3  >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});


Pause("-------------------------------");
// sub-string
Pause("\nnom2.substr(nom,12,10)");
        nom2.substr(nom,12,10);
        Print("getsubStr(12,10) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\rnom2:>{s}<\n\r",
            .{nom.string(), nom2.count(), nom2.capacity(),  nom2.getnbc(), nom2.string()});
 
Pause("\nnom2.substr(nom,0,10)");
        nom2.substr(nom,0,10);
        Print("getsubStr(0,10) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\rnom2:>{s}<\n\r",
            .{nom.string(), nom2.count(), nom2.capacity(),  nom2.getnbc(), nom2.string()});

Pause("nom3.substr(nom2,0,10)");
    nom3.substr(nom2,0,10);
        Print("getsubStr(0,10) nom2 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\rnom3:>{s}<\n\r",
            .{nom2.string(), nom3.count(), nom3.capacity(),  nom3.getnbc(), nom3.string()});
        
Pause("\nnom3.substr(nom2,9,1)");
        nom3.substr(nom2,9,1);
        Print("getsubStr(10,0) nom2 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\rnom3:>{s}<\n\r",
            .{nom2.string(), nom3.count(), nom3.capacity(),  nom3.getnbc(), nom3.string()});

// test error builttin
// Pause("\nnom3.substr(nom2,0,20)");
        // nom2.clear();
        // nom3.substr(nom2,10,0);
        // Print("getsubStr(10,0) nom2 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\rnom3:>{s}<\n\r",
            // .{nom2.string(), nom3.count(), nom3.capacity(),  nom3.getnbc(), nom3.string()});


// test error
// Pause("\nnom3.substr(nom2,10,0)");
        // nom2.setZfld("abcdef");
        // nom3.substr(nom2,10,0);
        // Print("getsubStr(10,0) nom2 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\rnom3:>{s}<\n\r",
            // .{nom2.string(), nom3.count(), nom3.capacity(),  nom3.getnbc(), nom3.string()});



Pause("-------------------------------");
// remove
Pause("\nnom3.remove(0,16)");
        nom3.setZfld("0123456789abcdef");
        Print("setZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});
        
        nom3.remove(0,16);
        Print("remove(0,16) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});

Pause("\nnom3.remove(10,6)");
        nom3.setZfld("0123456789abcdef");
        Print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});

        nom3.remove(10,6);
        Print("remove(10,16) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});

Pause("\nnom3.remove(0,1)");
        nom3.remove(0,1);
        Print("remove(0,1) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});

Pause("\nnom3.remove(15,1)");
        nom3.setZfld("0123456789abcdef");
        Print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});

        nom3.remove(15,1);
        Print("remove(15,1) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});


// test error builttin
// Pause("\nnom3.remove(0,0)");
//         nom3.setZfld("0123456789abcdef");
//         Print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
//             .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});
//         nom3.remove(0,0);
//         Print("remove(0,0) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
//             .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});

             
// test error builttin
// Pause("\nnom3.remove(16,0)");
//         nom3.setZfld("0123456789abcdef");
//         Print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
//             .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});     
//         nom3.remove(16,0);
//         Print("remove(16,0) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
//             .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});


// test error builttin
// Pause("\nnom3.remove(0,20)");
//         nom3.setZfld("0123456789abcdef");
//         Print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
//             .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});     
//         nom3.remove(0,20);
//         Print("remove(0,20) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
//             .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});


Pause("-------------------------------");


Pause("\nnom.isEmpty()");
        nom.clear();
        Print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        Print("nom.isEmpty() nom >{s}< count:{d}  capacity:{d}    nbrc:{d} isEmpty:{} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), nom.isEmpty()});

        nom.setZfld("Jean Pierre");
        Print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        Print("nom.isEmpty() nom >{s}< count:{d}  capacity:{d}    nbrc:{d} isEmpty:{} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), nom.isEmpty()});



Pause("-------------------------------");

Pause("\nnom.find(\"n\")");
        nom.setZfld("Jean Pierre");
        Print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        var rep : usize = 0;
        if ( nom.find("n") ) | data | {
            rep = data;
            Print("find('n') >{s}<  count:{d}  capacity:{d}    nbrc:{d} find:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , rep });

        Pause("\nnom.remove(0,rep)");
        nom.remove(0,rep);
        Print("remove(0,{d}) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{rep, nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom.setZfld("Jean Pierre");
        }
        else {
            Print("find('n') >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r err-find:{}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , null });
        }

// test error        
Pause("\nnom.find(\"?\")");
        nom.setZfld("Jean Pierre");
        Print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        rep = 0;
        if ( nom.find("?") ) | data | {
            rep = data;
            Print("find('?') >{s}<  count:{d}  capacity:{d}    nbrc:{d} find:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , rep });

        Pause("\nnom.remove(0,rep)");
        nom.remove(0,rep);
        Print("remove(0,{d}) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{rep, nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom.setZfld("Jean Pierre");
        }
        else {
            Print("find('?') >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r err-find:{}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , null });
        }





Pause("-------------------------------");

Pause("\nnom.rfind(\"P\")");
        nom.setZfld("Jean Pierre");
        Print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        rep = 0;
        if ( nom.rfind("P") ) | data | {
            rep = data;
            Print("rfind('P') >{s}<  count:{d}  capacity:{d}    nbrc:{d} find:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , rep });

        Pause("\nnom.remove( rep ,1)");
        nom.remove(rep ,1);
        Print("remove({d},{d}) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{rep  , 1, nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom.setZfld("Jean Pierre");
        }
        else {
            Print("rfind('P') >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r err-find:{}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , null });
        }

// test error        
Pause("\nnom.rfind(\"?\")");
        nom.setZfld("Jean Pierre");
        Print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        rep = 0;
        if ( nom.rfind("?") ) | data | {
            rep = data;
            Print("rfind('?') >{s}<  count:{d}  capacity:{d}    nbrc:{d} find:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , rep });

Pause("\nnom.remove(0,rep)");
        nom.remove(0,rep);
        Print("remove(0,{d}) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{rep, nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom.setZfld("Jean Pierre");
        }
        else {
            Print("rfind('?') >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r err-find:{}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , null });
        }




Pause("-------------------------------");

Pause("\nnom.findPos(5,\"e\")");
        nom.setZfld("Jean Pierre");
        Print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        rep = 0;
        if ( nom.findPos(5,"e")) | data | {
            rep = data;
            Print("findPos('e',5) >{s}<  count:{d}  capacity:{d}    nbrc:{d} find:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , rep });

Pause("\nnom.remove( rep ,1)");
        nom.remove(rep ,1);
        Print("remove({d},{d}) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{rep  , 1, nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom.setZfld("Jean Pierre");
        }
        else {
            Print("findPos(5,'e') >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r err-find:{}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , null });
        }

// test error        
Pause("\nnom.findPos(5,\"?\")");
        nom.setZfld("Jean Pierre");
        Print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        rep = 0;
        if ( nom.findPos(5,"?") ) | data | {
            rep = data;
            Print("findPos(5,'?') >{s}<  count:{d}  capacity:{d}    nbrc:{d} find:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , rep });

Pause("\nnom3.remove(0,rep)");
        nom.remove(0,rep);
        Print("remove(0,{d}) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{rep, nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom.setZfld("Jean Pierre");
        }
        else {
            Print("rfind(5,'?') >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r err-find:{}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , null });
        }



Pause("-------------------------------");

Pause("\nnom.concat(nom2)");
        nom.setZfld("Jean Pierre");
        Print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom2.setZfld(" Zig");
        Print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom2.string(), nom2.count(), nom2.capacity(),  nom2.getnbc()});
        
        nom.concat(nom2);
        Print("concat nom + nom2 >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

Pause("\nnom.concat(nom2)");
        nom.clear();
        Print("\n\nclear nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom2.setZfld(" Zig");
        Print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom2.string(), nom2.count(), nom2.capacity(),  nom2.getnbc()});
        
        nom.concat(nom2);
        Print("concat nom + nom2 >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

// test error
Pause("\nnom.concat(nom2)");
        nom.setZfld("Jean Pierre");
        Print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom2.clear();
        Print("\n\nclear nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom2.string(), nom2.count(), nom2.capacity(),  nom2.getnbc()});
        
        nom.concat(nom2);
        Print("concat nom + nom2 >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        
Pause("\nnom.concat(nom2)");
        nom.clear();
        Print("\n\nclear nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom2.clear();
        Print("\n\nclear nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom2.string(), nom2.count(), nom2.capacity(),  nom2.getnbc()});
        
        nom.concat(nom2);
        Print("concat nom + nom2 >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

Pause("\nnom.concatStr(nom2)");
        nom.setZfld("Test");
        Print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        
        nom.concatStr(" bonjour");
        Print("concat nom + 'bonjour' >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});



Pause("-------------------------------");

Pause("\nnom.replace( Pierre , toto)");

        nom.setZfld("Jean Pierre AS400");
        Print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        var testOk : bool = nom.replace("Pierre", "toto");  
          Print(
              "replace(\"Pierre\", \"toto\") >{s}<  count:{d}  capacity:{d}    nbrc:{d}    relace Ok : {}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), testOk});

        nom.setZfld("Jean Pierre AS400");
        Print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        testOk = nom.replace("Jean", "Informaticien");  
          Print(
              "replace(\"Jean\", \"Informaticien\") >{s}<  count:{d}  capacity:{d}    nbrc:{d}    relace Ok : {}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), testOk});

        nom.setZfld("Jean Pierre AS400");
        Print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        testOk = nom.replace("Yttt", "Informaticien");  
          Print(
              "replace(\"Yttt\", \"Informaticien\") >{s}<  count:{d}  capacity:{d}    nbrc:{d}    relace Ok : {}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), testOk});

        nom.clear();
        Print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        testOk = nom.replace(" ", "Informaticien");  
          Print(
              "replace(\"Yttt\", \"Informaticien\") >{s}<  count:{d}  capacity:{d}    nbrc:{d}    relace Ok : {}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), testOk});



Pause("-------------------------------");

Pause("\nnom.reverse()");
   
        nom.setZfld("Jean Pierre");
        Print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        nom.reverse();
        Print("reverse>{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});



Pause("-------------------------------");

Pause("\nnom.truncat(5)");
   
        nom.setZfld("Jean Pierre");
        Print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        nom.truncat(5);
        Print("truncat(5) >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});


Pause("-------------------------------");

Pause("\nnom.uppercase() jean pierre");
        nom.setZfld("jean pierre");
        nom.uppercase();
        Print("uppercase >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

Pause("\nnom.lowercase()");
        nom.lowercase();
        Print("lowercase >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

Pause("\nnom.capitalized()");
        nom.capitalized();
        Print("toCapitalized >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});    

Pause("\nnom.uppercase()  pédalier");
        nom.setZfld("pédalier");
        nom.uppercase();
        Print("uppercase >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

Pause("\nnom.lowercase()");
        nom.lowercase();
        Print("lowercase >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
Pause("\nnom.capitalized()");
        nom.setZfld("  pédalier");
        nom.capitalized();
        Print("toCapitalized {s}  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});


Pause("-------------------------------");

Pause("\nnom.trim())");

        nom.setZfld(" jean pierre ");
        Print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
       
        nom.trim(" ");
        Print("trim >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

Pause("\nnom.trimLeft())");       
        nom.setZfld(" jean pierre");
        Print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
       
        nom.trimLeft(" ");
        Print("trimLeft >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        
        nom.trimLeft("jean");
        Print("trimLeft('Jean') >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        
Pause("\nnom.trimRight())");       
        nom.setZfld(" jean pierre ");
        Print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
       
        nom.trimRight(" ");
        Print("trimRight(' ') >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
      
        nom.trimRight("e");
        Print("trimRight('e') >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        nom.trimRight("rr");
        Print("trimRight('rr') >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});







Pause("-------------------------------");
zfld.deinitZfld();


var testa = zfld.init(10) ;
var testb = zfld.init(10) ;
xx= "coucou";

    testa.setZfld("coucou");
    Print("cmpeql({s},{s})  {}\n\r",.{testa.string(),xx,testa.cmpeqlStr(xx)});
     Print("cmpxx({s},{s})  {s}\n\r",.{testa.string(),testb.string(),@tagName(testa.cmpxxStr(xx))});
     
    testb.setZfld("coucou");
    Print("cmpeql({s},{s})  {}\n\r",.{testa.string(),testb.string(),testa.cmpeql(testb)});

    Print("cmpxx({s},{s})  {s}\n\r",.{testa.string(),testb.string(),@tagName(testa.cmpxx(testb))});
    
    testb.setZfld("aaaaaa");
    Print("cmpxx({s},{s})  {s}\n\r",.{testa.string(),testb.string(),@tagName(testa.cmpxx(testb))});

    testb.setZfld("yaaaaa");
    Print("cmpxx({s},{s})  {s}\n\r",.{testa.string(),testb.string(),@tagName(testa.cmpxx(testb))});



    nom.setZfld(" jean pierre as400");
    Print("setZfld nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
    
    var bchk: bool = nom.checkStr("pierre");
    Print("checkStr('pierre') nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}  \n\r check:{} \n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), bchk });

    nom.setZfld(" jean pierre coucou as400");
    Print("setZfld nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
    
    bchk = nom.check(testa);
    Print("check(testa) nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}  \n\r  check:{} \n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), bchk});


   nom.setZfld(" jean pierre as400");
    Print("setZfld nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
    
    bchk = nom.checkStr("xx");
    Print("checkStr('xx') nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}  \n\r check:{} \n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), bchk });

    nom.setZfld(" jean pierre coucou as400");
    Print("setZfld nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

    testa.setZfld("xx");
    bchk = nom.check(testa);
    Print("check(testa = xx) nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}  \n\r  check:{} \n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), bchk});



    xx = nom.charAt(1);
    Pause(xx);
    // xx = nom.charAt(31);
    // Pause(xx);

    var iter = nom.iterator();
    while (iter.next()) |ch|    { Pause(ch); }
    
    zfld.deinitZfld();

Pause("stop");

}


