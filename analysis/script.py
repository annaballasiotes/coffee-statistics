#!/usr/bin/env python

import os
import pandas as pd
import scipy.stats as stats
import matplotlib.pyplot as plt

data_dir = os.path.join(os.path.dirname(os.path.dirname(__file__)), "data")
data = pd.read_csv(os.path.join(data_dir, "weights.csv"))
data = data.assign(loss=lambda x: (x.after - x.before) / x.before)

by_bag = data[data.brushed.eq(False)].boxplot(column=['loss'], by=['bag'], grid=False)
by_bag.set_title("Normalized Loss of Coffee Mass After Grinding by Bag")
by_bag.set_xlabel("Bag")
by_bag.set_xticks(ticks=[])
by_bag.set_ylabel("Normalized Loss (g/g)")

by_process = data.boxplot(column=['loss'], by=['brushed'], grid=False)
by_process.set_title("Normalized Loss of Coffee Mass After Grinding by Process")
by_process.set_xlabel("Process")
by_process.set_xticks(ticks=[1, 2])
by_process.set_xticklabels(labels=['None', 'Cleaned'])
by_process.set_ylabel("Normalized Loss (g/g)")