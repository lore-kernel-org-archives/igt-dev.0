Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC41C282C6
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 23:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606B910E4F1;
	Mon,  3 Mar 2025 23:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gsslmu7x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F05610E4F1
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 23:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741043709; x=1772579709;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ft2m1kOATr/7h7+8Ql66vAPrimqwB4hX7yJoXUWZPts=;
 b=Gsslmu7xgdZkdjACWMiOGWjiCWr/V8L7fuZ+X9d8IEHINhZJ3rhqndzU
 o7GxVt+9DVLK0CcR+NTnh7HtuNr3VDnymshvz7fhMQBbPkJBYYOvNbxjF
 NgFfNK890psYvkXMilIRZ1NPdp1ofMUXa22zIuEI3SlMnA4En1kGXSo/w
 /Zot3alY1Yjbh5Q9EzfZtGW2XOEYvD/2uYy8hoBvQHD374E4Piv71Z554
 tg6sKwJe6SwSg07WIanMKHTt8RdNRK/XtvPir3MN5tBImSBGxtBIOL5iq
 Qqgwb3IYWAHMJgW37OSvKLhH8Iks3KyJWPEiAI5kIrFg1BO3Q+XFrGbyT w==;
X-CSE-ConnectionGUID: hZC80iFhTpu2aUCPS2j/Hg==
X-CSE-MsgGUID: p/Laa9IDRUipbzEIirVlqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41793051"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41793051"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:09 -0800
X-CSE-ConnectionGUID: wHbcpGz/QJOL9FdyoGX0rQ==
X-CSE-MsgGUID: LZAUvZkaSGCv19qRLDdkYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118716722"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:09 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 12/14] tests/intel/xe_oa: Enable
 unprivileged-single-ctx-counters and fix it
Date: Mon,  3 Mar 2025 15:15:00 -0800
Message-Id: <20250303231502.135720-13-umesh.nerlige.ramappa@intel.com>
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

unprivileged-single-ctx-counters was hardcoded for a format size of 256
bytes. Fix it up for generic format size.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 93 +++++++++++++++++++++++----------------------
 1 file changed, 48 insertions(+), 45 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 47c4a1fdb..ca2faa555 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2962,6 +2962,16 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	struct accumulator accumulator = {
 		.format = fmt
 	};
+	uint32_t ctx_id_offset, counter_offset, dst_buf_size;
+	struct oa_format format = get_oa_format(fmt);
+
+	if (format.report_hdr_64bit) {
+		ctx_id_offset = 4;
+		counter_offset = 8;
+	} else {
+		ctx_id_offset = 2;
+		counter_offset = 4;
+	}
 
 	bops = buf_ops_create(drm_fd);
 
@@ -2990,25 +3000,29 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	stream_fd = __perf_open(drm_fd, &param, false);
         set_fd_flags(stream_fd, O_CLOEXEC);
 
-	dst_buf = intel_buf_create(bops, 4096, 1, 8, 64,
+#define FOUR_REPORTS (4 * format.size)
+#define BO_REPORT_OFFSET(_r) (_r * format.size)
+
+#define FOUR_TIMESTAMPS (4 * 8)
+#define BO_TIMESTAMP_OFFSET(_r) (FOUR_REPORTS + (_r * 8))
+
+	dst_buf_size = FOUR_REPORTS + FOUR_TIMESTAMPS;
+	dst_buf = intel_buf_create(bops, dst_buf_size, 1, 8, 64,
 				   I915_TILING_NONE,
 				   I915_COMPRESSION_NONE);
 
 	/* Set write domain to cpu briefly to fill the buffer with 80s */
 	buf_map(drm_fd, dst_buf, true /* write enable */);
-	memset(dst_buf->ptr, 0x80, 2048);
-	memset((uint8_t *) dst_buf->ptr + 2048, 0, 2048);
+	memset(dst_buf->ptr, 0, dst_buf_size);
+	memset(dst_buf->ptr, 0x80, FOUR_REPORTS);
 	intel_buf_unmap(dst_buf);
 
 	/* Submit an mi-rpc to context0 before measurable work */
-#define BO_TIMESTAMP_OFFSET0 1024
-#define BO_REPORT_OFFSET0 0
-#define BO_REPORT_ID0 0xdeadbeef
 	emit_stall_timestamp_and_rpc(ibb0,
 				     dst_buf,
-				     BO_TIMESTAMP_OFFSET0,
-				     BO_REPORT_OFFSET0,
-				     BO_REPORT_ID0);
+				     BO_TIMESTAMP_OFFSET(0),
+				     BO_REPORT_OFFSET(0),
+				     0xdeadbeef);
 	intel_bb_flush_render(ibb0);
 
 	/* Remove intel_buf from ibb0 added implicitly in rendercopy */
@@ -3026,14 +3040,11 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	 * all zeroes, since the counters will only increment for the
 	 * context passed to perf open ioctl
 	 */
-#define BO_TIMESTAMP_OFFSET2 1040
-#define BO_REPORT_OFFSET2 512
-#define BO_REPORT_ID2 0x00c0ffee
 	emit_stall_timestamp_and_rpc(ibb1,
 				     dst_buf,
-				     BO_TIMESTAMP_OFFSET2,
-				     BO_REPORT_OFFSET2,
-				     BO_REPORT_ID2);
+				     BO_TIMESTAMP_OFFSET(2),
+				     BO_REPORT_OFFSET(2),
+				     0x00c0ffee);
 	intel_bb_flush_render(ibb1);
 
 	/* Submit two copies on the other context to avoid a false
@@ -3050,28 +3061,22 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	intel_bb_flush_render(ibb1);
 
 	/* Submit an mi-rpc to context1 after all work */
-#define BO_TIMESTAMP_OFFSET3 1048
-#define BO_REPORT_OFFSET3 768
-#define BO_REPORT_ID3 0x01c0ffee
 	emit_stall_timestamp_and_rpc(ibb1,
 				     dst_buf,
-				     BO_TIMESTAMP_OFFSET3,
-				     BO_REPORT_OFFSET3,
-				     BO_REPORT_ID3);
+				     BO_TIMESTAMP_OFFSET(3),
+				     BO_REPORT_OFFSET(3),
+				     0x01c0ffee);
 	intel_bb_flush_render(ibb1);
 
 	/* Remove intel_buf from ibb1 added implicitly in rendercopy */
 	intel_bb_remove_intel_buf(ibb1, dst_buf);
 
 	/* Submit an mi-rpc to context0 after all measurable work */
-#define BO_TIMESTAMP_OFFSET1 1032
-#define BO_REPORT_OFFSET1 256
-#define BO_REPORT_ID1 0xbeefbeef
 	emit_stall_timestamp_and_rpc(ibb0,
 				     dst_buf,
-				     BO_TIMESTAMP_OFFSET1,
-				     BO_REPORT_OFFSET1,
-				     BO_REPORT_ID1);
+				     BO_TIMESTAMP_OFFSET(1),
+				     BO_REPORT_OFFSET(1),
+				     0xbeefbeef);
 	intel_bb_flush_render(ibb0);
 	intel_bb_sync(ibb0);
 	intel_bb_sync(ibb1);
@@ -3091,33 +3096,32 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	report0_32 = dst_buf->ptr;
 	igt_assert_eq(report0_32[0], 0xdeadbeef);
 	igt_assert(oa_timestamp(report0_32, fmt));
-	ctx0_id = report0_32[2];
+	ctx0_id = report0_32[ctx_id_offset];
 	igt_debug("MI_RPC(start) CTX ID: %u\n", ctx0_id);
-	dump_report(report0_32, 64, "report0_32");
+	dump_report(report0_32, format.size / 4, "report0_32");
 
-	report1_32 = report0_32 + 64;
+	report1_32 = report0_32 + format.size / 4;
 	igt_assert_eq(report1_32[0], 0xbeefbeef);
 	igt_assert(oa_timestamp(report1_32, fmt));
-	ctx1_id = report1_32[2];
+	ctx1_id = report1_32[ctx_id_offset];
 	igt_debug("CTX ID1: %u\n", ctx1_id);
-	dump_report(report1_32, 64, "report1_32");
+	dump_report(report1_32, format.size / 4, "report1_32");
 
 	/* Verify that counters in context1 are all zeroes */
-	report2_32 = report0_32 + 128;
+	report2_32 = report1_32 + format.size / 4;
 	igt_assert_eq(report2_32[0], 0x00c0ffee);
 	igt_assert(oa_timestamp(report2_32, fmt));
-	dump_report(report2_32, 64, "report2_32");
-	igt_assert_eq(0, memcmp(&report2_32[4],
-				(uint8_t *) dst_buf->ptr + 2048,
-				240));
+	dump_report(report2_32, format.size / 4, "report2_32");
 
-	report3_32 = report0_32 + 192;
+	report3_32 = report2_32 + format.size / 4;
 	igt_assert_eq(report3_32[0], 0x01c0ffee);
 	igt_assert(oa_timestamp(report3_32, fmt));
-	dump_report(report3_32, 64, "report3_32");
-	igt_assert_eq(0, memcmp(&report3_32[4],
-				(uint8_t *) dst_buf->ptr + 2048,
-				240));
+	dump_report(report3_32, format.size / 4, "report3_32");
+
+	for (int k = counter_offset; k < format.size / 4; k++) {
+		igt_assert_f(report2_32[k] == 0, "Failed counter %d check\n", k);
+		igt_assert_f(report3_32[k] == 0, "Failed counter %d check\n", k);
+	}
 
 	/* Accumulate deltas for counters - A0, A21 and A26 */
 	memset(accumulator.deltas, 0, sizeof(accumulator.deltas));
@@ -3136,8 +3140,8 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	 * the OA report timestamps should be almost identical but
 	 * allow a 500 nanoseconds margin.
 	 */
-	timestamp0_64 = *(uint64_t *)(((uint8_t *)dst_buf->ptr) + BO_TIMESTAMP_OFFSET0);
-	timestamp1_64 = *(uint64_t *)(((uint8_t *)dst_buf->ptr) + BO_TIMESTAMP_OFFSET1);
+	timestamp0_64 = *(uint64_t *)(((uint8_t *)dst_buf->ptr) + BO_TIMESTAMP_OFFSET(0));
+	timestamp1_64 = *(uint64_t *)(((uint8_t *)dst_buf->ptr) + BO_TIMESTAMP_OFFSET(1));
 
 	igt_debug("ts_timestamp64 0 = %"PRIu64"\n", timestamp0_64);
 	igt_debug("ts_timestamp64 1 = %"PRIu64"\n", timestamp1_64);
@@ -4783,7 +4787,6 @@ igt_main
 
 		igt_subtest_with_dynamic("unprivileged-single-ctx-counters") {
 			igt_require_f(render_copy, "no render-copy function\n");
-			igt_require(intel_graphics_ver(devid) < IP_VER(20, 0));
 			__for_one_render_engine(hwe)
 				test_single_ctx_render_target_writes_a_counter(hwe);
 		}
-- 
2.34.1

