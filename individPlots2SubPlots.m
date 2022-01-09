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

arguments 
    axS (1,:) 
    subplotDim (1, 2) 
end
if length(axS) > sum(subplotDim)
    error('Sum of subplot dimension must be greater or equal to length of axis handles')
end

f = figure();
axSP = gobjects(size(axS)); 
for i = 1:subplotDim(1)*subplotDim(2)
    axSP(i) = subplot(subplotDim(1), subplotDim(2), i, 'parent', f);
end
for i = 1:length(axS)
    axcp = copyobj(axS(i), f);
    set(axcp, 'position', get(axSP(i), 'position'));
    delete(axSP(i)); 
end
if length(axS) < subplotDim(1) * subplotDim(2)
    delete(axSP(length(axS)+1:sum(subplotDim))); % delete unused axes
end

end

