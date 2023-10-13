Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9AF10E5CB
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 09:31:57 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.15.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 72805580BF0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 02:31:56 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qrEWQ-0035om-1P
 for igt-dev@lists.freedesktop.org; Fri, 13 Oct 2023 11:31:54 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Oct 2023 11:29:27 +0200
Message-ID: <20231013093152.737239-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20231013093152.737239-1-mauro.chehab@linux.intel.com>
References: <20231013093152.737239-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] scripts/test_list.py: allow ignoring
 uppercase on testlist read
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

There are some tests in KMS which uses uppercase names. Add a
config option on test_list.py json handler to allow parsing
testlist regular expressions on a case-insensitive way.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index c0462188ba8a..c75d15bfca73 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -321,6 +321,10 @@ class TestList:
             self.props["Class"]["_properties_"]["level"] = 1
             self.props["Class"]["_properties_"]["sublevel"] = sublevel_count[0] + 1
 
+        flags = 0
+        if self.config.get("case_insensitive_testlist", False):
+            flags |= re.IGNORECASE
+
         # Remove non-multilevel items, as we're only interested on
         # hierarchical item levels here
         for field, item in self.props.items():
@@ -335,7 +339,7 @@ class TestList:
                 testlist = {}
                 for value in item["_properties_"]["testlists"]:
                     for name in value.keys():
-                        self.read_testlist(testlist, name, cfg_path + value[name])
+                        self.read_testlist(testlist, name, cfg_path + value[name], flags)
 
                 item["_properties_"]["testlist"] = testlist
 
@@ -344,7 +348,7 @@ class TestList:
                 blocklist = {}
                 for value in item["_properties_"]["blocklists"]:
                     for name in value.keys():
-                        self.read_testlist(testlist, name, cfg_path + value[name])
+                        self.read_testlist(testlist, name, cfg_path + value[name], flags)
 
                 item["_properties_"]["blocklist"] = blocklist
 
@@ -448,7 +452,7 @@ class TestList:
 
             self.__add_field(key, sublevel, hierarchy_level, field[key])
 
-    def read_testlist(self, testlist, name, filename):
+    def read_testlist(self, testlist, name, filename, flags):
         base = r"^\s*({}[^\s\{}]+)(\S*)\s*(\#.*)?$"
         regex = re.compile(base.format(self.main_name, self.subtest_separator))
 
@@ -462,7 +466,7 @@ class TestList:
                     subtest = match.group(2)
                     if not subtest.endswith("$"):
                         subtest += r"(\@.*)?$"
-                    testlist[name].append(re.compile(f"{test}{subtest}"))
+                    testlist[name].append(re.compile(f"{test}{subtest}", flags))
 
     def __filter_subtest(self, test, subtest, field_not_found_value):
 
-- 
2.41.0
