# R Methodology Flowchart — Grid-Based Workflow Diagram (Gmisc)

An R script that programmatically builds a methodology (workflow) flowchart using
the Gmisc grid-based flowchart framework. Boxes are laid out and connected on a
grid graphics canvas, producing a reproducible, code-generated diagram of a
research workflow (data collection, field survey, GIS modelling and mapping,
Python and R analysis, data coordination, and exclusion of noise). The diagram
was used as the methodology figure of the study cited below.

## Related publication

This script (methodology_flowchart_gmisc.R) produced the methodology (workflow)
flowchart figure in:

Lemenkova, P. Artificial Neural Networks for Mapping Coastal Lagoon of Chilika
Lake, India, Using Earth Observation Data. Journal of Marine Science and
Engineering 2024, 12(5), 709.

- DOI:    https://doi.org/10.3390/jmse12050709
- Zenodo: https://zenodo.org/records/11066668
- HAL:    https://hal.science/hal-04559189v1
- SSRN:   https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4807301
- MDPI:   https://www.mdpi.com/2077-1312/12/5/709 (ISSN 2077-1312, Scopus / Web of Science)

The article itself applies artificial neural networks to Earth-observation
imagery; this repository contains only the R script that draws its workflow
flowchart.

## Script

### methodology_flowchart_gmisc.R
- Defines flowchart nodes as grid graphical objects with Gmisc::boxGrob, each
  label assembled from multiple lines with glue.
- Arranges the primary vertical sequence with spreadVertical, aligns and
  distributes the parallel sub-process boxes with alignVertical and
  spreadHorizontal, and repositions the "excluded" box with moveBox.
- Draws the connectors between boxes with connectGrob (vertical, N-type and
  L-type links), iterating over the sequence to chain the main path.
- Renders everything on a fresh grid page (grid.newpage), using a magrittr pipe
  to compose the layout steps.

## Methods and techniques

- Programmatic, reproducible flowchart construction (diagram as code) rather than
  manual drawing.
- Grid graphics graphical objects (grobs) for boxes and connectors (Gmisc).
- Automatic vertical/horizontal alignment and spreading of nodes, with explicit
  repositioning for side boxes.
- Multi-line label composition with glue.

## Requirements

- R (>= 3.5)
- Packages: Gmisc, glue, htmlTable, grid, magrittr

Install with:

    install.packages(c("Gmisc", "glue", "htmlTable", "magrittr"))

## Usage

Run the script directly:

    Rscript methodology_flowchart_gmisc.R

It opens a grid graphics device and draws the flowchart; edit the boxGrob labels
and connectGrob links to adapt the workflow.

## Author and citation

Polina Lemenkova
ORCID: https://orcid.org/0000-0002-5759-1089

If you use this script, please cite:

Lemenkova, P. Artificial Neural Networks for Mapping Coastal Lagoon of Chilika
Lake, India, Using Earth Observation Data. Journal of Marine Science and
Engineering 2024, 12(5), 709. https://doi.org/10.3390/jmse12050709

## License

No license file is currently included. For reuse terms, please contact the
author via the ORCID record above.
