# Copyright 2017 UniCredit S.p.A.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
import cello, unittest

template `=~`(a, b: float): bool =
  ((b - a) / (max(a, b))) < 1e-10


suite "Jaro similarity":
  test "computing Jaro similarity":
    check jaro("MARTHA", "MARHTA") =~ 0.9444444444
    check jaro("DIXON", "DICKSONX") =~ 0.7666666667
    check jaro("JELLYFISH", "SMELLYFISH") =~ 0.8962962963
    check jaro("ALEXANDRE", "ALEKSANDER") =~ 0.8546296296

  test "computing Jaro-Winkler similarity":
    check jaroWinkler("MARTHA", "MARHTA") =~ 0.9611111111
    check jaroWinkler("DIXON", "DICKSONX") =~ 0.8133333333
    check jaroWinkler("JELLYFISH", "SMELLYFISH") =~ 0.8962962963
    check jaroWinkler("ALEXANDRE", "ALEKSANDER") =~ 0.8982407407
    check jaroWinkler("MATEMATICA", "MATHEMATICS") =~ 0.9342424242