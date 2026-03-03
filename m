Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16777E67A69
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 05:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD5610E633;
	Tue,  3 Mar 2026 05:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EuSb8E+q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DFF10E633
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 05:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772515872; x=1804051872;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QA2ldoKmYd/mCHO/gm+YFY5b2W2PJmZVwVD766j2ilQ=;
 b=EuSb8E+qp1VtIeuP7fzUadowfk3yDMtiTB++/jcmnFf+DMv/HdOqReP8
 tnFB/9yddC8BjAL8+ZsOBvwZuQKcQOFRLnnQRTJVxZeK+tYf/YRkcbFVP
 w5FpXf3uakXOYikmPPONkCIOz5p5s8harhirbPmuQar9oHPBDCGCc/qbR
 GkQSpUwYmkHjIYxJ8O1R6JssT+DsW4SWvhEdiPyEX7qZZUks24zX3PT0r
 nErIa9eeN6gn9BFbZYn6GcQWUn394tUvDBb0Z8dnxCf6/QuryN0KceBDq
 Y8Ds5J23F/sykgx/lIyoruBpmWJk1hm6OQbsxCwA6HVA1riHBxOdi36aI Q==;
X-CSE-ConnectionGUID: 8rWpbScJSgmQQ2OFGEWQvg==
X-CSE-MsgGUID: K1fuNHZITzaBTl6tAHzt4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84630049"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="84630049"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 21:31:12 -0800
X-CSE-ConnectionGUID: IqMdSgXlSEW9LkvOrdOLzA==
X-CSE-MsgGUID: fUolVQ6RT6mVlZezsQ9huQ==
X-ExtLoop1: 1
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa003.fm.intel.com with ESMTP; 02 Mar 2026 21:31:09 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com,
 zbigniew.kempczynski@intel.com, andrzej.hajda@intel.com
Subject: [PATCH i-g-t v2 3/5] lib/gpgpu_shader: Add support for xe3p efficient
 64bit addressing
Date: Tue,  3 Mar 2026 11:01:02 +0530
Message-ID: <20260303053104.1674811-4-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303053104.1674811-1-priyanka.dandamudi@intel.com>
References: <20260303053104.1674811-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
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

From: Andrzej Hajda <andrzej.hajda@intel.com>

xe3p with new type of addressing requires following changes in shaders:
- new interface descriptor, state base address, COMPUTE_WALKER_2
- new instructions for load/store messages.

v2: xe_canonical_va() instead of CANONICAL_57B.(Zbigniew)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/gpgpu_shader.c | 75 +++++++++++++++++++++++++++++++++++++++++-----
 lib/iga64_macros.h |  5 +++-
 2 files changed, 72 insertions(+), 8 deletions(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index abccb4808f..874f2c63d6 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -12,6 +12,7 @@
 #include "gpgpu_shader.h"
 #include "gpu_cmds.h"
 #include "xe/xe_query.h"
+#include "xe/xe_util.h"
 
 struct label_entry {
 	uint32_t id;
@@ -218,15 +219,72 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
 		      engine | I915_EXEC_NO_RELOC, false);
 }
 
+static void
+__xe3p_gpgpu_execfunc(struct intel_bb *ibb,
+		      struct intel_buf *target,
+		      unsigned int x_dim, unsigned int y_dim,
+		      struct gpgpu_shader *shdr,
+		      struct gpgpu_shader *sip,
+		      uint64_t ring, bool explicit_engine)
+{
+	struct xe3p_interface_descriptor_data idd;
+	uint32_t sip_offset, *inline_data;
+	uint64_t engine;
+
+	intel_bb_add_intel_buf(ibb, target, true);
+	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
+	xe3p_fill_interface_descriptor(ibb, target, shdr->instr,
+				       4 * shdr->size, &idd);
+	idd.dw02.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
+	if (sip && sip->size)
+		sip_offset = fill_sip(ibb, sip->instr, 4 * sip->size);
+	else
+		sip_offset = 0;
+
+	intel_bb_ptr_set(ibb, 0);
+
+	intel_bb_out(ibb, GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
+		     PIPELINE_SELECT_GPGPU);
+	xe3p_emit_state_base_address(ibb);
+	xehp_emit_state_compute_mode(ibb, shdr->vrt != VRT_DISABLED);
+
+	if (sip_offset) {
+		struct drm_i915_gem_exec_object2 *object =
+			intel_bb_find_object(ibb, ibb->handle);
+		uint64_t ppgtt_bb_addr, sip_addr;
+
+		igt_assert(object);
+
+		/* get base batch buffer address. */
+		ppgtt_bb_addr = object->offset;
+
+		sip_addr = xe_canonical_va(ibb->fd, ppgtt_bb_addr + sip_offset);
+		emit_sip(ibb, sip_addr);
+	}
+
+	/* Inline data is at 32th dword of COMPUTE_WALKER_2 */
+	inline_data = intel_bb_ptr(ibb) + 4 * 32;
+	/* Pass a value of "SIMD_SIZE(16) * x_dim" as the argument for width */
+	xe3p_emit_compute_walk2(ibb, 0, 0, x_dim * 16, y_dim, &idd, x_dim * y_dim);
+	fill_inline_data(inline_data, xe_canonical_va(ibb->fd, target->addr.offset), target, x_dim);
+
+	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
+	intel_bb_ptr_align(ibb, 32);
+
+	engine = explicit_engine ? ring : I915_EXEC_DEFAULT;
+
+	intel_bb_exec(ibb, engine | I915_EXEC_NO_RELOC, false, true);
+}
+
 static void gpgpu_alloc_gpu_addr(struct intel_bb *ibb, struct intel_buf *target)
 {
-	uint64_t ahnd;
+        uint64_t ahnd;
 
-	ahnd = intel_allocator_open_vm_full(ibb->fd, ibb->vm_id, 0, 0, INTEL_ALLOCATOR_SIMPLE,
-					 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
-	target->addr.offset = intel_allocator_alloc(ahnd, target->handle,
-						    target->surface[0].size, 0);
-	intel_allocator_close(ahnd);
+        ahnd = intel_allocator_open_vm_full(ibb->fd, ibb->vm_id, 0, 0, INTEL_ALLOCATOR_SIMPLE,
+                                         ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+        target->addr.offset = intel_allocator_alloc(ahnd, target->handle,
+                                                    target->surface[0].size, 0);
+        intel_allocator_close(ahnd);
 }
 
 /**
@@ -257,7 +315,10 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
 	if (target->addr.offset == INTEL_BUF_INVALID_ADDRESS)
 		gpgpu_alloc_gpu_addr(ibb, target);
 
-	if (shdr->gen_ver >= 1250)
+	if (shdr->gen_ver >= 3500)
+		__xe3p_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
+				      ring, explicit_engine);
+	else if (shdr->gen_ver >= 1250)
 		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
 				      ring, explicit_engine);
 	else
diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
index 76a330ab50..5b943bc277 100644
--- a/lib/iga64_macros.h
+++ b/lib/iga64_macros.h
@@ -78,9 +78,12 @@
 #if GEN_VER < 3000
 #define LOAD_SPACE_DW(dst, src) send.tgm (1)	dst	src	null:0	0x0	0x62100003
 #define STORE_SPACE_DW(dst, src) send.tgm (1)	null	dst	null:0	0x0	0x64000007
-#else
+#elif GEN_VER < 3500
 #define LOAD_SPACE_DW(dst, src) send.ugm (1)	dst	src	null:0	0x0	0x2120003
 #define STORE_SPACE_DW(dst, src) send.ugm (1)	null	dst	src:1	0x0	0x2020007
+#else
+#define LOAD_SPACE_DW(dst, src) sendg.ugm (1)	dst	src:1	null:0	0x28003
+#define STORE_SPACE_DW(dst, src) sendg.ugm (1)	null	dst:1	src:1	0x28007
 #endif
 #endif
 
-- 
2.43.0

