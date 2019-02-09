# Load the cdnow data
from lifetimes.datasets import load_cdnow_summary

data = load_cdnow_summary(index_col=[0])
data.head()

# Basic Frequency/Recency analysis using the BG/NBD model
from lifetimes import BetaGeoFitter

bgf = BetaGeoFitter(penalizer_coef=0.0)
bgf.fit(data['frequency'], data['recency'], data['T'])
bgf

## Visualizing our Frequency/Recency Matrix
from lifetimes.plotting import plot_frequency_recency_matrix

plot_frequency_recency_matrix(bgf)

from lifetimes.plotting import plot_probability_alive_matrix

plot_probability_alive_matrix(bgf)
