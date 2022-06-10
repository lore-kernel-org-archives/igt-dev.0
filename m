Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA2412ACC0
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 07:08:20 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jun 2022 09:07:48 +0200
Message-Id: <20220610070751.27541-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220610070751.27541-1-zbigniew.kempczynski@intel.com>
References: <20220610070751.27541-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/intel_reg: Add common MI_* macros
 to remove duplicates
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In few tests we got some MI_* duplicates (MI_MATH for example).
Add common definitions in intel_reg.h and remove local definitions
in the tests.

v2: Definitions MI_LOAD_REGISTER_MEM_GEN8 was removed so from now
    on user will need to encode length on it own. :

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 benchmarks/gem_wsim.c        | 31 ------------------------
 lib/intel_aux_pgtable.c      |  4 +--
 lib/intel_reg.h              | 47 +++++++++++++++++++++++++++++++++++-
 tests/i915/gem_exec_fair.c   | 27 ---------------------
 tests/i915/gem_exec_fence.c  | 43 +++++----------------------------
 tests/i915/gem_watchdog.c    | 27 ---------------------
 tests/i915/gem_workarounds.c |  4 +--
 tests/i915/gen7_exec_parse.c |  6 ++---
 tests/i915/gen9_exec_parse.c | 11 +++------
 9 files changed, 61 insertions(+), 139 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index d14352225e..2d60135817 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -279,38 +279,7 @@ static uint64_t ns_to_ctx_ticks(uint64_t ns)
 	return div64_u64_round_up(ns * f, NSEC_PER_SEC);
 }
 
-#define MI_INSTR(opcode, flags) (((opcode) << 23) | (flags))
-
-#define MI_ARB_CHECK MI_INSTR(0x5, 0)
-
-#define MI_MATH(x)                      MI_INSTR(0x1a, (x) - 1)
-#define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
-/* Opcodes for MI_MATH_INSTR */
-#define   MI_MATH_NOOP                  MI_MATH_INSTR(0x000, 0x0, 0x0)
-#define   MI_MATH_LOAD(op1, op2)        MI_MATH_INSTR(0x080, op1, op2)
-#define   MI_MATH_LOADINV(op1, op2)     MI_MATH_INSTR(0x480, op1, op2)
-#define   MI_MATH_LOAD0(op1)            MI_MATH_INSTR(0x081, op1)
-#define   MI_MATH_LOAD1(op1)            MI_MATH_INSTR(0x481, op1)
-#define   MI_MATH_ADD                   MI_MATH_INSTR(0x100, 0x0, 0x0)
-#define   MI_MATH_SUB                   MI_MATH_INSTR(0x101, 0x0, 0x0)
-#define   MI_MATH_AND                   MI_MATH_INSTR(0x102, 0x0, 0x0)
-#define   MI_MATH_OR                    MI_MATH_INSTR(0x103, 0x0, 0x0)
-#define   MI_MATH_XOR                   MI_MATH_INSTR(0x104, 0x0, 0x0)
-#define   MI_MATH_STORE(op1, op2)       MI_MATH_INSTR(0x180, op1, op2)
-#define   MI_MATH_STOREINV(op1, op2)    MI_MATH_INSTR(0x580, op1, op2)
-/* Registers used as operands in MI_MATH_INSTR */
-#define   MI_MATH_REG(x)                (x)
-#define   MI_MATH_REG_SRCA              0x20
-#define   MI_MATH_REG_SRCB              0x21
-#define   MI_MATH_REG_ACCU              0x31
-#define   MI_MATH_REG_ZF                0x32
-#define   MI_MATH_REG_CF                0x33
-
 #define MI_STORE_DWORD_INDEX	MI_INSTR(0x21, 1)
-#define MI_STORE_REGISTER_MEM	MI_INSTR(0x24, 0)
-#define MI_LOAD_REGISTER_REG    MI_INSTR(0x2A, 1)
-#define   MI_CS_MMIO_DST BIT(19)
-#define   MI_CS_MMIO_SRC BIT(18)
 
 static unsigned int offset_in_page(void *addr)
 {
diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index e31a6c343d..7556351a02 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -644,11 +644,11 @@ gen12_emit_aux_pgtable_state(struct intel_bb *ibb, uint32_t state, bool render)
 	if (!state)
 		return;
 
-	intel_bb_out(ibb, MI_LOAD_REGISTER_MEM_GEN8 | MI_MMIO_REMAP_ENABLE_GEN12);
+	intel_bb_out(ibb, MI_LOAD_REGISTER_MEM | MI_MMIO_REMAP_ENABLE_GEN12 | 2);
 	intel_bb_out(ibb, table_base_reg);
 	intel_bb_emit_reloc(ibb, ibb->handle, 0, 0, state, ibb->batch_offset);
 
-	intel_bb_out(ibb, MI_LOAD_REGISTER_MEM_GEN8 | MI_MMIO_REMAP_ENABLE_GEN12);
+	intel_bb_out(ibb, MI_LOAD_REGISTER_MEM | MI_MMIO_REMAP_ENABLE_GEN12 | 2);
 	intel_bb_out(ibb, table_base_reg + 4);
 	intel_bb_emit_reloc(ibb, ibb->handle, 0, 0, state + 4, ibb->batch_offset);
 }
diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index e26ee82a5b..e4d1f1c263 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -2623,8 +2623,14 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 #define MI_LOAD_SCAN_LINES_INCL		(0x12<<23)
 #define MI_LOAD_REGISTER_IMM		((0x22 << 23) | 1)
-#define MI_LOAD_REGISTER_MEM_GEN8	((0x29 << 23) | (4 - 2))
+#define MI_LOAD_REGISTER_REG		((0x2A << 23) | 1)
+#define MI_LOAD_REGISTER_MEM		(0x29 << 23)
+#define   MI_CS_MMIO_DST		(1 << 19)
+#define   MI_CS_MMIO_SRC		(1 << 18)
 #define   MI_MMIO_REMAP_ENABLE_GEN12	(1 << 17)
+#define   MI_WPARID_ENABLE_GEN12	(1 << 16)
+#define MI_STORE_REGISTER_MEM		(0x24 << 23)
+#define   MI_STORE_PREDICATE_ENABLE_GEN12 (1 << 21)
 
 /* Flush */
 #define MI_FLUSH			(0x04<<23)
@@ -2642,6 +2648,9 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define MI_NOOP_WRITE_ID		(1<<22)
 #define MI_NOOP_ID_MASK			(1<<22 - 1)
 
+/* ARB Check */
+#define MI_ARB_CHECK                    (0x5 << 23)
+
 #define STATE3D_COLOR_FACTOR	((0x3<<29)|(0x1d<<24)|(0x01<<16))
 
 /* Atomics */
@@ -2657,12 +2666,48 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define   MI_BATCH_PREDICATE       (1 << 15) /* HSW+ on RCS only*/
 #define MI_BATCH_BUFFER_END	(0xA << 23)
 #define MI_COND_BATCH_BUFFER_END	(0x36 << 23)
+#define   MAD_GT_IDD                    (0 << 12)
+#define   MAD_GT_OR_EQ_IDD              (1 << 12)
+#define   MAD_LT_IDD                    (2 << 12)
+#define   MAD_LT_OR_EQ_IDD              (3 << 12)
+#define   MAD_EQ_IDD                    (4 << 12)
+#define   MAD_NEQ_IDD                   (5 << 12)
 #define MI_DO_COMPARE                   (1 << 21)
 
 #define MI_BATCH_NON_SECURE		(1)
 #define MI_BATCH_NON_SECURE_I965	(1 << 8)
 #define MI_BATCH_NON_SECURE_HSW		(1<<13) /* Additional bit for RCS */
 
+/* Math */
+#define MI_INSTR(opcode, flags)         (((opcode) << 23) | (flags))
+#define MI_MATH(x)                      MI_INSTR(0x1a, (x) - 1)
+#define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
+/* Opcodes for MI_MATH_INSTR */
+#define   MI_MATH_NOOP                  MI_MATH_INSTR(0x000, 0x0, 0x0)
+#define   MI_MATH_LOAD(op1, op2)        MI_MATH_INSTR(0x080, op1, op2)
+#define   MI_MATH_LOADINV(op1, op2)     MI_MATH_INSTR(0x480, op1, op2)
+#define   MI_MATH_LOAD0(op1)            MI_MATH_INSTR(0x081, op1)
+#define   MI_MATH_LOAD1(op1)            MI_MATH_INSTR(0x481, op1)
+#define   MI_MATH_ADD                   MI_MATH_INSTR(0x100, 0x0, 0x0)
+#define   MI_MATH_SUB                   MI_MATH_INSTR(0x101, 0x0, 0x0)
+#define   MI_MATH_AND                   MI_MATH_INSTR(0x102, 0x0, 0x0)
+#define   MI_MATH_OR                    MI_MATH_INSTR(0x103, 0x0, 0x0)
+#define   MI_MATH_XOR                   MI_MATH_INSTR(0x104, 0x0, 0x0)
+#define   MI_MATH_STORE(op1, op2)       MI_MATH_INSTR(0x180, op1, op2)
+#define   MI_MATH_STOREINV(op1, op2)    MI_MATH_INSTR(0x580, op1, op2)
+/* DG2+ */
+#define   MI_MATH_SHL                   MI_MATH_INSTR(0x105, 0x0, 0x0)
+#define   MI_MATH_SHR                   MI_MATH_INSTR(0x106, 0x0, 0x0)
+#define   MI_MATH_SAR                   MI_MATH_INSTR(0x107, 0x0, 0x0)
+
+/* Registers used as operands in MI_MATH_INSTR */
+#define   MI_MATH_REG(x)                (x)
+#define   MI_MATH_REG_SRCA              0x20
+#define   MI_MATH_REG_SRCB              0x21
+#define   MI_MATH_REG_ACCU              0x31
+#define   MI_MATH_REG_ZF                0x32
+#define   MI_MATH_REG_CF                0x33
+
 #define MAX_DISPLAY_PIPES	2
 
 typedef enum {
diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index 935f9c4a0b..89921697f7 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -112,33 +112,6 @@ static uint64_t ticks_to_ns(int i915, uint64_t ticks)
 				  read_timestamp_frequency(i915));
 }
 
-#define MI_INSTR(opcode, flags) (((opcode) << 23) | (flags))
-
-#define MI_MATH(x)                      MI_INSTR(0x1a, (x) - 1)
-#define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
-/* Opcodes for MI_MATH_INSTR */
-#define   MI_MATH_NOOP                  MI_MATH_INSTR(0x000, 0x0, 0x0)
-#define   MI_MATH_LOAD(op1, op2)        MI_MATH_INSTR(0x080, op1, op2)
-#define   MI_MATH_LOADINV(op1, op2)     MI_MATH_INSTR(0x480, op1, op2)
-#define   MI_MATH_LOAD0(op1)            MI_MATH_INSTR(0x081, op1)
-#define   MI_MATH_LOAD1(op1)            MI_MATH_INSTR(0x481, op1)
-#define   MI_MATH_ADD                   MI_MATH_INSTR(0x100, 0x0, 0x0)
-#define   MI_MATH_SUB                   MI_MATH_INSTR(0x101, 0x0, 0x0)
-#define   MI_MATH_AND                   MI_MATH_INSTR(0x102, 0x0, 0x0)
-#define   MI_MATH_OR                    MI_MATH_INSTR(0x103, 0x0, 0x0)
-#define   MI_MATH_XOR                   MI_MATH_INSTR(0x104, 0x0, 0x0)
-#define   MI_MATH_STORE(op1, op2)       MI_MATH_INSTR(0x180, op1, op2)
-#define   MI_MATH_STOREINV(op1, op2)    MI_MATH_INSTR(0x580, op1, op2)
-/* Registers used as operands in MI_MATH_INSTR */
-#define   MI_MATH_REG(x)                (x)
-#define   MI_MATH_REG_SRCA              0x20
-#define   MI_MATH_REG_SRCB              0x21
-#define   MI_MATH_REG_ACCU              0x31
-#define   MI_MATH_REG_ZF                0x32
-#define   MI_MATH_REG_CF                0x33
-
-#define MI_LOAD_REGISTER_REG    MI_INSTR(0x2A, 1)
-
 static void delay(int i915,
 		  const struct intel_execution_engine2 *e,
 		  uint32_t handle,
diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 47ddf3083d..b7ce425d81 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -2366,37 +2366,6 @@ static void test_syncobj_timeline_multiple_ext_nodes(int fd)
 		syncobj_destroy(fd, syncobjs[i]);
 }
 
-#define MI_INSTR(opcode, flags) (((opcode) << 23) | (flags))
-
-/* #define MI_LOAD_REGISTER_MEM	   (MI_INSTR(0x29, 1) */
-/* #define MI_LOAD_REGISTER_MEM_GEN8  MI_INSTR(0x29, 2) */
-
-#define MI_LOAD_REGISTER_REG       MI_INSTR(0x2A, 1)
-
-#define MI_STORE_REGISTER_MEM      MI_INSTR(0x24, 1)
-#define MI_STORE_REGISTER_MEM_GEN8 MI_INSTR(0x24, 2)
-
-#define MI_MATH(x)                 MI_INSTR(0x1a, (x) - 1)
-#define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
-/* Opcodes for MI_MATH_INSTR */
-#define   MI_MATH_NOOP			MI_MATH_INSTR(0x00,  0x0, 0x0)
-#define   MI_MATH_LOAD(op1, op2)	MI_MATH_INSTR(0x80,  op1, op2)
-#define   MI_MATH_LOADINV(op1, op2)	MI_MATH_INSTR(0x480, op1, op2)
-#define   MI_MATH_ADD			MI_MATH_INSTR(0x100, 0x0, 0x0)
-#define   MI_MATH_SUB			MI_MATH_INSTR(0x101, 0x0, 0x0)
-#define   MI_MATH_AND			MI_MATH_INSTR(0x102, 0x0, 0x0)
-#define   MI_MATH_OR			MI_MATH_INSTR(0x103, 0x0, 0x0)
-#define   MI_MATH_XOR			MI_MATH_INSTR(0x104, 0x0, 0x0)
-#define   MI_MATH_STORE(op1, op2)	MI_MATH_INSTR(0x180, op1, op2)
-#define   MI_MATH_STOREINV(op1, op2)	MI_MATH_INSTR(0x580, op1, op2)
-/* Registers used as operands in MI_MATH_INSTR */
-#define   MI_MATH_REG(x)		(x)
-#define   MI_MATH_REG_SRCA		0x20
-#define   MI_MATH_REG_SRCB		0x21
-#define   MI_MATH_REG_ACCU		0x31
-#define   MI_MATH_REG_ZF		0x32
-#define   MI_MATH_REG_CF		0x33
-
 #define HSW_CS_GPR(n)                   (0x600 + 8*(n))
 #define RING_TIMESTAMP                  (0x358)
 #define MI_PREDICATE_RESULT_1           (0x41c)
@@ -2610,23 +2579,23 @@ static void build_increment_engine_bb(struct inter_engine_batches *batch,
 {
 	uint32_t *bb = batch->increment_bb = calloc(1, 4096);
 
-	*bb++ = MI_LOAD_REGISTER_MEM_GEN8;
+	*bb++ = MI_LOAD_REGISTER_MEM | 2;
 	*bb++ = mmio_base + HSW_CS_GPR(0);
 	batch->read0_ptrs[0] = bb;
 	*bb++ = 0;
 	*bb++ = 0;
-	*bb++ = MI_LOAD_REGISTER_MEM_GEN8;
+	*bb++ = MI_LOAD_REGISTER_MEM | 2;
 	*bb++ = mmio_base + HSW_CS_GPR(0) + 4;
 	batch->read0_ptrs[1] = bb;
 	*bb++ = 0;
 	*bb++ = 0;
 
-	*bb++ = MI_LOAD_REGISTER_MEM_GEN8;
+	*bb++ = MI_LOAD_REGISTER_MEM | 2;
 	*bb++ = mmio_base + HSW_CS_GPR(1);
 	batch->read1_ptrs[0] = bb;
 	*bb++ = 0;
 	*bb++ = 0;
-	*bb++ = MI_LOAD_REGISTER_MEM_GEN8;
+	*bb++ = MI_LOAD_REGISTER_MEM | 2;
 	*bb++ = mmio_base + HSW_CS_GPR(1) + 4;
 	batch->read1_ptrs[1] = bb;
 	*bb++ = 0;
@@ -2638,12 +2607,12 @@ static void build_increment_engine_bb(struct inter_engine_batches *batch,
 	*bb++ = MI_MATH_ADD;
 	*bb++ = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
 
-	*bb++ = MI_STORE_REGISTER_MEM_GEN8;
+	*bb++ = MI_STORE_REGISTER_MEM | 2;
 	*bb++ = mmio_base + HSW_CS_GPR(0);
 	batch->write_ptrs[0] = bb;
 	*bb++ = 0;
 	*bb++ = 0;
-	*bb++ = MI_STORE_REGISTER_MEM_GEN8;
+	*bb++ = MI_STORE_REGISTER_MEM | 2;
 	*bb++ = mmio_base + HSW_CS_GPR(0) + 4;
 	batch->write_ptrs[1] = bb;
 	*bb++ = 0;
diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
index fc1ba00712..01eb007694 100644
--- a/tests/i915/gem_watchdog.c
+++ b/tests/i915/gem_watchdog.c
@@ -270,33 +270,6 @@ static void virtual(int i915, const intel_ctx_cfg_t *base_cfg)
 	igt_assert_eq(count, expect);
 }
 
-#define MI_INSTR(opcode, flags) (((opcode) << 23) | (flags))
-
-#define MI_MATH(x)                      MI_INSTR(0x1a, (x) - 1)
-#define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
-/* Opcodes for MI_MATH_INSTR */
-#define   MI_MATH_NOOP                  MI_MATH_INSTR(0x000, 0x0, 0x0)
-#define   MI_MATH_LOAD(op1, op2)        MI_MATH_INSTR(0x080, op1, op2)
-#define   MI_MATH_LOADINV(op1, op2)     MI_MATH_INSTR(0x480, op1, op2)
-#define   MI_MATH_LOAD0(op1)            MI_MATH_INSTR(0x081, op1)
-#define   MI_MATH_LOAD1(op1)            MI_MATH_INSTR(0x481, op1)
-#define   MI_MATH_ADD                   MI_MATH_INSTR(0x100, 0x0, 0x0)
-#define   MI_MATH_SUB                   MI_MATH_INSTR(0x101, 0x0, 0x0)
-#define   MI_MATH_AND                   MI_MATH_INSTR(0x102, 0x0, 0x0)
-#define   MI_MATH_OR                    MI_MATH_INSTR(0x103, 0x0, 0x0)
-#define   MI_MATH_XOR                   MI_MATH_INSTR(0x104, 0x0, 0x0)
-#define   MI_MATH_STORE(op1, op2)       MI_MATH_INSTR(0x180, op1, op2)
-#define   MI_MATH_STOREINV(op1, op2)    MI_MATH_INSTR(0x580, op1, op2)
-/* Registers used as operands in MI_MATH_INSTR */
-#define   MI_MATH_REG(x)                (x)
-#define   MI_MATH_REG_SRCA              0x20
-#define   MI_MATH_REG_SRCB              0x21
-#define   MI_MATH_REG_ACCU              0x31
-#define   MI_MATH_REG_ZF                0x32
-#define   MI_MATH_REG_CF                0x33
-
-#define MI_LOAD_REGISTER_REG    MI_INSTR(0x2A, 1)
-
 static unsigned int offset_in_page(void *addr)
 {
 	return (uintptr_t)addr & 4095;
diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
index 70967b3ff5..fc5184925a 100644
--- a/tests/i915/gem_workarounds.c
+++ b/tests/i915/gem_workarounds.c
@@ -83,8 +83,6 @@ static bool write_only(const uint32_t addr)
 	return false;
 }
 
-#define MI_STORE_REGISTER_MEM (0x24 << 23)
-
 static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
 {
 	struct drm_i915_gem_exec_object2 obj[2];
@@ -122,7 +120,7 @@ static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
 	out = base =
 		gem_mmap__cpu(i915, obj[1].handle, 0, batch_sz, PROT_WRITE);
 	for (int i = 0; i < num_wa_regs; i++) {
-		*out++ = MI_STORE_REGISTER_MEM | ((gen >= 8 ? 4 : 2) - 2);
+		*out++ = MI_STORE_REGISTER_MEM | (1 + (gen >= 8));
 		*out++ = wa_regs[i].addr;
 		reloc[i].target_handle = obj[0].handle;
 		reloc[i].offset = (out - base) * sizeof(*out);
diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
index c83a791126..69b768ed29 100644
--- a/tests/i915/gen7_exec_parse.c
+++ b/tests/i915/gen7_exec_parse.c
@@ -48,8 +48,6 @@
 #define INSTR_CLIENT_SHIFT	29
 #define   INSTR_INVALID_CLIENT  0x7
 
-#define MI_LOAD_REGISTER_REG (0x2a << 23)
-#define MI_STORE_REGISTER_MEM (0x24 << 23)
 #define MI_ARB_ON_OFF (0x8 << 23)
 #define MI_DISPLAY_FLIP ((0x14 << 23) | 1)
 
@@ -374,7 +372,7 @@ static void test_allocations(int fd)
 static void hsw_load_register_reg(void)
 {
 	uint32_t init_gpr0[16] = {
-		MI_LOAD_REGISTER_IMM | (3 - 2),
+		MI_LOAD_REGISTER_IMM,
 		HSW_CS_GPR0,
 		0xabcdabc0, /* leave [1:0] zero */
 		MI_BATCH_BUFFER_END,
@@ -386,7 +384,7 @@ static void hsw_load_register_reg(void)
 		MI_BATCH_BUFFER_END,
 	};
 	uint32_t do_lrr[16] = {
-		MI_LOAD_REGISTER_REG | (3 - 2),
+		MI_LOAD_REGISTER_REG,
 		0, /* [1] = src */
 		HSW_CS_GPR0, /* dst */
 		MI_BATCH_BUFFER_END,
diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index fa61693cfc..c8743a78a0 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -38,12 +38,9 @@
 #define INSTR_CLIENT_SHIFT	29
 #define   INSTR_INVALID_CLIENT  0x7
 
-#define MI_LOAD_REGISTER_REG (0x2a << 23)
-#define MI_STORE_REGISTER_MEM (0x24 << 23)
 #define MI_ARB_ON_OFF (0x8 << 23)
 #define MI_USER_INTERRUPT (0x02 << 23)
 #define MI_FLUSH_DW (0x26 << 23)
-#define MI_ARB_CHECK (0x05 << 23)
 #define MI_REPORT_HEAD (0x07 << 23)
 #define MI_SUSPEND_FLUSH (0x0b << 23)
 #define MI_LOAD_SCAN_LINES_EXCL (0x13 << 23)
@@ -689,7 +686,7 @@ static void test_cmd_crossing_page(const int i915, const uint32_t handle)
 		MI_BATCH_BUFFER_END,
 	};
 	const uint32_t store_reg[] = {
-		MI_STORE_REGISTER_MEM | (4 - 2),
+		MI_STORE_REGISTER_MEM | 2,
 		BCS_GPR(0),
 		0, /* reloc */
 		0, /* reloc */
@@ -728,7 +725,7 @@ static void test_invalid_length(const int i915, const uint32_t handle)
 	};
 
 	const uint32_t store_reg[] = {
-		MI_STORE_REGISTER_MEM | (4 - 2),
+		MI_STORE_REGISTER_MEM | 2,
 		BCS_GPR(0),
 		0, /* reloc */
 		0, /* reloc */
@@ -841,7 +838,7 @@ static void test_register(const int i915, const uint32_t handle,
 	};
 
 	const uint32_t store_reg[] = {
-		MI_STORE_REGISTER_MEM | (4 - 2),
+		MI_STORE_REGISTER_MEM | 2,
 		r->addr,
 		0, /* reloc */
 		0, /* reloc */
@@ -880,7 +877,7 @@ static long int read_reg(const int i915, const uint32_t handle,
 			 const uint32_t addr)
 {
 	const uint32_t store_reg[] = {
-		MI_STORE_REGISTER_MEM | (4 - 2),
+		MI_STORE_REGISTER_MEM | 2,
 		addr,
 		0, /* reloc */
 		0, /* reloc */
-- 
2.32.0
