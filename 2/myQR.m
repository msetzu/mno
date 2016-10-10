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
## @deftypefn {Function File} {@var{retval} =} myQR (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <tia@HP>
## Created: 2016-10-04

function [Q, R] = myQR (A)
  m = size(A)(1);
  n = size(A)(2);
  Q = eye(m);
  R = A;
  
  for k = 1:n
      vector = R(k:end,k)
      I_k = eye(k - 1);
      
      H_k = householder_reflector(vector);
      a = I_k
      b = zeros(k - 1, n - k - 1)
      c = zeros(m - k - 1, k - 1)
      d = H_k(1:end,1:end)
      H_k
      e = [I_k b]
      f = [c H_k]
      Q_k = [I_k b; c H_k]
      Q = Q * Q_k
      R_k = H_k * R(k:end, k:end)
  end
  
  R = R_k;
endfunction
