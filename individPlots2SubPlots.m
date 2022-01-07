function individPlots2SubPlots(axS, subplotDim)
%{
Take individual figures and put them to onto subplots. 

INPUTS:
axS: axis handles [N x 1]
subplotDim: subplot dimensions [1 x 2]

OUTPUT:
Figure with graphs from figure handles in one figure that has subplots with
given dimensions

%}

f = figure();
axSP = gobjects(size(axS)); 
for i = 1:sum(subplotDim)
    axSP(i) = subplot(subplotDim(1), subplotDim(2), i, 'parent', f);
end
for i = 1:sum(subplotDim)
    axcp = copyobj(axS(i), f);
    set(axcp, 'position', get(axSP(i), 'position'));
    delete(axSP(i)); 
end

end

