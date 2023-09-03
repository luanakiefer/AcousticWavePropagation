function plotProfile(depths, crossaxis, data, label, xLabel, unity, step)
    m = min(data(:));
    M = max(data(:));

    contourf(crossaxis, depths, transpose(data), m:step:M);
    title(label)
    set(gca, "xdir", "reverse")
    axis ij
    h = colorbar;
    h.Label.String = unity;
    h.Label.FontSize = 14;
    xlabel(xLabel)
    ylabel("Profundidade (m)")
    ylim([0, 4000])
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel', a, 'fontsize', 18)
end

