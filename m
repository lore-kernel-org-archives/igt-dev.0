Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF0C10E36F
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 13:32:12 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.3.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 06C4F580D74
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 06:32:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pgmx4-00ABnI-0E
 for igt-dev@lists.freedesktop.org; Mon, 27 Mar 2023 15:31:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 15:31:48 +0200
Message-Id: <20230327133155.2428454-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/11] scripts/igt_doc.py: prepare to place
 TestList class on a separate file
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

Do some changes at the code to avoid depending on global vars and
to declare plural ancillary function as static.

Acked-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index efbcee5e74e2..8eed875b0681 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -51,7 +51,7 @@ def _sort_using_array(item, array):
 # As suggested at https://stackoverflow.com/questions/18902608/generating-the-plural-form-of-a-noun/19018986
 #
 
-def plural(field):
+def _plural(field):
 
     """
     Poor man's conversion to plural.
@@ -232,7 +232,8 @@ class TestList:
     Description: test ioctls
     """
 
-    def __init__(self, config_fname, include_plan, file_list):
+    def __init__(self, config_fname, include_plan = False, file_list = False,
+                 igt_build_path = None, igt_runner = None):
         self.doc = {}
         self.test_number = 0
         self.config = None
@@ -240,6 +241,8 @@ class TestList:
         self.plan_filenames = []
         self.props = {}
         self.config_fname = config_fname
+        self.igt_build_path = igt_build_path
+        self.igt_runner = igt_runner
         self.level_count = 0
         self.field_list = {}
         self.title = None
@@ -264,7 +267,7 @@ class TestList:
 
                 field_lc = field.lower()
                 self.field_list[field_lc] = field
-                field_plural = plural(field_lc)
+                field_plural = _plural(field_lc)
                 if field_lc != field_plural:
                     self.field_list[field_plural] = field
 
@@ -757,6 +760,9 @@ class TestList:
 
         """Compare documented subtests with the IGT test list"""
 
+        if not self.igt_build_path or not self.igt_runner:
+            sys.exit("Need the IGT build path and igt_runner executable file name")
+
         doc_subtests = sorted(self.get_subtests()[""])
 
         for i in range(0, len(doc_subtests)): # pylint: disable=C0200
@@ -766,9 +772,9 @@ class TestList:
 
         # Get a list of tests from
         try:
-            result = subprocess.run([ f"{IGT_BUILD_PATH}/{IGT_RUNNER}",
+            result = subprocess.run([ f"{self.igt_build_path}/{self.igt_runner}",
                                     "-L", "-t",  test_prefix,
-                                    f"{IGT_BUILD_PATH}/tests"], check = True,
+                                    f"{self.igt_build_path}/tests"], check = True,
                                     stdout=subprocess.PIPE, universal_newlines=True)
         except subprocess.CalledProcessError as sub_err:
             print(sub_err.stderr)
@@ -1023,7 +1029,7 @@ class TestList:
         """Show subtests, allowing sort and filter a field """
 
         if sort_field:
-            test_subtests = tests.get_subtests(sort_field, filter_field)
+            test_subtests = self.get_subtests(sort_field, filter_field)
             for val_key in sorted(test_subtests.keys()):
                 if not test_subtests[val_key]:
                     continue
@@ -1034,7 +1040,7 @@ class TestList:
                     for sub in test_subtests[val_key]:
                         print (f"  {sub}")
         else:
-            for sub in tests.get_subtests(sort_field, filter_field)[""]:
+            for sub in self.get_subtests(sort_field, filter_field)[""]:
                 print (sub)
 
     def gen_testlist(self, directory, sort_field, filter_field):
@@ -1101,7 +1107,8 @@ parser.add_argument('--files', nargs='+',
 
 parse_args = parser.parse_args()
 
-tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files)
+tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files,
+                 IGT_BUILD_PATH, IGT_RUNNER)
 
 RUN = 0
 if parse_args.show_subtests:
-- 
2.39.2
