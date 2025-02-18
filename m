Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7289EC021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2649710E762;
	Tue, 18 Feb 2025 20:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUCznqGV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E74F10E762
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910496; x=1771446496;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3fHvpfb3J3hBRT+alxO/akJpyt9GUrNE60wmWB1uYxg=;
 b=GUCznqGVayCjtNoX0DZE7qzPNVv0/++1pkA2ue+0UPi7FbFey+i16FLx
 oKiRnC4ulqhbGbZLGY0VZQ06VFJNg4VbZ6PUILqTu6moBfuxuOLNtZMdS
 RXkzbTwTaFX5vq7ta8jL02mwKo5OkYQDo2ZutAnqhrRZTs3XfCSb7k38e
 QVMqM0ll8bRBcPs25uAh26dQ0oyATX/rtBS/0edvaQHYO58VpERBlDMwQ
 wR2vNUD1N7j0hqXLy4b1d+Jwc+4AYHihkcj+8HaFr6F+CVSW3i6b7jLiC
 DAFWW7jjTIopX0gwM7FHN3Fy1N5HBBB2UVl/tVfo6uUEIlK88yBOJKnEo A==;
X-CSE-ConnectionGUID: uDQuQeRzR3S/5JFCYQ6TWQ==
X-CSE-MsgGUID: FxSD5KdzSLi8QJ/trNjEeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44545837"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44545837"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
X-CSE-ConnectionGUID: RPv8m7yMQeyRzNqATcpoZA==
X-CSE-MsgGUID: gCwLnRcqQAix+LfmN3D6uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114367447"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t CI run 05/14] tests/intel/xe_oa: Use same render copy
 width and height across tests
Date: Tue, 18 Feb 2025 12:28:03 -0800
Message-Id: <20250218202812.1679653-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
References: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
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

Use the same width and height for render copy frame across tests.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 7e40e9257..aaf92308a 100644
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

