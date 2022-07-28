Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A26310F41C
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 17:56:07 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id t15so1288607ilm.7
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 10:56:07 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178]) by smtp.gmail.com with ESMTPSA id
 u4-20020a02b1c4000000b00339e18d2c9bsm627635jah.115.2022.07.28.10.56.05
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 10:56:05 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id n13so1306791ilk.1
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 10:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <YuEY1XNsPVb1GzcN@platvala-desk.ger.corp.intel.com>
 <20220727202125.546432-1-jshargo@chromium.org>
 <YuJA8zCW9wFQh5M6@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YuJA8zCW9wFQh5M6@platvala-desk.ger.corp.intel.com>
From: Jim Shargo <jshargo@chromium.org>
Date: Thu, 28 Jul 2022 13:55:53 -0400
Message-ID: <CACmi3jEmJJr_WxHd4DDn_qE3qLu5rjz_ARLt-MeftqgGw24hQA@mail.gmail.com>
To: Petri Latvala <petri.latvala@intel.com>
Content-Type: multipart/alternative; boundary="000000000000540c2805e4e13f71"
Subject: Re: [igt-dev] [PATCH i-g-t v2] tooling: Add linux's .clang-format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jim Shargo <jshargo@chromium.org>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--000000000000540c2805e4e13f71
Content-Type: text/plain; charset="UTF-8"

Ah! Gotcha. v3 incoming.

On Thu, Jul 28, 2022 at 3:59 AM Petri Latvala <petri.latvala@intel.com>
wrote:

> On Wed, Jul 27, 2022 at 04:21:25PM -0400, Jim Shargo wrote:
> > As I was authoring my first patchset for IGT, I found myself fighting
> > the tooling a bit to get everything right. I had to add a bunch of extra
> > command line args to use my linux checkout's formatting rules to get the
> > style right.
> >
> > I grabbed this from a recent checkout of torvald's repo.
> >
> > The commit I used was: e0dccc3b76fb35bb257b4118367a883073d7390e
> >
> > To make this discoverable to new contributors, this change:
> >
> >   - Updates CONTRIBUTING.md with a link to git-clang-format, which is
> >   a useful tool for using clang-format from git just on a commit's
> >   changes.
> >   - Updates .editorconfig with a reference to .clang-format and a
> >   pointer to CONTRIBUTING.md
> >
> > Changes made to the linux kernel style:
> >
> >   - Reflowing comments, including multi-line comments (ReflowComments)
> >   - Support for magic code blocks (ForEachMacros, IfMacros)
> >
> > Signed-off-by: Jim Shargo <jshargo@chromium.org>
> > ---
> > V1 -> V2: Better support for IGT style and addressing comments
> >
> >  .clang-format   | 176 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  .editorconfig   |   6 +-
> >  CONTRIBUTING.md |   8 ++-
> >  3 files changed, 185 insertions(+), 5 deletions(-)
> >  create mode 100644 .clang-format
> >
> > diff --git a/.clang-format b/.clang-format
> > new file mode 100644
> > index 00000000..da42bead
> > --- /dev/null
> > +++ b/.clang-format
> > @@ -0,0 +1,176 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# clang-format configuration file. Intended for clang-format >= 11.
> > +#
> > +# For more information, see:
> > +#
> > +#   Documentation/process/clang-format.rst
> > +#   https://clang.llvm.org/docs/ClangFormat.html
> > +#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html
> > +#
> > +# This file was pulled from the linux kernel at revision
> > +# e0dccc3b76fb35bb257b4118367a883073d7390e.
> > +#
> > +# Changes made for IGT-specific styles should include a comment noting
> > +# the previous value with "kernel-value". This makes it clear what we
> > +# want to keep when updating this file.
> > +---
> > +AccessModifierOffset: -4
> > +AlignAfterOpenBracket: Align
> > +AlignConsecutiveAssignments: false
> > +AlignConsecutiveDeclarations: false
> > +AlignEscapedNewlines: Left
> > +AlignOperands: true
> > +AlignTrailingComments: false
> > +AllowAllParametersOfDeclarationOnNextLine: false
> > +AllowShortBlocksOnASingleLine: false
> > +AllowShortCaseLabelsOnASingleLine: false
> > +AllowShortFunctionsOnASingleLine: None
> > +AllowShortIfStatementsOnASingleLine: false
> > +AllowShortLoopsOnASingleLine: false
> > +AlwaysBreakAfterDefinitionReturnType: None
> > +AlwaysBreakAfterReturnType: None
> > +AlwaysBreakBeforeMultilineStrings: false
> > +AlwaysBreakTemplateDeclarations: false
> > +BinPackArguments: true
> > +BinPackParameters: true
> > +BraceWrapping:
> > +  AfterClass: false
> > +  AfterControlStatement: false
> > +  AfterEnum: false
> > +  AfterFunction: true
> > +  AfterNamespace: true
> > +  AfterObjCDeclaration: false
> > +  AfterStruct: false
> > +  AfterUnion: false
> > +  AfterExternBlock: false
> > +  BeforeCatch: false
> > +  BeforeElse: false
> > +  IndentBraces: false
> > +  SplitEmptyFunction: true
> > +  SplitEmptyRecord: true
> > +  SplitEmptyNamespace: true
> > +BreakBeforeBinaryOperators: None
> > +BreakBeforeBraces: Custom
> > +BreakBeforeInheritanceComma: false
> > +BreakBeforeTernaryOperators: false
> > +BreakConstructorInitializersBeforeComma: false
> > +BreakConstructorInitializers: BeforeComma
> > +BreakAfterJavaFieldAnnotations: false
> > +BreakStringLiterals: false
> > +ColumnLimit: 80
> > +CommentPragmas: '^ IWYU pragma:'
> > +CompactNamespaces: false
> > +ConstructorInitializerAllOnOneLineOrOnePerLine: false
> > +ConstructorInitializerIndentWidth: 8
> > +ContinuationIndentWidth: 8
> > +Cpp11BracedListStyle: false
> > +DerivePointerAlignment: false
> > +DisableFormat: false
> > +ExperimentalAutoDetectBinPacking: false
> > +FixNamespaceComments: false
> > +
> > +# Taken from:
> > +#   git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*(' include/
> tools/ \
> > +#   | sed "s,^#define \([^[:space:]]*for_each[^[:space:]]*\)(.*$,  -
> '\1'," \
> > +#   | LC_ALL=C sort -u
> > +ForEachMacros: # kernel-value: (long list removed)
> > +  # IGT rules, found via:
> > +  # git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*(' include/
> lib/ |
> > +  #     sed "s,^#define \([^(]\+\).*,'\1'," |
> > +  #     grep -v "__" |
> > +  #     sort -u
> > +  - 'for_each_collection_data'
> > +  - 'for_each_combination'
> > +  - 'for_each_connected_output'
> > +  - 'for_each_connector_mode'
> > +  - 'for_each_ctx_cfg_engine'
> > +  - 'for_each_ctx_engine'
> > +  - 'for_each_format'
> > +  - 'for_each_if'
> > +  - 'for_each_memory_region'
> > +  - 'for_each_mmap_offset_type'
> > +  - 'for_each_physical_engine'
> > +  - 'for_each_physical_ring'
> > +  - 'for_each_pipe'
> > +  - 'for_each_pipe_static'
> > +  - 'for_each_pipe_with_single_output'
> > +  - 'for_each_pipe_with_valid_output'
> > +  - 'for_each_plane_on_pipe'
> > +  - 'for_each_prime_number'
> > +  - 'for_each_ring'
> > +  - 'for_each_subset'
> > +  - 'for_each_sysfs_gt_dirfd'
> > +  - 'for_each_sysfs_gt_path'
> > +  - 'for_each_valid_output_on_pipe'
> > +  - 'for_each_variation_nr'
> > +  - 'for_each_variation_r'
> > +  - 'igt_list_for_each_entry'
> > +  - 'igt_list_for_each_entry_reverse'
> > +  - 'igt_list_for_each_entry_safe'
> > +  - 'igt_list_for_each_entry_safe_reverse'
> > +
> > +IfMacros: # kernel-value: none
> > +  - 'igt_dynamic'
> > +  - 'igt_fixture'
> > +  - 'igt_fork'
> > +  - 'igt_subtest'
> > +  - 'igt_subtest_f'
> > +  - 'igt_subtest_group'
> > +  - 'igt_subtest_with_dynamic'
> > +  - 'igt_subtest_with_dynamic_f'
> > +  - 'igt_until_timeout'
> > +
> > +IncludeBlocks: Preserve
> > +IncludeCategories:
> > +  - Regex: '.*'
> > +    Priority: 1
> > +IncludeIsMainRegex: '(Test)?$'
> > +IndentCaseLabels: false
> > +IndentGotoLabels: false
> > +IndentPPDirectives: None
> > +IndentWidth: 8
> > +IndentWrappedFunctionNames: false
> > +JavaScriptQuotes: Leave
> > +JavaScriptWrapImports: true
> > +KeepEmptyLinesAtTheStartOfBlocks: false
> > +MacroBlockBegin: ''
> > +MacroBlockEnd: ''
> > +MaxEmptyLinesToKeep: 1
> > +NamespaceIndentation: None
> > +ObjCBinPackProtocolList: Auto
> > +ObjCBlockIndentWidth: 8
> > +ObjCSpaceAfterProperty: true
> > +ObjCSpaceBeforeProtocolList: true
> > +
> > +# Taken from git's rules
> > +PenaltyBreakAssignment: 10
> > +PenaltyBreakBeforeFirstCallParameter: 30
> > +PenaltyBreakComment: 10
> > +PenaltyBreakFirstLessLess: 0
> > +PenaltyBreakString: 10
> > +PenaltyExcessCharacter: 100
> > +PenaltyReturnTypeOnItsOwnLine: 60
> > +
> > +PointerAlignment: Right
> > +ReflowComments: true # kernel-value: false
> > +SortIncludes: false
> > +SortUsingDeclarations: false
> > +SpaceAfterCStyleCast: false
> > +SpaceAfterTemplateKeyword: true
> > +SpaceBeforeAssignmentOperators: true
> > +SpaceBeforeCtorInitializerColon: true
> > +SpaceBeforeInheritanceColon: true
> > +SpaceBeforeParens: ControlStatementsExceptForEachMacros
> > +SpaceBeforeRangeBasedForLoopColon: true
> > +SpaceInEmptyParentheses: false
> > +SpacesBeforeTrailingComments: 1
> > +SpacesInAngles: false
> > +SpacesInContainerLiterals: false
> > +SpacesInCStyleCastParentheses: false
> > +SpacesInParentheses: false
> > +SpacesInSquareBrackets: false
> > +Standard: Cpp03
> > +TabWidth: 8
> > +UseTab: Always
> > +...
> > diff --git a/.editorconfig b/.editorconfig
> > index 7b7f1375..5c7e31d3 100644
> > --- a/.editorconfig
> > +++ b/.editorconfig
> > @@ -1,5 +1,7 @@
> > -# To use this config in your editor, follow the instructions at:
> > -# http://editorconfig.org
> > +# To use this config in your editor, follow the instructions at
> > +# http://editorconfig.org. You can also use "clang-format" for new C
> > +# code (see CONTRIBUTING.md for suggestions and .clang-format for more
> > +# details).
> >
> >  root = true
> >
> > diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> > index 6d1294ad..8d7320b7 100644
> > --- a/CONTRIBUTING.md
> > +++ b/CONTRIBUTING.md
> > @@ -10,8 +10,9 @@ improvements for documentation and new tools and
> testcases.
> >  The Code
> >  --------
> >
> > -- The code should follow kernel coding style:
> > -  https://www.kernel.org/doc/html/latest/process/coding-style.html
> > +- The code should follow [kernel coding style](coding-style). Before
> > +  sending out a patch, changes can be formatted with
> > +  [git-clang-format](git-clang-format).
>
> I meant pointing to .editorconfig here.
>
>
> --
> Petri Latvala
>
>
> >
> >  - Testcases (subtests) have to use minus signs (-) as a word separator.
> >    The generated documentation contains glossary of commonly used terms.
> > @@ -30,9 +31,10 @@ The Code
> >    provided by the igt library. The semantic patch lib/igt.cocci can
> help with
> >    more automatic conversions.
> >
> > +[coding-style]:
> https://www.kernel.org/doc/html/latest/process/coding-style.html
> > +[git-clang-format]:
> https://github.com/llvm-mirror/clang/blob/master/tools/clang-format/git-clang-format
> >  [igt-describe]:
> https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
> >
> > -
> >  Sending Patches
> >  ---------------
> >
> > --
> > 2.37.1.359.gd136c6c3e2-goog
> >
>

--000000000000540c2805e4e13f71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah! Gotcha. v3 incoming.</div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 28, 2022 at 3:59 AM Pe=
tri Latvala &lt;<a href=3D"mailto:petri.latvala@intel.com">petri.latvala@in=
tel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Wed, Jul 27, 2022 at 04:21:25PM -0400, Jim Shargo wrote:<br>
&gt; As I was authoring my first patchset for IGT, I found myself fighting<=
br>
&gt; the tooling a bit to get everything right. I had to add a bunch of ext=
ra<br>
&gt; command line args to use my linux checkout&#39;s formatting rules to g=
et the<br>
&gt; style right.<br>
&gt; <br>
&gt; I grabbed this from a recent checkout of torvald&#39;s repo.<br>
&gt; <br>
&gt; The commit I used was: e0dccc3b76fb35bb257b4118367a883073d7390e<br>
&gt; <br>
&gt; To make this discoverable to new contributors, this change:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- Updates CONTRIBUTING.md with a link to git-clang-format,=
 which is<br>
&gt;=C2=A0 =C2=A0a useful tool for using clang-format from git just on a co=
mmit&#39;s<br>
&gt;=C2=A0 =C2=A0changes.<br>
&gt;=C2=A0 =C2=A0- Updates .editorconfig with a reference to .clang-format =
and a<br>
&gt;=C2=A0 =C2=A0pointer to CONTRIBUTING.md<br>
&gt; <br>
&gt; Changes made to the linux kernel style:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- Reflowing comments, including multi-line comments (Reflo=
wComments)<br>
&gt;=C2=A0 =C2=A0- Support for magic code blocks (ForEachMacros, IfMacros)<=
br>
&gt; <br>
&gt; Signed-off-by: Jim Shargo &lt;<a href=3D"mailto:jshargo@chromium.org" =
target=3D"_blank">jshargo@chromium.org</a>&gt;<br>
&gt; ---<br>
&gt; V1 -&gt; V2: Better support for IGT style and addressing comments<br>
&gt; <br>
&gt;=C2=A0 .clang-format=C2=A0 =C2=A0| 176 ++++++++++++++++++++++++++++++++=
++++++++++++++++<br>
&gt;=C2=A0 .editorconfig=C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 CONTRIBUTING.md |=C2=A0 =C2=A08 ++-<br>
&gt;=C2=A0 3 files changed, 185 insertions(+), 5 deletions(-)<br>
&gt;=C2=A0 create mode 100644 .clang-format<br>
&gt; <br>
&gt; diff --git a/.clang-format b/.clang-format<br>
&gt; new file mode 100644<br>
&gt; index 00000000..da42bead<br>
&gt; --- /dev/null<br>
&gt; +++ b/.clang-format<br>
&gt; @@ -0,0 +1,176 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +#<br>
&gt; +# clang-format configuration file. Intended for clang-format &gt;=3D =
11.<br>
&gt; +#<br>
&gt; +# For more information, see:<br>
&gt; +#<br>
&gt; +#=C2=A0 =C2=A0Documentation/process/clang-format.rst<br>
&gt; +#=C2=A0 =C2=A0<a href=3D"https://clang.llvm.org/docs/ClangFormat.html=
" rel=3D"noreferrer" target=3D"_blank">https://clang.llvm.org/docs/ClangFor=
mat.html</a><br>
&gt; +#=C2=A0 =C2=A0<a href=3D"https://clang.llvm.org/docs/ClangFormatStyle=
Options.html" rel=3D"noreferrer" target=3D"_blank">https://clang.llvm.org/d=
ocs/ClangFormatStyleOptions.html</a><br>
&gt; +#<br>
&gt; +# This file was pulled from the linux kernel at revision<br>
&gt; +# e0dccc3b76fb35bb257b4118367a883073d7390e.<br>
&gt; +#<br>
&gt; +# Changes made for IGT-specific styles should include a comment notin=
g<br>
&gt; +# the previous value with &quot;kernel-value&quot;. This makes it cle=
ar what we<br>
&gt; +# want to keep when updating this file.<br>
&gt; +---<br>
&gt; +AccessModifierOffset: -4<br>
&gt; +AlignAfterOpenBracket: Align<br>
&gt; +AlignConsecutiveAssignments: false<br>
&gt; +AlignConsecutiveDeclarations: false<br>
&gt; +AlignEscapedNewlines: Left<br>
&gt; +AlignOperands: true<br>
&gt; +AlignTrailingComments: false<br>
&gt; +AllowAllParametersOfDeclarationOnNextLine: false<br>
&gt; +AllowShortBlocksOnASingleLine: false<br>
&gt; +AllowShortCaseLabelsOnASingleLine: false<br>
&gt; +AllowShortFunctionsOnASingleLine: None<br>
&gt; +AllowShortIfStatementsOnASingleLine: false<br>
&gt; +AllowShortLoopsOnASingleLine: false<br>
&gt; +AlwaysBreakAfterDefinitionReturnType: None<br>
&gt; +AlwaysBreakAfterReturnType: None<br>
&gt; +AlwaysBreakBeforeMultilineStrings: false<br>
&gt; +AlwaysBreakTemplateDeclarations: false<br>
&gt; +BinPackArguments: true<br>
&gt; +BinPackParameters: true<br>
&gt; +BraceWrapping:<br>
&gt; +=C2=A0 AfterClass: false<br>
&gt; +=C2=A0 AfterControlStatement: false<br>
&gt; +=C2=A0 AfterEnum: false<br>
&gt; +=C2=A0 AfterFunction: true<br>
&gt; +=C2=A0 AfterNamespace: true<br>
&gt; +=C2=A0 AfterObjCDeclaration: false<br>
&gt; +=C2=A0 AfterStruct: false<br>
&gt; +=C2=A0 AfterUnion: false<br>
&gt; +=C2=A0 AfterExternBlock: false<br>
&gt; +=C2=A0 BeforeCatch: false<br>
&gt; +=C2=A0 BeforeElse: false<br>
&gt; +=C2=A0 IndentBraces: false<br>
&gt; +=C2=A0 SplitEmptyFunction: true<br>
&gt; +=C2=A0 SplitEmptyRecord: true<br>
&gt; +=C2=A0 SplitEmptyNamespace: true<br>
&gt; +BreakBeforeBinaryOperators: None<br>
&gt; +BreakBeforeBraces: Custom<br>
&gt; +BreakBeforeInheritanceComma: false<br>
&gt; +BreakBeforeTernaryOperators: false<br>
&gt; +BreakConstructorInitializersBeforeComma: false<br>
&gt; +BreakConstructorInitializers: BeforeComma<br>
&gt; +BreakAfterJavaFieldAnnotations: false<br>
&gt; +BreakStringLiterals: false<br>
&gt; +ColumnLimit: 80<br>
&gt; +CommentPragmas: &#39;^ IWYU pragma:&#39;<br>
&gt; +CompactNamespaces: false<br>
&gt; +ConstructorInitializerAllOnOneLineOrOnePerLine: false<br>
&gt; +ConstructorInitializerIndentWidth: 8<br>
&gt; +ContinuationIndentWidth: 8<br>
&gt; +Cpp11BracedListStyle: false<br>
&gt; +DerivePointerAlignment: false<br>
&gt; +DisableFormat: false<br>
&gt; +ExperimentalAutoDetectBinPacking: false<br>
&gt; +FixNamespaceComments: false<br>
&gt; +<br>
&gt; +# Taken from:<br>
&gt; +#=C2=A0 =C2=A0git grep -h &#39;^#define [^[:space:]]*for_each[^[:spac=
e:]]*(&#39; include/ tools/ \<br>
&gt; +#=C2=A0 =C2=A0| sed &quot;s,^#define \([^[:space:]]*for_each[^[:space=
:]]*\)(.*$,=C2=A0 - &#39;\1&#39;,&quot; \<br>
&gt; +#=C2=A0 =C2=A0| LC_ALL=3DC sort -u<br>
&gt; +ForEachMacros: # kernel-value: (long list removed)<br>
&gt; +=C2=A0 # IGT rules, found via:<br>
&gt; +=C2=A0 # git grep -h &#39;^#define [^[:space:]]*for_each[^[:space:]]*=
(&#39; include/ lib/ |<br>
&gt; +=C2=A0 #=C2=A0 =C2=A0 =C2=A0sed &quot;s,^#define \([^(]\+\).*,&#39;\1=
&#39;,&quot; |<br>
&gt; +=C2=A0 #=C2=A0 =C2=A0 =C2=A0grep -v &quot;__&quot; |<br>
&gt; +=C2=A0 #=C2=A0 =C2=A0 =C2=A0sort -u=C2=A0 =C2=A0 <br>
&gt; +=C2=A0 - &#39;for_each_collection_data&#39;<br>
&gt; +=C2=A0 - &#39;for_each_combination&#39;<br>
&gt; +=C2=A0 - &#39;for_each_connected_output&#39;<br>
&gt; +=C2=A0 - &#39;for_each_connector_mode&#39;<br>
&gt; +=C2=A0 - &#39;for_each_ctx_cfg_engine&#39;<br>
&gt; +=C2=A0 - &#39;for_each_ctx_engine&#39;<br>
&gt; +=C2=A0 - &#39;for_each_format&#39;<br>
&gt; +=C2=A0 - &#39;for_each_if&#39;<br>
&gt; +=C2=A0 - &#39;for_each_memory_region&#39;<br>
&gt; +=C2=A0 - &#39;for_each_mmap_offset_type&#39;<br>
&gt; +=C2=A0 - &#39;for_each_physical_engine&#39;<br>
&gt; +=C2=A0 - &#39;for_each_physical_ring&#39;<br>
&gt; +=C2=A0 - &#39;for_each_pipe&#39;<br>
&gt; +=C2=A0 - &#39;for_each_pipe_static&#39;<br>
&gt; +=C2=A0 - &#39;for_each_pipe_with_single_output&#39;<br>
&gt; +=C2=A0 - &#39;for_each_pipe_with_valid_output&#39;<br>
&gt; +=C2=A0 - &#39;for_each_plane_on_pipe&#39;<br>
&gt; +=C2=A0 - &#39;for_each_prime_number&#39;<br>
&gt; +=C2=A0 - &#39;for_each_ring&#39;<br>
&gt; +=C2=A0 - &#39;for_each_subset&#39;<br>
&gt; +=C2=A0 - &#39;for_each_sysfs_gt_dirfd&#39;<br>
&gt; +=C2=A0 - &#39;for_each_sysfs_gt_path&#39;<br>
&gt; +=C2=A0 - &#39;for_each_valid_output_on_pipe&#39;<br>
&gt; +=C2=A0 - &#39;for_each_variation_nr&#39;<br>
&gt; +=C2=A0 - &#39;for_each_variation_r&#39;<br>
&gt; +=C2=A0 - &#39;igt_list_for_each_entry&#39;<br>
&gt; +=C2=A0 - &#39;igt_list_for_each_entry_reverse&#39;<br>
&gt; +=C2=A0 - &#39;igt_list_for_each_entry_safe&#39;<br>
&gt; +=C2=A0 - &#39;igt_list_for_each_entry_safe_reverse&#39;<br>
&gt; +<br>
&gt; +IfMacros: # kernel-value: none<br>
&gt; +=C2=A0 - &#39;igt_dynamic&#39;<br>
&gt; +=C2=A0 - &#39;igt_fixture&#39;<br>
&gt; +=C2=A0 - &#39;igt_fork&#39;<br>
&gt; +=C2=A0 - &#39;igt_subtest&#39;<br>
&gt; +=C2=A0 - &#39;igt_subtest_f&#39;<br>
&gt; +=C2=A0 - &#39;igt_subtest_group&#39;<br>
&gt; +=C2=A0 - &#39;igt_subtest_with_dynamic&#39;<br>
&gt; +=C2=A0 - &#39;igt_subtest_with_dynamic_f&#39;<br>
&gt; +=C2=A0 - &#39;igt_until_timeout&#39;<br>
&gt; +<br>
&gt; +IncludeBlocks: Preserve<br>
&gt; +IncludeCategories:<br>
&gt; +=C2=A0 - Regex: &#39;.*&#39;<br>
&gt; +=C2=A0 =C2=A0 Priority: 1<br>
&gt; +IncludeIsMainRegex: &#39;(Test)?$&#39;<br>
&gt; +IndentCaseLabels: false<br>
&gt; +IndentGotoLabels: false<br>
&gt; +IndentPPDirectives: None<br>
&gt; +IndentWidth: 8<br>
&gt; +IndentWrappedFunctionNames: false<br>
&gt; +JavaScriptQuotes: Leave<br>
&gt; +JavaScriptWrapImports: true<br>
&gt; +KeepEmptyLinesAtTheStartOfBlocks: false<br>
&gt; +MacroBlockBegin: &#39;&#39;<br>
&gt; +MacroBlockEnd: &#39;&#39;<br>
&gt; +MaxEmptyLinesToKeep: 1<br>
&gt; +NamespaceIndentation: None<br>
&gt; +ObjCBinPackProtocolList: Auto<br>
&gt; +ObjCBlockIndentWidth: 8<br>
&gt; +ObjCSpaceAfterProperty: true<br>
&gt; +ObjCSpaceBeforeProtocolList: true<br>
&gt; +<br>
&gt; +# Taken from git&#39;s rules<br>
&gt; +PenaltyBreakAssignment: 10<br>
&gt; +PenaltyBreakBeforeFirstCallParameter: 30<br>
&gt; +PenaltyBreakComment: 10<br>
&gt; +PenaltyBreakFirstLessLess: 0<br>
&gt; +PenaltyBreakString: 10<br>
&gt; +PenaltyExcessCharacter: 100<br>
&gt; +PenaltyReturnTypeOnItsOwnLine: 60<br>
&gt; +<br>
&gt; +PointerAlignment: Right<br>
&gt; +ReflowComments: true # kernel-value: false<br>
&gt; +SortIncludes: false<br>
&gt; +SortUsingDeclarations: false<br>
&gt; +SpaceAfterCStyleCast: false<br>
&gt; +SpaceAfterTemplateKeyword: true<br>
&gt; +SpaceBeforeAssignmentOperators: true<br>
&gt; +SpaceBeforeCtorInitializerColon: true<br>
&gt; +SpaceBeforeInheritanceColon: true<br>
&gt; +SpaceBeforeParens: ControlStatementsExceptForEachMacros<br>
&gt; +SpaceBeforeRangeBasedForLoopColon: true<br>
&gt; +SpaceInEmptyParentheses: false<br>
&gt; +SpacesBeforeTrailingComments: 1<br>
&gt; +SpacesInAngles: false<br>
&gt; +SpacesInContainerLiterals: false<br>
&gt; +SpacesInCStyleCastParentheses: false<br>
&gt; +SpacesInParentheses: false<br>
&gt; +SpacesInSquareBrackets: false<br>
&gt; +Standard: Cpp03<br>
&gt; +TabWidth: 8<br>
&gt; +UseTab: Always<br>
&gt; +...<br>
&gt; diff --git a/.editorconfig b/.editorconfig<br>
&gt; index 7b7f1375..5c7e31d3 100644<br>
&gt; --- a/.editorconfig<br>
&gt; +++ b/.editorconfig<br>
&gt; @@ -1,5 +1,7 @@<br>
&gt; -# To use this config in your editor, follow the instructions at:<br>
&gt; -# <a href=3D"http://editorconfig.org" rel=3D"noreferrer" target=3D"_b=
lank">http://editorconfig.org</a><br>
&gt; +# To use this config in your editor, follow the instructions at<br>
&gt; +# <a href=3D"http://editorconfig.org" rel=3D"noreferrer" target=3D"_b=
lank">http://editorconfig.org</a>. You can also use &quot;clang-format&quot=
; for new C<br>
&gt; +# code (see CONTRIBUTING.md for suggestions and .clang-format for mor=
e<br>
&gt; +# details).<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 root =3D true<br>
&gt;=C2=A0 <br>
&gt; diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md<br>
&gt; index 6d1294ad..8d7320b7 100644<br>
&gt; --- a/CONTRIBUTING.md<br>
&gt; +++ b/CONTRIBUTING.md<br>
&gt; @@ -10,8 +10,9 @@ improvements for documentation and new tools and tes=
tcases.<br>
&gt;=C2=A0 The Code<br>
&gt;=C2=A0 --------<br>
&gt;=C2=A0 <br>
&gt; -- The code should follow kernel coding style:<br>
&gt; -=C2=A0 <a href=3D"https://www.kernel.org/doc/html/latest/process/codi=
ng-style.html" rel=3D"noreferrer" target=3D"_blank">https://www.kernel.org/=
doc/html/latest/process/coding-style.html</a><br>
&gt; +- The code should follow [kernel coding style](coding-style). Before<=
br>
&gt; +=C2=A0 sending out a patch, changes can be formatted with<br>
&gt; +=C2=A0 [git-clang-format](git-clang-format).<br>
<br>
I meant pointing to .editorconfig here.<br>
<br>
<br>
-- <br>
Petri Latvala<br>
<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 - Testcases (subtests) have to use minus signs (-) as a word sep=
arator.<br>
&gt;=C2=A0 =C2=A0 The generated documentation contains glossary of commonly=
 used terms.<br>
&gt; @@ -30,9 +31,10 @@ The Code<br>
&gt;=C2=A0 =C2=A0 provided by the igt library. The semantic patch lib/igt.c=
occi can help with<br>
&gt;=C2=A0 =C2=A0 more automatic conversions.<br>
&gt;=C2=A0 <br>
&gt; +[coding-style]: <a href=3D"https://www.kernel.org/doc/html/latest/pro=
cess/coding-style.html" rel=3D"noreferrer" target=3D"_blank">https://www.ke=
rnel.org/doc/html/latest/process/coding-style.html</a><br>
&gt; +[git-clang-format]: <a href=3D"https://github.com/llvm-mirror/clang/b=
lob/master/tools/clang-format/git-clang-format" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/llvm-mirror/clang/blob/master/tools/clang-fo=
rmat/git-clang-format</a><br>
&gt;=C2=A0 [igt-describe]: <a href=3D"https://drm.pages.freedesktop.org/igt=
-gpu-tools/igt-gpu-tools-Core.html#igt-describe" rel=3D"noreferrer" target=
=3D"_blank">https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-C=
ore.html#igt-describe</a><br>
&gt;=C2=A0 <br>
&gt; -<br>
&gt;=C2=A0 Sending Patches<br>
&gt;=C2=A0 ---------------<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.37.1.359.gd136c6c3e2-goog<br>
&gt; <br>
</blockquote></div>

--000000000000540c2805e4e13f71--
