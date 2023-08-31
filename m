Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFDC10E68F
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 14:55:19 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.5.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 051DD580109
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 07:55:15 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qbj4i-0020HQ-2z
 for igt-dev@lists.freedesktop.org; Thu, 31 Aug 2023 16:55:12 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Aug 2023 16:52:11 +0200
Message-ID: <20230831145509.477543-10-mauro.chehab@linux.intel.com>
In-Reply-To: <20230831145509.477543-1-mauro.chehab@linux.intel.com>
References: <20230831145509.477543-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 09/11] scripts/test_list.py: don't rely
 on file name to parse config
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

Currently, config_fname should not be empty, as the class init
will fail. Make the logic more generic to prepare to optionally pass
the configuration dict directly.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 8ef3a136688f..962dbbadeeee 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -255,7 +255,6 @@ class TestList:
         self.filenames = file_list
         self.plan_filenames = []
         self.props = {}
-        self.config_fname = config_fname
         self.igt_build_path = igt_build_path
         self.level_count = 0
         self.field_list = {}
@@ -276,6 +275,9 @@ class TestList:
         with open(config_fname, 'r', encoding='utf8') as handle:
             self.config = json.load(handle)
 
+        config_origin = config_fname
+        cfg_path = os.path.realpath(os.path.dirname(config_fname)) + "/"
+
         self.__add_field(None, 0, 0, self.config["fields"])
 
         sublevel_count = [ 0 ] * self.level_count
@@ -317,12 +319,12 @@ class TestList:
             files = self.config["files"]
             exclude_file_glob = self.config.get("exclude_files", [])
             for cfg_file in exclude_file_glob:
-                cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
+                cfg_file = cfg_path + cfg_file
                 for fname in glob.glob(cfg_file):
                     exclude_files.append(fname)
 
             for cfg_file in files:
-                cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
+                cfg_file = cfg_path + cfg_file
                 for fname in glob.glob(cfg_file):
                     if fname in exclude_files:
                         continue
@@ -338,7 +340,7 @@ class TestList:
             implemented_class = "Implemented"
             files = self.config["planning_files"]
             for cfg_file in files:
-                cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
+                cfg_file = cfg_path + cfg_file
                 for fname in glob.glob(cfg_file):
                     self.plan_filenames.append(fname)
                     has_planned = True
@@ -366,12 +368,12 @@ class TestList:
                 continue
 
             self.__add_file_documentation(fname, implemented_class, field_re,
-                                          test_tag, subtest_tag)
+                                          test_tag, subtest_tag, config_origin)
 
         if include_plan:
             for fname in self.plan_filenames:
                 self.__add_file_documentation(fname, planned_class, field_re,
-                                              test_tag, subtest_tag)
+                                              test_tag, subtest_tag, config_origin)
 
     #
     # ancillary methods
@@ -1011,7 +1013,7 @@ class TestList:
     #
 
     def __add_file_documentation(self, fname, implemented_class, field_re,
-                                 test_tag, subtest_tag):
+                                 test_tag, subtest_tag, config_origin):
 
         """Adds the contents of test/subtest documentation form a file"""
 
@@ -1221,7 +1223,7 @@ class TestList:
 
                 file_line.rstrip(r"\n")
                 sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
-                         (self.config_fname, file_line))
+                         (config_origin, file_line))
 
     def show_subtests(self, sort_field):
 
-- 
2.41.0
