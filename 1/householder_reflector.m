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
## @deftypefn {Function File} {@var{retval} =} householder_reflector (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <tia@HP>
## Created: 2016-09-30

function [Hk] = householder_reflector (vector)
  rows = size(vector)(1);
  columns = size(vector)(2);
  
  alpha = norm(vector);
  
  I = eye(rows);
  % canonical base
  ek = transpose(eye(rows)(1,:));
  reflection_vectors = [vector + alpha * ek, vector + alpha * ek];
  
  Hk = I - (2 / norm(reflection_vectors(1) ^ 2) * reflection_vectors(1) * ctranspose(reflection_vectors(1));
endfunction
