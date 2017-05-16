fixed=randi(5,5,5);
moving=randi(5,5,5);


imagesc(fixed);
imagesc(moving);

data=DataCost(fixed,moving);
    for ind=1:1:numel(moving)
            % the neighbors's index of current pixel
            neighbors_ind=neighborhood(ind,moving,N);
            % the neighbors's pixel value of current pixel
            neighbors_val=moving([neighbors_ind]);
    end
    
        if (nargin<3)
        N = 8;
    end