Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E63EEF300
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 05:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBA510EB11;
	Thu,  5 Mar 2026 05:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Js6ELjVN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DB810EB10
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 05:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772688868; x=1804224868;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2e9XN18VZXhGlmcVYR8JYk5Hw/3DQ+r+u2bSwoy+3zs=;
 b=Js6ELjVNTOS6helQuR9Bn9NSflYuvzM+1IHkYOb8S3lP9/EBCrNy62PS
 uS+bTrq7HxDmpv1bZKuVfTyh4YTfouYSbOwYy+eMeibifA+Y4ZDVqG/+c
 BwwTtqOn5JCUqso3gdcjQxY9CgssFv+4k6rKEayDiW73ACrKZfuMNClCf
 rYFkwgH35y0FLGhqlraHSX533U64WudEfGsKdySzAnpaXp1Ad2Fb89Nlk
 zFDi7o2ExoQ1+Nhz6IS9UyVWYmFBJxAS7amUayViBtEbycIVgVw55eMRc
 2FFg4jNxAi1HI5xXIXWmal19/0Fo2YXh4aaxhBcwBQA6MwTf42o+QsQAI A==;
X-CSE-ConnectionGUID: Avllk9dwQ/6Lw085emYOtA==
X-CSE-MsgGUID: DFHKXt0PRYOVX5C33S/BXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73833742"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="73833742"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 21:34:28 -0800
X-CSE-ConnectionGUID: 6kt94Kj0QbqAwOJMNKIuOw==
X-CSE-MsgGUID: Zt9O0LMnR2WizVTEqOq49Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="216388823"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2026 21:34:26 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v3 5/5] tests/intel/xe_prefetch_fault: Add test for
 prefetch fault
Date: Thu,  5 Mar 2026 11:04:19 +0530
Message-ID: <20260305053413.1734922-12-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305053413.1734922-7-priyanka.dandamudi@intel.com>
References: <20260305053413.1734922-7-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

L1 prefetch uses CTYPE = Prefetch, such page faults are ignored by HW.
Added a test to check for L1/L2 prefetch fault handling support. It has
been implemented using compute pipeline.
Prefetch operations are implemented using a Load instruction with a NULL
destination register. This indicates to the LSC to perform the requested
cache fill operation but without returning data to the EU.
Added gpgpu shader prefetch fault template to support the test.

v2: Use xe_canonical_va instead of CANONICAL_57B.

v3: Remove unrequired graphics version in asm.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/meson.build                               |   2 +-
 tests/intel/xe_prefetch_fault.c               | 212 ++++++++++++++++++
 .../xe_prefetch_fault.c.gen.iga64_codes.c     |  21 ++
 tests/meson.build                             |   1 +
 4 files changed, 235 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/xe_prefetch_fault.c
 create mode 100644 tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c

diff --git a/lib/meson.build b/lib/meson.build
index ea721ecf70..cd03e8f634 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -262,7 +262,7 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
 		      fallback : 'NO-GIT',
 		      command : vcs_command )
 
-iga64_assembly_sources = [ 'gpgpu_shader.c', 'gpgpu_fill.c', '../tests/intel/xe_eudebug_online.c' ]
+iga64_assembly_sources = [ 'gpgpu_shader.c', 'gpgpu_fill.c', '../tests/intel/xe_eudebug_online.c', '../tests/intel/xe_prefetch_fault.c']
 libiga64_asms = static_library('iga64_asms',
 	iga64_assembly_sources,
 	include_directories: inc,
diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
new file mode 100644
index 0000000000..b7484aae0b
--- /dev/null
+++ b/tests/intel/xe_prefetch_fault.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: Tests for prefetch fault functionality
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: prefetch fault
+ * Functionality: prefetch fault
+ * Test category: functionality test
+ */
+#include "gpgpu_shader.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_gt.h"
+#include "xe/xe_util.h"
+#include "igt.h"
+#include "igt_sysfs.h"
+#include "intel_pat.h"
+#include "intel_mocs.h"
+
+#define WALKER_X_DIM	4
+#define WALKER_Y_DIM	1
+#define PAGE_SIZE 4096
+#define COLOR_C4 0xC4C4C4C4
+
+struct dim_t {
+	uint32_t x;
+	uint32_t y;
+	uint32_t alignment;
+};
+
+/**
+ * gpgpu_shader__e64b_prefetch_fault:
+ * @shdr: shader to be modified
+ * @addr: ppgtt virtual address to raise prefetch fault
+ *
+ * This shader can only be used when in efficient 64bit mode.
+ * For a given arbitrary ppgtt virtual address, it raises prefetch fault using load instruction.
+ */
+static void gpgpu_shader__prefetch_fault(struct gpgpu_shader *shdr,
+					 uint64_t addr)
+{
+	igt_assert_f((addr & 0x3) == 0, "address must be aligned to DWord!\n");
+
+	emit_iga64_code(shdr, xe_prefetch_fault_prefetch, "			\n\
+#define IGA64_FLAGS \"\"							\n\
+#if GEN_VER >= 3500								\n\
+L0:										\n\
+// Set base address with scalar register					\n\
+(W)	mov (1)		s0.0<1>:ud		ARG(0):ud			\n\
+(W)	mov (1)		s0.1<1>:ud		ARG(1):ud			\n\
+										\n\
+// A64 offset									\n\
+(W)	mov (8)		r30.0<1>:uq		0x0:uq				\n\
+										\n\
+// efficient 64bit Read with cached L1, cached L2 and cached L3			\n\
+// sendg ugm load with SBID 3							\n\
+// Message Descriptor								\n\
+//      bspec:71885								\n\
+//      0x99C00 =>								\n\
+//      [45:44] Offset Scaling: 0 (disable)					\n\
+//      [43:22] Global Offset: 0						\n\
+//      [21] Overfetch: 0 (disable)						\n\
+//      [19:16] Cache: 9 (L1 cached, L2 cached and L3 cached)			\n\
+//      [15:14] Address Type and Size: 2 (Flat A64 Base, A64 Index)		\n\
+//      [13:11] Data Size: 3 (D64)						\n\
+//      [10:10] Transpose : 1 (enable)						\n\
+//      [9:7] Vector Size: 0 (Vector length 1)					\n\
+//      [5:0] Opcode: 0 (Load)							\n\
+// Prefetch operations are implemented using a NULL destination register.       \n\
+(W)	sendg.ugm (1|M0)	null	r30:1	null:0	s0.0	0x99C00	{A@1,$5}\n\
+										\n\
+#endif										\n\
+	", lower_32_bits(addr), upper_32_bits(addr));
+}
+
+static struct intel_buf *
+create_buf(int fd, int width, int height, uint32_t color)
+{
+	struct intel_buf *buf;
+	uint32_t *ptr;
+	size_t i;
+
+	buf = intel_buf_create(buf_ops_create(fd), width, height, 32, 0,
+			       I915_TILING_NONE, 0);
+
+	ptr = xe_bo_map(fd, buf->handle, buf->size);
+	igt_assert(ptr != MAP_FAILED);
+
+	for (i = 0; i < buf->size / sizeof(uint32_t); i++)
+		ptr[i] = color;
+
+	munmap(ptr, buf->size);
+
+	return buf;
+}
+
+static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint32_t vm,
+					       uint64_t offset, uint32_t size)
+{
+	struct intel_bb *ibb;
+
+	ibb = intel_bb_create_with_context(fd, exec_queue, vm, NULL, size);
+
+	/* update intel bb offset */
+	intel_bb_remove_object(ibb, ibb->handle, ibb->batch_offset, ibb->size);
+	intel_bb_add_object(ibb, ibb->handle, ibb->size, offset, ibb->alignment, false);
+	ibb->batch_offset = offset;
+
+	return ibb;
+}
+
+static struct gpgpu_shader *get_prefetch_shader(int fd)
+{
+	static struct gpgpu_shader *shader;
+
+	shader = gpgpu_shader_create(fd);
+	gpgpu_shader__prefetch_fault(shader, xe_canonical_va(fd, 0x1f000000));
+	gpgpu_shader__eot(shader);
+
+	return shader;
+}
+
+/**
+ * SUBTEST: prefetch-fault
+ * Description: Validate L1/L2 cache prefetch fault.
+ * Run type: FULL
+ */
+
+static void test_prefetch(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	/* faulty address 0x1f000000 should be beyond bb_offset+bb_size. */
+	const uint64_t bb_offset = 0x1b000000;
+	const size_t bb_size = 4096;
+	struct dim_t w_dim;
+	struct gpgpu_shader *shader;
+	struct intel_bb *ibb;
+	struct intel_buf *buf;
+	uint32_t *ptr;
+	uint32_t exec_queue_id, vm;
+	int prefetch_pre, prefetch_pos;
+	static const char *stat = "prefetch_pagefault_count";
+
+	w_dim.x = WALKER_X_DIM;
+	w_dim.y = WALKER_Y_DIM;
+
+	buf = create_buf(fd, w_dim.x, w_dim.y, COLOR_C4);
+
+	prefetch_pre = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+
+	exec_queue_id = xe_exec_queue_create(fd, vm, hwe, 0);
+
+	ibb = xe_bb_create_on_offset(fd, exec_queue_id, vm,
+				     bb_offset, bb_size);
+	intel_bb_set_lr_mode(ibb, true);
+
+	shader = get_prefetch_shader(fd);
+
+	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
+
+	gpgpu_shader_destroy(shader);
+
+	intel_bb_sync(ibb);
+
+	ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size, PROT_READ);
+
+	for (int j = 0; j < w_dim.y; j++)
+		for (int i = 0; i < w_dim.x; i++) {
+			igt_assert_f(ptr[j * w_dim.x + i] == COLOR_C4,
+				     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
+				     COLOR_C4, ptr[j * w_dim.x + i], i, j);
+		}
+	/* Validate prefetch count. */
+	prefetch_pos = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
+	igt_assert_eq(prefetch_pos, prefetch_pre + w_dim.x * w_dim.y);
+
+	munmap(ptr, buf->size);
+
+	intel_bb_destroy(ibb);
+}
+
+int igt_main()
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+	}
+
+	igt_subtest_with_dynamic("prefetch-fault") {
+		xe_for_each_engine(fd, hwe) {
+			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
+				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_prefetch(fd, hwe);
+			}
+		}
+	}
+
+	igt_fixture() {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
new file mode 100644
index 0000000000..63d625a653
--- /dev/null
+++ b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: MIT
+// Generated using Intel Graphics Assembler 1.1.0-int
+
+#include "gpgpu_shader.h"
+
+#define MD5_SUM_IGA64_ASMS e7208e50b70deaed9d16527ee184bc5b
+
+struct iga64_template const iga64_code_xe_prefetch_fault_prefetch[] = {
+	{ .gen_ver = 3500, .size = 28, .code = (const uint32_t []) {
+		0x80000061, 0x60014220, 0x00000000, 0xc0ded000,
+		0x80000061, 0x60114220, 0x00000000, 0xc0ded001,
+		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
+		0x80012033, 0x00000004, 0xf0091e0c, 0x9c000000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
+
+	}}
+};
diff --git a/tests/meson.build b/tests/meson.build
index 7f356de9be..c008826923 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -324,6 +324,7 @@ intel_xe_progs = [
 	'xe_pm',
 	'xe_pm_residency',
 	'xe_pmu',
+        'xe_prefetch_fault',
 	'xe_prime_self_import',
 	'xe_pxp',
 	'xe_query',
-- 
2.43.0

