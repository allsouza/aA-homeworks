const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state, action) => {
  state = state || initialState;
  switch (action.type){
    case ("SWITCH_LOCATION"):
      // debugger
        return {jobs: action.jobs, city: action.city}
      default:
        return state;
    }
};

export default reducer;
