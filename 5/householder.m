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
## @deftypefn {Function File} {@var{retval} =} householder (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <tia@HP>
## Created: 2016-11-08

function [retval] = householder (A)
  [m,n] = size(A);
  for k = 1:min(m - 1,n)
    t = norm( A(k:m,k) );
    s = sign( A(k,k) ) * t;
    t = t^2 + s * (2 * A(k, k) + s);
    A(k, k) = A(k, k) + s;
    d(k) = -s;
    gamma = sqrt(2/t);
    A(k:m, k) = gamma * A(k:m, k);
    if (k < n)
      A(k:m, k + 1:n) = A(k:m, k + 1:n) - A(k:m, k) * (A(k:m, k) * A(k:m,k+1:n));
    end
  end  
  if (m <= n)
    d(m) = A(m,m);
  end
endfunction
