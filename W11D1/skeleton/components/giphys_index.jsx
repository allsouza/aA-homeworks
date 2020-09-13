import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({giphys}) => {
    // debugger
    const items = giphys.map(giphy =>{
        return <li key={giphy.id}><GiphysIndexItem url={giphy.images.fixed_height.url} /></li>
    })
    return (
        <ul>
            {items}
        </ul>
    )
}

export default GiphysIndex;