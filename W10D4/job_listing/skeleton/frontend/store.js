import {createStore} from "redux";
import reducer from "../frontend/reducer";

const store = createStore(reducer);

export default store;