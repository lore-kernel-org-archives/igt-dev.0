Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FC9C705E
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Jul 2022 20:21:27 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id z18so86457qki.2
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Jul 2022 13:21:27 -0700 (PDT)
From: Jim Shargo <jshargo@chromium.org>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>
Date: Wed, 27 Jul 2022 16:21:25 -0400
Message-Id: <20220727202125.546432-1-jshargo@chromium.org>
In-Reply-To: <YuEY1XNsPVb1GzcN@platvala-desk.ger.corp.intel.com>
References: <YuEY1XNsPVb1GzcN@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tooling: Add linux's .clang-format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jim Shargo <jshargo@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As I was authoring my first patchset for IGT, I found myself fighting
the tooling a bit to get everything right. I had to add a bunch of extra
command line args to use my linux checkout's formatting rules to get the
style right.

I grabbed this from a recent checkout of torvald's repo.

The commit I used was: e0dccc3b76fb35bb257b4118367a883073d7390e

To make this discoverable to new contributors, this change:

  - Updates CONTRIBUTING.md with a link to git-clang-format, which is
  a useful tool for using clang-format from git just on a commit's
  changes.
  - Updates .editorconfig with a reference to .clang-format and a
  pointer to CONTRIBUTING.md

Changes made to the linux kernel style:

  - Reflowing comments, including multi-line comments (ReflowComments)
  - Support for magic code blocks (ForEachMacros, IfMacros)

Signed-off-by: Jim Shargo <jshargo@chromium.org>
---
V1 -> V2: Better support for IGT style and addressing comments

 .clang-format   | 176 ++++++++++++++++++++++++++++++++++++++++++++++++
 .editorconfig   |   6 +-
 CONTRIBUTING.md |   8 ++-
 3 files changed, 185 insertions(+), 5 deletions(-)
 create mode 100644 .clang-format

diff --git a/.clang-format b/.clang-format
new file mode 100644
index 00000000..da42bead
--- /dev/null
+++ b/.clang-format
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# clang-format configuration file. Intended for clang-format >= 11.
+#
+# For more information, see:
+#
+#   Documentation/process/clang-format.rst
+#   https://clang.llvm.org/docs/ClangFormat.html
+#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html
+#
+# This file was pulled from the linux kernel at revision
+# e0dccc3b76fb35bb257b4118367a883073d7390e.
+#
+# Changes made for IGT-specific styles should include a comment noting
+# the previous value with "kernel-value". This makes it clear what we
+# want to keep when updating this file.
+---
+AccessModifierOffset: -4
+AlignAfterOpenBracket: Align
+AlignConsecutiveAssignments: false
+AlignConsecutiveDeclarations: false
+AlignEscapedNewlines: Left
+AlignOperands: true
+AlignTrailingComments: false
+AllowAllParametersOfDeclarationOnNextLine: false
+AllowShortBlocksOnASingleLine: false
+AllowShortCaseLabelsOnASingleLine: false
+AllowShortFunctionsOnASingleLine: None
+AllowShortIfStatementsOnASingleLine: false
+AllowShortLoopsOnASingleLine: false
+AlwaysBreakAfterDefinitionReturnType: None
+AlwaysBreakAfterReturnType: None
+AlwaysBreakBeforeMultilineStrings: false
+AlwaysBreakTemplateDeclarations: false
+BinPackArguments: true
+BinPackParameters: true
+BraceWrapping:
+  AfterClass: false
+  AfterControlStatement: false
+  AfterEnum: false
+  AfterFunction: true
+  AfterNamespace: true
+  AfterObjCDeclaration: false
+  AfterStruct: false
+  AfterUnion: false
+  AfterExternBlock: false
+  BeforeCatch: false
+  BeforeElse: false
+  IndentBraces: false
+  SplitEmptyFunction: true
+  SplitEmptyRecord: true
+  SplitEmptyNamespace: true
+BreakBeforeBinaryOperators: None
+BreakBeforeBraces: Custom
+BreakBeforeInheritanceComma: false
+BreakBeforeTernaryOperators: false
+BreakConstructorInitializersBeforeComma: false
+BreakConstructorInitializers: BeforeComma
+BreakAfterJavaFieldAnnotations: false
+BreakStringLiterals: false
+ColumnLimit: 80
+CommentPragmas: '^ IWYU pragma:'
+CompactNamespaces: false
+ConstructorInitializerAllOnOneLineOrOnePerLine: false
+ConstructorInitializerIndentWidth: 8
+ContinuationIndentWidth: 8
+Cpp11BracedListStyle: false
+DerivePointerAlignment: false
+DisableFormat: false
+ExperimentalAutoDetectBinPacking: false
+FixNamespaceComments: false
+
+# Taken from:
+#   git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*(' include/ tools/ \
+#   | sed "s,^#define \([^[:space:]]*for_each[^[:space:]]*\)(.*$,  - '\1'," \
+#   | LC_ALL=C sort -u
+ForEachMacros: # kernel-value: (long list removed)
+  # IGT rules, found via:
+  # git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*(' include/ lib/ |
+  #     sed "s,^#define \([^(]\+\).*,'\1'," |
+  #     grep -v "__" |
+  #     sort -u    
+  - 'for_each_collection_data'
+  - 'for_each_combination'
+  - 'for_each_connected_output'
+  - 'for_each_connector_mode'
+  - 'for_each_ctx_cfg_engine'
+  - 'for_each_ctx_engine'
+  - 'for_each_format'
+  - 'for_each_if'
+  - 'for_each_memory_region'
+  - 'for_each_mmap_offset_type'
+  - 'for_each_physical_engine'
+  - 'for_each_physical_ring'
+  - 'for_each_pipe'
+  - 'for_each_pipe_static'
+  - 'for_each_pipe_with_single_output'
+  - 'for_each_pipe_with_valid_output'
+  - 'for_each_plane_on_pipe'
+  - 'for_each_prime_number'
+  - 'for_each_ring'
+  - 'for_each_subset'
+  - 'for_each_sysfs_gt_dirfd'
+  - 'for_each_sysfs_gt_path'
+  - 'for_each_valid_output_on_pipe'
+  - 'for_each_variation_nr'
+  - 'for_each_variation_r'
+  - 'igt_list_for_each_entry'
+  - 'igt_list_for_each_entry_reverse'
+  - 'igt_list_for_each_entry_safe'
+  - 'igt_list_for_each_entry_safe_reverse'
+
+IfMacros: # kernel-value: none
+  - 'igt_dynamic'
+  - 'igt_fixture'
+  - 'igt_fork'
+  - 'igt_subtest'
+  - 'igt_subtest_f'
+  - 'igt_subtest_group'
+  - 'igt_subtest_with_dynamic'
+  - 'igt_subtest_with_dynamic_f'
+  - 'igt_until_timeout'
+
+IncludeBlocks: Preserve
+IncludeCategories:
+  - Regex: '.*'
+    Priority: 1
+IncludeIsMainRegex: '(Test)?$'
+IndentCaseLabels: false
+IndentGotoLabels: false
+IndentPPDirectives: None
+IndentWidth: 8
+IndentWrappedFunctionNames: false
+JavaScriptQuotes: Leave
+JavaScriptWrapImports: true
+KeepEmptyLinesAtTheStartOfBlocks: false
+MacroBlockBegin: ''
+MacroBlockEnd: ''
+MaxEmptyLinesToKeep: 1
+NamespaceIndentation: None
+ObjCBinPackProtocolList: Auto
+ObjCBlockIndentWidth: 8
+ObjCSpaceAfterProperty: true
+ObjCSpaceBeforeProtocolList: true
+
+# Taken from git's rules
+PenaltyBreakAssignment: 10
+PenaltyBreakBeforeFirstCallParameter: 30
+PenaltyBreakComment: 10
+PenaltyBreakFirstLessLess: 0
+PenaltyBreakString: 10
+PenaltyExcessCharacter: 100
+PenaltyReturnTypeOnItsOwnLine: 60
+
+PointerAlignment: Right
+ReflowComments: true # kernel-value: false
+SortIncludes: false
+SortUsingDeclarations: false
+SpaceAfterCStyleCast: false
+SpaceAfterTemplateKeyword: true
+SpaceBeforeAssignmentOperators: true
+SpaceBeforeCtorInitializerColon: true
+SpaceBeforeInheritanceColon: true
+SpaceBeforeParens: ControlStatementsExceptForEachMacros
+SpaceBeforeRangeBasedForLoopColon: true
+SpaceInEmptyParentheses: false
+SpacesBeforeTrailingComments: 1
+SpacesInAngles: false
+SpacesInContainerLiterals: false
+SpacesInCStyleCastParentheses: false
+SpacesInParentheses: false
+SpacesInSquareBrackets: false
+Standard: Cpp03
+TabWidth: 8
+UseTab: Always
+...
diff --git a/.editorconfig b/.editorconfig
index 7b7f1375..5c7e31d3 100644
--- a/.editorconfig
+++ b/.editorconfig
@@ -1,5 +1,7 @@
-# To use this config in your editor, follow the instructions at:
-# http://editorconfig.org
+# To use this config in your editor, follow the instructions at
+# http://editorconfig.org. You can also use "clang-format" for new C
+# code (see CONTRIBUTING.md for suggestions and .clang-format for more
+# details).
 
 root = true
 
diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 6d1294ad..8d7320b7 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -10,8 +10,9 @@ improvements for documentation and new tools and testcases.
 The Code
 --------
 
-- The code should follow kernel coding style:
-  https://www.kernel.org/doc/html/latest/process/coding-style.html
+- The code should follow [kernel coding style](coding-style). Before
+  sending out a patch, changes can be formatted with
+  [git-clang-format](git-clang-format).
 
 - Testcases (subtests) have to use minus signs (-) as a word separator.
   The generated documentation contains glossary of commonly used terms.
@@ -30,9 +31,10 @@ The Code
   provided by the igt library. The semantic patch lib/igt.cocci can help with
   more automatic conversions.
 
+[coding-style]: https://www.kernel.org/doc/html/latest/process/coding-style.html
+[git-clang-format]: https://github.com/llvm-mirror/clang/blob/master/tools/clang-format/git-clang-format
 [igt-describe]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
 
-
 Sending Patches
 ---------------
 
-- 
2.37.1.359.gd136c6c3e2-goog
