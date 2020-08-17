Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDF76E326
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2020 12:03:50 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date: Mon, 17 Aug 2020 15:01:46 +0300
Message-Id: <20200817120149.17083-1-mika.kuoppala@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/gen7_exec_parse: Test masked
 registers
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

There were no test to test the masked registers.
LRR is prohibited with masked registers. Add testcase
to confirm it.

Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/i915/gen7_exec_parse.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
index 2ba438c9..22ccbc68 100644
--- a/tests/i915/gen7_exec_parse.c
+++ b/tests/i915/gen7_exec_parse.c
@@ -398,6 +398,8 @@ static void hsw_load_register_reg(void)
 		OACONTROL, /* filtered */
 		DERRMR, /* master only */
 		0x2038, /* RING_START: invalid */
+		0xb038, /* HSW_SCRATCH1 masked */
+		0xe49c  /* HSW_ROW_CHICKEN3 masked */
 	};
 	int fd;
 	uint32_t handle;
@@ -439,6 +441,7 @@ static void hsw_load_register_reg(void)
 				   store_gpr0, sizeof(store_gpr0),
 				   2 * sizeof(uint32_t), /* reloc */
 				   0xabcdabc0);
+		igt_debug("Testing disallowed reg src 0x%08x\n", disallowed_regs[i]);
 		do_lrr[1] = disallowed_regs[i];
 		exec_batch(fd, handle, do_lrr, sizeof(do_lrr),
 			   I915_EXEC_RENDER,
@@ -449,6 +452,26 @@ static void hsw_load_register_reg(void)
 				   0xabcdabc0);
 	}
 
+	for (int i = 0 ; i < ARRAY_SIZE(disallowed_regs); i++) {
+		exec_batch(fd, handle, init_gpr0, sizeof(init_gpr0),
+			   I915_EXEC_RENDER,
+			   0);
+		exec_batch_patched(fd, handle,
+				   store_gpr0, sizeof(store_gpr0),
+				   2 * sizeof(uint32_t), /* reloc */
+				   0xabcdabc0);
+		igt_debug("Testing disallowed reg dst 0x%08x\n", disallowed_regs[i]);
+		do_lrr[1] = HSW_CS_GPR0;
+		do_lrr[2] = disallowed_regs[i];
+		exec_batch(fd, handle, do_lrr, sizeof(do_lrr),
+			   I915_EXEC_RENDER,
+			   bad_lrr_errno);
+		exec_batch_patched(fd, handle,
+				   store_gpr0, sizeof(store_gpr0),
+				   2 * sizeof(uint32_t), /* reloc */
+				   0xabcdabc0);
+	}
+
 	close(fd);
 }
 
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
