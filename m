Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5696E26C
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2020 12:44:14 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  3 Aug 2020 14:43:12 +0200
Message-Id: <20200803124313.31162-22-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200803124313.31162-1-zbigniew.kempczynski@intel.com>
References: <20200803124313.31162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v25 21/22] tests/perf: use coherent mapping
 on non-llc platforms
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

---
 tests/i915/perf.c | 37 ++++++++-----------------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 10386e30..d59b359a 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -524,6 +524,8 @@ emit_report_perf_count(struct intel_bb *ibb,
 		       int dst_offset,
 		       uint32_t report_id)
 {
+	intel_bb_add_intel_buf(ibb, dst, true);
+
 	if (IS_HASWELL(devid))
 		intel_bb_out(ibb, GEN6_MI_REPORT_PERF_COUNT);
 	else
@@ -3018,6 +3020,8 @@ emit_stall_timestamp_and_rpc(struct intel_bb *ibb,
 				   PIPE_CONTROL_RENDER_TARGET_FLUSH |
 				   PIPE_CONTROL_WRITE_TIMESTAMP);
 
+	intel_bb_add_intel_buf(ibb, dst, true);
+
 	if (intel_gen(devid) >= 8)
 		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL | (6 - 2));
 	else
@@ -3390,18 +3394,13 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 						   I915_TILING_NONE,
 						   I915_COMPRESSION_NONE);
 
-			intel_buf_cpu_map(dst_buf, true /* write enable */);
+			if (gem_has_llc(ibb0->i915))
+				intel_buf_cpu_map(dst_buf, true);
+			else
+				intel_buf_device_map(dst_buf, true);
 			memset(dst_buf->ptr, 0x80, 4096);
 			intel_buf_unmap(dst_buf);
 
-			/* Check 0 */
-			intel_buf_cpu_map(dst_buf, false /* write enable */);
-			report0_32 = dst_buf->ptr;
-			igt_info("report 0: %x\n", report0_32[0]);
-			igt_info("time 0: %x\n", report0_32[1]);
-			intel_buf_unmap(dst_buf);
-
-
 			emit_stall_timestamp_and_rpc(ibb0,
 						     dst_buf,
 						     512 /* timestamp offset */,
@@ -3423,13 +3422,6 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 			/* Another redundant flush to clarify batch bo is free to reuse */
 			intel_bb_flush_render_with_context(ibb0, context0_id);
 
-			/* Check 1 */
-			intel_buf_cpu_map(dst_buf, false /* write enable */);
-			report0_32 = dst_buf->ptr;
-			igt_info("report 1: %x\n", report0_32[0]);
-			igt_info("time 1: %x\n", report0_32[1]);
-			intel_buf_unmap(dst_buf);
-
 			/* submit two copies on the other context to avoid a false
 			 * positive in case the driver somehow ended up filtering for
 			 * context1
@@ -3455,24 +3447,11 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 
 			intel_bb_flush_render_with_context(ibb1, context1_id);
 			intel_bb_sync(ibb1);
-
-			/* Check 2 */
-			intel_buf_cpu_map(dst_buf, false /* write enable */);
-			report0_32 = dst_buf->ptr;
-			report1_32 = report0_32 + 64; /* 64 uint32_t = 256bytes offset */
-			igt_info("report 2 a: %x\n", report0_32[0]);
-			igt_info("time 2 a: %x\n", report0_32[1]);
-			igt_info("report 2 b: %x\n", report1_32[0]);
-			igt_info("time 2 b: %x\n", report1_32[1]);
-			intel_buf_unmap(dst_buf);
-
 			intel_bb_sync(ibb0);
 
 			intel_buf_cpu_map(dst_buf, false /* write enable */);
 
 			report0_32 = dst_buf->ptr;
-			igt_info("report: %x\n", report0_32[0]);
-			igt_info("time: %x\n", report0_32[1]);
 			igt_assert_eq(report0_32[0], 0xdeadbeef); /* report ID */
 			igt_assert_neq(report0_32[1], 0); /* timestamp */
 			prev = report0_32;
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
