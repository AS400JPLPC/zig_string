# zig_string
UTF-8 String Library

# FORK
[![CI](https://github.com/JakubSzark/zig-string)](https://github.com/JakubSzark/zig-string)


# a big thank-you Jakub Szarkowicz  real work

This library is a UTF-8 compatible **string** library for the **Zig** programming language. 
I made this for the sole purpose to further my experience and understanding of zig.
Also it may be useful for some people who need it (including myself), with future projects. Project is also open for people to add to and improve. Please check the **issues** to view requested features.

include ziglyph   
[![CI](https://github.com/jecolon/ziglyph)](https://github.com/jecolon/ziglyph)   
I had thought of making a lib. from icu for lower and upper transformations but the ziglyph library is not limited to that.  


# Basic Usage
```zig
const String = @import("./zig_string.zig").String;
// ...

// Use your favorite allocator
var arena = ArenaAllocator.init(std.heap.page_allocator);
defer arena.deinit();

// Create your String
var myString = String.init(&arena.allocator());
defer myString.deinit();

// Use functions provided
try myString.concat("🔥 Hello!");
_ = myString.pop();
try myString.concat(", World 🔥");

// Success!
assert(myString.cmp("🔥 Hello, World 🔥"));

```

# You have examples of use in zig_termcurs



# Things needed
- Optimizations
- Multi-Language toUppercase & toLowercase
- Better documentation
- More Testing

# How to Contribute
1. Fork
2. Clone
3. Add Features (Use Zig FMT)
4. Make a Test
5. Pull Request
6. Success!

# update oct 2022  
- delete truncate
- new normalize
- new StringTo
- new findPos
- new cloneDef
- change toOwned if (self.buffer != null) to if (self.len() != 0)
- change toLowercase toLowerStr include ziglyph
- change toUppercase toUpperStr include ziglyph  
- rectification beug  to insert expand  delete( *2 len buffeur ) 
- I tested 90% full process

# Working Features
If there are any issues with <b>complexity</b> please <b>open an issue</b>
(I'm no expert when it comes to complexity)

Function      | Description                              | Complexity (Best)
--------------|------------------------------------------|-----------
init          | Creates a String with an Allocator       | O(1)
deinit        | De-allocates the String                  | O(1)
len           | Returns count of characters stored       | O(n)
clear         | Clears the contents of the String        | O(n)
allocate      | Sets the internal buffer size            | O(1)
capacity      | Returns the capacity of the String       | O(1)
str           | Returns the String as a slice            | O(1)
StringTo      | Erase append string literal              | O(1)
concat        | Appends a string literal to the end      | O(n)
cmp           | Compares to string literal               | O(n)
pop           | Removes the last character               | O(1)
substr        | Creates a string from a range            | O(n)
toOwned       | Creates an owned slice of the String     | O(1)
writer        | Returns a std.io.Writer for the String   | O(1)
iterator      | Returns a StringIterator over the String | O(1)
remove        | Removes a character at an index          | O(n)
removeRange   | Removes a range of characters            | O(n)
trimStart     | Remove whitelist from the start          | O(n)
trimEnd       | Remove whitelist from the end            | O(n)
trim          | Removes whitelist from both ends         | O(n)
toLowerStr    | Converts to lowercase and ziglyph Soft   | O(1)
toUpperStr    | Converts to uppercase and ziglyph Soft   | O(1)
find          | Finds first string literal appearance    | O(n)
findpos       | Finds position occurrence of literal     | O(n)
split         | Returns a slice based on delimiters      | O(nm)
splitToString | Returns a String based on delimiters     | O(nm)
insert        | Inserts a character at an index          | O(n)
reverse       | Reverses all the characters              | O(n)
clone         | Copies this string to a new one          | O(n)
cloneDef      | Dup define this string return new        | O(n)
Normalize     | Truncate after n char  think about sql   | O(1)
isEmpty       | Checks if length is zero                 | O(1)
repeat        | Repeats string n times                   | O(nm)
charAt        | Returns character at index               | O(1)
