Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4EFA726E
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Aug 2022 23:57:05 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 Aug 2022 23:56:45 +0000
Message-Id: <20220822235657.280702-12-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220822235657.280702-1-umesh.nerlige.ramappa@intel.com>
References: <20220822235657.280702-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 11/23] i915/perf: Explicitly state
 rendercopy needs for a test
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

Let tests explicitly require rendercopy before running. This helps in
temporarily blocking these tests until rendercopy is available on new
platforms.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 89aa4931..ba8c3792 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -1601,6 +1601,9 @@ static void load_helper_set_load(enum load load)
 
 static void load_helper_run(enum load load)
 {
+	if (!render_copy)
+		return;
+
 	/*
 	 * FIXME fork helpers won't get cleaned up when started from within a
 	 * subtest, so handle the case where it sticks around a bit too long.
@@ -1633,12 +1636,20 @@ static void load_helper_run(enum load load)
 
 static void load_helper_stop(void)
 {
+	if (!render_copy)
+		return;
+
 	kill(lh.igt_proc.pid, SIGUSR1);
 	igt_assert(igt_wait_helper(&lh.igt_proc) == 0);
 }
 
 static void load_helper_init(void)
 {
+	if (!render_copy) {
+		igt_info("Running test without render_copy\n");
+		return;
+	}
+
 	lh.devid = intel_get_drm_devid(drm_fd);
 
 	/* MI_STORE_DATA can only use GTT address on gen4+/g33 and needs
@@ -1659,7 +1670,12 @@ static void load_helper_init(void)
 
 static void load_helper_fini(void)
 {
-	int i915 = buf_ops_get_fd(lh.bops);
+	int i915;
+
+	if (!render_copy)
+		return;
+
+	i915 = buf_ops_get_fd(lh.bops);
 
 	if (lh.igt_proc.running)
 		load_helper_stop();
@@ -5054,7 +5070,6 @@ igt_main
 		gt_max_freq_mhz = sysfs_read(RPS_RP0_FREQ_MHZ);
 
 		render_copy = igt_get_render_copyfunc(devid);
-		igt_require_f(render_copy, "no render-copy function\n");
 	}
 
 	igt_subtest("non-system-wide-paranoid")
@@ -5157,6 +5172,7 @@ igt_main
 
 	igt_subtest("unprivileged-single-ctx-counters") {
 		igt_require(IS_HASWELL(devid));
+		igt_require_f(render_copy, "no render-copy function\n");
 		hsw_test_single_ctx_counters();
 	}
 
@@ -5170,6 +5186,7 @@ igt_main
 		 * For gen12 implement a separate test that uses only OAR
 		 */
 		igt_require(intel_gen(devid) >= 8 && intel_gen(devid) < 12);
+		igt_require_f(render_copy, "no render-copy function\n");
 		gen8_test_single_ctx_render_target_writes_a_counter();
 	}
 
@@ -5185,8 +5202,10 @@ igt_main
 			gen12_test_oa_tlb_invalidate();
 
 		igt_describe("Measure performance for a specific context using OAR in Gen 12");
-		igt_subtest("gen12-unprivileged-single-ctx-counters")
+		igt_subtest("gen12-unprivileged-single-ctx-counters") {
+			igt_require_f(render_copy, "no render-copy function\n");
 			gen12_test_single_ctx_render_target_writes_a_counter();
+		}
 	}
 
 	igt_subtest("rc6-disable")
-- 
2.25.1
