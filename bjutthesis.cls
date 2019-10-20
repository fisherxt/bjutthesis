\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bjutthesis}[2019/09/16 2.7 Thesis Template]

\RequirePackage{xparse}
\RequirePackage{./cls/ezinfo}

%% Template MACROs
\DeclareRobustCommand{\bjutthesis}{ {\rmfamily B\textsc{\kern-.1emj\kern-.025emu\kern-.02emt}\kern-.08emT\kern-.1667em\lower.475ex\hbox{H}\kern-.0667emE\kern-.0667em\lower.475ex\hbox{S}\kern-.05emI\kern-.0667em\lower.475ex\hbox{S}} }
\def\version{ver.\,2.7}

%% ==== basics
\LoadClass[UTF8, scheme=plain, zihao=-4, linespread=1.56]{ctexbook}
\input{./cls/bjutthesis.cfg}
\ctexset {%
  punct      = quanjiao,
  space      = auto,
  autoindent = true,
  today      = old  }
\ctexset {%
  chapter = {
    beforeskip   = \z@,
    afterskip    = 5mm,
    fixskip      = false,
    indent       = \z@,
    format       = \bjut@chapter@font\centering,
    name         = {第, 章},
    nameformat   = {},
    titleformat  = {},
    numberformat = {}, 
    number       = \arabic{chapter},
    aftername    = \hspace{\ccwd},
    afterindent  = true,
    aftertitle   = {},
    pagestyle    = bjut@headings  },
  section = {
    beforeskip   = \z@, % \z@,
    afterskip    = \z@, % 2.3ex plus .2ex,
    indent       = \z@,
    format       = \bjut@section@font\raggedright,
    aftername    = \hspace{\ccwd},
    afterindent  = true  },
  subsection = {
    beforeskip   = \z@, % \z@,
    afterskip    = \z@, % 1.5ex plus .2ex,
    indent       = \z@,
    format       = \bjut@subsection@font\raggedright,
    aftername    = \hspace{\ccwd},
    afterindent  = true  },
  subsubsection = {
    beforeskip   = \z@,
    afterskip    = \z@,
    indent       = \z@,
    format       = \bjut@subsubsection@font,
    runin        = true,
    aftertitle   = \hspace{\ccwd}  }  }
\setlength{\parskip}{\z@}

%% ==== fonts, times new roman
\RequirePackage[T1]{fontenc}
\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{newtxmath}

%% ==== layout
\RequirePackage{geometry}
\geometry {%
  a4paper,
  hcentering,
  ignoreall,
  nomarginpar,
  headheight  = 5.0mm,
  headsep     = 5.5mm,
  top         = 25.4mm,
  bottom      = 25.4mm,
  left        = 31.7mm,
  right       = 31.7mm,
  footskip    = 8.5mm  }

%% ==== pagestyle
\renewcommand\frontmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{bjut@headings}  }
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{bjut@headings}  }
\renewcommand\backmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagestyle{bjut@headings}  }

%% ==== cross references
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\hypersetup{%
  linktoc=all,
  bookmarksnumbered  = true,
  bookmarksopen      = true,
  bookmarksopenlevel = 1,
  breaklinks         = true,
  colorlinks         = false,
  plainpages         = false,
  pdfborder          = 0 0 0  }
\urlstyle{same}

%% ==== eqs, figs and tabs
\RequirePackage{amsmath, mathtools, upgreek}             % eqs
\RequirePackage{graphicx, xcolor, tikz, pgfplots}        % figs
\RequirePackage{threeparttable, booktabs, longtable, multirow, dcolumn}  % tabs

%% ==== itemize and enumerate
\RequirePackage[shortlabels]{enumitem}
\setlist[itemize]{wide=2\ccwd}
\setlist[enumerate]{label=（\arabic*）, wide=2\ccwd, labelsep=0pt}
\setlist[enumerate,2]{label=\arabic*）, wide=4\ccwd, labelsep=0pt, leftmargin=2\ccwd}
\setlist[description]{wide=2\ccwd}
\setlist{nosep}

%% ==== numbering
\setcounter{secnumdepth}{3} % 4-level numbering: chap, sec, subsec and subsubsec
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}

%% ==== table of contents
\RequirePackage{./cls/bitoc}
\RequirePackage[titles]{tocloft}
\setcounter{tocdepth}{2}
% -- pagestyle
\tocloftpagestyle{bjut@headings}
% -- dotline: shape and seperation
\renewcommand\cftdot{$\cdot$}
\renewcommand\cftdotsep{0}
% -- chapter entries
\renewcommand{\cftchapfont}{\zihao{-4}\heiti}
\setlength\cftbeforechapskip{\z@}
%\setlength\cftchapnumwidth{3\ccwd}
\renewcommand{\cftchapaftersnumb}{}
\renewcommand{\cftchapdotsep}{0}
% -- section entries
\setlength\cftsecindent{1.5\ccwd}
\setlength\cftsecnumwidth{1.5\ccwd}
\renewcommand{\cftsecaftersnumb}{}
% -- subsection entries
\setlength\cftsubsecindent{3\ccwd}
\setlength\cftsubsecnumwidth{2\ccwd}
\renewcommand{\cftsubsecaftersnumb}{}

%% ==== bibliography
\RequirePackage[super, sort&compress]{gbt7714}
\renewcommand\bibfont{\zihao{5}}
\addtolength\bibsep{-0.7em}

% ==== cover, titlepage and statementpage
\newcommand{\makecover}{%
  \bjut@cover
  \global\let\makecover\relax  }
\renewcommand{\maketitle}{%
  \bjut@ctitlepage
  \global\let\maketitle\relax  }
\newcommand\makeetitle{%
  \bjut@etitlepage
  \let\makeetitle\relax  }
\newcommand{\makestate}{%
  \bjut@statepage
  \global\let\makestate\relax  }

\AtEndPreamble{%
  \pgfplotsset{compat=1.16} }
\AtBeginDocument{%
  \pagestyle{empty} }