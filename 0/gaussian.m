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
## @deftypefn {Function File} {@var{retval} =} gaussian (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <tia@HP>
## Created: 2016-09-20

function g = gaussian (M)
  i = size(M)(1)
  j = size(M)(2)
  C = zeros(i, j)
  k = 2
  
  while k <= j
    ## A up to the current row
    B = A(1:k - 1, 1:i)
    ## multiplier for zero current diagonal element
    mul = A(k + 1, k) / A(k, k)
    ## to be zeroed row
    c = A(k:k + 1, 1:i)
    ## same matrix, except for the new line
    C = [B; c - mul * A(k:k - 1, 1:i); A(k + 1, k)]
  end
  
  b = zeros(j)
  b(1) = C(i, j)
  g = b(1)
endfunction