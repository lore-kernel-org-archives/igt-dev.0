Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7831410E430
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 10:29:57 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu,  4 May 2023 15:54:50 +0530
Message-Id: <20230504102451.3047783-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230504102451.3047783-1-bhanuprakash.modem@intel.com>
References: <20230504102451.3047783-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/3] testplan: Add testplan support for kms tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org, kamil.konieczny@linux.intel.com
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 docs/testplan/meson.build  |  6 ++++--
 tests/kms_test_config.json | 41 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 tests/kms_test_config.json

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index e36713960..4e3565cf8 100644
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
+	      'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist }
 	    }
 
 foreach testplan, fields: test_dict
diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
new file mode 100644
index 000000000..4faecb7a7
--- /dev/null
+++ b/tests/kms_test_config.json
@@ -0,0 +1,41 @@
+{
+    "description": "JSON file to be used to parse KMS documentation",
+    "files": [ "chamelium/kms_chamelium_edid.c", "chamelium/kms_chamelium_frames.c",
+               "chamelium/kms_chamelium_hpd.c", "i915/kms_psr.c",
+               "kms_addfb_basic.c", "kms_cursor_legacy.c", "kms_flip.c",
+               "kms_force_connector_basic.c", "kms_pipe_crc_basic.c",
+               "kms_prop_blob.c", "kms_color.c"
+             ],
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


