Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FA2B1D36
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Aug 2022 12:54:21 +0000 (UTC)
Date: Fri, 12 Aug 2022 15:53:10 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jim Shargo <jshargo@chromium.org>
Message-ID: <YvZNNsz6RspU1vZl@platvala-desk.ger.corp.intel.com>
References: <YuJA8zCW9wFQh5M6@platvala-desk.ger.corp.intel.com>
 <20220728175736.1893691-1-jshargo@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728175736.1893691-1-jshargo@chromium.org>
Subject: Re: [igt-dev] [PATCH i-g-t v3] tooling: Add linux's .clang-format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jul 28, 2022 at 01:57:36PM -0400, Jim Shargo wrote:
> As I was authoring my first patchset for IGT, I found myself fighting
> the tooling a bit to get everything right. I had to add a bunch of extra
> command line args to use my linux checkout's formatting rules to get the
> style right.
> 
> I grabbed this from a recent checkout of torvald's repo.
> 
> The commit I used was: e0dccc3b76fb35bb257b4118367a883073d7390e
> 
> To make this discoverable to new contributors, this change also
> updates CONTRIBUTING.md with:
> 
>   - A link to git-clang-format, which is a useful tool for using
>   clang-format from git just on a commit's changes
>   - A link to .editorconfig to make it more discoverable
> 
> Changes made to the linux kernel style:
> 
>   - Reflowing comments, including multi-line comments (ReflowComments)
>   - Support for magic code blocks (ForEachMacros, IfMacros)
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> ---
> V2 -> V3: Update CONTRIBUTING.md with a note about .editorconfig,
>           remove reference to .clang-format from the .editorconfig
> V1 -> V2: Better support for IGT style and addressing comments
> 
>  .clang-format   | 176 ++++++++++++++++++++++++++++++++++++++++++++++++
>  CONTRIBUTING.md |   9 ++-
>  2 files changed, 182 insertions(+), 3 deletions(-)
>  create mode 100644 .clang-format
> 
> diff --git a/.clang-format b/.clang-format
> new file mode 100644
> index 00000000..da42bead
> --- /dev/null
> +++ b/.clang-format
> @@ -0,0 +1,176 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# clang-format configuration file. Intended for clang-format >= 11.
> +#
> +# For more information, see:
> +#
> +#   Documentation/process/clang-format.rst
> +#   https://clang.llvm.org/docs/ClangFormat.html
> +#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html
> +#
> +# This file was pulled from the linux kernel at revision
> +# e0dccc3b76fb35bb257b4118367a883073d7390e.
> +#
> +# Changes made for IGT-specific styles should include a comment noting
> +# the previous value with "kernel-value". This makes it clear what we
> +# want to keep when updating this file.
> +---
> +AccessModifierOffset: -4
> +AlignAfterOpenBracket: Align
> +AlignConsecutiveAssignments: false
> +AlignConsecutiveDeclarations: false
> +AlignEscapedNewlines: Left
> +AlignOperands: true
> +AlignTrailingComments: false
> +AllowAllParametersOfDeclarationOnNextLine: false
> +AllowShortBlocksOnASingleLine: false
> +AllowShortCaseLabelsOnASingleLine: false
> +AllowShortFunctionsOnASingleLine: None
> +AllowShortIfStatementsOnASingleLine: false
> +AllowShortLoopsOnASingleLine: false
> +AlwaysBreakAfterDefinitionReturnType: None
> +AlwaysBreakAfterReturnType: None
> +AlwaysBreakBeforeMultilineStrings: false
> +AlwaysBreakTemplateDeclarations: false
> +BinPackArguments: true
> +BinPackParameters: true
> +BraceWrapping:
> +  AfterClass: false
> +  AfterControlStatement: false
> +  AfterEnum: false
> +  AfterFunction: true
> +  AfterNamespace: true
> +  AfterObjCDeclaration: false
> +  AfterStruct: false
> +  AfterUnion: false
> +  AfterExternBlock: false
> +  BeforeCatch: false
> +  BeforeElse: false
> +  IndentBraces: false
> +  SplitEmptyFunction: true
> +  SplitEmptyRecord: true
> +  SplitEmptyNamespace: true
> +BreakBeforeBinaryOperators: None
> +BreakBeforeBraces: Custom
> +BreakBeforeInheritanceComma: false
> +BreakBeforeTernaryOperators: false
> +BreakConstructorInitializersBeforeComma: false
> +BreakConstructorInitializers: BeforeComma
> +BreakAfterJavaFieldAnnotations: false
> +BreakStringLiterals: false
> +ColumnLimit: 80
> +CommentPragmas: '^ IWYU pragma:'
> +CompactNamespaces: false
> +ConstructorInitializerAllOnOneLineOrOnePerLine: false
> +ConstructorInitializerIndentWidth: 8
> +ContinuationIndentWidth: 8
> +Cpp11BracedListStyle: false
> +DerivePointerAlignment: false
> +DisableFormat: false
> +ExperimentalAutoDetectBinPacking: false
> +FixNamespaceComments: false
> +
> +# Taken from:
> +#   git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*(' include/ tools/ \
> +#   | sed "s,^#define \([^[:space:]]*for_each[^[:space:]]*\)(.*$,  - '\1'," \
> +#   | LC_ALL=C sort -u
> +ForEachMacros: # kernel-value: (long list removed)
> +  # IGT rules, found via:
> +  # git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*(' include/ lib/ |
> +  #     sed "s,^#define \([^(]\+\).*,'\1'," |
> +  #     grep -v "__" |
> +  #     sort -u    
> +  - 'for_each_collection_data'
> +  - 'for_each_combination'
> +  - 'for_each_connected_output'
> +  - 'for_each_connector_mode'
> +  - 'for_each_ctx_cfg_engine'
> +  - 'for_each_ctx_engine'
> +  - 'for_each_format'
> +  - 'for_each_if'
> +  - 'for_each_memory_region'
> +  - 'for_each_mmap_offset_type'
> +  - 'for_each_physical_engine'
> +  - 'for_each_physical_ring'
> +  - 'for_each_pipe'
> +  - 'for_each_pipe_static'
> +  - 'for_each_pipe_with_single_output'
> +  - 'for_each_pipe_with_valid_output'
> +  - 'for_each_plane_on_pipe'
> +  - 'for_each_prime_number'
> +  - 'for_each_ring'
> +  - 'for_each_subset'
> +  - 'for_each_sysfs_gt_dirfd'
> +  - 'for_each_sysfs_gt_path'
> +  - 'for_each_valid_output_on_pipe'
> +  - 'for_each_variation_nr'
> +  - 'for_each_variation_r'
> +  - 'igt_list_for_each_entry'
> +  - 'igt_list_for_each_entry_reverse'
> +  - 'igt_list_for_each_entry_safe'
> +  - 'igt_list_for_each_entry_safe_reverse'
> +
> +IfMacros: # kernel-value: none
> +  - 'igt_dynamic'
> +  - 'igt_fixture'
> +  - 'igt_fork'
> +  - 'igt_subtest'
> +  - 'igt_subtest_f'
> +  - 'igt_subtest_group'
> +  - 'igt_subtest_with_dynamic'
> +  - 'igt_subtest_with_dynamic_f'
> +  - 'igt_until_timeout'

What version of clang-format is needed for IfMacros?


-- 
Petri Latvala


> +
> +IncludeBlocks: Preserve
> +IncludeCategories:
> +  - Regex: '.*'
> +    Priority: 1
> +IncludeIsMainRegex: '(Test)?$'
> +IndentCaseLabels: false
> +IndentGotoLabels: false
> +IndentPPDirectives: None
> +IndentWidth: 8
> +IndentWrappedFunctionNames: false
> +JavaScriptQuotes: Leave
> +JavaScriptWrapImports: true
> +KeepEmptyLinesAtTheStartOfBlocks: false
> +MacroBlockBegin: ''
> +MacroBlockEnd: ''
> +MaxEmptyLinesToKeep: 1
> +NamespaceIndentation: None
> +ObjCBinPackProtocolList: Auto
> +ObjCBlockIndentWidth: 8
> +ObjCSpaceAfterProperty: true
> +ObjCSpaceBeforeProtocolList: true
> +
> +# Taken from git's rules
> +PenaltyBreakAssignment: 10
> +PenaltyBreakBeforeFirstCallParameter: 30
> +PenaltyBreakComment: 10
> +PenaltyBreakFirstLessLess: 0
> +PenaltyBreakString: 10
> +PenaltyExcessCharacter: 100
> +PenaltyReturnTypeOnItsOwnLine: 60
> +
> +PointerAlignment: Right
> +ReflowComments: true # kernel-value: false
> +SortIncludes: false
> +SortUsingDeclarations: false
> +SpaceAfterCStyleCast: false
> +SpaceAfterTemplateKeyword: true
> +SpaceBeforeAssignmentOperators: true
> +SpaceBeforeCtorInitializerColon: true
> +SpaceBeforeInheritanceColon: true
> +SpaceBeforeParens: ControlStatementsExceptForEachMacros
> +SpaceBeforeRangeBasedForLoopColon: true
> +SpaceInEmptyParentheses: false
> +SpacesBeforeTrailingComments: 1
> +SpacesInAngles: false
> +SpacesInContainerLiterals: false
> +SpacesInCStyleCastParentheses: false
> +SpacesInParentheses: false
> +SpacesInSquareBrackets: false
> +Standard: Cpp03
> +TabWidth: 8
> +UseTab: Always
> +...
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index 6d1294ad..f2af5a18 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -10,8 +10,10 @@ improvements for documentation and new tools and testcases.
>  The Code
>  --------
>  
> -- The code should follow kernel coding style:
> -  https://www.kernel.org/doc/html/latest/process/coding-style.html
> +- The code should follow [kernel coding style](coding-style). Before
> +  sending out a patch, changes can be formatted with
> +  [git-clang-format](git-clang-format). Editors can be configured
> +  using .editorconfig for additional style support.
>  
>  - Testcases (subtests) have to use minus signs (-) as a word separator.
>    The generated documentation contains glossary of commonly used terms.
> @@ -30,9 +32,10 @@ The Code
>    provided by the igt library. The semantic patch lib/igt.cocci can help with
>    more automatic conversions.
>  
> +[coding-style]: https://www.kernel.org/doc/html/latest/process/coding-style.html
> +[git-clang-format]: https://github.com/llvm-mirror/clang/blob/master/tools/clang-format/git-clang-format
>  [igt-describe]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
>  
> -
>  Sending Patches
>  ---------------
>  
> -- 
> 2.37.1.455.g008518b4e5-goog
> 
