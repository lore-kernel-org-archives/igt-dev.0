Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A256E6E0C6
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Nov 2020 16:46:12 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sat,  7 Nov 2020 22:19:15 +0530
Message-Id: <20201107164915.102917-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_module_load: Add descriptions for
 test and it's subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/i915_module_load.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index aa998b99..476bc6ae 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -36,6 +36,8 @@
 #include <sys/ioctl.h>
 #include <fcntl.h>
 
+IGT_TEST_DESCRIPTION("Tests the i915 module loading");
+
 #define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static void store_dword(int fd, unsigned ring)
@@ -320,6 +322,7 @@ hda_dynamic_debug(bool enable)
 
 igt_main
 {
+	igt_describe("Verify the basic functionality of i915 driver after it's reloaded");
 	igt_subtest("reload") {
 		int load_error;
 
@@ -337,6 +340,7 @@ igt_main
 		/* only default modparams, can leave module loaded */
 	}
 
+	igt_describe("Verify that i915 driver can be successfully loaded with disabled display");
 	igt_subtest("reload-no-display") {
 		igt_i915_driver_unload();
 
@@ -345,6 +349,8 @@ igt_main
 		igt_i915_driver_unload();
 	}
 
+	igt_describe("Verify that i915 driver can be successfully reloaded atleast once "
+	       "with fault injection");
 	igt_subtest("reload-with-fault-injection") {
 		const char *param;
 		int i = 0;
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
