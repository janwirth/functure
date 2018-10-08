# functure
A case study - the functional future of full stack development

Warning: Opioninated

## The Functure Stack
- Serverless-Haskell Backend 
- Elm frontend using create-elm-app
- elm-bridge for type-safe connection
- Serverless offline for a smooth dev experience

## Why?
_Please note that this is NOT firing shots at the JS language - I think it is a great tool. Likewise, the JS frameworks out there are great tools. I just think we can do better._
### Hypothesis 1: Frontend is a solved problem.

The entire Frontend ecosystem slowly converges _exactly_ onto elm.

Around 2015 the React became the hot stuff along with Vue.
Now we have very simple, mostly functional view layers.

react or vue + redux = the elm architecture.

redux or vue + redux + typescript or flow + Immutable = bloated (see gzipped size), unsafe (TS makes thing safe but not bulletproof) elm with bad compiler messages (hard to read, hard to act upon). Webpack configurations are becoming hard to maintain. 

2018 (today) ReasonReact is apparently THE way to write react. Now we have something that sounds familiar (React) with two ecosystems. One that is safe and another one that is unsafe. The compiler is still not very helpful. The syntax is still ugly.

Ask yourself - do you want to spend three more years working on something that has not real end in sight or on something that is already solving the problem well?

### Hypothesis 2: My grandmother can probably write better frontend code with elm than me with some-hot-JS-framework
I do _not_ think exactly that. But elm is easier to learn and easier to master than _any_ JS framework let alone the entire JS language. I have five years of experience in JS now and 0.5 years in elm and I feel almost as comfortable in elm as in JS.


![The feelz](https://github.com/FranzSkuffka/functure/blob/master/what-frontend-feels-like.png?raw=true)

*Why I believe Elm is unpopular*
- React and Vue have better Marketing
- React and Vue have better release cycles
- React and Vue have much better Community management 

## MVP Roadmap
Core of issue cluster here: https://github.com/seek-oss/serverless-haskell/issues/69
- update elm-bridge
- fix serverless-offline package
- implement good watch mechanism for serverless haskel
- provide built-in serverless Auth pattern
- add DynamoDB bindings (or other DB bindings)
