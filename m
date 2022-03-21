Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8880E10E2F4
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Mar 2022 14:29:57 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
Date: Mon, 21 Mar 2022 19:51:54 +0530
Message-Id: <20220321142155.273109-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20220321142155.273109-1-priyanka.dandamudi@intel.com>
References: <20220321142155.273109-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/i915_module_load: Add descriptions
 for test
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add test description for subtests.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/i915_module_load.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index a86dd86c..a1b8604f 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -37,6 +37,8 @@
 #include "igt_sysfs.h"
 #include "igt_core.h"
 
+IGT_TEST_DESCRIPTION("Tests the i915 module loading.");
+
 static void store_all(int i915)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
@@ -236,6 +238,7 @@ hda_dynamic_debug(bool enable)
 
 igt_main
 {
+	igt_describe("Verify the basic functionality of i915 driver after it's reloaded.");
 	igt_subtest("reload") {
 		int load_error;
 
@@ -252,6 +255,7 @@ igt_main
 		/* only default modparams, can leave module loaded */
 	}
 
+	igt_describe("Verify that i915 driver can be successfully loaded with disabled display.");
 	igt_subtest("reload-no-display") {
 		igt_i915_driver_unload();
 
@@ -260,6 +264,8 @@ igt_main
 		igt_i915_driver_unload();
 	}
 
+	igt_describe("Verify that i915 driver can be successfully reloaded atleast once"
+		     " with fault injection.");
 	igt_subtest("reload-with-fault-injection") {
 		const char *param;
 		int i = 0;
-- 
2.25.1
