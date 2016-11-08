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
## @deftypefn {Function File} {@var{retval} =} wage_gap (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <tia@HP>
## Created: 2016-11-08

% Return the pair (underpaid, overpaid) players as arrays [$salary, $player_i]
function [underpaid, overpaid] = wage_gap (A)
  % (salary, player)
  underpaid = [-1 -1];
  overpaid = [-1 -1];
  k = size(A)(1)
  for i = 1:k {
    delta = b(i) - (A(i, 1) + A(i, 2) - A(i, 3));
    % underpaid player
    if (delta / x(i) < underpaid(1))
      underpaid = [delta / x, i]
    % overpaid player
    if (delta x(i) > overpaid(1))
      overpaid = [delta / x, i]  
   }
endfunction
