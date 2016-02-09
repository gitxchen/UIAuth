function [ax,p1,p2]=plot_eer_42(x_acc,acc,x_rej,rej,linecolor,linestyle);
  [ax,p1,p2]=plotyy(x_acc,acc,x_rej,rej);
  %set(p1,'Marker',marker);
  %set(p2,'Marker',marker);
  set(p1,'LineStyle',linestyle);
  set(p2,'LineStyle',linestyle);
  
  set(p1,'Linewidth',3);
  set(p2,'Linewidth',3);
  
  set(p1,'Color',linecolor)
  set(p2,'Color',linecolor)
  
  set(ax(1),'XTick',[])
  set(ax(2),'XTick',[])
  
  set(ax(1),'YTick',[])
  set(ax(2),'YTick',[])
  
end
