Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045F410E5BD
 for <igt-dev@lists.freedesktop.org>; Fri,  5 May 2023 10:36:17 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri,  5 May 2023 16:01:19 +0530
Message-Id: <20230505103119.3309148-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230505103119.3309148-1-bhanuprakash.modem@intel.com>
References: <20230505103119.3309148-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 2/2] testplan: Add testplan support for kms
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add testplan support for kms tests.
The documentation for kms tests will be like:

	/**
	 * TEST: Test foo.
	 * Category: Display
	 *
	 * SUBTEST: bar
	 * Description: bar description
	 * Test category: functionality test
	 * Run type: BAT
	 * Functionality: dp
	 * Mega feature: DP 2.0
	 */

V2: - Empty 'extra_args' to avoid failures for missing docs
    - Use wildcards instead of adding full list of files

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 docs/testplan/meson.build  |  6 ++++--
 tests/kms_test_config.json | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 tests/kms_test_config.json

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index e36713960..b65ee964d 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -7,6 +7,7 @@ rst2pdf = find_program('rst2pdf', required: false)
 stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
 
 xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
+kms_test_config = join_paths(source_root, 'tests', 'kms_test_config.json')
 
 check_testlist = []
 if build_tests
@@ -22,8 +23,9 @@ else
 	doc_dependencies = []
 endif
 
-test_dict = { 'xe_tests':
-		{ 'input': xe_test_config, 'extra_args': check_testlist }
+test_dict = {
+	      'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist },
+	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
 	    }
 
 foreach testplan, fields: test_dict
diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
new file mode 100644
index 000000000..d2d6357d1
--- /dev/null
+++ b/tests/kms_test_config.json
@@ -0,0 +1,36 @@
+{
+    "description": "JSON file to be used to parse KMS documentation",
+    "files": [ "chamelium/kms_*.c", "i915/kms_*.c", "kms_*.c" ],
+    "fields": {
+        "Category": {
+            "_properties_": {
+                "description": "Contains the major group for the tested functionality 'Display'"
+            }
+        },
+        "Mega feature": {
+            "_properties_": {
+                "description": "Contains the mega feature for end to end use case, e.g. the 'PSR' feature."
+            },
+            "Functionality": {
+                "_properties_": {
+                    "description": "Groups tests on buckets containg more detailed functionality"
+                }
+            }
+        },
+        "Run type": {
+            "_properties_": {
+                "description": "Defines what category of testlist it belongs"
+            }
+        },
+        "Test category": {
+            "_properties_": {
+                "description": "Defines the test category. Usually used at subtest level."
+            }
+        },
+        "Description" : {
+            "_properties_": {
+                "description": "Provides a description for the test/subtest."
+            }
+        }
+    }
+}
-- 
2.40.0


