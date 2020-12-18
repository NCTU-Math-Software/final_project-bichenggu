function randomDice()

    P1(36)=0;
    P2(36)=0;
    mysum=0;
    
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
    
    for tt=1:6
        for yy=1:6
            for uu=1:6
                for ii=1:6
                    for jj=1:6 
                        for pp=1:6
                            k=tt+yy+uu+ii++jj+pp;
                            P2(k)=P2(k)+1;
                        end
                    end
                end
            end
        end
    end   
    
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
    disp(p)

end