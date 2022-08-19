Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B6910EEE9
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Aug 2022 14:23:43 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-324ec5a9e97so125210507b3.7
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Aug 2022 07:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <YuJA8zCW9wFQh5M6@platvala-desk.ger.corp.intel.com>
 <20220728175736.1893691-1-jshargo@chromium.org>
 <YvZNNsz6RspU1vZl@platvala-desk.ger.corp.intel.com>
 <CACmi3jHdk2dDCnbgJXHOz3kkuBLb5VuVAYjm3GEQ5P7LX6T_BQ@mail.gmail.com>
In-Reply-To: <CACmi3jHdk2dDCnbgJXHOz3kkuBLb5VuVAYjm3GEQ5P7LX6T_BQ@mail.gmail.com>
From: Jim Shargo <jshargo@chromium.org>
Date: Fri, 19 Aug 2022 10:23:31 -0400
Message-ID: <CAFPEXxsYXXTaD-wFQSkKYjx5TxYBvq_YY5eqhkgNJkSmCoiKFw@mail.gmail.com>
To: Jim Shargo <jshargo@google.com>
Content-Type: multipart/alternative; boundary="00000000000051787d05e698d886"
Subject: Re: [igt-dev] [PATCH i-g-t v3] tooling: Add linux's .clang-format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--00000000000051787d05e698d886
Content-Type: text/plain; charset="UTF-8"

Hi!

Just checking in--is this ready to commit? Is there anything else I need to
fix up?

Thanks!


On Fri, Aug 12, 2022 at 12:00 PM Jim Shargo <jshargo@google.com> wrote:

> It appears to be 13:
> https://clang.llvm.org/docs/ClangFormatStyleOptions.html
>
>
> On Fri, Aug 12, 2022 at 8:54 AM Petri Latvala <petri.latvala@intel.com>
> wrote:
> >
> > On Thu, Jul 28, 2022 at 01:57:36PM -0400, Jim Shargo wrote:
> > > As I was authoring my first patchset for IGT, I found myself fighting
> > > the tooling a bit to get everything right. I had to add a bunch of
> extra
> > > command line args to use my linux checkout's formatting rules to get
> the
> > > style right.
> > >
> > > I grabbed this from a recent checkout of torvald's repo.
> > >
> > > The commit I used was: e0dccc3b76fb35bb257b4118367a883073d7390e
> > >
> > > To make this discoverable to new contributors, this change also
> > > updates CONTRIBUTING.md with:
> > >
> > >   - A link to git-clang-format, which is a useful tool for using
> > >   clang-format from git just on a commit's changes
> > >   - A link to .editorconfig to make it more discoverable
> > >
> > > Changes made to the linux kernel style:
> > >
> > >   - Reflowing comments, including multi-line comments (ReflowComments)
> > >   - Support for magic code blocks (ForEachMacros, IfMacros)
> > >
> > > Signed-off-by: Jim Shargo <jshargo@chromium.org>
> > > ---
> > > V2 -> V3: Update CONTRIBUTING.md with a note about .editorconfig,
> > >           remove reference to .clang-format from the .editorconfig
> > > V1 -> V2: Better support for IGT style and addressing comments
> > >
> > >  .clang-format   | 176 ++++++++++++++++++++++++++++++++++++++++++++++++
> > >  CONTRIBUTING.md |   9 ++-
> > >  2 files changed, 182 insertions(+), 3 deletions(-)
> > >  create mode 100644 .clang-format
> > >
> > > diff --git a/.clang-format b/.clang-format
> > > new file mode 100644
> > > index 00000000..da42bead
> > > --- /dev/null
> > > +++ b/.clang-format
> > > @@ -0,0 +1,176 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +#
> > > +# clang-format configuration file. Intended for clang-format >= 11.
> > > +#
> > > +# For more information, see:
> > > +#
> > > +#   Documentation/process/clang-format.rst
> > > +#   https://clang.llvm.org/docs/ClangFormat.html
> > > +#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html
> > > +#
> > > +# This file was pulled from the linux kernel at revision
> > > +# e0dccc3b76fb35bb257b4118367a883073d7390e.
> > > +#
> > > +# Changes made for IGT-specific styles should include a comment noting
> > > +# the previous value with "kernel-value". This makes it clear what we
> > > +# want to keep when updating this file.
> > > +---
> > > +AccessModifierOffset: -4
> > > +AlignAfterOpenBracket: Align
> > > +AlignConsecutiveAssignments: false
> > > +AlignConsecutiveDeclarations: false
> > > +AlignEscapedNewlines: Left
> > > +AlignOperands: true
> > > +AlignTrailingComments: false
> > > +AllowAllParametersOfDeclarationOnNextLine: false
> > > +AllowShortBlocksOnASingleLine: false
> > > +AllowShortCaseLabelsOnASingleLine: false
> > > +AllowShortFunctionsOnASingleLine: None
> > > +AllowShortIfStatementsOnASingleLine: false
> > > +AllowShortLoopsOnASingleLine: false
> > > +AlwaysBreakAfterDefinitionReturnType: None
> > > +AlwaysBreakAfterReturnType: None
> > > +AlwaysBreakBeforeMultilineStrings: false
> > > +AlwaysBreakTemplateDeclarations: false
> > > +BinPackArguments: true
> > > +BinPackParameters: true
> > > +BraceWrapping:
> > > +  AfterClass: false
> > > +  AfterControlStatement: false
> > > +  AfterEnum: false
> > > +  AfterFunction: true
> > > +  AfterNamespace: true
> > > +  AfterObjCDeclaration: false
> > > +  AfterStruct: false
> > > +  AfterUnion: false
> > > +  AfterExternBlock: false
> > > +  BeforeCatch: false
> > > +  BeforeElse: false
> > > +  IndentBraces: false
> > > +  SplitEmptyFunction: true
> > > +  SplitEmptyRecord: true
> > > +  SplitEmptyNamespace: true
> > > +BreakBeforeBinaryOperators: None
> > > +BreakBeforeBraces: Custom
> > > +BreakBeforeInheritanceComma: false
> > > +BreakBeforeTernaryOperators: false
> > > +BreakConstructorInitializersBeforeComma: false
> > > +BreakConstructorInitializers: BeforeComma
> > > +BreakAfterJavaFieldAnnotations: false
> > > +BreakStringLiterals: false
> > > +ColumnLimit: 80
> > > +CommentPragmas: '^ IWYU pragma:'
> > > +CompactNamespaces: false
> > > +ConstructorInitializerAllOnOneLineOrOnePerLine: false
> > > +ConstructorInitializerIndentWidth: 8
> > > +ContinuationIndentWidth: 8
> > > +Cpp11BracedListStyle: false
> > > +DerivePointerAlignment: false
> > > +DisableFormat: false
> > > +ExperimentalAutoDetectBinPacking: false
> > > +FixNamespaceComments: false
> > > +
> > > +# Taken from:
> > > +#   git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*('
> include/ tools/ \
> > > +#   | sed "s,^#define \([^[:space:]]*for_each[^[:space:]]*\)(.*$,  -
> '\1'," \
> > > +#   | LC_ALL=C sort -u
> > > +ForEachMacros: # kernel-value: (long list removed)
> > > +  # IGT rules, found via:
> > > +  # git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*('
> include/ lib/ |
> > > +  #     sed "s,^#define \([^(]\+\).*,'\1'," |
> > > +  #     grep -v "__" |
> > > +  #     sort -u
> > > +  - 'for_each_collection_data'
> > > +  - 'for_each_combination'
> > > +  - 'for_each_connected_output'
> > > +  - 'for_each_connector_mode'
> > > +  - 'for_each_ctx_cfg_engine'
> > > +  - 'for_each_ctx_engine'
> > > +  - 'for_each_format'
> > > +  - 'for_each_if'
> > > +  - 'for_each_memory_region'
> > > +  - 'for_each_mmap_offset_type'
> > > +  - 'for_each_physical_engine'
> > > +  - 'for_each_physical_ring'
> > > +  - 'for_each_pipe'
> > > +  - 'for_each_pipe_static'
> > > +  - 'for_each_pipe_with_single_output'
> > > +  - 'for_each_pipe_with_valid_output'
> > > +  - 'for_each_plane_on_pipe'
> > > +  - 'for_each_prime_number'
> > > +  - 'for_each_ring'
> > > +  - 'for_each_subset'
> > > +  - 'for_each_sysfs_gt_dirfd'
> > > +  - 'for_each_sysfs_gt_path'
> > > +  - 'for_each_valid_output_on_pipe'
> > > +  - 'for_each_variation_nr'
> > > +  - 'for_each_variation_r'
> > > +  - 'igt_list_for_each_entry'
> > > +  - 'igt_list_for_each_entry_reverse'
> > > +  - 'igt_list_for_each_entry_safe'
> > > +  - 'igt_list_for_each_entry_safe_reverse'
> > > +
> > > +IfMacros: # kernel-value: none
> > > +  - 'igt_dynamic'
> > > +  - 'igt_fixture'
> > > +  - 'igt_fork'
> > > +  - 'igt_subtest'
> > > +  - 'igt_subtest_f'
> > > +  - 'igt_subtest_group'
> > > +  - 'igt_subtest_with_dynamic'
> > > +  - 'igt_subtest_with_dynamic_f'
> > > +  - 'igt_until_timeout'
> >
> > What version of clang-format is needed for IfMacros?
> >
> >
> > --
> > Petri Latvala
> >
> >
> > > +
> > > +IncludeBlocks: Preserve
> > > +IncludeCategories:
> > > +  - Regex: '.*'
> > > +    Priority: 1
> > > +IncludeIsMainRegex: '(Test)?$'
> > > +IndentCaseLabels: false
> > > +IndentGotoLabels: false
> > > +IndentPPDirectives: None
> > > +IndentWidth: 8
> > > +IndentWrappedFunctionNames: false
> > > +JavaScriptQuotes: Leave
> > > +JavaScriptWrapImports: true
> > > +KeepEmptyLinesAtTheStartOfBlocks: false
> > > +MacroBlockBegin: ''
> > > +MacroBlockEnd: ''
> > > +MaxEmptyLinesToKeep: 1
> > > +NamespaceIndentation: None
> > > +ObjCBinPackProtocolList: Auto
> > > +ObjCBlockIndentWidth: 8
> > > +ObjCSpaceAfterProperty: true
> > > +ObjCSpaceBeforeProtocolList: true
> > > +
> > > +# Taken from git's rules
> > > +PenaltyBreakAssignment: 10
> > > +PenaltyBreakBeforeFirstCallParameter: 30
> > > +PenaltyBreakComment: 10
> > > +PenaltyBreakFirstLessLess: 0
> > > +PenaltyBreakString: 10
> > > +PenaltyExcessCharacter: 100
> > > +PenaltyReturnTypeOnItsOwnLine: 60
> > > +
> > > +PointerAlignment: Right
> > > +ReflowComments: true # kernel-value: false
> > > +SortIncludes: false
> > > +SortUsingDeclarations: false
> > > +SpaceAfterCStyleCast: false
> > > +SpaceAfterTemplateKeyword: true
> > > +SpaceBeforeAssignmentOperators: true
> > > +SpaceBeforeCtorInitializerColon: true
> > > +SpaceBeforeInheritanceColon: true
> > > +SpaceBeforeParens: ControlStatementsExceptForEachMacros
> > > +SpaceBeforeRangeBasedForLoopColon: true
> > > +SpaceInEmptyParentheses: false
> > > +SpacesBeforeTrailingComments: 1
> > > +SpacesInAngles: false
> > > +SpacesInContainerLiterals: false
> > > +SpacesInCStyleCastParentheses: false
> > > +SpacesInParentheses: false
> > > +SpacesInSquareBrackets: false
> > > +Standard: Cpp03
> > > +TabWidth: 8
> > > +UseTab: Always
> > > +...
> > > diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> > > index 6d1294ad..f2af5a18 100644
> > > --- a/CONTRIBUTING.md
> > > +++ b/CONTRIBUTING.md
> > > @@ -10,8 +10,10 @@ improvements for documentation and new tools and
> testcases.
> > >  The Code
> > >  --------
> > >
> > > -- The code should follow kernel coding style:
> > > -  https://www.kernel.org/doc/html/latest/process/coding-style.html
> > > +- The code should follow [kernel coding style](coding-style). Before
> > > +  sending out a patch, changes can be formatted with
> > > +  [git-clang-format](git-clang-format). Editors can be configured
> > > +  using .editorconfig for additional style support.
> > >
> > >  - Testcases (subtests) have to use minus signs (-) as a word
> separator.
> > >    The generated documentation contains glossary of commonly used
> terms.
> > > @@ -30,9 +32,10 @@ The Code
> > >    provided by the igt library. The semantic patch lib/igt.cocci can
> help with
> > >    more automatic conversions.
> > >
> > > +[coding-style]:
> https://www.kernel.org/doc/html/latest/process/coding-style.html
> > > +[git-clang-format]:
> https://github.com/llvm-mirror/clang/blob/master/tools/clang-format/git-clang-format
> > >  [igt-describe]:
> https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
> > >
> > > -
> > >  Sending Patches
> > >  ---------------
> > >
> > > --
> > > 2.37.1.455.g008518b4e5-goog
> > >
>

--00000000000051787d05e698d886
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!=C2=A0<div><br></div><div>Just checking in--is this rea=
dy to commit? Is there anything else I need to fix up?</div><div><br></div>=
<div>Thanks!</div><div><br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 12, 2022 at 12:00 PM Jim Sharg=
o &lt;<a href=3D"mailto:jshargo@google.com">jshargo@google.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It appears to=
 be 13: <a href=3D"https://clang.llvm.org/docs/ClangFormatStyleOptions.html=
" rel=3D"noreferrer" target=3D"_blank">https://clang.llvm.org/docs/ClangFor=
matStyleOptions.html</a><br>
<br>
<br>
On Fri, Aug 12, 2022 at 8:54 AM Petri Latvala &lt;<a href=3D"mailto:petri.l=
atvala@intel.com" target=3D"_blank">petri.latvala@intel.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; On Thu, Jul 28, 2022 at 01:57:36PM -0400, Jim Shargo wrote:<br>
&gt; &gt; As I was authoring my first patchset for IGT, I found myself figh=
ting<br>
&gt; &gt; the tooling a bit to get everything right. I had to add a bunch o=
f extra<br>
&gt; &gt; command line args to use my linux checkout&#39;s formatting rules=
 to get the<br>
&gt; &gt; style right.<br>
&gt; &gt;<br>
&gt; &gt; I grabbed this from a recent checkout of torvald&#39;s repo.<br>
&gt; &gt;<br>
&gt; &gt; The commit I used was: e0dccc3b76fb35bb257b4118367a883073d7390e<b=
r>
&gt; &gt;<br>
&gt; &gt; To make this discoverable to new contributors, this change also<b=
r>
&gt; &gt; updates CONTRIBUTING.md with:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0- A link to git-clang-format, which is a useful tool =
for using<br>
&gt; &gt;=C2=A0 =C2=A0clang-format from git just on a commit&#39;s changes<=
br>
&gt; &gt;=C2=A0 =C2=A0- A link to .editorconfig to make it more discoverabl=
e<br>
&gt; &gt;<br>
&gt; &gt; Changes made to the linux kernel style:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0- Reflowing comments, including multi-line comments (=
ReflowComments)<br>
&gt; &gt;=C2=A0 =C2=A0- Support for magic code blocks (ForEachMacros, IfMac=
ros)<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jim Shargo &lt;<a href=3D"mailto:jshargo@chromium.=
org" target=3D"_blank">jshargo@chromium.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; V2 -&gt; V3: Update CONTRIBUTING.md with a note about .editorconf=
ig,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remove reference to .clan=
g-format from the .editorconfig<br>
&gt; &gt; V1 -&gt; V2: Better support for IGT style and addressing comments=
<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 .clang-format=C2=A0 =C2=A0| 176 +++++++++++++++++++++++++++=
+++++++++++++++++++++<br>
&gt; &gt;=C2=A0 CONTRIBUTING.md |=C2=A0 =C2=A09 ++-<br>
&gt; &gt;=C2=A0 2 files changed, 182 insertions(+), 3 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 .clang-format<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/.clang-format b/.clang-format<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 00000000..da42bead<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/.clang-format<br>
&gt; &gt; @@ -0,0 +1,176 @@<br>
&gt; &gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; &gt; +#<br>
&gt; &gt; +# clang-format configuration file. Intended for clang-format &gt=
;=3D 11.<br>
&gt; &gt; +#<br>
&gt; &gt; +# For more information, see:<br>
&gt; &gt; +#<br>
&gt; &gt; +#=C2=A0 =C2=A0Documentation/process/clang-format.rst<br>
&gt; &gt; +#=C2=A0 =C2=A0<a href=3D"https://clang.llvm.org/docs/ClangFormat=
.html" rel=3D"noreferrer" target=3D"_blank">https://clang.llvm.org/docs/Cla=
ngFormat.html</a><br>
&gt; &gt; +#=C2=A0 =C2=A0<a href=3D"https://clang.llvm.org/docs/ClangFormat=
StyleOptions.html" rel=3D"noreferrer" target=3D"_blank">https://clang.llvm.=
org/docs/ClangFormatStyleOptions.html</a><br>
&gt; &gt; +#<br>
&gt; &gt; +# This file was pulled from the linux kernel at revision<br>
&gt; &gt; +# e0dccc3b76fb35bb257b4118367a883073d7390e.<br>
&gt; &gt; +#<br>
&gt; &gt; +# Changes made for IGT-specific styles should include a comment =
noting<br>
&gt; &gt; +# the previous value with &quot;kernel-value&quot;. This makes i=
t clear what we<br>
&gt; &gt; +# want to keep when updating this file.<br>
&gt; &gt; +---<br>
&gt; &gt; +AccessModifierOffset: -4<br>
&gt; &gt; +AlignAfterOpenBracket: Align<br>
&gt; &gt; +AlignConsecutiveAssignments: false<br>
&gt; &gt; +AlignConsecutiveDeclarations: false<br>
&gt; &gt; +AlignEscapedNewlines: Left<br>
&gt; &gt; +AlignOperands: true<br>
&gt; &gt; +AlignTrailingComments: false<br>
&gt; &gt; +AllowAllParametersOfDeclarationOnNextLine: false<br>
&gt; &gt; +AllowShortBlocksOnASingleLine: false<br>
&gt; &gt; +AllowShortCaseLabelsOnASingleLine: false<br>
&gt; &gt; +AllowShortFunctionsOnASingleLine: None<br>
&gt; &gt; +AllowShortIfStatementsOnASingleLine: false<br>
&gt; &gt; +AllowShortLoopsOnASingleLine: false<br>
&gt; &gt; +AlwaysBreakAfterDefinitionReturnType: None<br>
&gt; &gt; +AlwaysBreakAfterReturnType: None<br>
&gt; &gt; +AlwaysBreakBeforeMultilineStrings: false<br>
&gt; &gt; +AlwaysBreakTemplateDeclarations: false<br>
&gt; &gt; +BinPackArguments: true<br>
&gt; &gt; +BinPackParameters: true<br>
&gt; &gt; +BraceWrapping:<br>
&gt; &gt; +=C2=A0 AfterClass: false<br>
&gt; &gt; +=C2=A0 AfterControlStatement: false<br>
&gt; &gt; +=C2=A0 AfterEnum: false<br>
&gt; &gt; +=C2=A0 AfterFunction: true<br>
&gt; &gt; +=C2=A0 AfterNamespace: true<br>
&gt; &gt; +=C2=A0 AfterObjCDeclaration: false<br>
&gt; &gt; +=C2=A0 AfterStruct: false<br>
&gt; &gt; +=C2=A0 AfterUnion: false<br>
&gt; &gt; +=C2=A0 AfterExternBlock: false<br>
&gt; &gt; +=C2=A0 BeforeCatch: false<br>
&gt; &gt; +=C2=A0 BeforeElse: false<br>
&gt; &gt; +=C2=A0 IndentBraces: false<br>
&gt; &gt; +=C2=A0 SplitEmptyFunction: true<br>
&gt; &gt; +=C2=A0 SplitEmptyRecord: true<br>
&gt; &gt; +=C2=A0 SplitEmptyNamespace: true<br>
&gt; &gt; +BreakBeforeBinaryOperators: None<br>
&gt; &gt; +BreakBeforeBraces: Custom<br>
&gt; &gt; +BreakBeforeInheritanceComma: false<br>
&gt; &gt; +BreakBeforeTernaryOperators: false<br>
&gt; &gt; +BreakConstructorInitializersBeforeComma: false<br>
&gt; &gt; +BreakConstructorInitializers: BeforeComma<br>
&gt; &gt; +BreakAfterJavaFieldAnnotations: false<br>
&gt; &gt; +BreakStringLiterals: false<br>
&gt; &gt; +ColumnLimit: 80<br>
&gt; &gt; +CommentPragmas: &#39;^ IWYU pragma:&#39;<br>
&gt; &gt; +CompactNamespaces: false<br>
&gt; &gt; +ConstructorInitializerAllOnOneLineOrOnePerLine: false<br>
&gt; &gt; +ConstructorInitializerIndentWidth: 8<br>
&gt; &gt; +ContinuationIndentWidth: 8<br>
&gt; &gt; +Cpp11BracedListStyle: false<br>
&gt; &gt; +DerivePointerAlignment: false<br>
&gt; &gt; +DisableFormat: false<br>
&gt; &gt; +ExperimentalAutoDetectBinPacking: false<br>
&gt; &gt; +FixNamespaceComments: false<br>
&gt; &gt; +<br>
&gt; &gt; +# Taken from:<br>
&gt; &gt; +#=C2=A0 =C2=A0git grep -h &#39;^#define [^[:space:]]*for_each[^[=
:space:]]*(&#39; include/ tools/ \<br>
&gt; &gt; +#=C2=A0 =C2=A0| sed &quot;s,^#define \([^[:space:]]*for_each[^[:=
space:]]*\)(.*$,=C2=A0 - &#39;\1&#39;,&quot; \<br>
&gt; &gt; +#=C2=A0 =C2=A0| LC_ALL=3DC sort -u<br>
&gt; &gt; +ForEachMacros: # kernel-value: (long list removed)<br>
&gt; &gt; +=C2=A0 # IGT rules, found via:<br>
&gt; &gt; +=C2=A0 # git grep -h &#39;^#define [^[:space:]]*for_each[^[:spac=
e:]]*(&#39; include/ lib/ |<br>
&gt; &gt; +=C2=A0 #=C2=A0 =C2=A0 =C2=A0sed &quot;s,^#define \([^(]\+\).*,&#=
39;\1&#39;,&quot; |<br>
&gt; &gt; +=C2=A0 #=C2=A0 =C2=A0 =C2=A0grep -v &quot;__&quot; |<br>
&gt; &gt; +=C2=A0 #=C2=A0 =C2=A0 =C2=A0sort -u<br>
&gt; &gt; +=C2=A0 - &#39;for_each_collection_data&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_combination&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_connected_output&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_connector_mode&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_ctx_cfg_engine&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_ctx_engine&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_format&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_if&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_memory_region&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_mmap_offset_type&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_physical_engine&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_physical_ring&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_pipe&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_pipe_static&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_pipe_with_single_output&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_pipe_with_valid_output&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_plane_on_pipe&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_prime_number&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_ring&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_subset&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_sysfs_gt_dirfd&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_sysfs_gt_path&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_valid_output_on_pipe&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_variation_nr&#39;<br>
&gt; &gt; +=C2=A0 - &#39;for_each_variation_r&#39;<br>
&gt; &gt; +=C2=A0 - &#39;igt_list_for_each_entry&#39;<br>
&gt; &gt; +=C2=A0 - &#39;igt_list_for_each_entry_reverse&#39;<br>
&gt; &gt; +=C2=A0 - &#39;igt_list_for_each_entry_safe&#39;<br>
&gt; &gt; +=C2=A0 - &#39;igt_list_for_each_entry_safe_reverse&#39;<br>
&gt; &gt; +<br>
&gt; &gt; +IfMacros: # kernel-value: none<br>
&gt; &gt; +=C2=A0 - &#39;igt_dynamic&#39;<br>
&gt; &gt; +=C2=A0 - &#39;igt_fixture&#39;<br>
&gt; &gt; +=C2=A0 - &#39;igt_fork&#39;<br>
&gt; &gt; +=C2=A0 - &#39;igt_subtest&#39;<br>
&gt; &gt; +=C2=A0 - &#39;igt_subtest_f&#39;<br>
&gt; &gt; +=C2=A0 - &#39;igt_subtest_group&#39;<br>
&gt; &gt; +=C2=A0 - &#39;igt_subtest_with_dynamic&#39;<br>
&gt; &gt; +=C2=A0 - &#39;igt_subtest_with_dynamic_f&#39;<br>
&gt; &gt; +=C2=A0 - &#39;igt_until_timeout&#39;<br>
&gt;<br>
&gt; What version of clang-format is needed for IfMacros?<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Petri Latvala<br>
&gt;<br>
&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +IncludeBlocks: Preserve<br>
&gt; &gt; +IncludeCategories:<br>
&gt; &gt; +=C2=A0 - Regex: &#39;.*&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 Priority: 1<br>
&gt; &gt; +IncludeIsMainRegex: &#39;(Test)?$&#39;<br>
&gt; &gt; +IndentCaseLabels: false<br>
&gt; &gt; +IndentGotoLabels: false<br>
&gt; &gt; +IndentPPDirectives: None<br>
&gt; &gt; +IndentWidth: 8<br>
&gt; &gt; +IndentWrappedFunctionNames: false<br>
&gt; &gt; +JavaScriptQuotes: Leave<br>
&gt; &gt; +JavaScriptWrapImports: true<br>
&gt; &gt; +KeepEmptyLinesAtTheStartOfBlocks: false<br>
&gt; &gt; +MacroBlockBegin: &#39;&#39;<br>
&gt; &gt; +MacroBlockEnd: &#39;&#39;<br>
&gt; &gt; +MaxEmptyLinesToKeep: 1<br>
&gt; &gt; +NamespaceIndentation: None<br>
&gt; &gt; +ObjCBinPackProtocolList: Auto<br>
&gt; &gt; +ObjCBlockIndentWidth: 8<br>
&gt; &gt; +ObjCSpaceAfterProperty: true<br>
&gt; &gt; +ObjCSpaceBeforeProtocolList: true<br>
&gt; &gt; +<br>
&gt; &gt; +# Taken from git&#39;s rules<br>
&gt; &gt; +PenaltyBreakAssignment: 10<br>
&gt; &gt; +PenaltyBreakBeforeFirstCallParameter: 30<br>
&gt; &gt; +PenaltyBreakComment: 10<br>
&gt; &gt; +PenaltyBreakFirstLessLess: 0<br>
&gt; &gt; +PenaltyBreakString: 10<br>
&gt; &gt; +PenaltyExcessCharacter: 100<br>
&gt; &gt; +PenaltyReturnTypeOnItsOwnLine: 60<br>
&gt; &gt; +<br>
&gt; &gt; +PointerAlignment: Right<br>
&gt; &gt; +ReflowComments: true # kernel-value: false<br>
&gt; &gt; +SortIncludes: false<br>
&gt; &gt; +SortUsingDeclarations: false<br>
&gt; &gt; +SpaceAfterCStyleCast: false<br>
&gt; &gt; +SpaceAfterTemplateKeyword: true<br>
&gt; &gt; +SpaceBeforeAssignmentOperators: true<br>
&gt; &gt; +SpaceBeforeCtorInitializerColon: true<br>
&gt; &gt; +SpaceBeforeInheritanceColon: true<br>
&gt; &gt; +SpaceBeforeParens: ControlStatementsExceptForEachMacros<br>
&gt; &gt; +SpaceBeforeRangeBasedForLoopColon: true<br>
&gt; &gt; +SpaceInEmptyParentheses: false<br>
&gt; &gt; +SpacesBeforeTrailingComments: 1<br>
&gt; &gt; +SpacesInAngles: false<br>
&gt; &gt; +SpacesInContainerLiterals: false<br>
&gt; &gt; +SpacesInCStyleCastParentheses: false<br>
&gt; &gt; +SpacesInParentheses: false<br>
&gt; &gt; +SpacesInSquareBrackets: false<br>
&gt; &gt; +Standard: Cpp03<br>
&gt; &gt; +TabWidth: 8<br>
&gt; &gt; +UseTab: Always<br>
&gt; &gt; +...<br>
&gt; &gt; diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md<br>
&gt; &gt; index 6d1294ad..f2af5a18 100644<br>
&gt; &gt; --- a/CONTRIBUTING.md<br>
&gt; &gt; +++ b/CONTRIBUTING.md<br>
&gt; &gt; @@ -10,8 +10,10 @@ improvements for documentation and new tools a=
nd testcases.<br>
&gt; &gt;=C2=A0 The Code<br>
&gt; &gt;=C2=A0 --------<br>
&gt; &gt;<br>
&gt; &gt; -- The code should follow kernel coding style:<br>
&gt; &gt; -=C2=A0 <a href=3D"https://www.kernel.org/doc/html/latest/process=
/coding-style.html" rel=3D"noreferrer" target=3D"_blank">https://www.kernel=
.org/doc/html/latest/process/coding-style.html</a><br>
&gt; &gt; +- The code should follow [kernel coding style](coding-style). Be=
fore<br>
&gt; &gt; +=C2=A0 sending out a patch, changes can be formatted with<br>
&gt; &gt; +=C2=A0 [git-clang-format](git-clang-format). Editors can be conf=
igured<br>
&gt; &gt; +=C2=A0 using .editorconfig for additional style support.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 - Testcases (subtests) have to use minus signs (-) as a wor=
d separator.<br>
&gt; &gt;=C2=A0 =C2=A0 The generated documentation contains glossary of com=
monly used terms.<br>
&gt; &gt; @@ -30,9 +32,10 @@ The Code<br>
&gt; &gt;=C2=A0 =C2=A0 provided by the igt library. The semantic patch lib/=
igt.cocci can help with<br>
&gt; &gt;=C2=A0 =C2=A0 more automatic conversions.<br>
&gt; &gt;<br>
&gt; &gt; +[coding-style]: <a href=3D"https://www.kernel.org/doc/html/lates=
t/process/coding-style.html" rel=3D"noreferrer" target=3D"_blank">https://w=
ww.kernel.org/doc/html/latest/process/coding-style.html</a><br>
&gt; &gt; +[git-clang-format]: <a href=3D"https://github.com/llvm-mirror/cl=
ang/blob/master/tools/clang-format/git-clang-format" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/llvm-mirror/clang/blob/master/tools/clang=
-format/git-clang-format</a><br>
&gt; &gt;=C2=A0 [igt-describe]: <a href=3D"https://drm.pages.freedesktop.or=
g/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe" rel=3D"noreferrer" ta=
rget=3D"_blank">https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-too=
ls-Core.html#igt-describe</a><br>
&gt; &gt;<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 Sending Patches<br>
&gt; &gt;=C2=A0 ---------------<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.37.1.455.g008518b4e5-goog<br>
&gt; &gt;<br>
</blockquote></div>

--00000000000051787d05e698d886--
