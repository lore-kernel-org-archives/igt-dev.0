Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F8310E97C
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 08:23:57 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 09:23:16 +0100
Message-Id: <20230310082326.12088-9-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
References: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 08/18] scripts/igt_doc.py: don't use ":="
 operator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

As this was introduced on python 3.8, remove its usage, in order
to make the script compatible with version 3.7.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 scripts/igt_doc.py | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index cd8dccecb4..1d1d7856f2 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -58,7 +58,8 @@ def plural(field):
 
     """
 
-    if (match := re.match(r"(.*)\b(\S+)", field)):
+    match = re.match(r"(.*)\b(\S+)", field)
+    if match:
         ret_str = match.group(1)
         word = match.group(2)
 
@@ -702,7 +703,8 @@ class TestList:
             sort_field = self.field_list[sort_field.lower()]
 
         if filter_field_expr:
-            if not (match := re.match(r"(.*)=~\s*(.*)", filter_field_expr)):
+            match = re.match(r"(.*)=~\s*(.*)", filter_field_expr)
+            if not match:
                 sys.exit(f"Filter field {filter_field_expr} is not at <field> =~ <regex> syntax")
 
             field = match.group(1).strip().lower()
@@ -859,7 +861,8 @@ class TestList:
                     current_field = ''
 
                     # Check if it is a new TEST section
-                    if (match := re.match(r'^TEST:\s*(.*)', file_line)):
+                    match = re.match(r'^TEST:\s*(.*)', file_line)
+                    if match:
                         current_test = self.test_number
                         self.test_number += 1
 
@@ -878,7 +881,8 @@ class TestList:
                         continue
 
                 # Check if it is a new SUBTEST section
-                if (match := re.match(r'^SUBTESTS?:\s*(.*)', file_line)):
+                match = re.match(r'^SUBTESTS?:\s*(.*)', file_line)
+                if match:
                     current_subtest = subtest_number
                     subtest_number += 1
 
@@ -915,7 +919,8 @@ class TestList:
                     continue
 
                 # It is a known section. Parse its contents
-                if (match := re.match(field_re, file_line)):
+                match = re.match(field_re, file_line)
+                if match:
                     current_field = self.field_list[match.group(1).lower()]
                     match_val = match.group(2)
 
@@ -929,7 +934,8 @@ class TestList:
                     continue
 
                 # Use hashes for arguments to avoid duplication
-                if (match := re.match(r'arg\[(\d+)\]:\s*(.*)', file_line)):
+                match = re.match(r'arg\[(\d+)\]:\s*(.*)', file_line)
+                if match:
                     current_field = ''
                     if arg_ref is None:
                         sys.exit(f"{fname}:{file_ln + 1}: arguments should be defined after one or more subtests, at the same comment")
@@ -946,7 +952,8 @@ class TestList:
 
                     continue
 
-                if (match := re.match(r'\@(\S+):\s*(.*)', file_line)):
+                match = re.match(r'\@(\S+):\s*(.*)', file_line)
+                if match:
                     if cur_arg >= 0:
                         current_field = ''
                         if arg_ref is None:
@@ -962,7 +969,8 @@ class TestList:
                     continue
 
                 # We don't need a multi-lined version here
-                if (match := re.match(r'arg\[(\d+)\]\.values:\s*(.*)', file_line)):
+                match = re.match(r'arg\[(\d+)\]\.values:\s*(.*)', file_line)
+                if match:
                     cur_arg = int(match.group(1)) - 1
 
                     if cur_arg not in self.doc[current_test]["arg"][arg_ref]:
@@ -978,7 +986,8 @@ class TestList:
 
                 # Handle multi-line field contents
                 if current_field:
-                    if (match := re.match(r'\s+(.*)', file_line)):
+                    match = re.match(r'\s+(.*)', file_line)
+                    if match:
                         if handle_section == 'test':
                             dic = self.doc[current_test]
                         else:
@@ -991,7 +1000,8 @@ class TestList:
 
                 # Handle multi-line argument contents
                 if cur_arg >= 0 and arg_ref is not None:
-                    if (match := re.match(r'\s+\*?\s*(.*)', file_line)):
+                    match = re.match(r'\s+\*?\s*(.*)', file_line)
+                    if match:
                         match_val = match.group(1)
 
                         match = re.match(r'^(\<.*)\>$',self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element])
-- 
2.34.1
