Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C823510E0B5
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 11:15:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Tue, 27 Jun 2023 16:39:11 +0530
Message-Id: <20230627110911.2735472-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626160106.2632928-5-bhanuprakash.modem@intel.com>
References: <20230626160106.2632928-5-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V2 i-g-t 4/4] testplan/kms: Move kms testplan to intel
 dir
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com
List-ID: <igt-dev@lists.freedesktop.org>

As this testplan is specific to the Intel hardware, the correct
place for it is inside the tests/intel/.

V2: - Fix the included files path

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 docs/testplan/meson.build              | 2 +-
 tests/{ => intel}/kms_test_config.json | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename tests/{ => intel}/kms_test_config.json (94%)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index fb933a780eb..1167edc28ba 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -7,7 +7,7 @@ rst2pdf = find_program('rst2pdf', required: false)
 stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
 
 xe_test_config = join_paths(source_root, 'tests', 'intel', 'xe_test_config.json')
-kms_test_config = join_paths(source_root, 'tests', 'kms_test_config.json')
+kms_test_config = join_paths(source_root, 'tests', 'intel', 'kms_test_config.json')
 i915_test_config = join_paths(source_root, 'tests', 'intel', 'i915_test_config.json')
 
 check_testlist = []
diff --git a/tests/kms_test_config.json b/tests/intel/kms_test_config.json
similarity index 94%
rename from tests/kms_test_config.json
rename to tests/intel/kms_test_config.json
index 5fbe40bdc48..d781822e9fc 100644
--- a/tests/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -1,7 +1,7 @@
 {
     "description": "JSON file to be used to parse KMS documentation",
     "name": "Display and KMS Tests for Intel i915 and Xe Drivers",
-    "files": [ "chamelium/kms_*.c", "i915/kms_*.c", "kms_*.c" ],
+    "files": [ "../chamelium/kms_*.c", "../kms_*.c", "kms_*.c" ],
     "fields": {
         "Category": {
             "_properties_": {
-- 
2.40.0


