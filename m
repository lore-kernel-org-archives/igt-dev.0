Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBEF10E97B
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 08:23:53 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 09:23:15 +0100
Message-Id: <20230310082326.12088-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
References: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/18] scripts/igt_doc.py: improve
 multi-line logic
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

Currently, there's no way to use something like:
	/**
	 ...
	 * Issue:
	 *	https://foo.bar

as https would be mis-interpreted as a field.

Fix it by always requiring one or more spaces/tabs on continuation
lines.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 scripts/igt_doc.py | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index c06c6e4eae..cd8dccecb4 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -832,6 +832,8 @@ class TestList:
             subtest_number = 0
 
             for file_ln,file_line in enumerate(handle):
+                file_line = file_line.rstrip()
+
                 if re.match(r'^\s*\*$', file_line):
                     continue
 
@@ -850,7 +852,7 @@ class TestList:
                 if not handle_section:
                     continue
 
-                file_line = re.sub(r'^\s*\*\s*', '', file_line)
+                file_line = re.sub(r'^\s*\* ?', '', file_line)
 
                 # Handle only known sections
                 if handle_section == '1':
@@ -966,21 +968,17 @@ class TestList:
                     if cur_arg not in self.doc[current_test]["arg"][arg_ref]:
                         self.doc[current_test]["arg"][arg_ref][cur_arg] = {}
 
-                    values = match.group(2).split(",")
+                    values = match.group(2).replace(" ", "").split(",")
                     for split_val in values:
                         if split_val == "":
                             continue
-                        self.doc[current_test]["arg"][arg_ref][cur_arg][split_val.strip()] = split_val.strip()
+                        self.doc[current_test]["arg"][arg_ref][cur_arg][split_val] = split_val
 
                     continue
 
-                if (match := re.match(r'^(.*):', file_line)):
-                    sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized field '%s'. Need to add at %s" %
-                            (match.group(1), self.config_fname))
-
                 # Handle multi-line field contents
                 if current_field:
-                    if (match := re.match(r'\s*(.*)', file_line)):
+                    if (match := re.match(r'\s+(.*)', file_line)):
                         if handle_section == 'test':
                             dic = self.doc[current_test]
                         else:
@@ -989,12 +987,11 @@ class TestList:
                         if dic[current_field] != '':
                             dic[current_field] += " "
                         dic[current_field] += match.group(1)
-
-                    continue
+                        continue
 
                 # Handle multi-line argument contents
                 if cur_arg >= 0 and arg_ref is not None:
-                    if (match := re.match(r'\s*\*?\s*(.*)', file_line)):
+                    if (match := re.match(r'\s+\*?\s*(.*)', file_line)):
                         match_val = match.group(1)
 
                         match = re.match(r'^(\<.*)\>$',self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element])
@@ -1006,6 +1003,10 @@ class TestList:
                             self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] += match_val
                     continue
 
+                re.sub(r"\n$","", file_line)
+                sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
+                         (self.config_fname, file_line))
+
 #
 # Main
 #
-- 
2.34.1
