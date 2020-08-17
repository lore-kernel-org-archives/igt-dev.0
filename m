Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C7D6E326
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2020 12:03:50 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date: Mon, 17 Aug 2020 15:01:48 +0300
Message-Id: <20200817120149.17083-3-mika.kuoppala@linux.intel.com>
In-Reply-To: <20200817120149.17083-1-mika.kuoppala@linux.intel.com>
References: <20200817120149.17083-1-mika.kuoppala@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/gen7_exec_parse: Add tests for
 longer LRIs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Test that reg/value pair inside a longer stream
is handled correctly.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/i915/gen7_exec_parse.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
index 91a72c7c..39bb1c4e 100644
--- a/tests/i915/gen7_exec_parse.c
+++ b/tests/i915/gen7_exec_parse.c
@@ -405,6 +405,26 @@ static void hsw_load_register_reg(void)
 		0xffffffff, /* value */
 		MI_BATCH_BUFFER_END,
 	};
+	uint32_t do_lri_long_middle[16] = {
+		MI_LOAD_REGISTER_IMM | (7 - 2),
+		HSW_CS_GPR0,
+		0,
+		0, /* [3] = dst */
+		0xffffffff,
+		HSW_CS_GPR0,
+		0,
+		MI_BATCH_BUFFER_END,
+	};
+	uint32_t do_lri_long_end[16] = {
+		MI_LOAD_REGISTER_IMM | (7 - 2),
+		HSW_CS_GPR0,
+		0,
+		HSW_CS_GPR0,
+		0,
+		0, /* [5] = dst */
+		0xffffffff,
+		MI_BATCH_BUFFER_END,
+	};
 	uint32_t allowed_regs[] = {
 		HSW_CS_GPR1,
 		SO_WRITE_OFFSET_0,
@@ -496,6 +516,22 @@ static void hsw_load_register_reg(void)
 			   I915_EXEC_RENDER,
 			   bad_lrr_errno);
 
+		igt_debug("Testing disallowed long lri middle 0x%08x\n",
+			  disallowed_regs[i]);
+		do_lri_long_middle[3] = disallowed_regs[i];
+		exec_batch(fd, handle,
+			   do_lri_long_middle, sizeof(do_lri_long_middle),
+			   I915_EXEC_RENDER,
+			   bad_lrr_errno);
+
+		igt_debug("Testing disallowed long lri end 0x%08x\n",
+			  disallowed_regs[i]);
+		do_lri_long_end[5] = disallowed_regs[i];
+		exec_batch(fd, handle,
+			   do_lri_long_end, sizeof(do_lri_long_end),
+			   I915_EXEC_RENDER,
+			   bad_lrr_errno);
+
 		exec_batch_patched(fd, handle,
 				   store_gpr0, sizeof(store_gpr0),
 				   2 * sizeof(uint32_t), /* reloc */
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
