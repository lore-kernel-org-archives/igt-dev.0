Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1640997972
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Aug 2022 18:01:51 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 Aug 2022 14:01:45 -0400
Message-Id: <20220801180145.243227-5-rodrigo.vivi@intel.com>
In-Reply-To: <20220801180145.243227-1-rodrigo.vivi@intel.com>
References: <20220801180145.243227-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] test/i915/i915_suspend: Use
 SUSPEND_STATE_S3 to enforce S3.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Now that we have the ability to enforce the S3, let's use it
and avoid the extra check in the test.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_aux.c             | 14 +++-----------
 lib/igt_aux.h             |  2 --
 tests/i915/i915_suspend.c |  5 +----
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 7d66350a..a101cca7 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -836,15 +836,7 @@ static bool is_state_supported(int power_dir, enum igt_suspend_state state)
 	return str;
 }
 
-/**
- * igt_get_memsleep_state
- *
- * Reads the value of /sys/power/mem_sleep and
- * returns the current suspend state associated with 'mem'.
- *
- * Returns : an #igt_mem_sleep state, current suspend state associated with 'mem'.
- */
-int igt_get_memsleep_state(void)
+static int get_mem_sleep(void)
 {
 	char *mem_sleep_states;
 	char *mem_sleep_state;
@@ -933,9 +925,9 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 	orig_test = get_suspend_test(power_dir);
 
 	if (state == SUSPEND_STATE_S3) {
-		orig_mem_sleep = igt_get_memsleep_state();
+		orig_mem_sleep = get_mem_sleep();
 		set_mem_sleep(power_dir, MEM_SLEEP_DEEP);
-		igt_skip_on_f(igt_get_memsleep_state() != MEM_SLEEP_DEEP,
+		igt_skip_on_f(get_mem_sleep() != MEM_SLEEP_DEEP,
 			      "S3 not possible in this system.\n");
 	}
 
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index b1e48b0f..89437a90 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -216,8 +216,6 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 void igt_set_autoresume_delay(int delay_secs);
 int igt_get_autoresume_delay(enum igt_suspend_state state);
 
-int igt_get_memsleep_state(void);
-
 /* dropping priviledges */
 void igt_drop_root(void);
 
diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index 222a8e4a..94935595 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -209,9 +209,6 @@ test_suspend_without_i915(int state)
 	igt_kmsg(KMSG_INFO "Unloading i915\n");
 	igt_assert_eq(igt_i915_driver_unload(),0);
 
-	igt_skip_on_f(igt_get_memsleep_state() == MEM_SLEEP_S2IDLE &&
-		      state == SUSPEND_STATE_MEM,
-		      "S3 not possible: platform default mem_sleep state is s2idle\n");
 	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
 
 	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
@@ -228,7 +225,7 @@ igt_main
 
 	igt_describe("Validate S3 without i915 module");
 	igt_subtest("basic-s3-without-i915")
-		test_suspend_without_i915(SUSPEND_STATE_MEM);
+		test_suspend_without_i915(SUSPEND_STATE_S3);
 
 	igt_fixture
 		fd = drm_open_driver(DRIVER_INTEL);
-- 
2.35.3
