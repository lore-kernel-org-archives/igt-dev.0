Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860BB10E5FC
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 07:51:02 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 38D93580E8C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 00:51:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qJr6I-0044Tm-0R
 for igt-dev@lists.freedesktop.org; Thu, 13 Jul 2023 09:50:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Jul 2023 09:50:48 +0200
Message-Id: <20230713075054.970457-9-mauro.chehab@linux.intel.com>
In-Reply-To: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
References: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 08/14] scripts/test_list.py: allow
 passing a config dict directly
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

Make the logic more generic by allowing to pass a config dict
directly.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 465c73c3bdef..27434a6d7471 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -245,8 +245,10 @@ class TestList:
     Description: test ioctls
     """
 
-    def __init__(self, config_fname, include_plan = False, file_list = False,
+    def __init__(self, config_fname = None,
+                 include_plan = False, file_list = None,
                  built_testlist = None,
+                 config_dict = None, sources_path = None,
                  test_tag = "TEST", subtest_tag = "SUBTESTS?",
                  main_name = "igt", subtest_separator = "@"):
         self.doc = {}
@@ -263,18 +265,34 @@ class TestList:
         self.subtest_separator = subtest_separator
         self.main_name = main_name
 
+        # Exclusive or: either one is needed
+        if bool(config_fname) == bool(config_dict):
+            sys.exit("Error: either config filename or config dict shall be used")
+
         if self.main_name:
             self.main_name += subtest_separator
 
-        driver_name = re.sub(r'(.*/)?([^\/]+)/.*', r'\2', config_fname).capitalize()
-
         implemented_class = None
 
-        with open(config_fname, 'r', encoding='utf8') as handle:
-            self.config = json.load(handle)
+        if config_fname:
+            with open(config_fname, 'r', encoding='utf8') as handle:
+                self.config = json.load(handle)
 
-        config_origin = config_fname
-        cfg_path = os.path.realpath(os.path.dirname(config_fname)) + "/"
+            config_origin = config_fname
+            cfg_path = os.path.realpath(os.path.dirname(config_fname)) + "/"
+            driver_name = re.sub(r'(.*/)?([^\/]+)/.*', r'\2', config_fname).capitalize()
+
+        else:
+            self.config = config_dict
+            config_origin = "config dict"
+            cfg_path = "./"
+            driver_name = main_name
+
+        if sources_path:
+            cfg_path = os.path.realpath(sources_path) + "/"
+
+        if not self.config:
+            sys.exit("Error: configuration is empty!")
 
         self.__add_field(None, 0, 0, self.config["fields"])
 
-- 
2.40.1
