Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D476989196
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2020 12:03:50 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date: Mon, 17 Aug 2020 15:01:47 +0300
Message-Id: <20200817120149.17083-2-mika.kuoppala@linux.intel.com>
In-Reply-To: <20200817120149.17083-1-mika.kuoppala@linux.intel.com>
References: <20200817120149.17083-1-mika.kuoppala@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/gen7_exec_parse: Test lrm/lri
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
Cc: Jon Bloomfield <jon.bloomfield@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Test also with lrm and lri with bad mask to assert
that access is not allowed.

Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/i915/gen7_exec_parse.c | 38 ++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
index 22ccbc68..91a72c7c 100644
--- a/tests/i915/gen7_exec_parse.c
+++ b/tests/i915/gen7_exec_parse.c
@@ -48,6 +48,7 @@
 
 #define MI_LOAD_REGISTER_REG (0x2a << 23)
 #define MI_STORE_REGISTER_MEM (0x24 << 23)
+#define MI_LOAD_REGISTER_MEM (0x29 << 23)
 #define MI_ARB_ON_OFF (0x8 << 23)
 #define MI_DISPLAY_FLIP ((0x14 << 23) | 1)
 
@@ -91,6 +92,7 @@ static uint64_t __exec_batch_patched(int fd,
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc[1];
+	int ret;
 
 	uint32_t target_bo = gem_create(fd, 4096);
 	uint64_t actual_value = 0;
@@ -117,8 +119,10 @@ static uint64_t __exec_batch_patched(int fd,
 	execbuf.batch_len = size;
 	execbuf.flags = I915_EXEC_RENDER;
 
-	gem_execbuf(fd, &execbuf);
+	ret = __checked_execbuf(fd, &execbuf);
 	gem_sync(fd, cmd_bo);
+	if (ret)
+		return ret;
 
 	gem_read(fd,target_bo, 0, &actual_value, sizeof(actual_value));
 
@@ -380,7 +384,7 @@ static void hsw_load_register_reg(void)
 	uint32_t store_gpr0[16] = {
 		MI_STORE_REGISTER_MEM | (3 - 2),
 		HSW_CS_GPR0,
-		0, /* reloc*/
+		0, /* reloc */
 		MI_BATCH_BUFFER_END,
 	};
 	uint32_t do_lrr[16] = {
@@ -389,6 +393,18 @@ static void hsw_load_register_reg(void)
 		HSW_CS_GPR0, /* dst */
 		MI_BATCH_BUFFER_END,
 	};
+	uint32_t do_lrm[16] = {
+		MI_LOAD_REGISTER_MEM | (3 - 2),
+		0, /* dst reg */
+		0, /* reloc */
+		MI_BATCH_BUFFER_END,
+	};
+	uint32_t do_lri_wrong_mask[16] = {
+		MI_LOAD_REGISTER_IMM | (3 - 2),
+		0, /* [1] = dst */
+		0xffffffff, /* value */
+		MI_BATCH_BUFFER_END,
+	};
 	uint32_t allowed_regs[] = {
 		HSW_CS_GPR1,
 		SO_WRITE_OFFSET_0,
@@ -441,7 +457,7 @@ static void hsw_load_register_reg(void)
 				   store_gpr0, sizeof(store_gpr0),
 				   2 * sizeof(uint32_t), /* reloc */
 				   0xabcdabc0);
-		igt_debug("Testing disallowed reg src 0x%08x\n", disallowed_regs[i]);
+		igt_debug("Testing disallowed lrr 0x%08x\n", disallowed_regs[i]);
 		do_lrr[1] = disallowed_regs[i];
 		exec_batch(fd, handle, do_lrr, sizeof(do_lrr),
 			   I915_EXEC_RENDER,
@@ -460,12 +476,26 @@ static void hsw_load_register_reg(void)
 				   store_gpr0, sizeof(store_gpr0),
 				   2 * sizeof(uint32_t), /* reloc */
 				   0xabcdabc0);
-		igt_debug("Testing disallowed reg dst 0x%08x\n", disallowed_regs[i]);
+
+		igt_debug("Testing disallowed lrr dst 0x%08x\n", disallowed_regs[i]);
 		do_lrr[1] = HSW_CS_GPR0;
 		do_lrr[2] = disallowed_regs[i];
 		exec_batch(fd, handle, do_lrr, sizeof(do_lrr),
 			   I915_EXEC_RENDER,
 			   bad_lrr_errno);
+
+		igt_debug("Testing disallowed lrm 0x%08x\n", disallowed_regs[i]);
+		do_lrm[1] = disallowed_regs[i];
+		exec_batch_patched(fd, handle, do_lrm, sizeof(do_lrm),
+				   2 * sizeof(uint32_t), /* reloc */
+				   bad_lrr_errno);
+
+		igt_debug("Testing disallowed wrong mask lri 0x%08x\n", disallowed_regs[i]);
+		do_lri_wrong_mask[1] = disallowed_regs[i];
+		exec_batch(fd, handle, do_lri_wrong_mask, sizeof(do_lri_wrong_mask),
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
