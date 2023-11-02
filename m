Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3415810E879
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 13:10:06 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.131.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CF7D2580D74
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 06:10:02 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qyXSS-001I15-12
 for igt-dev@lists.freedesktop.org; Thu, 02 Nov 2023 14:10:00 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Nov 2023 14:06:24 +0100
Message-ID: <20231102130957.307435-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20231102130957.307435-1-mauro.chehab@linux.intel.com>
References: <20231102130957.307435-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] scripts/test_list.py: speedup update
 testlist logic
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

Compile the expand regex to speed it up the parsing of
test lists.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index bd609feeb1f1..252fda576c92 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -512,6 +512,8 @@ class TestList:
         return False
 
     def update_testlist_field(self, subtest_dict):
+        expand = re.compile(",\s*")
+
         for field in self.props.keys():
             if "_properties_" not in self.props[field]:
                 continue
@@ -528,16 +530,16 @@ class TestList:
 
             value = subtest_dict.get(field)
             if value:
-                values = set(re.split(",\s*", value))
+                values = set(expand.split(value))
             else:
                 values = set()
 
             if append_value:
-                include_names = set(re.split(",\s*", append_value))
+                include_names = set(expand.split(append_value))
                 values.update(include_names)
 
             for names, regex_array in update.get("include", {}).items():
-                name = set(re.split(",\s*", names))
+                name = set(expand.split(names))
                 for regex in regex_array:
                     if regex.fullmatch(testname):
                         values.update(name)
@@ -546,7 +548,7 @@ class TestList:
             # If test is at a global blocklist, ignore it
             set_default = True
             for names, regex_array in update.get("exclude", {}).items():
-                deleted_names = set(re.split(",\s*", names))
+                deleted_names = set(expand.split(names))
                 for regex in regex_array:
                     if regex.fullmatch(testname):
                         if sorted(deleted_names) == sorted(values):
-- 
2.41.0
