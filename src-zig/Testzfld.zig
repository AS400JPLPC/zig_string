//----------------------
//---date text----------
//----------------------



const std = @import("std");

const zfld = @import("zfield");

const stdout = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();
pub fn main() !void {



var nom = zfld.ZFIELD.init(30) ;
var nom2 = zfld.ZFIELD.init(10) ;
var xx : [] const u8 = undefined;

        nom.setZfld("早上好 test 🔥");

        
        std.debug.print("setZfld nom >{s}<  count:{d}  capacity:{d}   nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        nom.setZfld("té€34567890123456789012345678Z");
        std.debug.print("setZfld nom >{s}<  count:{d}  capacity:{d}   nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        xx = nom.string();
        std.debug.print("string nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}  \n\rXX:>{s}<\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), xx});



// clear
        nom.clear();
        std.debug.print("clear nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        nom.setZfld("t€é123456789012345678901234567Z");


// clone     
var nom3 =  nom.clone();
        std.debug.print("clone nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\rnom:>{s}<\n\r",
            .{nom.string(), nom3.count(), nom3.capacity(),  nom3.getnbc(), nom3.string()});


// copy
        nom3.setZfld("abcd");
        std.debug.print("setZfld nom3 >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});
        nom3.copy(nom);
        std.debug.print("copy nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\rnom3:>{s}<\n\r",
            .{nom.string(), nom3.count(), nom3.capacity(),  nom3.getnbc(), nom3.string()});

// pop
        nom3.pop();
        std.debug.print("pop nom3  >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});


pause("-------------------------------");
// sub-string
pause("\nnom2.substr(nom,12,10)");
        nom2.substr(nom,12,10);
        std.debug.print("getsubStr(12,10) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\rnom2:>{s}<\n\r",
            .{nom.string(), nom2.count(), nom2.capacity(),  nom2.getnbc(), nom2.string()});
 
pause("\nnom2.substr(nom,0,10)");
        nom2.substr(nom,0,10);
        std.debug.print("getsubStr(0,10) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\rnom2:>{s}<\n\r",
            .{nom.string(), nom2.count(), nom2.capacity(),  nom2.getnbc(), nom2.string()});

pause("nom3.substr(nom2,0,10)");
    nom3.substr(nom2,0,10);
        std.debug.print("getsubStr(0,10) nom2 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\rnom3:>{s}<\n\r",
            .{nom2.string(), nom3.count(), nom3.capacity(),  nom3.getnbc(), nom3.string()});
        
pause("\nnom3.substr(nom2,9,1)");
        nom3.substr(nom2,9,1);
        std.debug.print("getsubStr(10,0) nom2 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\rnom3:>{s}<\n\r",
            .{nom2.string(), nom3.count(), nom3.capacity(),  nom3.getnbc(), nom3.string()});

// test error builttin
// pause("\nnom3.substr(nom2,0,20)");
        // nom2.clear();
        // nom3.substr(nom2,10,0);
        // std.debug.print("getsubStr(10,0) nom2 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\rnom3:>{s}<\n\r",
            // .{nom2.string(), nom3.count(), nom3.capacity(),  nom3.getnbc(), nom3.string()});


// test error
// pause("\nnom3.substr(nom2,10,0)");
        // nom2.setZfld("abcdef");
        // nom3.substr(nom2,10,0);
        // std.debug.print("getsubStr(10,0) nom2 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\rnom3:>{s}<\n\r",
            // .{nom2.string(), nom3.count(), nom3.capacity(),  nom3.getnbc(), nom3.string()});



pause("-------------------------------");
// remove
pause("\nnom3.remove(0,16)");
        nom3.setZfld("0123456789abcdef");
        std.debug.print("setZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});
        
        nom3.remove(0,16);
        std.debug.print("remove(0,16) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});

pause("\nnom3.remove(10,6)");
        nom3.setZfld("0123456789abcdef");
        std.debug.print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});

        nom3.remove(10,6);
        std.debug.print("remove(10,16) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});

pause("\nnom3.remove(0,1)");
        nom3.remove(0,1);
        std.debug.print("remove(0,1) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});

pause("\nnom3.remove(15,1)");
        nom3.setZfld("0123456789abcdef");
        std.debug.print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});

        nom3.remove(15,1);
        std.debug.print("remove(15,1) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});


// test error builttin
// pause("\nnom3.remove(0,0)");
//         nom3.setZfld("0123456789abcdef");
//         std.debug.print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
//             .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});
//         nom3.remove(0,0);
//         std.debug.print("remove(0,0) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
//             .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});

             
// test error builttin
// pause("\nnom3.remove(16,0)");
//         nom3.setZfld("0123456789abcdef");
//         std.debug.print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
//             .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});     
//         nom3.remove(16,0);
//         std.debug.print("remove(16,0) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
//             .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});


// test error builttin
// pause("\nnom3.remove(0,20)");
//         nom3.setZfld("0123456789abcdef");
//         std.debug.print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
//             .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});     
//         nom3.remove(0,20);
//         std.debug.print("remove(0,20) nom3 >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
//             .{nom3.string(), nom3.count(), nom3.capacity(),  nom3.getnbc()});


pause("-------------------------------");


pause("\nnom.isEmpty()");
        nom.clear();
        std.debug.print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        std.debug.print("nom.isEmpty() nom >{s}< count:{d}  capacity:{d}    nbrc:{d} isEmpty:{} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), nom.isEmpty()});

        nom.setZfld("Jean Pierre");
        std.debug.print("\n\nsetZfld nom3>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        std.debug.print("nom.isEmpty() nom >{s}< count:{d}  capacity:{d}    nbrc:{d} isEmpty:{} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), nom.isEmpty()});



pause("-------------------------------");

pause("\nnom.find(\"n\")");
        nom.setZfld("Jean Pierre");
        std.debug.print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        var rep : usize = 0;
        if ( nom.find("n") ) | data | {
            rep = data;
            std.debug.print("find('n') >{s}<  count:{d}  capacity:{d}    nbrc:{d} find:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , rep });

        pause("\nnom.remove(0,rep)");
        nom.remove(0,rep);
        std.debug.print("remove(0,{d}) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{rep, nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom.setZfld("Jean Pierre");
        }
        else {
            std.debug.print("find('n') >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r err-find:{}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , null });
        }

// test error        
pause("\nnom.find(\"?\")");
        nom.setZfld("Jean Pierre");
        std.debug.print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        rep = 0;
        if ( nom.find("?") ) | data | {
            rep = data;
            std.debug.print("find('?') >{s}<  count:{d}  capacity:{d}    nbrc:{d} find:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , rep });

        pause("\nnom.remove(0,rep)");
        nom.remove(0,rep);
        std.debug.print("remove(0,{d}) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{rep, nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom.setZfld("Jean Pierre");
        }
        else {
            std.debug.print("find('?') >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r err-find:{}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , null });
        }





pause("-------------------------------");

pause("\nnom.rfind(\"P\")");
        nom.setZfld("Jean Pierre");
        std.debug.print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        rep = 0;
        if ( nom.rfind("P") ) | data | {
            rep = data;
            std.debug.print("rfind('P') >{s}<  count:{d}  capacity:{d}    nbrc:{d} find:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , rep });

        pause("\nnom.remove( rep ,1)");
        nom.remove(rep ,1);
        std.debug.print("remove({d},{d}) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{rep  , 1, nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom.setZfld("Jean Pierre");
        }
        else {
            std.debug.print("rfind('P') >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r err-find:{}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , null });
        }

// test error        
pause("\nnom.rfind(\"?\")");
        nom.setZfld("Jean Pierre");
        std.debug.print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        rep = 0;
        if ( nom.rfind("?") ) | data | {
            rep = data;
            std.debug.print("rfind('?') >{s}<  count:{d}  capacity:{d}    nbrc:{d} find:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , rep });

pause("\nnom.remove(0,rep)");
        nom.remove(0,rep);
        std.debug.print("remove(0,{d}) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{rep, nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom.setZfld("Jean Pierre");
        }
        else {
            std.debug.print("rfind('?') >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r err-find:{}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , null });
        }




pause("-------------------------------");

pause("\nnom.findPos(5,\"e\")");
        nom.setZfld("Jean Pierre");
        std.debug.print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        rep = 0;
        if ( nom.findPos(5,"e")) | data | {
            rep = data;
            std.debug.print("findPos('e',5) >{s}<  count:{d}  capacity:{d}    nbrc:{d} find:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , rep });

pause("\nnom.remove( rep ,1)");
        nom.remove(rep ,1);
        std.debug.print("remove({d},{d}) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{rep  , 1, nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom.setZfld("Jean Pierre");
        }
        else {
            std.debug.print("findPos(5,'e') >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r err-find:{}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , null });
        }

// test error        
pause("\nnom.findPos(5,\"?\")");
        nom.setZfld("Jean Pierre");
        std.debug.print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        rep = 0;
        if ( nom.findPos(5,"?") ) | data | {
            rep = data;
            std.debug.print("findPos(5,'?') >{s}<  count:{d}  capacity:{d}    nbrc:{d} find:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , rep });

pause("\nnom3.remove(0,rep)");
        nom.remove(0,rep);
        std.debug.print("remove(0,{d}) nom >{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{rep, nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom.setZfld("Jean Pierre");
        }
        else {
            std.debug.print("rfind(5,'?') >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r err-find:{}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc() , null });
        }



pause("-------------------------------");

pause("\nnom.concat(nom2)");
        nom.setZfld("Jean Pierre");
        std.debug.print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom2.setZfld(" Zig");
        std.debug.print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom2.string(), nom2.count(), nom2.capacity(),  nom2.getnbc()});
        
        nom.concat(nom2);
        std.debug.print("concat nom + nom2 >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

pause("\nnom.concat(nom2)");
        nom.clear();
        std.debug.print("\n\nclear nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom2.setZfld(" Zig");
        std.debug.print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom2.string(), nom2.count(), nom2.capacity(),  nom2.getnbc()});
        
        nom.concat(nom2);
        std.debug.print("concat nom + nom2 >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

// test error
pause("\nnom.concat(nom2)");
        nom.setZfld("Jean Pierre");
        std.debug.print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom2.clear();
        std.debug.print("\n\nclear nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom2.string(), nom2.count(), nom2.capacity(),  nom2.getnbc()});
        
        nom.concat(nom2);
        std.debug.print("concat nom + nom2 >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        
pause("\nnom.concat(nom2)");
        nom.clear();
        std.debug.print("\n\nclear nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        nom2.clear();
        std.debug.print("\n\nclear nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom2.string(), nom2.count(), nom2.capacity(),  nom2.getnbc()});
        
        nom.concat(nom2);
        std.debug.print("concat nom + nom2 >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

pause("\nnom.concatStr(nom2)");
        nom.setZfld("Test");
        std.debug.print("\n\nsetZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
        
        nom.concatStr(" bonjour");
        std.debug.print("concat nom + 'bonjour' >{s}<  count:{d}  capacity:{d}    nbrc:{d} \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});



pause("-------------------------------");

pause("\nnom.replace( Pierre , toto)");

        nom.setZfld("Jean Pierre AS400");
        std.debug.print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        var testOk : bool = nom.replace("Pierre", "toto");  
          std.debug.print(
              "replace(\"Pierre\", \"toto\") >{s}<  count:{d}  capacity:{d}    nbrc:{d}    relace Ok : {}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), testOk});

        nom.setZfld("Jean Pierre AS400");
        std.debug.print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        testOk = nom.replace("Jean", "Informaticien");  
          std.debug.print(
              "replace(\"Jean\", \"Informaticien\") >{s}<  count:{d}  capacity:{d}    nbrc:{d}    relace Ok : {}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), testOk});

        nom.setZfld("Jean Pierre AS400");
        std.debug.print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        testOk = nom.replace("Yttt", "Informaticien");  
          std.debug.print(
              "replace(\"Yttt\", \"Informaticien\") >{s}<  count:{d}  capacity:{d}    nbrc:{d}    relace Ok : {}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), testOk});

        nom.clear();
        std.debug.print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        testOk = nom.replace(" ", "Informaticien");  
          std.debug.print(
              "replace(\"Yttt\", \"Informaticien\") >{s}<  count:{d}  capacity:{d}    nbrc:{d}    relace Ok : {}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), testOk});



pause("-------------------------------");

pause("\nnom.reverse()");
   
        nom.setZfld("Jean Pierre");
        std.debug.print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        nom.reverse();
        std.debug.print("reverse>{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});



pause("-------------------------------");

pause("\nnom.truncat(5)");
   
        nom.setZfld("Jean Pierre");
        std.debug.print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        nom.truncat(5);
        std.debug.print("truncat(5) >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});


pause("-------------------------------");

pause("\nnom.uppercase() jean pierre");
        nom.setZfld("jean pierre");
        nom.uppercase();
        std.debug.print("uppercase >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

pause("\nnom.lowercase()");
        nom.lowercase();
        std.debug.print("lowercase >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

pause("\nnom.capitalized()");
        nom.capitalized();
        std.debug.print("toCapitalized >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});    

pause("\nnom.uppercase()  pédalier");
        nom.setZfld("pédalier");
        nom.uppercase();
        std.debug.print("uppercase >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

pause("\nnom.lowercase()");
        nom.lowercase();
        std.debug.print("lowercase >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
pause("\nnom.capitalized()");
        nom.setZfld("  pédalier");
        nom.capitalized();
        std.debug.print("toCapitalized {s}  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});


pause("-------------------------------");

pause("\nnom.trim())");

        nom.setZfld(" jean pierre ");
        std.debug.print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
       
        nom.trim(" ");
        std.debug.print("trim >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

pause("\nnom.trimLeft())");       
        nom.setZfld(" jean pierre");
        std.debug.print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
       
        nom.trimLeft(" ");
        std.debug.print("trimLeft >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        
        nom.trimLeft("jean");
        std.debug.print("trimLeft('Jean') >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        
pause("\nnom.trimRight())");       
        nom.setZfld(" jean pierre ");
        std.debug.print("\n\n setZfld nom>{s}< count:{d}  capacity:{d}    nbrc:{d}  \n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
       
        nom.trimRight(" ");
        std.debug.print("trimRight(' ') >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
      
        nom.trimRight("e");
        std.debug.print("trimRight('e') >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

        nom.trimRight("rr");
        std.debug.print("trimRight('rr') >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
            .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});







pause("-------------------------------");
zfld.deinitZfld();


var testa = zfld.ZFIELD.init(10) ;
var testb = zfld.ZFIELD.init(10) ;
xx= "coucou";

    testa.setZfld("coucou");
    std.debug.print("cmpeql({s},{s})  {}\n\r",.{testa.string(),xx,testa.cmpeqlStr(xx)});
     std.debug.print("cmpxx({s},{s})  {s}\n\r",.{testa.string(),testb.string(),@tagName(testa.cmpxxStr(xx))});
     
    testb.setZfld("coucou");
    std.debug.print("cmpeql({s},{s})  {}\n\r",.{testa.string(),testb.string(),testa.cmpeql(testb)});

    std.debug.print("cmpxx({s},{s})  {s}\n\r",.{testa.string(),testb.string(),@tagName(testa.cmpxx(testb))});
    
    testb.setZfld("aaaaaa");
    std.debug.print("cmpxx({s},{s})  {s}\n\r",.{testa.string(),testb.string(),@tagName(testa.cmpxx(testb))});

    testb.setZfld("yaaaaa");
    std.debug.print("cmpxx({s},{s})  {s}\n\r",.{testa.string(),testb.string(),@tagName(testa.cmpxx(testb))});



    nom.setZfld(" jean pierre as400");
    std.debug.print("setZfld nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
    
    var bchk: bool = nom.checkStr("pierre");
    std.debug.print("checkStr('pierre') nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}  \n\r check:{} \n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), bchk });

    nom.setZfld(" jean pierre coucou as400");
    std.debug.print("setZfld nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
    
    bchk = nom.check(testa);
    std.debug.print("check(testa) nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}  \n\r  check:{} \n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), bchk});


   nom.setZfld(" jean pierre as400");
    std.debug.print("setZfld nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});
    
    bchk = nom.checkStr("xx");
    std.debug.print("checkStr('xx') nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}  \n\r check:{} \n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), bchk });

    nom.setZfld(" jean pierre coucou as400");
    std.debug.print("setZfld nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}\n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc()});

    testa.setZfld("xx");
    bchk = nom.check(testa);
    std.debug.print("check(testa = xx) nom >{s}<  count:{d}  capacity:{d}    nbrc:{d}  \n\r  check:{} \n\r",
        .{nom.string(), nom.count(), nom.capacity(),  nom.getnbc(), bchk});



    xx = nom.charAt(1);
    pause(xx);
    // xx = nom.charAt(31);
    // pause(xx);

    var iter = nom.iterator();
    while (iter.next()) |ch|    { pause(ch); }
    
    zfld.deinitZfld();

pause("stop");

}

fn pause(text : [] const u8) void {
    std.debug.print("{s}\n",.{text});
   	var buf : [3]u8  =	[_]u8{0} ** 3;
	_= stdin.readUntilDelimiterOrEof(buf[0..], '\n') catch unreachable;

}
