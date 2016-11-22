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

function g = gaussian (A, b)
  n = size(A)(1);
  m = size(A)(2);
  C = zeros(i, j);

  for k = 1 : (n - 1)
    for i = (k + 1):n      
      for j = k : n
        mul = A(i, k) / A(k, k);
        A(i,j) = A(i,j) - mul *  A(k,j);
      end
    end
  end
  
  A
  g = A\b;
endfunction
