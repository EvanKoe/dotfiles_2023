//
// This function returns MAX if VARIABLE is higher
// than MAX or 0 if VARIABLE is negative and
// CANBENEGATIVE is false
const doNotGoFurther = (
  variable: number = 50,
  max: number = 100,
  canBeNegative: boolean = false
) => {
  if (variable <= 0 && !canBeNegative) {
    return 0;
  } else if (variable >= max) {
    return max;
  }
  return variable;
}


export {
  doNotGoFurther
};
