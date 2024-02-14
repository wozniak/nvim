return {
	s({trig="ddx", snippetType="autosnippet"}, { t("\frac{d}{dx} ") }),
	s({trig="dydx", snippetType="autosnippet"}, { t("\\dv{y}{x}") }),
	s({trig="dv", snippetType="autosnippet"}, fmta("\\dv{<>}{<>}", { i(1), i(2) }) ),
	s({trig=";t", snippetType="autosnippet"}, { t("\\theta") }),
	s({trig=";m", snippetType="autosnippet"}, { t("\\mu") }),
	s({trig=";p", snippetType="autosnippet"}, { t("\\pi") }),
	s({trig=",pack", snippetType="autosnippet"}, fmta("\\usepackage{<>}", { i(1) })),
	s({trig="ff", snippetType="autosnippet"},
	  {
		t("\\frac{"),
		i(1),  -- insert node 1
		t("}{"),
		i(2),  -- insert node 2
		t("}")
	  }
	),
	s({trig="env", snippetType="autosnippet"},
	  fmta("\\begin{<>}\n\t<>\n\\end{<>}",
		{
		  i(1),
		  i(2),
		  rep(1),
		}
	  )
	),
	s({trig=",lim", snippetType="autosnippet"},
		fmta("\\lim_{<>\\to<>}", { i(1), i(2) })
	),
	s({trig=",int", snippetType="autosnippet"},
		fmta("\\int_{<>}^{<>} <>\\, d<>", { i(1), i(2), i(3), i(4) })
	),
	s({trig=",anti", snippetType="autosnippet"},
		fmta("\\int <>\\, d<>", { i(1), i(2) })
	),
	s({trig=",mm", snippetType="autosnippet"},
		fmta("$$\n<>\n$$", { i(1) })
	),
}
