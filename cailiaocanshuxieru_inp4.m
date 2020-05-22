% 将材料参数写入.inp文件
A=[168400.,121400., 75400.,     0.,     0.,     0.,     0.,     0.
     0.,     0.,     0.,     0.,     0.,     0.,     0.,     0.
     0.,     0.,     0.,     0.,     0.,     0.,     0.,     0.
     1.,     0.,     0.,     0.,     0.,     0.,     0.,     0.
     1.,     1.,     1.,     1.,     1.,     0.,     0.,     0.
     0.,     0.,     0.,     0.,     0.,     0.,     0.,     0.
     0.,     0.,     0.,     0.,     0.,     0.,     0.,     0.];         %7x8前面56个材料参数
 k=1;
 for i=1:7                                                 %转化为一维数组；
     for j=1:8
        a(k)=A(i,j);
        k=k+1;
     end
 end
 % 晶粒取向（有前面的晶粒取向函数生成）
 %  [u ,v, w, 0. 0. 1, 0. 0.     晶粒1第一个向量在晶体和整体做表中的值
  %  h, k, l, 0., 1., 0.,0., 0.,]晶粒2第一个向量在晶体和整体做表中的值
  %************************************************************************
  %**********  取向数O需要输入，当然，他由程序3计算得到*******************
  %************************************************************************
 %O=[-1.,     0.,     1.,     0.,     0.,     1.,     0.,     0.
    % 0.,     1.,     0.,     0.,     1.,     0.,     0.,     0.
    %-1.,     0.,     1.,     0.,     0.,     1.,     0.,     0.
    %0.,     1.,     0.,     0.,     1.,     0.,     0.,     0.
    % 0.,     1.,     0.,     0.,     1.,     0.,     0.,     0.
    %-1.,     0.,     1.,     0.,     0.,     1.,     0.,     0.];                %晶粒的取向 8x2，在每个材料参数矩阵中占两行（本来向量为3+3， 但会填零成矩阵）

[ii,jj]=size(O);
for l=1:ii
     k=1;                                    %转化为一维数组；
      for j=1:8
         o(l).orint(k)=O(l,j);
         k=k+1;
      end
end
 
 B=[10.,  0.001,     0.,     0.,     0.,     0.,     0.,     0.
     0.,     0.,     0.,     0.,     0.,     0.,     0.,     0.
     0.,     0.,     0.,     0.,     0.,     0.,     0.,     0.
  541.5,  109.5,   60.8,     0.,     0.,     0.,     0.,     0.
     1.,     1.,     0.,     0.,     0.,     0.,     0.,     0.
     0.,     0.,     0.,     0.,     0.,     0.,     0.,     0.
     0.,     0.,     0.,     0.,     0.,     0.,     0.,     0.
     0.,     0.,     0.,     0.,     0.,     0.,     0.,     0.
     0.,     0.,     0.,     0.,     0.,     0.,     0.,     0.
    0.5,     1.,     0.,     0.,     0.,     0.,     0.,     0.
     1.,    10.,  1.0000e-005,     0.,     0.,     0.,     0.,     0.];      %后11x8个材料参数
  k=1;
 for i=1:10                                                 %转化为一维数组；
     for j=1:8
        b(k)=B(i,j);
        k=k+1;
     end
 end
  
 si=size(O);   %判断晶粒个数
 si=si(1)/2;
 Depvar= 125;   %可能需要改变的变量
for i=1:si
     
    fid=fopen('cailiaocanshu.txt','a+')
    fprintf(fid, '**---------------------------------------- \n');
    fprintf(fid, '** \n');
    fprintf(fid, '*Material, name=CRYSTAL%i\n',i);
    fprintf(fid, '*Depvar \n');
    fprintf(fid,'%2i, \n',Depvar);
    fprintf(fid, '*User Material, constants=160, unsymm \n');
    fprintf(fid,'%8.1f, %8.1f, %8.1f, %8.1f, %8.1f, %8.1f, %8.1f, %8.1f \n',a);
    fprintf(fid, '**orient---------------------------------------- \n');
    for j=2*i-1:2*i
      fprintf(fid,'%8.4f, %8.4f, %8.4f, %8.4f, %8.4f, %8.4f, %8.4f, %8.4f \n',o(j).orint);
    end
    fprintf(fid, '**orient---------------------------------------- \n');
    fprintf(fid,'%8.4f, %8.4f, %8.4f, %8.4f, %8.4f, %8.4f, %8.4f, %8.4f \n',b);
    fprintf(fid,'      1.,      10.,    1e-05,       0.,       0.,       0.,       0.,       0. \n');
    fclose(fid);
end
       