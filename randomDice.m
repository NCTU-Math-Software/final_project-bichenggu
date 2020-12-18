function randomDice()
    format long
    P1(36)=0;
    P2(36)=0;
    mysum=0;
    
    %{
    for qq=1:4
        for ww=1:4 
            for ee=1:4
                for rr=1:4
                    for tt=1:4
                        for yy=1:4
                            for uu=1:4
                                for ii=1:4
                                    for pp=1:4
                                        k=qq+ww+ee+rr+tt+yy+uu+ii+pp;
                                        P1(k)=P1(k)+1;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    %}
    P1=num_dice(9,4);
    %{
    for tt=1:6
        for yy=1:6
            for uu=1:6
                for ii=1:6
                    for jj=1:6 
                        for pp=1:6
                            k=tt+yy+uu+ii+jj+pp;
                            P2(k)=P2(k)+1;
                        end
                    end
                end
            end
        end
    end   
    %}
    P2=num_dice(6,6);
    for ii=9:36
        for jj=6:36
            if ii>jj
                mysum=mysum+P1(ii)*P2(jj);
            else
                break;
            end
        end
    end
    %disp(mysum)
    p=mysum/(6^6)/(4^9);
    ppre=roundn(p,-7);
    digits(9)
    vpa(ppre)

end

function pro=num_dice(n,d)
    p(n*d)=0;
    
    for ii=1:n
        if ii==1
            pro=ones(1,d);
        else            
            frontPro=num_dice(ii-1,d);
            frontStart=ii-1;
            frontFinal=(ii-1)*d;
            for jj=1:d
                for kk=frontStart:frontFinal
                    p(jj+kk)=p(jj+kk)+frontPro(kk);
                end
            end
            
            pro=p;
        end     
        
    end

end