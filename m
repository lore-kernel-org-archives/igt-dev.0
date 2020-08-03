Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5A46E21B
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2020 08:58:55 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  3 Aug 2020 10:58:02 +0200
Message-Id: <20200803085803.23741-21-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200803085803.23741-1-zbigniew.kempczynski@intel.com>
References: <20200803085803.23741-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v24 20/21] tests/perf: debug stuff
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
 tests/i915/perf.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 401fe72f..10386e30 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -3394,6 +3394,14 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 			memset(dst_buf->ptr, 0x80, 4096);
 			intel_buf_unmap(dst_buf);
 
+			/* Check 0 */
+			intel_buf_cpu_map(dst_buf, false /* write enable */);
+			report0_32 = dst_buf->ptr;
+			igt_info("report 0: %x\n", report0_32[0]);
+			igt_info("time 0: %x\n", report0_32[1]);
+			intel_buf_unmap(dst_buf);
+
+
 			emit_stall_timestamp_and_rpc(ibb0,
 						     dst_buf,
 						     512 /* timestamp offset */,
@@ -3415,6 +3423,13 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 			/* Another redundant flush to clarify batch bo is free to reuse */
 			intel_bb_flush_render_with_context(ibb0, context0_id);
 
+			/* Check 1 */
+			intel_buf_cpu_map(dst_buf, false /* write enable */);
+			report0_32 = dst_buf->ptr;
+			igt_info("report 1: %x\n", report0_32[0]);
+			igt_info("time 1: %x\n", report0_32[1]);
+			intel_buf_unmap(dst_buf);
+
 			/* submit two copies on the other context to avoid a false
 			 * positive in case the driver somehow ended up filtering for
 			 * context1
@@ -3440,11 +3455,24 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 
 			intel_bb_flush_render_with_context(ibb1, context1_id);
 			intel_bb_sync(ibb1);
+
+			/* Check 2 */
+			intel_buf_cpu_map(dst_buf, false /* write enable */);
+			report0_32 = dst_buf->ptr;
+			report1_32 = report0_32 + 64; /* 64 uint32_t = 256bytes offset */
+			igt_info("report 2 a: %x\n", report0_32[0]);
+			igt_info("time 2 a: %x\n", report0_32[1]);
+			igt_info("report 2 b: %x\n", report1_32[0]);
+			igt_info("time 2 b: %x\n", report1_32[1]);
+			intel_buf_unmap(dst_buf);
+
 			intel_bb_sync(ibb0);
 
 			intel_buf_cpu_map(dst_buf, false /* write enable */);
 
 			report0_32 = dst_buf->ptr;
+			igt_info("report: %x\n", report0_32[0]);
+			igt_info("time: %x\n", report0_32[1]);
 			igt_assert_eq(report0_32[0], 0xdeadbeef); /* report ID */
 			igt_assert_neq(report0_32[1], 0); /* timestamp */
 			prev = report0_32;
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
