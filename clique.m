function clique_cost=clique(neighbors_ind,N)
% return the cliques of 'ind ' pixel 
% switch (N)
%     case 8
%        clique_ind= neighborhood2d(ind,image);
%     case 26
%        clique_ind= neighborhood3d(ind,image);   
%     otherwise
%        fprintf('%d is not include in the neighborhood type!',N);


end

function clique_cost=clique_1(ind,fixed_label,moving_label,N)
% return the sigle-cliques of 'ind ' pixel 
    dataCost=DataCost(ind,fixed_label,moving_label,N);
    clique_cost=dataCost;
end

function clique_cost=clique_2(ind,fixed_label,moving_label,N)
% return the pair-cliques of 'ind ' pixel 

end

function clique_cost=clique_3(ind,fixed_label,moving_label,N)
% return the triple-cliques of 'ind ' pixel 

end