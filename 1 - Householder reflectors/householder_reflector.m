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

function [H_k] = householder_reflector (vector)
  m = size(vector)(1);
  n = size(vector)(2);

  vector_norm = norm(vector);

  I = eye(m);
  % canonical base
  e_k = eye(m)(:,1);
  reflection_vector = vector + sign(vector(1)) * vector_norm * e_k;
  reflection_vector_norm = norm(reflection_vector);

  H_k = I - (2 / reflection_vector_norm(1) ^ 2) * (reflection_vector * ctranspose(reflection_vector));
endfunction
