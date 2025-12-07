# Comments

## Master rules
- Never use single-line comments. `//` Use Multi-line comments `/**/`.
- Doxygen-style documentation is for declaration, not definition.

## Documentation
- `@file file` with `@brief brief`, on top for minimum doxygen declaration.
- `@def name` or `@fn name` for declaring it public.
- `@param name <PARAMTAG>... [typename]` for c-style parameter.
- `@tparam name <TPARAMTAG>` for template parameter, when c-style parameter is not enough.

## Class Tags
- <CLASS>
    > direct modification of the structure is not adviced.

- <ABSTRCT>
    > an un-defined type

## Function Tags
- <TDSAFE>      
    > Thread safe. When this is omitted, it is not desinged as thread-safe.

## Template Parameter Tags
- <LBL>
    > temporary label parameter  
    > which could be a name for variable, function, goto label, etc

- <TP>  
    > Type parameter

- <CD>  
    > Code parameter

- <OPR1>
    > Operator with 1 operand  
    > !, ~, &, *, -, ...

- <OPR2>
    > Operator with 2 operands  
    > +, -, *, %, ...

- <OPR3>
    > Operator with 3 operands  
    > ?, ...

## Parameter(classic c-style) tags
- <TMP>  
    > You cannot expect it to store meaningful value.  
    > The l-value in used.

- <REFDBY, ...>        
    > Will be referenced by `...`.  
    > Which means it must outlive `...`.

- <CONST>  
    > the primitive value itself will be read.  
    > You cna expect it to store meaningful value.

- <RET>  
    > the return value is guarenteed to be stored here,  
    > You can expect it to store meaningful value.  
    > not respecting its value.

- <INIT:`__stop__`>
    > the return value as compound has handle|pointer internally.  
    > turning off via `__stop__` is required.  
    > `__stop__` must be marked as `<STOP>`.

- <STOP>
    > the value will no more function after this even the value has not been changed.

- <NEW, `__free__`, ...>  
    > the return value stored here is new handle|pointer and need to be freed.  
    > freeing function will be given as `__free__`, or be omitted when `free` is enough.  
    > values considered as null will be given as  `...`, or be omitted when NULL, nullptr, ae2f_NIL is enough.  
    > `__free__` must be marked as `<FREE>`

- <FREE>  
    > this given handle will no longer be available.

- <RD>      
    > is valid pointer, and its data will be read.

- <WR>      
    > is valid pointer, and its data will be overwritten without respecting its existing.

- <RDWR>    
    > is valid pointer, and its data will be read and overwritten.

- <OPT>  
    > the value|handle|pointer could be `NULL`.

- <OPT, ...>  
    > the value|handle|pointer could be `...`,  
    > where `...` will be read as `NULL`.

- <FN>  
    > the parameter is callable function in some way.

## Type tags

- <HANDLE, ...>  
    > is an opaque handle.  
    > `...` will be considered as null or special value.  
    > `...` could be omitted when `0`|`NULL`|`ae2f_NIL` is special value.

- <ENUM:`enum_type`>  
    > this type is meant to store `enum_type` as its value.  

- <BFIELD:`enum_type`>  
    > this type is meant to store combined bitfield from `enum_type`.
