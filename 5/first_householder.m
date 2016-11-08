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
## @deftypefn {Function File} {@var{retval} =} first_householder (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <tia@HP>
## Created: 2016-11-08

function [householder_pos, householder_neg] = first_householder (vector)
  m = size(vector)(1);
  n = size(vector)(2);

  vector_norm = norm(vector);

  I = eye(m);
  % canonical base
  e_k = eye(m)(:,1);
  householder_pos = [vector(1) + vector_norm * e_k(1), vector(2) + vector_norm * e_k(2), zeroes(m - 2)];
  householder_pos = [vector(1) - vector_norm * e_k(1), vector(2) + vector_norm * e_k(2), zeroes(m - 2)];
endfunction
