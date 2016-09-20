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
## @deftypefn {Function File} {@var{retval} =} generate_matrix (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <tia@HP>
## Created: 2016-09-20

function [N] = generate_matrix ()
 % return a 10x10 matrix whose first 9 rows are random in 0,1
 % and the last row is the sum of the previius ones
 % sum(MATRIX, N) sums the elements in MATRIX by the Nth dimension: 1 for columns,
 % two for rows.
 M = rand(9,10);
 m = sum(M, 2);
 N = [M ; m']
endfunction
