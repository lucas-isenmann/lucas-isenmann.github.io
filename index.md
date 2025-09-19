<style>

img {
    border-radius: 10px;
}

.article {
    border-radius: 10px;
    padding: 20px;
    background-color: #1a1a1a;
    position: relative;
    cursor: pointer;
    margin: 20px;
}

.description-tooltip {
    background-color: black;
    position: fixed;
    right: 20px;
    top: 20px;
    width: 300px;
    padding: 15px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    opacity: 0;
    visibility: hidden;
    transition: opacity 1s ease-in-out;
    z-index: 1000;
}

/* Show tooltip on hover */
.article:hover + .description-tooltip,
.article:focus + .description-tooltip {
    opacity: 1;
    visibility: visible;
}

/* Arrow pointing to trigger */
.description-tooltip::before {
    content: '';
    position: absolute;
    left: -10px;
    top: 50%;
    border-width: 10px 10px 10px 0;
    border-style: solid;
    border-color: transparent black transparent transparent;
}
    
body {
    max-width: 700px;
    margin-left: auto;
    margin-right: auto;
    padding: 0 20px;
    background-color: #222;
    color: #fff;
    font-family: system-ui, -apple-system, sans-serif;
}

h2, h3 {
    font-weight: bold;
    color: lightblue;
    transition: all 0.3s ease;
    position: relative;
    margin: 1.5em 0;
    padding-bottom: 0.5em;
}

h2:hover, h3:hover {
    color: #7fffd4;
    transform: translateY(-2px);
    text-shadow: 0 2px 4px rgba(127, 255, 212, 0.3);
}

h2::after, h3::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 2px;
    background: aquamarine;
    transform: scaleX(0);
    transition: transform 0.3s ease;
}

h2:hover::after, h3:hover::after {
    transform: scaleX(1);
}

a {
    color: aquamarine;
    text-decoration: none;
    transition: color 0.3s ease;
}

a:hover {
    color: #7fffd4;
}
</style>


💼 Assistant Professor (ATER in french)

🏫 University of Strasbourg, France

✉️ lucasisenmann (at) unistra.fr

## Research interests

- Planar graphs and intersection graphs
- Order dimension
- Clusters in graphs
- Degreewidth of tournaments
- Distance identifying problems


## Publications

### Submitted Papers

<div class="article">

**Correlation Clustering with Overlap: a Heuristic Graph Editing Approach**
(with Faisal N. Abu-Khzam and Sergio Thoumi)
Submitted
[ArXiv Preprint](https://arxiv.org/abs/2412.02704)
</div>
<div class="description-tooltip">

![Alt text](img/cluster_vertex_splitting.png)

**Cluster Editing** consists in adding and deleting edges so that the resulting graph is an union of cliques.
The problem is that this model does not allow data to be contained in several clusters.

We address this latter problem by allowing vertex to be split.
We develop heuristics for this **Cluster Vertex Splitting** problem and compare them to classical algorithms.
</div>






### Journal Publications

<div class="article">

**Dushnik-Miller dimension of TD-Delaunay complexes**
(with Daniel Gonçalves)
*European Journal on Combinatorics*,
2019
[ArXiv Preprint](https://arxiv.org/abs/1803.09576)
</div>

<div class="article">

**On the Distance Identifying Set meta-problem and applications to the complexity of identifying problems on graphs**
(with Florian Barbero and Jocelyn Thiebaut)
*Algorithmitica*,
2018
[ArXiv Preprint](https://arxiv.org/abs/1810.03868)
</div>

### International conferences

<div class="article">

**Bicluster Editing with Overlaps: A Vertex Splitting Approach**
(with Faisal N. Abu-Khzam and Zeina Merchard)
*IWOCA 2025*,
[ArXiv Preprint](https://arxiv.org/abs/2505.03959)
[Conference Slides](slides/BCEVS_iwoca_slides.pdf)
</div>
<div class="description-tooltip">

![Alt text](img/BCEVS.png)

**Bicluster Editing with Overlaps** consists in splitting the vertices of a bipartite graph and deleting or adding edges so that the graph becomes an union of bicliques.
</div>

<div class="article">

**On the complexity of 2-club Cluster Editing with Vertex Splitting**
(with Faisal N. Abu-Khzam, [Tom Davot](https://www.univ-angers.fr/fr/acces-directs/annuaire-2/d/a/uduser-t-davot-fr.html) and Sergio Thoumi)
*COCOON 2025*,
[ArXiv Preprint](https://arxiv.org/abs/2411.04846)
[Conference Slides](slides/2CCEDVS_COCOON.pdf)
</div>
<div class="description-tooltip">

![Alt text](img/2CCEDVS.png)

A 2-club is graph with diameter at most 2 (each pair of vertices are at distance at most 2).
**2-Club Cluster Editing with Vertex Splitting** consists in adding and removing edges and split vertices so that the resulting graph is an union of 2-clubs.
</div>

<div class="article">

**Domination in Diameter-Two Graphs and the 2-Club Vertex Deletion Parameter**
(with Faisal N. Abu-Khzam)
*ITCJS-FAW*,
2025
[ArXiv Preprint](https://arxiv.org/abs/2408.08418)
[Conference Slides](slides/domination_diameter_2_faw_slides.pdf)
</div>
<div class="description-tooltip">

We prove that 
- Independent Dominating Set is W2-hard in graphs of diameter at most 2
- 2CCVD parameterized by solution size is FPT
</div>

<div class="article">

**Degreewidth : a new parameter for solving problems on tournaments**
(with [Tom Davot](https://www.univ-angers.fr/fr/acces-directs/annuaire-2/d/a/uduser-t-davot-fr.html), Sanjukta Roy and Jocelyn Thiebaut)
*WG*,
2023
[ArXiv Preprint](https://arxiv.org/abs/2212.06007)
</div>
<div class="description-tooltip">

![Alt text](img/DW.png)

The **degreewidth** of a tournament is the minimum of the maximum number of backward arcs incident to vertices for every order of the vertices.
We prove
- it is NP-complete to compute it
- DS parameterized by DW is FPT
</div>

<div class="article">

**Analysis of the Sybil defense of Duniter-based cryptocurrencies**
*FRCSS*,
2021
</div>
<div class="description-tooltip">

![Alt text](img/duniter.png)

Duniter is a cryptocurrency wher each user is generating money on a regular basis.
To avoid Sybil attacks (i.e. that malicious users create fake accounts and gain more money), some graph theoritical rules.
We study the limits of these defenses.
</div>

<div class="article">

**On the approximation hardness of geodetic set and its variants**
(with Tom Davot and Jocelyn Thiebaut)
*COCOON*, 2021
[HAL](https://hal.science/lirmm-03328636v2)
</div>


<div class="article">

**Dushnik-Miller dimension of stair contact complexes**
(with Daniel Gonçalves)
*EuroComb*, 2019
</div>



<div class="article">

**Discrete Morse theory for the collapsibility of supremum sections**
(with Balthazar Bauer)
*ICGT*, 2018
[ArXiv Preprint](https://arxiv.org/abs/1803.09577)
</div>

<div class="article">

**Planar graphs as L-intersection or L-contact graphs**
(with Daniel Gonçalves and Claire Pennarun)
*SODA*, 2018
[ArXiv Preprint](https://arxiv.org/abs/1707.08833)
</div>

<div class="article">

**Möbius stanchion system**
(with Timothée Pecatte)
*LAGOS*, 2017
</div>




### Thesis


<div class="article">

**From planar graphs to higher dimension**
PhD Thesis supervised by [Daniel Gonçalves](https://www.lirmm.fr/~goncalves/pmwiki/).
Defended in 2019.
[HAL](https://theses.hal.science/tel-02931761/)
</div>


## Softwares

<div class="article">

[Gracoon](www.gracoon.com) - An online collaborative graph editor.
</div>

<div class="article">

[Agreg-maths.fr](www.agreg-maths.fr) - A website collecting ressources for the agregation of mathematics in France.
</div>

<div class="article">

[PACE 2024](https://github.com/lucas-isenmann/pace24-ocm/tree/final) - An exact solver for the PACE 2024 challenge on the One sided Crossing Minimization problem 
</div>
