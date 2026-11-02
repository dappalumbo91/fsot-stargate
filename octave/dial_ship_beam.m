% Copyright 2026 Damian Arthur Palumbo
% SPDX-License-Identifier: Apache-2.0
%
% Ship-scale stress-energy in the same energy-condition function as the shell.
% Minkowski grid. Positive dust plus a forward null flux.
% This is not an Einstein-equation shell and not a compactness dial.
FW = fileparts(mfilename('fullpath')); addpath(fileparts(FW)); setup_wf; addpath(FW);
outDir = getenv('OUT');
if isempty(outDir), error('Set OUT to a writable directory'); end
if exist(outDir, 'dir') ~= 7, mkdir(outDir); end
fid = fopen(fullfile(outDir, 'dial_ship_beam.txt'), 'w');
out = @(varargin) [fprintf(varargin{:}); fprintf(fid, varargin{:})];
out('ship beam. Minkowski dust plus +x null flux. Not a shell score.\n');
out('clean: every sampled observer stays above -1e-6 on a tensor of order 1\n');

gridSize = [1, 8, 8, 5];
M = metricGet_Minkowski(gridSize, [1, 1, 1, 1]);
labels = {"Null", "Weak", "Strong", "Dominant"};
cases = {"dust", "beam", "dust+beam"};
z = zeros(gridSize);
one = ones(gridSize);
for n = 1:3
  T.type = "Stress-Energy";
  T.coords = "cartesian";
  T.index = "contravariant";
  T.name = "ship-beam";
  T.date = date;
  for i = 1:4
    for j = 1:4
      T.tensor{i, j} = z;
    end
  end
  if n ~= 2
    T.tensor{1, 1} = one;
  end
  if n ~= 1
    T.tensor{1, 1} = T.tensor{1, 1} + one;
    T.tensor{1, 2} = one;
    T.tensor{2, 1} = one;
    T.tensor{2, 2} = one;
  end
  out('\n-- %s\n', cases{n});
  worst = 0;
  for k = 1:4
    tic;
    map = getEnergyConditions(T, M, labels{k}, 48, 8, 0, 0);
    mn = min(map(:));
    worst = min(worst, mn);
    out('%s min=%.6e max=%.6e %.2fs\n', labels{k}, mn, max(map(:)), toc);
  end
  if worst >= -1e-6
    out('%s CLEAN floor=%.6e\n', cases{n}, worst);
  else
    out('%s FAIL floor=%.6e\n', cases{n}, worst);
  end
  fflush(fid);
end
out('ship beam done\n');
fclose(fid);
