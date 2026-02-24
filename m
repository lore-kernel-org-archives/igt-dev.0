Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11AAEFB815
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E8310E4E7;
	Tue, 24 Feb 2026 08:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eaZFCwmM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE12010E4E7
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771921687; x=1803457687;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GfyP9yRhdA04fwOaOsG5CArijy/Gcung6wIB8Rm01cg=;
 b=eaZFCwmMIgjgfFUaI6XCBneAZViyXqSWI5WIPp4EouF6zEoQ64HC1CjQ
 /oqzGCCMNHkMgfhGdG7pk3/sJWkZEiw5HYF34VJU+h8w8XPaaX2HjYESJ
 n03blre1eoIlzZaONwWo5ipP9YXSbsKtKhcNT9+6iwfTO23fyNv7BC+wa
 SqEGHL94eP063PXk1GBku9RL05rG2stS2alJpj7pRfieLH9Bt8LtVVlxR
 T2p3TWp9eAmdi3ivDUWnEaPT263vKIMUIF46hE7evQex6PMtRS02loOmt
 8XV+mYlK6E1hMhJ698yHsLA/x+lXCOm2IXg2I4GvuUg5cA3FN6BmJcvpG g==;
X-CSE-ConnectionGUID: 1RTkOl7eQmCIkCDfKYc4eA==
X-CSE-MsgGUID: kkP1X7GmQWKF/eWOYs8ePA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72904058"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72904058"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:28:07 -0800
X-CSE-ConnectionGUID: pN9djTDcTrylgfecebcysw==
X-CSE-MsgGUID: 6tm4v99zQPqeAM4CjpJ9Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="214088068"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2026 00:28:05 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 3/5] lib/gpgpu_shader: Add support for xe3p efficient
 64bit addressing
Date: Tue, 24 Feb 2026 13:57:58 +0530
Message-ID: <20260224082800.1581935-4-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224082800.1581935-1-priyanka.dandamudi@intel.com>
References: <20260224082800.1581935-1-priyanka.dandamudi@intel.com>
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

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/gpgpu_shader.c | 74 +++++++++++++++++++++++++++++++++++++++++-----
 lib/iga64_macros.h |  5 +++-
 2 files changed, 71 insertions(+), 8 deletions(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index abccb4808f..3e51932a26 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -218,15 +218,72 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
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
+		sip_addr = CANONICAL_57B(ppgtt_bb_addr + sip_offset);
+		emit_sip(ibb, sip_addr);
+	}
+
+	/* Inline data is at 32th dword of COMPUTE_WALKER_2 */
+	inline_data = intel_bb_ptr(ibb) + 4 * 32;
+	/* Pass a value of "SIMD_SIZE(16) * x_dim" as the argument for width */
+	xe3p_emit_compute_walk2(ibb, 0, 0, x_dim * 16, y_dim, &idd, x_dim * y_dim);
+	fill_inline_data(inline_data, CANONICAL_57B(target->addr.offset), target, x_dim);
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
@@ -257,7 +314,10 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
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

