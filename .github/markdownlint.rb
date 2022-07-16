# Markdownlint style configuration

# Enable everything by default.
all

# Extend line length just a bit.
rule 'MD013', :line_length => 125

# Allow in-line HTML
exclude_rule 'MD033'

# Allow headers to end in punctuation
exclude_rule 'MD026'

# Allow bare URLs
exclude_rule 'MD034'
