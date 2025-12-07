# Namings

## declaring
### function
> `libprefix_actobj_ext(void)`

### struct
> `libprefix_obj_ext`  
> `m_member`

### class   <CLASS>
> `x_libprefix_obj_ext`

### enum
> `e_libprefix_ename`  
> `LIBPREFIX_ENAME_VAL`

### enum_alias  <ENUM>
> `e_libprefix_obj_ext_t`

### enum_bitfield <BFIELD>
> `B_libprefix_obj_t`

## typedef
### simple
> `libprefix_newname_t`

### function
> `fn_libprefix_act_t(void)`

### undefined
> declared but undefined struct | union | class type.  
> `a_libprefix_obj_t`

### opaque pointer & handle
> opaque pointer will be known as handle.  
> `h_libprefix_obj_t`

## function parameter
> Every argument must have prefix to clarify its usage.  
> Prefix is heavily  [documentation style](./cmt.md)  
> Prefixes are designed to be combined.

### template
- <TP>:             `*_T`
- <CD>:             `C_*`
- <LBL>:            `L_*`
- <OPR1>:           `O1_*`
- <OPR2>:           `O2_*`
- <OPR3>:           `O3_*`

### classic
- <TMP>:        `t_*`
- <REFDBY>:     `y_*`
- <CONST>:      `c_*`
- <RET>:        `ret`(on first return), or `r_*`
- <INIT>:       `i_*`
- <STOP>:       `s_*`
- <NEW>:        `n_*`
- <FREE>:       `d_*`
- <HANDLE>:     `h_*`
- <RD>:         `rd_*`
- <WR>:         `wr_*`
- <RDWR>:       `rdwr_*`
- <OPT>:        `*_opt`
- <FN>:         `f_*`
