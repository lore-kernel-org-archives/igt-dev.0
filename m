Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2D3C282D2
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 23:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7E610E4F0;
	Mon,  3 Mar 2025 23:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oHSQO0yE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965FC10E0A0
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 23:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741043708; x=1772579708;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=c3DF0VHWKQPUucfMWbGzY1+CxhszLbAVVxVWDSILY+M=;
 b=oHSQO0yE+hsO2lQFZaVdd5WUMuURU1dUjCYV3fRDffDznEq1XukyxbvD
 2jVddZUL3Gn6GV4vH4LB2+T8tP0hchwQR0JqF5ZuaLKli1qhOzpuH4Krg
 MV8tnqcz4FnKJ5rzU4K4sRMEUkGF2mhd3aej5/feI03r4cIn0tsxORIQv
 H/Emmg7jxZk2xb3H8qDuq+Du+JpmXd3d6Uohq49MvbrihAf/nc0ndJTYR
 Kqz4zAQCSPIkXpxofXvUbBMj8OOfY4QnWQ5PfzUrWsWxD0fO+HeVYC2ZR
 +6tvbD07M3A8njZM1wSeCTrk/7Z/fVAQHEl9nCrGq1l8d3KFTy8dbqUGW A==;
X-CSE-ConnectionGUID: K87jh9s/SS6ECyeeavIY7Q==
X-CSE-MsgGUID: jwNVkrqtSQyminRfb97+6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41793042"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41793042"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:08 -0800
X-CSE-ConnectionGUID: hsbIqhBwTjKcdlsk++zaEQ==
X-CSE-MsgGUID: Hn+B/G3MQz27AhGFhJpOHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118716697"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:07 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 06/14] tests/intel/xe_oa: Use same render copy width
 and height across tests
Date: Mon,  3 Mar 2025 15:14:54 -0800
Message-Id: <20250303231502.135720-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
References: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Use the same width and height for render copy frame to make execution
times uniform across tests.

v2: Update commit message (Ashutosh)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 7889adf1e..08406ca5c 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -303,6 +303,7 @@ static uint64_t oa_exponent_default;
 static size_t default_oa_buffer_size;
 static struct intel_mmio_data mmio_data;
 static igt_render_copyfunc_t render_copy;
+static uint32_t rc_width, rc_height;
 
 static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
 {
@@ -1089,6 +1090,8 @@ init_sys_info(void)
 
 	intel_xe_perf_load_perf_configs(intel_xe_perf, drm_fd);
 
+	rc_width = 1920;
+	rc_height = 1080;
 	oa_exponent_default = max_oa_exponent_for_period_lte(1000000);
 
 	default_oa_buffer_size = get_default_oa_buffer_size(drm_fd);
@@ -1608,7 +1611,7 @@ static void load_helper_run(enum load load)
 
 		while (!lh.exit) {
 			render_copy(lh.ibb,
-				    &lh.src, 0, 0, 1920, 1080,
+				    &lh.src, 0, 0, rc_width, rc_height,
 				    &lh.dst, 0, 0);
 
 			intel_bb_sync(lh.ibb);
@@ -1645,8 +1648,8 @@ static void load_helper_init(void)
 
 	lh.ibb = intel_bb_create_with_context(drm_fd, lh.context_id, lh.vm, NULL, BATCH_SZ);
 
-	scratch_buf_init(lh.bops, &lh.dst, 1920, 1080, 0);
-	scratch_buf_init(lh.bops, &lh.src, 1920, 1080, 0);
+	scratch_buf_init(lh.bops, &lh.dst, rc_width, rc_height, 0);
+	scratch_buf_init(lh.bops, &lh.src, rc_width, rc_height, 0);
 }
 
 static void load_helper_fini(void)
@@ -3112,8 +3115,6 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	uint64_t delta_ts64, delta_oa32;
 	uint64_t delta_ts64_ns, delta_oa32_ns;
 	uint64_t delta_delta;
-	int width = 800;
-	int height = 600;
 #define INVALID_CTX_ID 0xffffffff
 	uint32_t ctx0_id = INVALID_CTX_ID;
 	uint32_t ctx1_id = INVALID_CTX_ID;
@@ -3125,8 +3126,8 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	bops = buf_ops_create(drm_fd);
 
 	for (int i = 0; i < ARRAY_SIZE(src); i++) {
-		scratch_buf_init(bops, &src[i], width, height, 0xff0000ff);
-		scratch_buf_init(bops, &dst[i], width, height, 0x00ff00ff);
+		scratch_buf_init(bops, &src[i], rc_width, rc_height, 0xff0000ff);
+		scratch_buf_init(bops, &dst[i], rc_width, rc_height, 0x00ff00ff);
 	}
 
 	vm = xe_vm_create(drm_fd, 0, 0);
@@ -3139,7 +3140,7 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 
 	/* Submit some early, unmeasured, work to the context we want */
 	render_copy(ibb0,
-		    &src[0], 0, 0, width, height,
+		    &src[0], 0, 0, rc_width, rc_height,
 		    &dst[0], 0, 0);
 
 	/* Initialize the context parameter to the perf open ioctl here */
@@ -3175,7 +3176,7 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 
 	/* This is the work/context that is measured for counter increments */
 	render_copy(ibb0,
-		    &src[0], 0, 0, width, height,
+		    &src[0], 0, 0, rc_width, rc_height,
 		    &dst[0], 0, 0);
 	intel_bb_flush_render(ibb0);
 
@@ -3200,11 +3201,11 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	 * context1
 	 */
 	render_copy(ibb1,
-		    &src[1], 0, 0, width, height,
+		    &src[1], 0, 0, rc_width, rc_height,
 		    &dst[1], 0, 0);
 
 	render_copy(ibb1,
-		    &src[2], 0, 0, width, height,
+		    &src[2], 0, 0, rc_width, rc_height,
 		    &dst[2], 0, 0);
 	intel_bb_flush_render(ibb1);
 
@@ -3325,7 +3326,7 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	igt_debug("n samples written = %"PRIu64"/%"PRIu64" (%ix%i)\n",
 		  accumulator.deltas[2 + 21],
 		  accumulator.deltas[2 + 26],
-		  width, height);
+		  rc_width, rc_height);
 	accumulator_print(&accumulator, "filtered");
 
 	/* Verify that the work actually happened by comparing the src
@@ -3334,7 +3335,7 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	buf_map(drm_fd, &src[0], false);
 	buf_map(drm_fd, &dst[0], false);
 
-	ret = memcmp(src[0].ptr, dst[0].ptr, 4 * width * height);
+	ret = memcmp(src[0].ptr, dst[0].ptr, 4 * rc_width * rc_height);
 	intel_buf_unmap(&src[0]);
 	intel_buf_unmap(&dst[0]);
 
@@ -3350,9 +3351,9 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	/* Check that this test passed. The test measures the number of 2x2
 	 * samples written to the render target using the counter A26. For
 	 * OAR, this counter will only have increments relevant to this specific
-	 * context. The value equals the width * height of the rendered work.
+	 * context. The value equals the rc_width * rc_height of the rendered work.
 	 */
-	igt_assert_eq(accumulator.deltas[2 + 26], width * height);
+	igt_assert_eq(accumulator.deltas[2 + 26], rc_width * rc_height);
 
  skip_check:
 	/* Clean up */
@@ -4006,8 +4007,6 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 	struct buf_ops *bops;
 	struct intel_bb *ibb;
 	uint32_t context, vm;
-	int height = 600;
-	int width = 800;
 	uint8_t *buf;
 
 	bops = buf_ops_create(drm_fd);
@@ -4019,8 +4018,8 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 	memset(dst_buf->ptr, 0, 4096);
 	intel_buf_unmap(dst_buf);
 
-	scratch_buf_init(bops, &src, width, height, 0xff0000ff);
-	scratch_buf_init(bops, &dst, width, height, 0x00ff00ff);
+	scratch_buf_init(bops, &src, rc_width, rc_height, 0xff0000ff);
+	scratch_buf_init(bops, &dst, rc_width, rc_height, 0x00ff00ff);
 
 	vm = xe_vm_create(drm_fd, 0, 0);
 	context = xe_exec_queue_create(drm_fd, vm, hwe, 0);
@@ -4039,7 +4038,7 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 
 	if (render_copy)
 		render_copy(ibb,
-			    &src, 0, 0, width, height,
+			    &src, 0, 0, rc_width, rc_height,
 			    &dst, 0, 0);
 
 	emit_mmio_triggered_report(ibb, 0xc0ffee22);
-- 
2.34.1

