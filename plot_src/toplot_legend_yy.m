function toplot_legend_yy(xaxis,yaxis,yaxis2,plotname,h_legend,ax)
  %,legend1,legend2)
  fontsize_val=19;
  
  %horrible hack placed just to get the XTickLabels to start showing up with the 
  %right size in the err_box_plot.m output
  set(findobj(gca,'Type','text'),'FontSize',fontsize_val-4);
  %set(findobj(ax(2),'Type','text'),'FontSize',fontsize_val-4);
  
  %end horrible hack

  %setting xticks only for ax(1), adding it for ax(2) causes
  % the xticklabels to show up twice and overlap
  set(ax(1),'XTick',[0:5:40],'FontName','Times New Roman','FontSize',fontsize_val,'FontWeight','Normal','YColor','k');
  
  
  set(ax(2),'YTick',[0:20:100],'FontName','Times New Roman','FontSize',fontsize_val,'FontWeight','Normal','YColor','k');
  set(ax(1),'YTick',[0:20:100],'FontName','Times New Roman','FontSize',fontsize_val,'FontWeight','Normal','YColor','k');
  
  
  set(ax(1),'xlim',[1 40]);
  
  set(ax(1),'ylim',[0 101]);
  set(ax(2),'ylim',[0 101]);

  xlabel(xaxis,'FontName','Times New Roman','FontSize',fontsize_val,'Fontweight','Normal')
  ylabel(ax(1),yaxis,'FontName','Times New Roman','FontSize',fontsize_val,'Fontweight','Normal')
  ylabel(ax(2),yaxis2,'FontName','Times New Roman','FontSize',fontsize_val,'Fontweight','Normal')
  title(strcat(plotname),'FontSize',fontsize_val+2,'Fontweight','Normal','FontName','Times New Roman')
  set(gcf, 'PaperUnits', 'inches');
  set(gcf, 'PaperSize', [7.5 7.5]);
  set(gcf, 'PaperPositionMode', 'auto');
  set(gcf, 'PaperPosition', [0 0 7.5 7.5  ]);
  set(gca,'Fontsize',fontsize_val,'Fontname','Times New Roman','Fontweight','Normal');
  
 
  %h_legend = legend(legend1,legend2);
  set(h_legend,'Fontsize',fontsize_val,'Fontname','Times New Roman');
  rect = [0.62, 0.12, .25, .25];
  set(h_legend, 'Position', rect)
  legend boxoff;
end
