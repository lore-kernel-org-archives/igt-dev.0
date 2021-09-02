Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E3A6E7E2
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Sep 2021 17:30:43 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Thu,  2 Sep 2021 10:30:41 -0700
Message-Id: <20210902173043.821318-15-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210902173043.821318-1-alan.previn.teres.alexis@intel.com>
References: <20210902173043.821318-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 14/16] Ensure RESET_STATS reports
 invalidated protected contexts
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

When protected contexts are created but get invalidated
due to PXP session teardown, RESET_STATS ioctl for said
context shall log an increased count in lost batch_active
equal to all engines of this context indicating the pxp
context is now banned.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 73 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 69 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 38c7925b..d538e78c 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -772,9 +772,34 @@ static void trigger_pxp_debugfs_forced_teardown(int i915)
 	close(fd);
 }
 
-static void test_pxp_stale_ctx_execution(int i915)
+static int get_context_num_engines(int i915, uint32_t ctx)
+{
+	intel_ctx_cfg_t cfg;
+	int n = 4; /* at the very least Gen12s have 4 engines */
+
+	if (gem_has_engine_topology(i915)) {
+		cfg =  intel_ctx_cfg_all_physical(i915);
+		n = cfg.num_engines;
+	}
+	return n;
+}
+
+static int get_context_lost_count(int i915, uint32_t ctx)
 {
+	struct drm_i915_reset_stats rs;
 	int ret;
+
+	memset(&rs, 0, sizeof(rs));
+	rs.ctx_id = ctx;
+	ret = drmIoctl(i915, DRM_IOCTL_I915_GET_RESET_STATS, &rs);
+	igt_assert(ret == 0);
+
+	return (int)rs.batch_active;
+}
+
+static void test_pxp_stale_ctx_execution(int i915)
+{
+	int ret, lostcount;
 	struct simple_exec_assets data = {0};
 
 	/*
@@ -786,7 +811,15 @@ static void test_pxp_stale_ctx_execution(int i915)
 	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
 	igt_assert(ret == 0);
 
+	lostcount = get_context_lost_count(i915, data.ctx);
 	trigger_pxp_debugfs_forced_teardown(i915);
+	/* After teardown, verify RESET_STATS for pxp context reflects
+	 * the non-recoverable invalidation
+	 */
+	usleep(50000);
+	igt_assert_f(get_context_lost_count(i915, data.ctx) >=
+		     lostcount + get_context_num_engines(i915, data.ctx),
+		     "RESET_STATS didn't reflect stale pxp context1\n");
 
 	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
 	igt_assert_f((ret == -EIO), "Executing stale pxp context didn't fail with -EIO\n");
@@ -796,7 +829,7 @@ static void test_pxp_stale_ctx_execution(int i915)
 
 static void test_pxp_stale_buf_execution(int i915)
 {
-	int ret;
+	int ret, lostcount;
 	struct simple_exec_assets data = {0};
 	uint32_t ctx2;
 	struct intel_bb *ibb2;
@@ -806,7 +839,15 @@ static void test_pxp_stale_buf_execution(int i915)
 	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
 	igt_assert(ret == 0);
 
+	lostcount = get_context_lost_count(i915, data.ctx);
 	trigger_pxp_debugfs_forced_teardown(i915);
+	/* After teardown, verify RESET_STATS for pxp context reflects
+	 * the non-recoverable invalidation
+	 */
+	usleep(50000);
+	igt_assert_f(get_context_lost_count(i915, data.ctx) >=
+		     lostcount + get_context_num_engines(i915, data.ctx),
+		     "RESET_STATS didn't reflect stale pxp context2\n");
 
 	/*
 	 * After teardown, use a new pxp context but reuse the stale bo to ensure
@@ -829,7 +870,7 @@ static void test_pxp_stale_buf_execution(int i915)
 
 static void test_pxp_stale_buf_optout_execution(int i915)
 {
-	int ret;
+	int ret, lostcount;
 	struct simple_exec_assets data = {0};
 
 	/*
@@ -840,7 +881,14 @@ static void test_pxp_stale_buf_optout_execution(int i915)
 	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
 	igt_assert(ret == 0);
 
+	lostcount = get_context_lost_count(i915, data.ctx);
 	trigger_pxp_debugfs_forced_teardown(i915);
+	/* After teardown, verify RESET_STATS for regular context doesn't
+	 * exhibit any invalidation
+	 */
+	usleep(50000);
+	igt_assert_f(get_context_lost_count(i915, data.ctx) ==  lostcount,
+		     "Bad RESET_STATS report for regular context3\n");
 
 	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
 	igt_assert_f((ret == 0), "Opt-out-execution with stale pxp buffer didn't succeed\n");
@@ -850,7 +898,7 @@ static void test_pxp_stale_buf_optout_execution(int i915)
 
 static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_data *pm)
 {
-	int ret;
+	int ret, lostcount[3];
 	struct simple_exec_assets data[3] = {{0}, {0}, {0}};
 	uint32_t ctx2;
 	struct intel_bb *ibb2;
@@ -881,8 +929,25 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
 	igt_assert(ret == 0);
 
 	/* Do an S3 suspend resume cycle which also causes the pxp teardown event */
+	lostcount[0] = get_context_lost_count(i915, data[0].ctx);
+	lostcount[1] = get_context_lost_count(i915, data[1].ctx);
+	lostcount[2] = get_context_lost_count(i915, data[2].ctx);
 	trigger_powermgt_suspend_cycle(i915, pm);
 
+	/* After teardown, verify RESET_STATS reflect:
+	 * for data[0]: non-recoverable invalidation
+	 * for data[1]: non-recoverable invalidation
+	 * for data[2]: no invalidation
+	 */
+	igt_assert_f(get_context_lost_count(i915,
+		     data[0].ctx) >= lostcount[0] + get_context_num_engines(i915, data[0].ctx),
+		     "Post-s3 RESET_STATS didn't reflect stale pxp context1\n");
+	igt_assert_f(get_context_lost_count(i915,
+		     data[1].ctx) >= lostcount[1] + get_context_num_engines(i915, data[1].ctx),
+		     "Post-s3 RESET_STATS didn't reflect stale pxp context2\n");
+	igt_assert_f(get_context_lost_count(i915, data[2].ctx) == lostcount[2],
+		     "Post-s3 bad RESET_STATS report for regular context3\n");
+
 	ret = gem_execbuf_flush_store_dw(i915, data[0].ibb, data[0].ctx, data[0].fencebuf);
 	igt_assert_f((ret == -EIO), "Executing stale pxp context didn't fail with -EIO\n");
 
-- 
2.25.1
