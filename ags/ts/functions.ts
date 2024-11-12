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


const onOneToPercent = (
  num: number,
  canGoOver: boolean = false
): string => {
  let new_num: number = num;

  if (num >= 1 && !canGoOver) {
    new_num = 1;
  }

  return `${(new_num * 100).toFixed(0)} %`;
}


export {
  doNotGoFurther,
  onOneToPercent
};
