import streamlit as st
import pandas as pd
import numpy as np

st.title('Hello World')

st.write('Here is our first attempt at using data to create a table:')
st.write(pd.DataFrame({
    'first column': [1, 2, 3, 4],
    'second column': [10, 20, 30, 40]
}))

st.write('Here is our first attempt at using data to create a table:')
chart_data = pd.DataFrame(
        np.random.randn(20, 3),
        columns=['a', 'b', 'c'])

st.line_chart(chart_data)

st.write('Here is our first attempt at using data to create a table:')
chart_data = pd.DataFrame(
        np.random.randn(20, 3),
        columns=['a', 'b', 'c'])

st.area_chart(chart_data)



