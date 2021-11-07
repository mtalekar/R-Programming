#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
profit_per_month <- revenue - expenses
revenue_after_tax <- revenue * (70/100)
profit_after_tax <- revenue_after_tax - expenses
profit_margin_per_month <- profit_after_tax / revenue

profit_mean_year = sum(profit_after_tax) / 12
prof_mean = round(mean(profit_after_tax))

good_months <- profit_after_tax > profit_mean_year 
bad_months <- profit_after_tax < profit_mean_year 
best_month <- round(max(profit_after_tax))
worst_month <- round(min(profit_after_tax))
