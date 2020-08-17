Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904ED89196
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2020 12:03:50 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date: Mon, 17 Aug 2020 15:01:49 +0300
Message-Id: <20200817120149.17083-4-mika.kuoppala@linux.intel.com>
In-Reply-To: <20200817120149.17083-1-mika.kuoppala@linux.intel.com>
References: <20200817120149.17083-1-mika.kuoppala@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/gen9_exec_parse: Add lrr test
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

From: Mika Kuoppala <mika.kuoppala@intel.com>

Make sure LOAD_REGISTER_REG is handled correctly
by parser.

Signed-off-by: Mika Kuoppala <mika.kuoppala@intel.com>
---
 tests/i915/gen9_exec_parse.c | 53 ++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index 8cd82f56..0e8ce11f 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -37,16 +37,18 @@
 #define INSTR_CLIENT_SHIFT	29
 #define   INSTR_INVALID_CLIENT  0x7
 
-#define MI_LOAD_REGISTER_REG (0x2a << 23)
-#define MI_STORE_REGISTER_MEM (0x24 << 23)
-#define MI_ARB_ON_OFF (0x8 << 23)
-#define MI_USER_INTERRUPT (0x02 << 23)
-#define MI_FLUSH_DW (0x26 << 23)
-#define MI_ARB_CHECK (0x05 << 23)
-#define MI_REPORT_HEAD (0x07 << 23)
-#define MI_SUSPEND_FLUSH (0x0b << 23)
-#define MI_LOAD_SCAN_LINES_EXCL (0x13 << 23)
-#define MI_UPDATE_GTT (0x23 << 23)
+#define MI_INSTR(opcode, flags) (((opcode) << 23) | (flags))
+
+#define MI_LOAD_REGISTER_REG       MI_INSTR(0x2A, 1)
+#define MI_STORE_REGISTER_MEM_GEN8 MI_INSTR(0x24, 2)
+
+#define MI_ARB_ON_OFF		MI_INSTR(0x8, 0)
+#define MI_USER_INTERRUPT	MI_INSTR(0x2, 0)
+#define MI_FLUSH_DW		MI_INSTR(0x26, 0)
+#define MI_ARB_CHECK		MI_INSTR(0x5, 0)
+#define MI_REPORT_HEAD		MI_INSTR(0x7, 0)
+#define MI_SUSPEND_FLUSH	MI_INSTR(0xb, 0)
+#define MI_LOAD_SCAN_LINES_EXCL MI_INSTR(0x13, 0)
 
 #define BCS_SWCTRL     0x22200
 #define BCS_GPR_BASE   0x22600
@@ -601,7 +603,7 @@ static void test_cmd_crossing_page(const int i915, const uint32_t handle)
 		MI_BATCH_BUFFER_END,
 	};
 	const uint32_t store_reg[] = {
-		MI_STORE_REGISTER_MEM | (4 - 2),
+		MI_STORE_REGISTER_MEM_GEN8,
 		BCS_GPR(0),
 		0, /* reloc */
 		0, /* reloc */
@@ -640,7 +642,7 @@ static void test_invalid_length(const int i915, const uint32_t handle)
 	};
 
 	const uint32_t store_reg[] = {
-		MI_STORE_REGISTER_MEM | (4 - 2),
+		MI_STORE_REGISTER_MEM_GEN8,
 		BCS_GPR(0),
 		0, /* reloc */
 		0, /* reloc */
@@ -753,7 +755,7 @@ static void test_register(const int i915, const uint32_t handle,
 	};
 
 	const uint32_t store_reg[] = {
-		MI_STORE_REGISTER_MEM | (4 - 2),
+		MI_STORE_REGISTER_MEM_GEN8,
 		r->addr,
 		0, /* reloc */
 		0, /* reloc */
@@ -761,6 +763,20 @@ static void test_register(const int i915, const uint32_t handle,
 		MI_BATCH_BUFFER_END,
 	};
 
+	const uint32_t lrr_src[] = {
+		MI_LOAD_REGISTER_REG,
+		r->addr,
+		BCS_GPR(0),
+		MI_BATCH_BUFFER_END,
+	};
+
+	const uint32_t lrr_dst[] = {
+		MI_LOAD_REGISTER_REG,
+		BCS_GPR(0),
+		r->addr,
+		MI_BATCH_BUFFER_END,
+	};
+
 	exec_batch(i915, I915_EXEC_BLT, handle,
 		   lri_mask, sizeof(lri_mask),
 		   r->privileged ? -EACCES : 0);
@@ -778,6 +794,15 @@ static void test_register(const int i915, const uint32_t handle,
 			   store_reg, sizeof(store_reg),
 			   2 * sizeof(uint32_t), /* reloc */
 			   r->privileged ? -EACCES : 0);
+
+	exec_batch(i915, I915_EXEC_BLT, handle,
+		   lrr_src, sizeof(lrr_src),
+		   r->privileged ? -EACCES : 0);
+
+	exec_batch(i915, I915_EXEC_BLT, handle,
+		   lrr_dst, sizeof(lrr_dst),
+		   r->privileged ? -EACCES : 0);
+
 }
 
 static void test_valid_registers(const int i915, const uint32_t handle)
@@ -792,7 +817,7 @@ static long int read_reg(const int i915, const uint32_t handle,
 			 const uint32_t addr)
 {
 	const uint32_t store_reg[] = {
-		MI_STORE_REGISTER_MEM | (4 - 2),
+		MI_STORE_REGISTER_MEM_GEN8,
 		addr,
 		0, /* reloc */
 		0, /* reloc */
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
