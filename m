Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF885E7716B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 11:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AB610ECE8;
	Wed,  4 Dec 2024 11:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlG/gnXv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6958D10ECE4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733313440; x=1764849440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=irq315O1HcxOVGgKRhlPXO7JsyXFQ7JWr5xYw4ml+CY=;
 b=mlG/gnXvsuuYmm8CzXx5zi0U233YKKXm415JJ+OK23xwy3+7rn7D/RqA
 tNfs7lLfxXjXXl7nIz4ORjoMivSsFapRMZlyaCT+aHXy4kRYjzOC5BQv7
 bDJ55EpqmSfEmMEJaVzbt+6nrzkvLvxqu3EUQxGJLFpCppsqcf5hERU0G
 +oIizzKbqn81Vb+I12P4Nhk1OeT9zrWjKdDidPYdce/spVAEI0RWZ/Z5B
 2If0gKJpO5/qvpjyfJOW05/tM9vtAsI5r0fbNGHlXPkjEoNhrMIZyLcIf
 gpA7Aab9h3rDriwGrlShNegbA9WMo/9F6SPToAKYnFGuJkGm5Tho0QSES Q==;
X-CSE-ConnectionGUID: TxqjSVl1RiyO3WWYd95rGw==
X-CSE-MsgGUID: y2k40GO5TFSBYVuWvYQZQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="51107639"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="51107639"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 03:57:20 -0800
X-CSE-ConnectionGUID: Uz9af0dFTOK4+aurhRApYA==
X-CSE-MsgGUID: ViTeaGOlT367cXi4A5mZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="93419226"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.198])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 03:57:19 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 1/1] tests/intel/xe_exec_store: Introduce long-shader
 tests
Date: Wed,  4 Dec 2024 12:57:05 +0100
Message-Id: <20241204115705.5455-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204115705.5455-1-dominik.karol.piatkowski@intel.com>
References: <20241204115705.5455-1-dominik.karol.piatkowski@intel.com>
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

Introduce long-shader-bb-check test with dynamic subtests dependent on
available memory regions.

These dynamic subtests are core version of
xe_eudebug_online@writes-caching* tests.

Each dynamic subtest writes incrementing values to 2-page-long target
surface using long shader. The bb is searched for full shader, expecting
it to exist. The target surface is checked against written values. Each
dynamic subtest places bb and surface in different configuration of
memory regions in order to validate memory coherency.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_exec_store.c | 102 ++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 1375ee906..2450834bf 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -12,6 +12,11 @@
 #include "xe/xe_query.h"
 #include "xe_drm.h"
 
+#include "intel_pat.h"
+#include "intel_mocs.h"
+#include "gpgpu_shader.h"
+#include "xe/xe_util.h"
+
 /**
  * TEST: Tests to verify store dword functionality.
  * Category: Core
@@ -334,6 +339,76 @@ static void persistent(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+#define LONG_SHADER_VALUE(n)	(0xcafe0000 + (n))
+
+/**
+ * SUBTEST: long-shader-bb-check
+ * DESCRIPTION: Write incrementing values to 2-page-long target surface using long shader. Check if
+ *		the bb contains full shader. Check if all written values are in the target surface.
+ *		Place bb and surface in various memory regions to validate memory coherency.
+ */
+static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
+			uint64_t bb_region, uint64_t target_region)
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
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -378,6 +453,33 @@ igt_main
 	igt_subtest("persistent")
 		persistent(fd);
 
+	igt_subtest_with_dynamic("long-shader-bb-check") {
+		struct igt_collection *set;
+		struct igt_collection *regions;
+
+		set = xe_get_memory_region_set(fd, DRM_XE_MEM_REGION_CLASS_SYSMEM,
+					       DRM_XE_MEM_REGION_CLASS_VRAM);
+
+		xe_for_each_engine(fd, hwe) {
+			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_RENDER &&
+			    hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+				continue;
+
+			for_each_variation_r(regions, 2, set) {
+				uint32_t bb_region = igt_collection_get_value(regions, 0);
+				uint32_t target_region = igt_collection_get_value(regions, 1);
+
+				igt_dynamic_f("gt%d-%s%d-bb-%s-target-%s",
+					      hwe->gt_id, xe_engine_class_string(hwe->engine_class),
+					      hwe->engine_instance, xe_region_name(bb_region),
+					      xe_region_name(target_region))
+					long_shader(fd, hwe, bb_region, target_region);
+			}
+		}
+
+		igt_collection_destroy(set);
+	}
+
 	igt_fixture {
 		xe_device_put(fd);
 		close(fd);
-- 
2.34.1

