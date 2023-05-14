# Network Analysis with Approximate Bayesian Computation

## Background

_**Network analysis**_ is a field of study to understand the structure, behavior, and function of complex systems composed of interconnected components, such as social networks, transportation systems, biological networks, and computer networks. In a network, an entity can be connected to other entities through links. These discrete entities are fundamental components of a network and are called _**nodes**_. Depending on the context and application of the analysis, nodes can represent a wide variety of entities, such as people, organization, web pages, genes, airports, and cities. Each node is usually assigned a unique identifier that distinguishes it from other nodes in the network.

_**Contagion model**_ is an example of the network analysis. Contagion models describe the spread of an attribute in a network: diseases in contact networks, behaviors in friend networks, ideas in discussion networks, and so on. This project is based on a study on how doctors adopted a new drug. Coleman, Katz, and Menzel[^1] collected data on doctors in several cities in Illinois, including the first date on which they prescribed tetracycline (a new drug at the time) and which other doctors they went to for advice or discussion of treatment options. One of the theories investigated in the paper was that doctors who knew other doctors who had already prescribed the drug adopted it more quickly than those who didn’t. This behavior can be described as a contagion model. 

In this project, we will simulate from a contagion model and use the simulations to obtain an approximate posterior distribution of the contagion parameter using approximate Bayesian computation. The contagion model I will use is the susceptible-infected (SI) contagion model. In this model, each of the nodes in a network can be either susceptible to infection or already infected. At each time step, each infected node picks one of its neighbors uniformly at random. If the chosen neighbor is not infected, it becomes infected with probability $p$. For this project, each of the nodes is a doctor, an _“infected”_ node is a doctor who has prescribed tetracycline, and the links in the network are doctors who discuss cases with each other.

## Data Description

This data set was prepared by Ron Burt[^2]. He dug out the 1966 data collected by Coleman, Katz and Menzel on medical innovation. They had collected data from physicians in four towns in Illinois, Peoria, Bloomington, Quincy and Galesburg. They were concerned with the impact of network ties on the physicians' adoprion of a new drug, tetracycline. Three sociometric matrices were generated. One was based on the replies to a question, "When you need information or advice about questions of therapy where do you usually turn?" A second stemmed from the question "And who are the three or four physicians with whom you most often find yourself discussing cases or therapy in the course of an ordinary week -- last week for instance?" And the third was simply "Would you tell me the first names of your three friends whom you see most often socially?"

In addition, records of prescriptions were reviewed and some other questions were asked. The ```attributes.csv``` file contains 13 attributes for each of 117 physicians: city of practice, recorded date of tetracycline adoption date, years in practice, meetings attended, journal subscriptions, free time activities, discussions, club memberships, friends, time in the community, patient load, physical proximity to other physicians and medical specialty. The codes are:

**City**: 1 Peoria, 2 Bloomington, 3 Quincy, 4 Galesburg

**Adoption Date**:  
1 November, 1953  
2 December, 1953  
3 January, 1954  
4 February, 1954  
5 March, 1954  
6 April, 1954  
7 May, 1954  
8 June, 1954  
9 July, 1954  
10 August, 1954  
11 September, 1954  
12 October, 1954  
13 November, 1954  
14 December, 1954  
15 December/January, 1954/1955  
16 January/February, 1955  
17 February, 1955  
18 no prescriptions found  
98 no prescription data obtained

**Year started in the profession**
1 1919 or before
2 1920-1929
3 1930-1934
4 1935-1939
5 1940-1944
6 1945 or later
9 no answer

**Have you attended any national, regional or state conventions of professional societies during the last 12 months? [if yes] Which ones**?  
0 none  
1 only general meetings  
2 specialty meetings  
9 no answer  

**Which medical journals do you receive regularly**?  
1 two  
2 three  
3 four  
4 five  
5 six  
6 seven  
7 eight  
8 nine or more  
9 no answer  

**With whom do you actually spend more of your free time -- doctors or non-doctors**?  
1 non-doctors  
2 about evenly split between them  
3 doctors  
9 mssing; no answer, don't know  

**When you are with other doctors socially, do you like to talk about medical matter**?  
1 no  
2 yes  
3 don't care  
9 missing; no answer, don't know  

**Do you belong to any club or hobby composed mostly of doctors**?  
0 no  
1 yes  
9 no answer  

**Would you tell me who are your three friends whom you see most often socially? What is [their] occupation**?  
1 none are doctors  
2 one is a doctor  
3 two are doctors  
4 three are doctors  
9 no answer  

**How long have you been practicing in this community**?  
1 a year or less  
2 more than a year, up to two years  
3 more than two years, up to five years  
4 more than five years, up to ten years  
5 more than ten years, up to twenty years  
6 more than twenty years  
9 no answer  

**About how many office visits would you say you have during the average week at this time of year**?  
1 25 or less  
2 26-50  
3 51-75  
4 76-100  
5 101-150  
6 151 or more  
9 missing; no answer, don't know  

**Are there other physicians in this building? [if yes] Other physicians in same office or with same waiting room**?  
1 none in building  
2 some in building, but none share his office or waiting room  
3 some in building sharing his office or waiting room  
4 some in building perhaps sharing his office or waiting room  
9 no answer  

**Do you specialize in any particular field of medicine? [if yes] What is it**?  
1 GP, general practitioner  
2 internist  
3 pediatrician  
4 other specialty  
9 no answer  

## REFERENCES

[^1]: Coleman, James, Elihu Katz and Herbert Menzel. 1957. "The Diffusion of an Innovation Among Physicians," Sociometry, 20:253-270.  
[^2]: Burt, Ronald S. 1987. "Social Contagion and Innovation: Cohesion Versus Structural Equivalence," AJS 92: 1287-1335.
