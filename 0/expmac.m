## Copyright (C) 2016
##
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {@var{retval} =} expmac (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <tia@HP>
## Created: 2016-09-20

function e = expmac(x, n)
  e = expmac_rec(x, 0, n, sign(x));
endfunction

function res = expmac_rec(x, f, m, x_sign)
  ## Positive exponent
  if m >= 0 && x_sign > 0
    g = (x^m) / factorial(m);
    res = g + f
    printf("x = %d | m: %d | x^m = %d | m! = %f | g = %f | f = %f \n", x, m, x^m, factorial(m), g, f)
    expmac_rec(x, res, m - 1, x_sign);

  ## Negative exponent
  elseif m >= 0 && x_sign < 0
    g = (x^m) / factorial(m);
    res = g + f
    printf("x = %d | m: %d | x^m = %d | m! = %f | g = %f | f = %f \n", x, m, x^m, factorial(m), g, f)
    expmac_rec(x, res, m - 1, x_sign);

  else
    res = f;
    printf("e^ %d= %f \n", x, f)
  end
endfunction
