Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29C8D58D4B
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 13:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B136710E3C8;
	Mon, 25 Nov 2024 13:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXWpXv8y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D84E10E3C8
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732543025; x=1764079025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KZYyW83cbOn+S3ZGi5i7l1pqToId+zLQ17+tb//tDEs=;
 b=kXWpXv8yc/hOl6phmcgnUhMJkEa+VV/zIBoS/VmbldTeNP+pr18HwwoO
 YuTi+gtFB++Z/YPs9FiL/ZSu0rEAI4MmSGbfrm/QeD6mK40R2kZgSIexY
 Z3Watb3NwGj9QzKVtMaEG+LKQVSnsyPs7zXGYjIJ3B5MBXB1zulyrp/oF
 PCzkHD88AUkK+U5mG5sbK4EFADDn2InLjN78ifyMA8vQG8/lEqygQ5ify
 JEHozJTtzR70tUCG6FI2S85YKSK0I2WaP1/UUpKUA4S0o5PEsp4G3Q36d
 XUtcANPdKfid1i1tF1f2QoHrHIrOYqqq7r4IIFQ8lDUmIXc7dOrNGRUx0 A==;
X-CSE-ConnectionGUID: DfenGqb+RaeG87zYREIO2w==
X-CSE-MsgGUID: 5uGPLsiTTMuKT4UehlP0vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="44043509"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="44043509"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 05:57:05 -0800
X-CSE-ConnectionGUID: 6MoOTepTRLaT/8JYPR0V8Q==
X-CSE-MsgGUID: 6zXpJWJoSwuT9o6UbFtptw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="96335599"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.228])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 05:57:04 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_exec_store: Introduce long-shader
 tests
Date: Mon, 25 Nov 2024 14:56:45 +0100
Message-Id: <20241125135645.6776-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125135645.6776-1-dominik.karol.piatkowski@intel.com>
References: <20241125135645.6776-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce 4 tests:
- long-shader-bb-sram-target-sram
- long-shader-bb-sram-target-vram
- long-shader-bb-vram-target-sram
- long-shader-bb-vram-target-vram

These tests are core version of xe_eudebug_online@writes-caching* tests.

Each test writes incrementing values to 2-page-long target surface using
long shader. The bb is searched for full shader, expecting it to exist.
The target surface is checked against written values. Each test places
bb and surface in different configuration of memory regions in order to
validate memory coherency.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_exec_store.c | 130 ++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 1375ee906..bb7e7987d 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -12,6 +12,10 @@
 #include "xe/xe_query.h"
 #include "xe_drm.h"
 
+#include "intel_pat.h"
+#include "intel_mocs.h"
+#include "gpgpu_shader.h"
+
 /**
  * TEST: Tests to verify store dword functionality.
  * Category: Core
@@ -334,6 +338,120 @@ static void persistent(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+#define LONG_SHADER_VALUE(n)	(0xcafe0000 + (n))
+
+/**
+ * SUBTEST: long-shader-bb-%s-target-%s
+ * DESCRIPTION: Write incrementing values to 2-page-long target surface using long shader. Check if
+ *		the bb contains full shader. Check if all written values are in the target surface.
+ *		Place bb and surface in various memory regions to validate memory coherency.
+ *
+ * arg[1]:
+ *
+ * @sram: bb in SRAM
+ * @vram: bb in VRAM
+ *
+ * arg[2]:
+ *
+ * @sram: target surface in SRAM
+ * @vram: target surface in VRAM
+ */
+static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
+			bool bb_in_vram, bool target_in_vram)
+{
+	const uint64_t target_offset = 0x1a000000;
+	const uint64_t bb_offset = 0x1b000000;
+	const size_t bb_size = 32768;
+	uint32_t vm_id;
+	uint32_t exec_queue;
+	const unsigned int instruction_count = 128;
+	const unsigned int walker_dim_x = 4;
+	const unsigned int walker_dim_y = 8;
+	const unsigned int surface_dim_x = 64;
+	const unsigned int surface_dim_y = instruction_count;
+	struct gpgpu_shader *shader;
+	struct intel_buf *buf;
+	struct intel_bb *ibb;
+	uint32_t *ptr;
+	uint64_t bb_region;
+	uint64_t target_region;
+
+	if (bb_in_vram || target_in_vram)
+		igt_skip_on_f(!xe_has_vram(fd), "Device does not have VRAM.\n");
+
+	bb_region = bb_in_vram ? vram_memory(fd, hwe->gt_id) : system_memory(fd);
+	target_region = target_in_vram ? vram_memory(fd, hwe->gt_id) : system_memory(fd);
+
+	buf = intel_buf_create_full(buf_ops_create(fd), 0, surface_dim_x / 4, surface_dim_y,
+				    32, 0, I915_TILING_NONE, 0, 0, 0, target_region,
+				    DEFAULT_PAT_INDEX, DEFAULT_MOCS_INDEX);
+	buf->addr.offset = target_offset;
+
+	vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	exec_queue = xe_exec_queue_create(fd, vm_id, hwe, 0);
+
+	ibb = intel_bb_create_with_context_in_region(fd, exec_queue, vm_id, NULL, bb_size, bb_region);
+	intel_bb_remove_object(ibb, ibb->handle, ibb->batch_offset, ibb->size);
+	intel_bb_add_object(ibb, ibb->handle, ibb->size, bb_offset, ibb->alignment, false);
+	ibb->batch_offset = bb_offset;
+
+	intel_bb_set_lr_mode(ibb, true);
+
+	shader = gpgpu_shader_create(fd);
+	gpgpu_shader__nop(shader);
+	for (int i = 0; i < instruction_count; i++)
+		gpgpu_shader__common_target_write_u32(shader, i, LONG_SHADER_VALUE(i));
+	gpgpu_shader__nop(shader);
+	gpgpu_shader__eot(shader);
+
+	gpgpu_shader_exec(ibb, buf, walker_dim_x, walker_dim_y, shader, NULL, 0, 0);
+	intel_bb_sync(ibb);
+
+	ptr = xe_bo_map(fd, ibb->handle, ibb->size);
+	igt_assert_f(memmem(ptr, ibb->size, shader->code, shader->size * sizeof(uint32_t)),
+		     "Could not find kernel in bb!\n");
+	gem_munmap(ptr, ibb->size);
+
+	gpgpu_shader_destroy(shader);
+
+	ptr = xe_bo_map(fd, buf->handle, buf->surface[0].size);
+	for (int i = 0; i < buf->surface[0].size / 4; i += 16)
+		for (int j = 0; j < 4; j++)
+			igt_assert(ptr[i + j] == LONG_SHADER_VALUE(i / 16));
+	gem_munmap(ptr, buf->surface[0].size);
+
+	intel_bb_destroy(ibb);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm_id);
+	free(buf);
+}
+
+#define is_compute_on_gt(__e, __gt) (((__e)->engine_class == DRM_XE_ENGINE_CLASS_RENDER || \
+				      (__e)->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) && \
+				      (__e)->gt_id == (__gt))
+
+static struct drm_xe_engine_class_instance *pick_compute(int fd, int gt)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int count = 0;
+
+	xe_for_each_engine(fd, hwe)
+		if (is_compute_on_gt(hwe, gt))
+			count++;
+
+	xe_for_each_engine(fd, hwe)
+		if (is_compute_on_gt(hwe, gt) && rand() % count-- == 0)
+			return hwe;
+
+	return NULL;
+}
+
+#define test_gt_render_or_compute(t, fd, __hwe) \
+	igt_subtest_with_dynamic(t) \
+		for (int gt = 0; (__hwe = pick_compute(fd, gt)); gt++) \
+			igt_dynamic_f("%s%d", xe_engine_class_string(__hwe->engine_class), \
+				      hwe->engine_instance)
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -378,6 +496,18 @@ igt_main
 	igt_subtest("persistent")
 		persistent(fd);
 
+	test_gt_render_or_compute("long-shader-bb-sram-target-sram", fd, hwe)
+		long_shader(fd, hwe, false, false);
+
+	test_gt_render_or_compute("long-shader-bb-sram-target-vram", fd, hwe)
+		long_shader(fd, hwe, false, true);
+
+	test_gt_render_or_compute("long-shader-bb-vram-target-sram", fd, hwe)
+		long_shader(fd, hwe, true, false);
+
+	test_gt_render_or_compute("long-shader-bb-vram-target-vram", fd, hwe)
+		long_shader(fd, hwe, true, true);
+
 	igt_fixture {
 		xe_device_put(fd);
 		close(fd);
-- 
2.34.1

