for lesson in 1_computing_intro/1_computing_intro \
    2_prob_stat_intro/2_prob_stat_intro \
    3_efficiency/3_efficiency \
    4_mistaken_assumptions/4_mistaken_assumptions \
    5_outlier_robustness/5_outlier_robustness \
    6_be_conservative/6_be_conservative 
do
    pandoc -f markdown -t latex ${lesson}.md -o ${lesson}.pdf
done

