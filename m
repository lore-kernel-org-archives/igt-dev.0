Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D5410E5CD
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 09:31:57 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.15.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 73336580DBE
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 02:31:56 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qrEWQ-0035os-1V
 for igt-dev@lists.freedesktop.org; Fri, 13 Oct 2023 11:31:54 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Oct 2023 11:29:29 +0200
Message-ID: <20231013093152.737239-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20231013093152.737239-1-mauro.chehab@linux.intel.com>
References: <20231013093152.737239-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] scripts/test_list.py: better name
 testlist include/exclude config fields
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

The config names "testlists" and "blocklists" are confusing, as they
don't have the same concept of such lists used within IGT.

What the test_list logic does, instead, is to fill a field with
a value for all tests included from a file, except for the ones
marked on an exclude testlist.

Use the name "include" for the tag defining the file name
containing a list of tests to be included.

On a similar way, use "exclude" to mean the file name containg
a list of tests to be excluded.

While here, remove two class variables originally planned for
the testlist/blocklist logic that aren't actually used.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py             | 24 +++++++++++-------------
 tests/intel/kms_test_config.json |  4 ++--
 tests/intel/xe_test_config.json  |  4 ++--
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index c75d15bfca73..e54873f07e20 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -260,8 +260,6 @@ class TestList:
         self.igt_build_path = igt_build_path
         self.level_count = 0
         self.field_list = {}
-        self.testlist = {}
-        self.blocklist = {}
         self.title = None
         self.filters = {}
         self.subtest_separator = subtest_separator
@@ -335,22 +333,22 @@ class TestList:
                     del item["_properties_"]["sublevel"]
 
             # Read testlist files if any
-            if "testlists" in item["_properties_"]:
+            if "include" in item["_properties_"]:
                 testlist = {}
-                for value in item["_properties_"]["testlists"]:
+                for value in item["_properties_"]["include"]:
                     for name in value.keys():
                         self.read_testlist(testlist, name, cfg_path + value[name], flags)
 
-                item["_properties_"]["testlist"] = testlist
+                item["_properties_"]["include"] = testlist
 
             # Read blocklist files if any
-            if "blocklists" in item["_properties_"]:
-                blocklist = {}
-                for value in item["_properties_"]["blocklists"]:
+            if "exclude" in item["_properties_"]:
+                testlist = {}
+                for value in item["_properties_"]["exclude"]:
                     for name in value.keys():
                         self.read_testlist(testlist, name, cfg_path + value[name], flags)
 
-                item["_properties_"]["blocklist"] = blocklist
+                item["_properties_"]["exclude"] = testlist
 
         if "_properties_" in self.props:
             del self.props["_properties_"]
@@ -490,7 +488,7 @@ class TestList:
             if "_properties_" not in self.props[field]:
                 continue
 
-            if "testlist" not in self.props[field]["_properties_"]:
+            if "include" not in self.props[field]["_properties_"]:
                 continue
 
             default_value = self.props[field]["_properties_"].get("default-testlist")
@@ -503,7 +501,7 @@ class TestList:
             else:
                 values = set()
 
-            for names, regex_array in self.props[field]["_properties_"]["testlist"].items():
+            for names, regex_array in self.props[field]["_properties_"]["include"].items():
                 name = set(re.split(",\s*", names))
                 for regex in regex_array:
                     if regex.match(testname):
@@ -512,8 +510,8 @@ class TestList:
 
             # If test is at a global blocklist, ignore it
             set_full_if_empty = True
-            if "blocklist" in self.props[field]["_properties_"]:
-                for names, regex_array in self.props[field]["_properties_"]["testlist"].items():
+            if "exclude" in self.props[field]["_properties_"]:
+                for names, regex_array in self.props[field]["_properties_"]["exclude"].items():
                     deleted_names = set(re.split(",\s*", names))
                     for regex in regex_array:
                         if regex.match(testname):
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 6c9b7194a58f..40cf69dd0904 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -24,7 +24,7 @@
                 "_properties_": {
                     "description": "Defines what category of testlist it belongs",
                     "default-testlist": "FULL",
-                    "testlists": [
+                    "include": [
                         { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
                         { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
                         { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
@@ -32,7 +32,7 @@
                         { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
                         { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
                     ],
-                    "blocklists": [
+                    "exclude": [
                         { "i915 BAT, i915 BAT chamelium, i915 chamelium": "../intel-ci/blacklist.txt" },
                         { "Xe BAT, Xe BAT chamelium": "../intel-ci/xe.blocklist.txt" }
                     ]
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 89df8a1a3ad2..20faf73b7270 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -33,10 +33,10 @@
                             "mandatory": true,
                             "description": "Defines what category of testlist it belongs",
                             "default-testlist": "FULL",
-                            "testlists": [
+                            "include": [
                                 { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
                             ],
-                            "blocklists": [
+                            "exclude": [
                                 { "Xe BAT": "../intel-ci/xe.blocklist.txt" }
                             ],
                             "order": [
-- 
2.41.0
