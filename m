Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44CD10E6E2
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 18:10:08 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 20:07:24 +0200
Message-ID: <20230906181001.498395-7-mauro.chehab@linux.intel.com>
In-Reply-To: <20230906181001.498395-1-mauro.chehab@linux.intel.com>
References: <20230906181001.498395-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/6] scripts/test_list.py: move "FULL"
 testlist to config file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tomasz.mistat@intel.com, jari.tahvanainen@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Don't assume that the default testlist is "FULL". Instead, read
it from the configuration file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py             | 6 ++++--
 tests/intel/kms_test_config.json | 1 +
 tests/intel/xe_test_config.json  | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index a8ea4f973e87..5672bbd92124 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -484,6 +484,8 @@ class TestList:
             if "testlist" not in self.props[field]["_properties_"]:
                 continue
 
+            default_value = self.props[field]["_properties_"].get("default-testlist")
+
             testname = subtest_dict["_summary_"]
 
             value = subtest_dict.get(field)
@@ -510,8 +512,8 @@ class TestList:
                                 set_full_if_empty = False
                             values.discard(deleted_names)
 
-            if set_full_if_empty and not values:
-                values = set(["FULL"])
+            if default_value and set_full_if_empty and not values:
+                values = set([default_value])
 
             subtest_dict[field] = ", ".join(sorted(values))
 
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 7ab288685677..5be264a79c6e 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -22,6 +22,7 @@
             "Run type": {
                 "_properties_": {
                     "description": "Defines what category of testlist it belongs",
+                    "default-testlist": "FULL",
                     "testlists": {
                         "i915 BAT": "../intel-ci/fast-feedback.testlist",
                         "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist",
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 408afcbb03bc..9e582a43df56 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -32,6 +32,7 @@
                         "_properties_": {
                             "mandatory": true,
                             "description": "Defines what category of testlist it belongs",
+                            "default-testlist": "FULL",
                             "testlists": {
                                 "Xe BAT": "../intel-ci/xe-fast-feedback.testlist"
                             },
-- 
2.41.0
