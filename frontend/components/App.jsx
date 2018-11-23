import React from 'react';
import { Provider } from 'react-redux';
import {
  Route,
  Switch,
  Link,
  HashRouter
} from 'react-router-dom';

import GreetingContainer from './greeting/greeting_container';
import SignUpFormContainer from './SessionForms/signup_form_container';
import LogInFormContainer from './SessionForms/login_form_container';
import {AuthRoute, ProtectedRoute} from '../util/route_util';
import StockContainer from './stocks/stock_container';

const App = () => (
  <div>
    <Switch>
      <Route exact path="/" component={GreetingContainer}/>
      <AuthRoute exact path="/login" component={LogInFormContainer} />
      <AuthRoute exact path="/signup" component={SignUpFormContainer} />
      <ProtectedRoute exact path="/stock/:ticker" component={StockContainer}/>
    </Switch>
  </div>
);

// <Route exact path="/login" component={LogInFormContainer} />
// <Route exact path="/signup" component={SignUpFormContainer} />
export default App;
