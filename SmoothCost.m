function cost = SmoothCost(moving_label,clique2,model)
%   calculate the smooth term     

        

end

function cost = TAD(moving_label,ind,neighbors_ind,clique2)
%   Calculates the truncated absolute difference between 'moving' i&i'    
    e=0;
    m_l=moving_label;
    for i=1:numel(neighbors_ind)
        e+=(m_l(ind)-m_l(i))^2;
        
    end
    
end