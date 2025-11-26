# Namings

## declaring
### function
> `libprefix_actobj_ext(void)`

### struct
> `libprefix_obj_ext`  
> `m_member`

### enum
> `e_libprefix_obj_t`

## typedef
### simple
> `libprefix_newname_t`

### function
> `fn_libprefix_act_t(void)`

### opaque pointer & handle
> opaque pointer will be known as handle.  
> `h_libprefix_obj_t`

## function parameter
> Every argument must have prefix to clarify its usage.  
> Prefix is heavily  [documentation style](./cmt.md)  
> Prefixes are designed to be combined.

### template
- <TP>:             `*_t`
- <CD>:             `c_*`
- <OPR1>:           `o1_*`
- <OPR2>:           `o2_*`
- <OPR3>:           `o3_*`

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
