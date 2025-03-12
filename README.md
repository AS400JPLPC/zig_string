# zig_string
UTF-8 String Library

# FORK
[JakubSzark/zig-string]((https://github.com/JakubSzark/zig-string))


**a big thank-you Jakub Szarkowicz  real work**

This library is a UTF-8 compatible **string** library for the **Zig** programming language. 
I made this for the sole purpose to further my experience and understanding of zig.
Also it may be useful for some people who need it (including myself), with future projects. Project is also open for people to add to and improve. Please check the **issues** to view requested features.
<br/>
<br/>
If you use an uninitialized or already uninitialized field, this will trigger an @panic error.  --> CRTL
<br/>

<br/>
The special feature: the addition of normalization to match the use in databases as well as when using screens or for lists.
<br/>
<br/>
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

*Look at the test.zig and testmem.zig files*



# Things needed
- Optimizations
- Better documentation
- More Testing

# How to Contribute
1. Fork
2. debug
3. Make a Test

(I'm no expert when it comes to complexity)


</br>

```
var arenaZfld = std.heap.ArenaAllocator.init(std.heap.page_allocator);
var allocZfld = arenaZfld.allocator();
pub fn deinitZfld() void {
    arenaZfld.deinit();
    arenaZfld = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    allocZfld = arenaZfld.allocator();
}
```

</br>


|Function      | Description                              | Pub |Debug|Option|bool|Panic|Crtl |
|--------------|------------------------------------------|-----|-----|------|----|-----|-----|
|init          | Creates String with Allocator & nbr char |  x  |     |      |    |     |     |
|deinit        | De-allocates the String                  |  x  |     |      |    |     |     |
|              |                                          |     |     |      |    |     |     |
|allocate      | Sets the internal buffer size            |     |     |      |    |     |  x  |
|capacity      | Returns the capacity of the String       |  x  |     |      |    |     |  x  |
|getnbc        | Return the numbers init char             |  x  |     |      |    |     |     |  
|Count         | Returns count of characters stored       |  x  |     |      |    |     |  x  |
|              |                                          |     |     |      |    |     |     |
|clear         | Clears the contents of the String        |  x  |     |      |    |     |  x  |
|cmpeql        | Compares to (zlfd,zfld)                  |  x  |     |      | x  |     |  x  |
|cmpeqlStr     | Compares to string literal               |  x  |     |      | x  |     |  x  |
|cmpxx         | Compares to (zlfd,zfld)  l EQ LT GT      |  x  |     |      |    |     |  x  |
|cmpxxStr      | Compares to string literal EQ LT GT      |  x  |     |      | x  |     |  x  |
|              |                                          |     |     |      |    |     |     |
|setZfld       | Erase append string literal of normalize |  x  |     |      |    |     |  x  |
|Normalize     | Truncate for SQL Screen ex:varchar(10)   |     |     |      |    |     |     |
|getstr        | Returns the String as a slice            |     |     |      |    |     |     |
|string        | Returns the Field string                 |  x  |     |      |    |     |  x  |
|              |                                          |     |     |      |    |     |     |
|clone         | Duplicate field                          |  x  |     |      |    |     |  x  |
|pop           | Removes the last character               |  x  |  x  |      |    |     |  x  |
|copy          | Copies this string to a new one field    |  x  |     |      |    |     |  x  |
|              |                                          |     |     |      |    |     |     |
|substr        | Sub-string a range of characters         |  x  |  x  |      |    |  x  |  x  |
|remove        | Removes a range of characters            |  x  |  x  |      |    |  x  |  x  |
|              |                                          |     |     |      |    |     |     |
|isEmpty       | Checks if length is zero                 |  x  |     |      |    |     |     |
|find          | Finds first string literal appearance    |  x  |     |  x   | x  |     |  x  |
|rfind         | Finds last  string literal appearance    |  x  |     |  x   |    |     |  x  |
|findpos       | Finds position occurrence of literal     |  x  |     |  x   |    |     |  x  |
|              |                                          |     |     |      |    |     |     |
|concat        | Appends a characters of the field        |  x  |     |      |    |     |  x  |
|concatStr     | Appends a characters of the literal      |  x  |     |      |    |     |  x  |
|truncat       | Reallocates the  buffer to size          |  x  |  x  |      |    |  x  |  x  |
|              |                                          |     |     |      |    |     |     |
|replace       | Replaces all occurrences of a zstring    |  x  |     |      | x  |     |  x  |
|reverse       | Reverses the characters in this zstring  |  x  |     |      |    |     |  x  |
|              |                                          |     |     |      |    |     |     |
|lowercase     | Converts to lowercase                    |  x  |     |      |    |     |  x  |
|uppercase     | Converts to uppercase                    |  x  |     |      |    |     |  x  |
|capitalized   | Converts to uppercase first word         |  x  |     |      |    |     |  x  |
|              |                                          |     |     |      |    |     |     |
|trim          | trim(zstring,whitelist)                  |  x  |     |      |    |     |  x  |
|trimLeft      | trimLef(zstring,whitelist)               |  x  |     |      |    |     |  x  |
|trim          | trimRight(zstring,whitelist)             |  x  |     |      |    |     |  x  |
|              |                                          |     |     |      |    |     |     |
|check         | Checks if the needle zstring             |  x  |     |      | x  |     |  x  |
|checkStr      | Checks if the needle Literal             |  x  |     |      | x  |     |  x  |
|              |                                          |     |     |      |    |     |     |
|charAt        | Returns character at index               |  x  |  x  |      |    |  x  |  x  |
|              |                                          |     |     |      |    |     |     |
|zfldIterator  | Struct Iterator                          |  x  |     |      |    |     |     |
|next          | next iterator Char(UTF8)                 |  x  |     |      |    |     |     |
|iterator      | Returns a StringIterator over the String |  x  |     |      |    |     |     |
|isUTF8Byte    | Checks if byte is part of UTF-8 character|     |     |      |    |     |     |
|getUTF8Size   | Returns the UTF-8 character's size       |     |     |      |    |     |     |
|getIndex      | Returns the real index of a unicode      |     |     |  x   |    |     |     |


<br/>
<br/>
global allocator

```
    var arenaZfld = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    var allocZfld = arenaZfld.allocator();

	pub fn deinitZfld() void {
	    arenaZfld.deinit();
	    arenaZfld = std.heap.ArenaAllocator.init(std.heap.page_allocator);
	    allocZfld = arenaZfld.allocator();
	}
```

if use zlfd.deinitZfld();


**All tests comply with AS400 processing requirements**


Progress:<br/>

- 2025-01-30 18:53 ->  Control, test and lock, security, compliance, a few hours or days... test the principle.<br/>
I'm not satisfied, I'd like to have a "job-logs"' a bit like the system log,<br/>
I'm thinking of a follow-up done with SQLite with a mini-server ... for optimum traceability.<br/>
- 2025-03-07 04:55 -> zig 0.14.0<br/>  
- 2025-03-10 17:25 -> Resuming diagnostics with the better-understood 0.14.0 @src deciphering @panic<br/>

</BR>
→ 2025-03-12 06:40   unicode.Decode deprecated change Utf8View <BR/>
</BR>
