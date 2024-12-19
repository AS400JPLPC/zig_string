# zig_string
UTF-8 String Library

# FORK
[JakubSzark/zig-string]((https://github.com/JakubSzark/zig-string))


# a big thank-you Jakub Szarkowicz  real work

This library is a UTF-8 compatible **string** library for the **Zig** programming language. 
I made this for the sole purpose to further my experience and understanding of zig.
Also it may be useful for some people who need it (including myself), with future projects. Project is also open for people to add to and improve. Please check the **issues** to view requested features.
<br>
<br>
The special feature: the addition of normalization to match the use in databases as well as when using screens or for lists.
<br>
<br>
# Basic Usage
```zig
const zfld = @import("zfield");
// ...

// Create your String
// nbc = 0 usual string 
// nbc > 0 usual varchar(..) --> zoned 
var myString = zfld.ZFIELD.init(30);
defer myString.deinit();

// Use functions provided
try myString.concat("🔥 Hello!");
_ = myString.pop();
try myString.concat(", World 🔥");

std.debug.print("{s}",.{myString.string()});
```

***Look at the test.zig and testmem.zig files***



# Things needed
- Optimizations
- Better documentation
- More Testing

# How to Contribute
1. Fork
2. debug
3. Make a Test

(I'm no expert when it comes to complexity)


|Function      | Description                              | Pub |
|--------------|------------------------------------------|-----|
|init          | Creates String with Allocator & nbr char |  x  |
|deinit        | De-allocates the String                  |  x  |
|allocate      | Sets the internal buffer size            |  .  |
|capacity      | Returns the capacity of the String       |  x  |
|getnbc        | Return the numbers init char             |  x  |
|len           | Returns count of characters stored       |  x  |
|              |                                          |     |
|clear         | Clears the contents of the String        |  x  |
|cmpeql        | Compares to string literal               |  x  |
|cmpxx         | Compares to string literal EQ LT GT      |  x  |
|check         | control len and nbr char                 |  x  |
|              |                                          |     |
|getstr        | Returns the String as a slice            |     |
|setStr        | Erase append string literal              |  x  |
|              |                                          |     |
|string        | Returns the String as a normalize        |  x  |
|setZfld       | Erase append string literal of normalize |  x  |
|Normalize     | Truncate for SQL Screen ex:varchar(10)   |  .  |
|              |                                          |     |
|getSubstr     | Returns string a zstring from a range    |  x  |
|              |                                          |     |
|clone         | Copies this string to a new one          |  x  |
|pop           | Removes the last character               |  x  |
|remove        | Removes a character at an index          |  x  |
|removeRange   | Removes a range of characters            |  .  |
|              |                                          |     |
|toOwned       | Creates an owned slice of the String     |  x  |
|charAt        | Returns character at index               |  x  |
|              |                                          |     |
|isEmpty       | Checks if length is zero                 |  x  |
|find          | Finds first string literal appearance    |  x  |
|rfind         | Finds last  string literal appearance    |  x  |
|findpos       | Finds position occurrence of literal     |  x  |
|              |                                          |     |
|zstrIterator  | Struct Iterator                          |  x  |
|next          | next iterator Char(UTF8)                 |  x  |
|preview       | preview iterator Char(UTF8)              |  x  |
|iterator      | Returns a StringIterator over the String |  x  |
|isUTF8Byte    | Checks if byte is part of UTF-8 character|  .  |
|getIndex      | Returns the real index of a unicode      |  .  |
|getUTF8Size   | Returns the UTF-8 character's size       |  .  |
|              |                                          |     |
|concat        | Appends a character of the zstring       |  x  |
|replace       | Replaces all occurrences of a zstring    |  x  |
|reverse       | Reverses the characters in this zstring  |  x  |
|truncat       | Reallocates the  buffer to size          |  x  |
|              |                                          |     |
|lowercase     | Converts to lowercase                    |  x  |
|uppercase     | Converts to uppercase                    |  x  |
|capitalized   | Converts to uppercase first word         |  x  |
|              |                                          |     |
|inwhitelist   | Checks whethera character is whitelisted |  .  |
|trimStart     | Remove whitelist from the start          |  x  |
|trimEnd       | Remove whitelist from the end            |  x  |
|trim          | Removes whitelist from both ends         |  x  |
|              |                                          |     |
|inStartsWith  | Checks start against a literal           |  x  |
|inEndsWith    | Checks end against a literal             |  x  |
|includes      | Checks if the needle zstring             |  x  |
|includesStr   | Checks if the needle Literal             |  x  |

<br>
<br>
global allocator

```zig
    var arenaZfld = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    var allocZfld = arenaZfld.allocator();

	pub fn deinitZfld() void {
	    arenaZfld.deinit();
	    arenaZfld = std.heap.ArenaAllocator.init(std.heap.page_allocator);
	    allocZfld = arenaZfld.allocator();
	}
```

if use zlfd.ZFIELD.deinitZfld();

