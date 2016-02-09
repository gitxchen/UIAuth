clear;

max_users=10;

for user1=1:max_users
  for user2=user1+1:max_users
    if user1 == user2
      continue;
    end
    

    clf;
    %1v3 pretty good
    %1v4 pretty good 
    %1v5 pretty good 
    %3v6 pretty good

    %1v8 really good
    %3v7 really good
    %4v8 really good
    %6v8 really good
    %7v8 really good
    %8v10 really good

    input_control='radiobutton';
    
    user1_str=strcat('/home/sharmav6/new_logs/new_logs/user',num2str(user1));
    user2_str=strcat('/home/sharmav6/new_logs/new_logs/user',num2str(user2));
    
    pts11=load(strcat(user1_str,'-',input_control,'-app1-downup.log'));
    pts12=load(strcat(user1_str,'-',input_control,'-app2-downup.log'));
    pts13=load(strcat(user1_str,'-',input_control,'-app3-downup.log'));
    pts14=load(strcat(user1_str,'-',input_control,'-app4-downup.log'));
    pts15=load(strcat(user1_str,'-',input_control,'-app5-downup.log'));
    
    pts21=load(strcat(user2_str,'-',input_control,'-app1-downup.log'));
    pts22=load(strcat(user2_str,'-',input_control,'-app2-downup.log'));
    pts23=load(strcat(user2_str,'-',input_control,'-app3-downup.log'));
    pts24=load(strcat(user2_str,'-',input_control,'-app4-downup.log'));
    pts25=load(strcat(user2_str,'-',input_control,'-app5-downup.log'));
    
    pts1=[pts11;pts12;pts13;pts14;pts15];
    pts2=[pts21;pts22;pts23;pts24;pts25];
    
    
    plot(pts1(:,1),pts1(:,2),'r*');
    
    hold on;
    plot(pts2(:,1),pts2(:,2),'bo');
    
    %xlabel('x-coordinate at pressed gesture start');
    %ylabel('y-coordinate at pressed gesture start');
    %ylabel('pressure at pressed gesture start');
    
    legend(num2str(user1),num2str(user2)); 
    filename=strcat('tmp_fig/',num2str(user1),'vs',num2str(user2))
    %print -depsc filename
    %print('-depsc',filename);
    hold off;
    input('Press enter');
  end
end
%1 vs 5 looks decent
%3 vs 16 looks decent
%5 vs 16 looks decent
%13 vs 16 looks decent
%3 vs 14 with columns 1 vs 3 plotted looks good 
%3 vs 16 with columns 1 vs 3 plotted looks good 
%3 vs 7 with cols 1 vs 3
