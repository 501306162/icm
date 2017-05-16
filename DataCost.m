function datacost = DataCost(fixed_label,moving_label,model)
%   calculate the data term of current pixel

    switch model
        case 'L1_norm'
            datacost=L1_norm(fixed_label,moving_label);
        case 'L2_norm'
            datacost=L2_norm(fixed_label,moving_label);
        case 'MAD'
            datacost=MAD(fixed_label,moving_label);
        case 'MSD'
            datacost=MSD(fixed_label,moving_label);
        case 'Normalized_L2'
            datacost=Normalized_L2(fixed_label,moving_label);
        case 'Incremental_sign_distance'
            datacost=Incremental_sign_distance(fixed_label,moving_label);
        case 'Intensity_Ratio_Variance' 
            datacost=Intensity_Ratio_Variance(fixed_label,moving_label);
        case 'Joint_Entropy'
            datacost=Joint_Entropy(fixed_label,moving_label);
    end
    
%     for ind=1:1:numel(moving)
%             % the neighbors's index of current pixel
%             neighbors_ind=neighborhood(ind,moving,N);
%             
%             
%     end        

end
% fixed-moving label 是两列数据..代表全部的点的label...
% dissimilarity ...can weight with e^x  
function l1=L1_norm(fixed_label,moving_label)
    l1=sum(abs(fixed_label-moving_label));
end

function l2=L2_norm(fixed_label,moving_label)
    l2=sum((fixed_label-moving_label).^2);
end

% dissimilarity used in all the pixel
function mad=MAD(fixed_label,moving_label)
    mad=median(abs(fixed_label-moving_label));
end

function msd=MSD(fixed_label,moving_label)
    msd=median((fixed_label-moving_label).^2);
end

function norl2=Normalized_L2(fixed_label,moving_label)
% the average performance is good
    n=numel(fixed_label);
    siama_f=sqrt((1/n)*sum((fixed_label-mean(fixed_label)).^2));
    siama_m=sqrt((1/n)*sum((moving_label-mean(moving_label)).^2));
    
    % modified lable set
    f_l=(fixed_label-mean(fixed_label))./sigma_f;
    m_l=(moving_label-mean(moving_label))./sigma_m;
    
    norl2=sum((fl-ml).^2);
end

function isd=Incremental_sign_distance(fixed_label,moving_label)
% let bi=1, if x(i+1)>x(i)
%     bi=0, otherwise
    f_sign=fixed_label(2:end)-fixed_label(1:(end-1));
    f_sign(f_sign~=1)=0;
    m_sign=moving_label(2:end)-moving_label(1:(end-1));
    m_sign(m_sign~=1)=0;
    
%   calculate the 'hamming' distance  
    isd=sum(xor(f_sign,m_sign)); 
end

function rv=Intensity_Ratio_Variance(fixed_label,moving_label)
% e is a small number to avoid division by 0
    e=1;
    n=numel(fixed_label);
    ri=(fixed_label+e)./(moving_label+e);
    rv=(1/n)*sum((ri-mean(ri)).^2);
end

function je=Joint_Entropy(fixed_label,moving_label)
    hij=zeros(256,256);
    if max(max(fixed_label))~=min(min(fixed_label))
        fixed_label=(fixed_label-min(min(fixed_label)))/(max(max(fixed_label))-min(min(fixed_label)));
    else
        fixed_label=zeros(numel(fixed_label),1);
    end
    if max(max(moving_label))~=min(min(moving_label))
        moving_label=(moving_label-min(min(moving_label)))/(max(max(moving_label))-min(min(moving_label)));
    else
        moving_label=zeros(numel(moving_label),1);
    end
    fixed_label=double(int16(fixed_label*255))+1;
    moving_label=double(int16(moving_label*255))+1;
    
    for i=1:numel(fixed_label)
        index_x=fixed_label(i);
        index_y=moving_label(i);
        hij(index_x,index_y)=hij(index_x,index_y)+1;
    end
    hijsum=sum(sum(hij));
    index=find(hij~=0);
    pij=hij/hijsum;
    je=-sum(sum(pij(index).*log2(pij(index))));
end
