import React from 'react';

import GiphysIndex from './giphys_index';

class GiphySearch extends React.Component{
    constructor(props){
        super(props);
        this.state = { searchTerm: "" }
        this.handleChange = this.handleChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleChange(e){
        e.preventDefault();
        this.setState({searchTerm: e.target.value})
    }

    handleSubmit(e){
        e.preventDefault();
        this.props.fetchSearchGiphys(this.state.searchTerm);
    }

    render(){
        return (
            <div>
        <form>
            <input type="text" onChange={this.handleChange}/>
            <input type="submit" value="Search" onClick={this.handleSubmit}/>
        </form>
        <h1>Results</h1>
        <GiphysIndex giphys={this.props.giphys}/>
        </div>
        )
    }

}
        
export default GiphySearch;