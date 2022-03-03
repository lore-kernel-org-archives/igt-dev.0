Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F1C10E93E
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Mar 2022 14:06:51 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Mar 2022 19:36:36 +0530
Message-Id: <20220303140636.26652-3-anshuman.gupta@intel.com>
In-Reply-To: <20220303140636.26652-1-anshuman.gupta@intel.com>
References: <20220303140636.26652-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] i915_pm_rpm: Add placement to
 gem_exec_stress
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This add memory region placement to gem_exec_stress group of test.
gem-execbuf-stress-pc8 is odd one test as PC8 is applicable to igfx
platform. dgfx sox has its own PkgG sates therefore memory region
placement is irrelevant for gem-execbuf-stress-pc8 test.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 1df0ed222..cf724b2a6 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -47,6 +47,7 @@
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
+#include "i915/gem_memory_topology.h"
 #include "igt.h"
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
@@ -1373,7 +1374,9 @@ static void gem_execbuf_subtest(void)
 
 /* Assuming execbuf already works, let's see what happens when we force many
  * suspend/resume cycles with commands. */
-static void gem_execbuf_stress_subtest(int rounds, int wait_flags)
+static void
+gem_execbuf_stress_subtest(int rounds, int wait_flags,
+			   struct drm_i915_gem_memory_class_instance *mem_regions)
 {
 	int i;
 	int batch_size = 4 * sizeof(uint32_t);
@@ -1396,7 +1399,12 @@ static void gem_execbuf_stress_subtest(int rounds, int wait_flags)
 
 	disable_all_screens_and_wait(&ms_data);
 
-	handle = gem_create(drm_fd, batch_size);
+	/* PC8 test is only applicable to igfx  */
+	if (wait_flags & WAIT_PC8_RES)
+		handle = gem_create(drm_fd, batch_size);
+	else
+		handle = gem_create_in_memory_region_list(drm_fd, batch_size, mem_regions, 1);
+
 	gem_write(drm_fd, handle, 0, batch_buf, batch_size);
 
 	objs[0].handle = handle;
@@ -2038,8 +2046,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	/* Skip instead of failing in case the machine is not prepared to reach
 	 * PC8+. We don't want bug reports from cases where the machine is just
 	 * not properly configured. */
-	igt_fixture
+	igt_fixture {
 		igt_require(setup_environment(false));
+	}
 
 	if (stay)
 		igt_subtest("stay")
@@ -2151,12 +2160,17 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		system_suspend_subtest(SUSPEND_STATE_DISK, SUSPEND_TEST_NONE);
 
 	/* GEM stress */
-	igt_subtest("gem-execbuf-stress")
-		gem_execbuf_stress_subtest(rounds, WAIT_STATUS);
+	igt_subtest_with_dynamic("gem-execbuf-stress") {
+		for_each_memory_region(r, drm_fd) {
+			igt_dynamic_f("%s", r->name)
+				gem_execbuf_stress_subtest(rounds, WAIT_STATUS, &r->ci);
+			igt_dynamic_f("%s-%s", "extra-wait", r->name)
+				gem_execbuf_stress_subtest(rounds, WAIT_STATUS | WAIT_EXTRA, &r->ci);
+		}
+	}
+
 	igt_subtest("gem-execbuf-stress-pc8")
-		gem_execbuf_stress_subtest(rounds, WAIT_PC8_RES);
-	igt_subtest("gem-execbuf-stress-extra-wait")
-		gem_execbuf_stress_subtest(rounds, WAIT_STATUS | WAIT_EXTRA);
+		gem_execbuf_stress_subtest(rounds, WAIT_PC8_RES, 0);
 
 	/* power-wake reference tests */
 	igt_subtest("pm-tiling") {
-- 
2.26.2
