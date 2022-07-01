Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2347E10E03C
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Jul 2022 12:13:57 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Jul 2022 14:13:34 +0200
Message-Id: <20220701121334.9911-2-nirmoy.das@intel.com>
In-Reply-To: <20220701121334.9911-1-nirmoy.das@intel.com>
References: <20220701121334.9911-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [igt-dev] [PATCH i-g-t 2/2] i915/gem_exec_fence: Support dg2+ batch
 predication
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com, nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

On dg2+, MI_BATCH_BUFFER_START | MI_USE_PREDICATE switches to using the
MI_SET_PREDICATE_RESULT register and requires bit 0 to be set to skip
the looping MI_BATCH_BUFFER_START.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5463
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/gem_exec_fence.c | 39 +++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index a6499a68a..d46914c2f 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -2369,6 +2369,7 @@ static void test_syncobj_timeline_multiple_ext_nodes(int fd)
 #define HSW_CS_GPR(n)                   (0x600 + 8*(n))
 #define RING_TIMESTAMP                  (0x358)
 #define MI_PREDICATE_RESULT_1           (0x41c)
+#define MI_SET_PREDICATE_RESULT         (0x3b8)
 
 #define WAIT_BB_OFFSET			(64 << 20)
 #define COUNTER_OFFSET			(65 << 20)
@@ -2467,6 +2468,13 @@ get_cs_timestamp_frequency(int fd)
 	igt_skip("Kernel with PARAM_CS_TIMESTAMP_FREQUENCY support required\n");
 }
 
+static bool use_set_predicate_result(int i915)
+{
+	uint16_t devid = intel_get_drm_devid(i915);
+
+	return intel_graphics_ver(devid) >= IP_VER(12, 50);
+}
+
 static struct drm_i915_gem_exec_object2
 build_wait_bb(int i915,
 	      const struct intel_execution_engine2 *engine,
@@ -2523,21 +2531,36 @@ build_wait_bb(int i915,
 	*bb++ = MI_MATH_SUB;
 	*bb++ = MI_MATH_STORE(MI_MATH_REG(3), MI_MATH_REG_ACCU);
 
-	*bb++ = MI_MATH(4);
-	*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
-	*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(3));
-	*bb++ = MI_MATH_ADD;
-	*bb++ = MI_MATH_STOREINV(MI_MATH_REG(4), MI_MATH_REG_CF);
+	if (use_set_predicate_result(i915)) {
+		*bb++ = MI_MATH(4);
+		*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
+		*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(3));
+		*bb++ = MI_MATH_ADD;
+		*bb++ = MI_MATH_STORE(MI_MATH_REG(4), MI_MATH_REG_CF);
 
-	*bb++ = MI_LOAD_REGISTER_REG;
-	*bb++ = mmio_base + HSW_CS_GPR(4);
-	*bb++ = mmio_base + MI_PREDICATE_RESULT_1;
+		*bb++ = MI_LOAD_REGISTER_REG;
+		*bb++ = mmio_base + HSW_CS_GPR(4);
+		*bb++ = mmio_base + MI_SET_PREDICATE_RESULT;
+	} else {
+		*bb++ = MI_MATH(4);
+		*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
+		*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(3));
+		*bb++ = MI_MATH_ADD;
+		*bb++ = MI_MATH_STOREINV(MI_MATH_REG(4), MI_MATH_REG_CF);
+
+		*bb++ = MI_LOAD_REGISTER_REG;
+		*bb++ = mmio_base + HSW_CS_GPR(4);
+		*bb++ = mmio_base + MI_PREDICATE_RESULT_1;
+	}
 
 	*bb++ = MI_BATCH_BUFFER_START | MI_BATCH_PREDICATE | 1;
 	relocs->offset = offset_in_page(bb);
 	*bb++ = obj.offset + relocs->delta;
 	*bb++ = obj.offset >> 32;
 
+	if (use_set_predicate_result(i915))
+		*bb++ = 1 << 23; // MI_SET_PREDICATE
+
 	*bb++ = MI_BATCH_BUFFER_END;
 
 	munmap(map, 4096);
-- 
2.35.1

Intel Deutschland GmbH
Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de <http://www.intel.de>
Managing Directors: Christin Eisenschmid, Sharon Heck, Tiffany Doon Silva  
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928
