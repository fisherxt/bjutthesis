\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bjutthesis}[2020/11/16 Thesis Template]
%
%% ==== VeryDependent Packages
\RequirePackage{xparse}
\RequirePackage{ezinfo}
%
%% ==== Basic
\LoadClass[UTF8, scheme=plain, zihao=-4, linespread=1.42, sub3section]{ctexbook}
\ctexset {%
    punct      = quanjiao,
    space      = auto,
    autoindent = true,
    today      = old }
%
%% ==== Template MACROs
\DeclareRobustCommand{\bjutthesis}{\rmfamily B\textsc{\kern-.1emj\kern-.025emu\kern-.02emt}\kern-.08emT\kern-.1667em\lower.475ex\hbox{H}\kern-.0667emE\kern-.0667em\lower.475ex\hbox{S}\kern-.05emI\kern-.0667em\lower.475ex\hbox{S}}
\def\version{ver.\,0.1}
% -- theme color
\RequirePackage{xcolor}
\definecolor{bjut@color@official}{RGB}{0,150,195}
\definecolor{bjut@color@doctorcover}{RGB}{186,15,43}
%
%% ==== format: FiveLevel-structured 
\setcounter{secnumdepth}{4}
\def\bjut@chapter@font{\zihao{3}\heiti}
\def\bjut@section@font{\zihao{4}\heiti}
\def\bjut@subsection@font{\zihao{-4}\heiti}
\def\bjut@subsubsection@font{\zihao{-4}\kaishu}
\def\bjut@subsubsubsection@font{\zihao{-4}\kaishu}
\let\subsubsubsection\paragraph
\setlength{\parskip}{\z@}
\ctexset {%
  chapter = {
    beforeskip   = \z@,
    afterskip    = 5mm,
    fixskip      = false,
    indent       = \z@,
    format       = \bjut@chapter@font\centering,
    name         = {第,章},
    nameformat   = {},
    titleformat  = {},
    numberformat = {}, 
    number       = \arabic{chapter},
    aftername    = \hspace{\ccwd},
    afterindent  = true,
    aftertitle   = {},
    pagestyle    = bjut@headings },
  section = {
    beforeskip   = \z@, % \z@,
    afterskip    = \z@, % 2.3ex plus .2ex,
    indent       = \z@,
    format       = \bjut@section@font\raggedright,
    aftername    = \hspace{\ccwd},
    afterindent  = true },
  subsection = {
    beforeskip   = \z@, % \z@,
    afterskip    = \z@, % 1.5ex plus .2ex,
    indent       = \z@,
    format       = \bjut@subsection@font\raggedright,
    aftername    = \hspace{\ccwd},
    afterindent  = true },
  subsubsection = {
    beforeskip   = \z@,
    afterskip    = \z@,
    indent       = \z@,
    format       = \bjut@subsubsection@font,
    runin        = true,
    aftertitle   = \hspace{\ccwd} },
  paragraph = {
    beforeskip   = \z@,
    afterskip    = \z@,
    indent       = 2\ccwd,
    format       = \bjut@subsubsubsection@font,
    runin        = true,
    aftername    = {},
    aftertitle   = \hspace{\ccwd} } }
%
%% ==== fonts
% -- times new roman
\RequirePackage[T1]{fontenc}
\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{newtxmath}
% -- bold Chinese fonts
\RequirePackage{ifthen}
\newcommand\bjut@fontset{\csname g__ctex_fontset_tl\endcsname}
\ifthenelse{\equal{\bjut@fontset}{windows}}{%
  % windows
  \newCJKfontfamily\bjut@kaishu[AutoFakeBold=1.75]{KaiTi}
  \newCJKfontfamily\bjut@songti[AutoFakeBold=1.75]{SimSun}
  \newCJKfontfamily\bjut@fangsong[AutoFakeBold=1.75]{FangSong}}{%
  \ifthenelse{\equal{\bjut@fontset}{mac}}{%
    % mac
    \setCJKfamilyfont{zhhei}{Heiti SC Medium}
    \newCJKfontfamily\bjut@songti[AutoFakeBold=1.75]{Songti SC}
    \newCJKfontfamily\bjut@kaishu[AutoFakeBold=1.75]{Kaiti SC}
    \newCJKfontfamily\bjut@fangsong[AutoFakeBold=1.75]{STFangsong} } {%
    \ifthenelse{\equal{\bjut@fontset}{fandol}}{%
      % fandol
      \let\bjut@kaishu\kaishu
      \let\bjut@songti\songti
      \let\bjut@fangson\fangsong
    }{%
      % other
      \let\bjut@kaishu\kaishu
      \let\bjut@songti\songti
      \let\bjut@fangson\fangsong}}}
\newcommand\textbfkai[1]{{\bfseries\bjut@kaishu #1}}
\newcommand\textbfsong[1]{{\bfseries\bjut@songti #1}}
\newcommand\textbffs[1]{{\bfseries\bjut@fangsong #1}}
%
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
  footskip    = 8.5mm }
%
%% ==== pagestyle
\def\bjut@header@text{北京工业大学工学博士学位论文}
\def\bjut@header@font{\fontsize{9.5bp}{11.5bp}\selectfont\kaishu}
\RequirePackage{fancyhdr}
\fancypagestyle{bjut@headings}{%
  \fancyhead{}
  \fancyhead[OC]{\bjut@header@font\leftmark}
  \fancyhead[EC]{\bjut@header@font\bjut@header@text}
  \fancyfoot{}
  \fancyfoot[C]{\zihao{-5}--\ \thepage\ --}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{\z@}}
\renewcommand\frontmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{bjut@headings}}
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{bjut@headings}}
\renewcommand\backmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagestyle{bjut@headings}}
%
%% ==== numbering
\renewcommand{\theparagraph}{(\arabic{paragraph})}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
%
%% ==== bicaption
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage[list=off]{bicaption}
% -- bicaption settings
\captionsetup{font=small}
\captionsetup[bi]{labelsep=space, format=hang, justification=centerlast, width=.618\textwidth}
\captionsetup[figure][bi-first]{name=图}
\captionsetup[figure][bi-second]{name=Fig.}
\captionsetup[table]{labelsep=space, format=hang}
\captionsetup[table][bi-first]{name=表}
\captionsetup[table][bi-second]{name=Table}
%
%% ==== cross references
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\hypersetup{%
  bookmarksnumbered  = true,
  bookmarksopen      = true,
  bookmarksopenlevel = 1,
  breaklinks         = true,
  colorlinks         = false,
  plainpages         = false,
  pdfborder          = 0 0 0}
\urlstyle{same}
%
%% ==== itemize, enumerate and description environment
\RequirePackage[shortlabels]{enumitem}
\setlist[itemize]{wide=2\ccwd}
\setlist[enumerate]{label=(\arabic*), wide=2\ccwd, labelsep=.5\ccwd}
\setlist[enumerate,2]{label=\arabic*), wide=4\ccwd, labelsep=.5\ccwd, leftmargin=2\ccwd}
\setlist[description]{wide=2\ccwd}
\setlist{nosep} % no extra vertical space
%
%% ==== equation description environment
\RequirePackage{tabularx}
\setlength\belowdisplayskip{.5ex}
\NewDocumentEnvironment{where}{O{式中：}}{%
    #1\tabularx{\textwidth-\widthof{#1}}[t]{@{}r@{~——~}X@{}}%
}{\endtabularx\\[.5ex]}
%
%% ==== table of contents
\RequirePackage{bitoc}
\RequirePackage[titles]{tocloft}
\setcounter{tocdepth}{2}
% -- pagestyle of ToC
\tocloftpagestyle{bjut@headings}
% -- dotline: shape and seperation
\renewcommand\cftdot{$\cdot$}
\renewcommand\cftdotsep{0}
% -- pagenumber width
\cftsetpnumwidth{2\ccwd}
% -- list of figures/tables
\renewcommand{\cftfigpresnum}{图~}
\setlength{\cftfignumwidth}{3.25\ccwd}
\renewcommand{\cfttabpresnum}{表~}
\setlength{\cfttabnumwidth}{3.25\ccwd}
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
%
%% ==== bibliography
\RequirePackage[sort&compress]{gbt7714}
\bibliographystyle{gbt7714-numerical}
%\citestyle{numbers}
\renewcommand\bibfont{\zihao{5}}
\addtolength\bibsep{-0.7em}
%
% ==== cover, titlepage and statementpage
\RequirePackage[pagecolor=white, nopagecolor=white]{pagecolor}  % -- pagecolor
\RequirePackage[copies]{contour}  % -- outlined text on cover
%\RequirePackage[normalem]{ulem}   % -- multiline underlined text
\RequirePackage{xeCJKfntef}
\RequirePackage{ragged2e}         % -- fully justified text
\contourlength{2pt}
\setlength\RaggedRightParindent{0pt}
\setlength\JustifyingParindent{0pt}
\newcommand{\makecover}{%
  \begin{titlepage}
    \newgeometry{left=10mm, right=10mm, top=10mm}
    \pagecolor{bjut@color@doctorcover}
    \begin{flushleft}\zihao{5}\heiti
      \renewcommand\arraystretch{.75}
      \begin{tabular}{@{}p{28mm}@{：}l}
        \makebox[28mm][s]{中文图书分类号}  & \ez@clc \\
        \makebox[28mm][s]{密级}            & \ez@secretlevel \\
        \makebox[28mm][s]{\hfill UDC}      & \ez@udc \\  
        \makebox[28mm][s]{学校代码}        & \ez@schoolcode \\
      \end{tabular}
    \end{flushleft}
    \vskip 1.5cm  
    \begin{center}
      \includegraphics[width=10.8cm]{./cls/bjut_logo_white}  
      \vskip 1.6cm
      \contour[20]{white}{%
      \makebox[12.6cm][s]{\fontsize{50}{60}\heiti 博士学位论文}}
      \vskip .8cm
      \makebox[10.8cm][s]{\fontsize{24}{30}\selectfont DOCTORAL DISSERTATION}
    \end{center}  
    \vfill
    \begin{center}\zihao{-2}\heiti
      \renewcommand\arraystretch{1.6}
      \begin{tabularx}{140mm}{@{}r@{：}X@{}}
        \makebox[45mm][s]{论文题目}      & \ez@ctitle \\
        \makebox[45mm][s]{论文作者}      & \ez@cauthor \\
        \makebox[45mm][s]{学科}          & \ez@cdiscipline \\
        \makebox[45mm][s]{指导教师}      & \ez@csupervisor~\ez@csupervstitle \\
        \makebox[45mm][s]{论文提交日期}  & \ez@cdate
      \end{tabularx}
    \end{center}\normalsize\normalfont
  \end{titlepage}
  \restoregeometry
  \nopagecolor
  \global\let\makecover\relax}
\renewcommand{\maketitle}{%
  % -- Chinese 
  \begin{titlepage}
    \begin{center}\zihao{5}
      \renewcommand\arraystretch{.9}
      \setlength\tabcolsep{0pt}
      \begin{tabular}{p{30mm}p{76mm}p{20mm}l}%@{\hspace{-.5em}}
        \makebox[30mm][s]{\hfill UDC：}, & \ez@udc  &  \makebox[20mm][s]{学校代码：}  &  \ez@schoolcode\\
        \makebox[30mm][s]{中文图书分类号：}  &  \ez@clc  &  \makebox[20mm][s]{学号：}  & \ez@studentid\\
                                           &         &  \makebox[20mm][s]{密级：}  &  \ez@secretlevel
      \end{tabular}
    \end{center}
    \vskip 1.5cm
    \begin{center}
      \makebox[12cm][s]{\zihao{-1}\textbfkai{北京工业大学{\ez@cdegree}学位论文}}
    \end{center}
    \vskip 1.2cm
    \begin{center}
      \renewcommand\arraystretch{1.5}
      \begin{tabularx}{130mm}{@{}r@{：}X@{}}
        \makebox[25mm][s]{\zihao{4}\textbfsong{题目}}  & \zihao{4}\uline{\ez@ctitle\hfill\mbox{}}\\
        \makebox[25mm][s]{\zihao{4}\textbfsong{英文题目}}  & \zihao{4}\MakeUppercase{\uline{\ez@etitle\hfill\mbox{}}}\\
      \end{tabularx}
    \end{center}
    \vfill
    \begin{center}\zihao{4}\fangsong
      \setlength\tabcolsep{0pt}
      \begin{tabularx}{130mm}{@{}p{34mm}@{：}l}
        \makebox[34mm][s]{\textbffs{论文作者}}  &  \ez@cauthor\\    
        \makebox[34mm][s]{\textbffs{学科专业}}  &  \ez@cdiscipline\\    
        \makebox[34mm][s]{\textbffs{研究方向}}  &  \ez@cmajor\\    
        \makebox[34mm][s]{\textbffs{申请学位}}  &  \ez@cdegree\\    
        \makebox[34mm][s]{\textbffs{指导教师}}  &  \ez@csupervisor~\ez@csupervstitle\\    
        \makebox[34mm][s]{\textbffs{所在单位}}  &  \ez@ccollege\\    
        \makebox[34mm][s]{\textbffs{答辩日期}}  &  \ez@cdate\\    
        \makebox[34mm][s]{\textbffs{授予学位单位}}  &  \ez@corganization\\
      \end{tabularx}
    \end{center}
  \end{titlepage}
  % -- English
  \begin{titlepage}
    \mbox{}
    \vfill
    \begin{center}
      \zihao{4}\bfseries\MakeUppercase\ez@etitle
    \end{center}
    \vspace{\stretch{2}}
    \begin{center}
      A DISSERTATION\\
      SUBMITTED TO THE \MakeUppercase\ez@ecollege\ AND THE COMMITTEE ON GRADUATE STUDIES OF BEIJING UNIVERSITY OF TECHNOLOGY\\
      IN PARTIAL FULFILLMENT OF THE REQUIREMENTS \\
      FOR THE DEGREE OF \\
      DOCTOR OF PHILOSOPHY
    \end{center}
    \vspace{\stretch{2}}
    \begin{center}
      \ez@eauthor
      \par
      \ez@edate
    \end{center}
    \vfill
  \end{titlepage}
  \global\let\maketitle\relax}
\newcommand{\makestate}{%
  \begin{titlepage}
    \mbox{}
    \vskip .5cm
    \begin{center}
      \makebox[4cm][s]{\zihao{3}\heiti 独创性声明}  
    \end{center}
    {\justifying
      \hspace{2\ccwd}本人声明所呈交的论文是我个人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，\kern-.2em也不包含为获得北京工业大学或其它教育机构的学位或证书而使用过的材料。\kern-.2em与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。}
    \begin{flushright}
      \renewcommand\arraystretch{1.75}
      \setlength\tabcolsep{0pt}
      \begin{tabular}{rp{18mm}@{：}p{38mm}@{}}\zihao{5}
        & \makebox[18mm][s]{签名} & \underline{\hspace{37mm}}\\
        & \makebox[18mm][s]{日期} & \hspace{\stretch{2}}年{\hfill}月{\hfill}日
      \end{tabular}
    \end{flushright}
    \vfill
    \begin{center}
      \makebox[6.5cm][s]{\zihao{3}\heiti 关于论文使用授权的说明}  
    \end{center}
    {\justifying
      \hspace{2\ccwd}本人完全了解北京工业大学有关保留、使用学位论文的规定，即：学校有权保留送交论文的复印件，允许论文被查阅和借阅；学校可以公布论文的全部或部分内容，可以采用影印、缩印或其他复制手段保存论文。\par 
      \RaggedRight
      \hspace{2\ccwd}（保密的论文在解密后应遵守此规定}
    \begin{flushright}
      \renewcommand\arraystretch{1.75}
      \setlength\tabcolsep{0pt}
      \begin{tabular}{p{18mm}@{：}p{38mm}p{20mm}p{18mm}@{：}p{38mm}@{}}\zihao{5}
        \makebox[18mm][s]{签名}     & \uline{\hspace{37mm}} & & \makebox[18mm][s]{日期} & \hspace{\stretch{2}}年{\hfill}月{\hfill}日\\
        \makebox[18mm][s]{导师签名} & \uline{\hspace{37mm}} & & \makebox[18mm][s]{日期} & \hspace{\stretch{2}}年{\hfill}月{\hfill}日\\
      \end{tabular}
    \end{flushright}
    \vfill  
  \end{titlepage}
  \global\let\makestate\relax}
%
\AtEndPreamble{%
  \pgfplotsset{compat=1.16}}
\AtBeginDocument{%
  \pagestyle{empty}}