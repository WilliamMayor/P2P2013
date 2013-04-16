function draw(X, Y, x_label, y_label, p_title, filename, figure1)
    axes1 = axes('Parent',figure1);
    box(axes1,'on');
    hold(axes1,'all');
    plot(X, Y);
    xlabel(x_label);
    ylabel(y_label);
    title(p_title);
    saveas(figure1,filename,'eps2c');
end