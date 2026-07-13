Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3975DC44507
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 13:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6F010E5D2;
	Mon, 13 Jul 2026 13:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7pPWb17";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582BB10E5DF
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 13:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783949903; x=1815485903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qxe9XRUPtfH7IXmy2eGpyVXPDo1E+1ys1oAZ08LLTlk=;
 b=U7pPWb17xdDOYdp0/ApUiDfCvMEiwagzizRGOalkWtNC/QWStm5rMRCB
 NLCqwiyglqBk0mIdwRVV2we6l/+/SIZtAInYX3dtXSFR+rdIaFj7dPg57
 DoWDoceBW3qdRZRr0u/kVAfUleE4ajflCIMeIB+jhITYvtiXS2znXYDWx
 1Dl48DdSDQJ5TYHkWedSAc/OMM0DGpR9v0ut1AjdL+mHTjOkTcH0JIyDz
 qOE1ff6Y4w6DHBhPfE10rYdJ0AeitK6YFYwVM6loaHpFdlU8ac8UEfagu
 bXwTyCYHMGTq6/OLIHTBewbw4UeKmfOajNDoIMaYLSr24SbDREQ82zV3H w==;
X-CSE-ConnectionGUID: AWVEJcc2TQqfHUW+00FDqA==
X-CSE-MsgGUID: z/XExol8TmGkWEPAuqnS6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87101719"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87101719"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 06:38:23 -0700
X-CSE-ConnectionGUID: y1815aCoSU+C7eRF4pCfoQ==
X-CSE-MsgGUID: iqtxDWbqTtGW9Idu0Iazog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="285639146"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 06:38:23 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v6 09/11] lib/rendercopy: Convert pipeline emit commands to
 genxml
Date: Mon, 13 Jul 2026 15:37:44 +0200
Message-ID: <20260713133746.453051-10-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713133746.453051-1-jan.maslak@intel.com>
References: <20260713133746.453051-1-jan.maslak@intel.com>
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

Replace intel_bb_out() calls in state-base-address, URB, shader stage,
and draw-state emit functions with igt_genxml_emit macros backed by the
genxml pack headers.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/rendercopy_gen9.c | 542 +++++++++++++++++-------------------------
 1 file changed, 223 insertions(+), 319 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 881ab73b55..b20b128c48 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -22,7 +22,6 @@
 #include "intel_mocs.h"
 #include "rendercopy.h"
 #include "surfaceformat.h"
-#include "xe2_render.h"
 #include "intel_reg.h"
 #include "igt_aux.h"
 #include "intel_chipset.h"
@@ -755,81 +754,80 @@ gen6_create_scissor_rect(struct intel_bb *ibb)
 
 static void
 gen8_emit_sip(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN4_STATE_SIP | (3 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_STATE_SIP, sip) {
+		/* SystemInstructionPointer left as zero */
+	}
 }
 
 static void
 gen7_emit_push_constants(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN7_3DSTATE_PUSH_CONSTANT_ALLOC_VS);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, GEN8_3DSTATE_PUSH_CONSTANT_ALLOC_HS);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, GEN8_3DSTATE_PUSH_CONSTANT_ALLOC_DS);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, GEN8_3DSTATE_PUSH_CONSTANT_ALLOC_GS);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, GEN7_3DSTATE_PUSH_CONSTANT_ALLOC_PS);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_PUSH_CONSTANT_ALLOC_VS, vs) { }
+	igt_genxml_emit(ibb, GFX9_3DSTATE_PUSH_CONSTANT_ALLOC_HS, hs) { }
+	igt_genxml_emit(ibb, GFX9_3DSTATE_PUSH_CONSTANT_ALLOC_DS, ds) { }
+	igt_genxml_emit(ibb, GFX9_3DSTATE_PUSH_CONSTANT_ALLOC_GS, gs) { }
+	igt_genxml_emit(ibb, GFX9_3DSTATE_PUSH_CONSTANT_ALLOC_PS, ps) { }
 }
 
+/*
+ * IGT_SBA_COMMON - shared STATE_BASE_ADDRESS fields across gen9/gen11/gen125.
+ * All three variants have identical field names for the fields we set.
+ */
+#define IGT_SBA_COMMON(sba, mocs_val, surf, dyn, inst)                     \
+	do {                                                               \
+		sba.GeneralStateBaseAddressModifyEnable = true;            \
+		sba.GeneralStateMOCS = (mocs_val);                         \
+		sba.StatelessDataPortAccessMOCS = (mocs_val);              \
+		sba.SurfaceStateBaseAddressModifyEnable = true;            \
+		sba.SurfaceStateMOCS = (mocs_val);                         \
+		sba.SurfaceStateBaseAddress = (surf);                      \
+		sba.DynamicStateBaseAddressModifyEnable = true;            \
+		sba.DynamicStateMOCS = (mocs_val);                         \
+		sba.DynamicStateBaseAddress = (dyn);                       \
+		sba.IndirectObjectMOCS = (mocs_val);                       \
+		sba.InstructionBaseAddressModifyEnable = true;             \
+		sba.InstructionMOCS = (mocs_val);                          \
+		sba.InstructionBaseAddress = (inst);                       \
+		sba.GeneralStateBufferSizeModifyEnable = true;             \
+		sba.GeneralStateBufferSize = 0xfffff;                      \
+		sba.DynamicStateBufferSizeModifyEnable = true;             \
+		sba.DynamicStateBufferSize = 1;                            \
+		sba.IndirectObjectBufferSizeModifyEnable = true;           \
+		sba.IndirectObjectBufferSize = 0xfffff;                    \
+		sba.InstructionBuffersizeModifyEnable = true;              \
+		sba.InstructionBufferSize = 1;                             \
+		sba.BindlessSurfaceStateMOCS = (mocs_val);                 \
+	} while (0)
+
 static void
 gen9_emit_state_base_address(struct intel_bb *ibb) {
+	uint8_t mocs = intel_get_wb_mocs(ibb->fd);
 
-	/* WaBindlessSurfaceStateModifyEnable:skl,bxt */
-	/* The length has to be one less if we dont modify
-	   bindless state */
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
-		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | 20);
-	else
-		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | (19 - 1 - 2));
-
-	/* general */
-	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);
-	intel_bb_out(ibb, 0);
-
-	/* stateless data port */
-	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);
-
-	/* surface */
-	intel_bb_emit_reloc(ibb, ibb->handle,
-			    I915_GEM_DOMAIN_SAMPLER, 0,
-			    BASE_ADDRESS_MODIFY, ibb->batch_offset);
-
-	/* dynamic */
-	intel_bb_emit_reloc(ibb, ibb->handle,
-			    I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0,
-			    BASE_ADDRESS_MODIFY, ibb->batch_offset);
-
-	/* indirect */
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	struct igt_address surf_base =
+		igt_address_of_batch(ibb, I915_GEM_DOMAIN_SAMPLER, 0);
+	struct igt_address dyn_base =
+		igt_address_of_batch(ibb,
+				     I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0);
+	struct igt_address inst_base =
+		igt_address_of_batch(ibb, I915_GEM_DOMAIN_INSTRUCTION, 0);
 
-	/* instruction */
-	intel_bb_emit_reloc(ibb, ibb->handle,
-			    I915_GEM_DOMAIN_INSTRUCTION, 0,
-			    BASE_ADDRESS_MODIFY, ibb->batch_offset);
-
-	/* general state buffer size */
-	intel_bb_out(ibb, 0xfffff000 | 1);
-	/* dynamic state buffer size */
-	intel_bb_out(ibb, 1 << 12 | 1);
-	/* indirect object buffer size */
-	intel_bb_out(ibb, 0xfffff000 | 1);
-	/* intruction buffer size */
-	intel_bb_out(ibb, 1 << 12 | 1);
-
-	/* Bindless surface state base address */
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
-		/* Bindless sampler */
-		intel_bb_out(ibb, 0);
-		intel_bb_out(ibb, 0);
-		intel_bb_out(ibb, 0);
+	if (HAS_4TILE(ibb->devid) || intel_gen(ibb->devid) > 12) {
+		igt_genxml_emit(ibb, GFX125_STATE_BASE_ADDRESS, sba) {
+			IGT_SBA_COMMON(sba, mocs, surf_base, dyn_base, inst_base);
+			/* WBP (0) and UC (1) are marked dont_use in the XML for this field. */
+			sba.L1CacheControl = GFX125_L1CC_WB;
+			sba.BindlessSamplerStateBaseAddressModifyEnable = true;
+			sba.BindlessSamplerStateMOCS = mocs;
+		}
+	} else if (intel_gen(ibb->devid) >= 11) {
+		igt_genxml_emit(ibb, GFX11_STATE_BASE_ADDRESS, sba) {
+			IGT_SBA_COMMON(sba, mocs, surf_base, dyn_base, inst_base);
+			sba.BindlessSamplerStateBaseAddressModifyEnable = true;
+			sba.BindlessSamplerStateMOCS = mocs;
+		}
+	} else {
+		igt_genxml_emit(ibb, GFX9_STATE_BASE_ADDRESS, sba) {
+			IGT_SBA_COMMON(sba, mocs, surf_base, dyn_base, inst_base);
+		}
 	}
 }
 
@@ -840,184 +838,119 @@ gen7_emit_urb(struct intel_bb *ibb) {
 	const int vs_size = 2;
 	const int vs_start = 4;
 
-	intel_bb_out(ibb, GEN7_3DSTATE_URB_VS);
-	intel_bb_out(ibb, vs_entries | ((vs_size - 1) << 16) | (vs_start << 25));
-	intel_bb_out(ibb, GEN7_3DSTATE_URB_GS);
-	intel_bb_out(ibb, vs_start << 25);
-	intel_bb_out(ibb, GEN7_3DSTATE_URB_HS);
-	intel_bb_out(ibb, vs_start << 25);
-	intel_bb_out(ibb, GEN7_3DSTATE_URB_DS);
-	intel_bb_out(ibb, vs_start << 25);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_URB_VS, urb) {
+		urb.VSNumberofURBEntries = vs_entries;
+		urb.VSURBEntryAllocationSize = vs_size - 1;
+		urb.VSURBStartingAddress = vs_start;
+	}
+	igt_genxml_emit(ibb, GFX9_3DSTATE_URB_GS, urb) {
+		urb.GSURBStartingAddress = vs_start;
+	}
+	igt_genxml_emit(ibb, GFX9_3DSTATE_URB_HS, urb) {
+		urb.HSURBStartingAddress = vs_start;
+	}
+	igt_genxml_emit(ibb, GFX9_3DSTATE_URB_DS, urb) {
+		urb.DSURBStartingAddress = vs_start;
+	}
 }
 
 static void
 gen8_emit_cc(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN7_3DSTATE_BLEND_STATE_POINTERS);
-	intel_bb_out(ibb, cc.blend_state | 1);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_BLEND_STATE_POINTERS, bsp) {
+		bsp.BlendStatePointer = cc.blend_state;
+		bsp.BlendStatePointerValid = true;
+	}
 
-	intel_bb_out(ibb, GEN6_3DSTATE_CC_STATE_POINTERS);
-	intel_bb_out(ibb, cc.cc_state | 1);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CC_STATE_POINTERS, ccp) {
+		ccp.ColorCalcStatePointer = cc.cc_state;
+		ccp.ColorCalcStatePointerValid = true;
+	}
 }
 
 static void
 gen8_emit_multisample(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN8_3DSTATE_MULTISAMPLE | 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_MULTISAMPLE, ms) { }
 
-	intel_bb_out(ibb, GEN6_3DSTATE_SAMPLE_MASK);
-	intel_bb_out(ibb, 1);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SAMPLE_MASK, sm) {
+		sm.SampleMask = 1;
+	}
 }
 
 static void
 gen8_emit_vs(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN6_3DSTATE_CONSTANT_VS | (11-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CONSTANT_VS, cvs) {
+		cvs.MOCS = intel_get_wb_mocs(ibb->fd);
+	}
 
-	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_VS);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POINTERS_VS, bt) { }
 
-	intel_bb_out(ibb, GEN7_3DSTATE_SAMPLER_STATE_POINTERS_VS);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SAMPLER_STATE_POINTERS_VS, sp) { }
 
-	intel_bb_out(ibb, GEN6_3DSTATE_VS | (9-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_VS, vs) { }
 }
 
 static void
 gen8_emit_hs(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN7_3DSTATE_CONSTANT_HS | (11-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CONSTANT_HS, chs) {
+		chs.MOCS = intel_get_wb_mocs(ibb->fd);
+	}
 
-	intel_bb_out(ibb, GEN7_3DSTATE_HS | (9-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	if (intel_gen(ibb->devid) >= 20)
+		igt_genxml_emit(ibb, GFX20_3DSTATE_HS, hs) { }
+	else
+		igt_genxml_emit(ibb, GFX9_3DSTATE_HS, hs) { }
 
-	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_HS);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POINTERS_HS, bt) { }
 
-	intel_bb_out(ibb, GEN8_3DSTATE_SAMPLER_STATE_POINTERS_HS);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SAMPLER_STATE_POINTERS_HS, sp) { }
 }
 
 static void
 gen8_emit_gs(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN6_3DSTATE_CONSTANT_GS | (11-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CONSTANT_GS, cgs) {
+		cgs.MOCS = intel_get_wb_mocs(ibb->fd);
+	}
 
-	intel_bb_out(ibb, GEN6_3DSTATE_GS | (10-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_GS, gs) { }
 
-	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_GS);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POINTERS_GS, bt) { }
 
-	intel_bb_out(ibb, GEN7_3DSTATE_SAMPLER_STATE_POINTERS_GS);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SAMPLER_STATE_POINTERS_GS, sp) { }
 }
 
 static void
 gen9_emit_ds(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN7_3DSTATE_CONSTANT_DS | (11-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CONSTANT_DS, cds) {
+		cds.MOCS = intel_get_wb_mocs(ibb->fd);
+	}
 
-	intel_bb_out(ibb, GEN7_3DSTATE_DS | (11-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_DS, ds) { }
 
-	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_DS);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POINTERS_DS, bt) { }
 
-	intel_bb_out(ibb, GEN8_3DSTATE_SAMPLER_STATE_POINTERS_DS);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SAMPLER_STATE_POINTERS_DS, sp) { }
 }
 
 
 static void
 gen8_emit_wm_hz_op(struct intel_bb *ibb) {
 	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
-		intel_bb_out(ibb, GEN8_3DSTATE_WM_HZ_OP | (6-2));
-		intel_bb_out(ibb, 0);
+		igt_genxml_emit(ibb, GFX20_3DSTATE_WM_HZ_OP, hz) { }
 	} else {
-		intel_bb_out(ibb, GEN8_3DSTATE_WM_HZ_OP | (5-2));
+		igt_genxml_emit(ibb, GFX9_3DSTATE_WM_HZ_OP, hz) { }
 	}
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
 }
 
 static void
 gen8_emit_null_state(struct intel_bb *ibb) {
 	gen8_emit_wm_hz_op(ibb);
 	gen8_emit_hs(ibb);
-	intel_bb_out(ibb, GEN7_3DSTATE_TE | (4-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+
+	if (intel_gen(ibb->devid) >= 12)
+		igt_genxml_emit(ibb, GFX12_3DSTATE_TE, te) { }
+	else
+		igt_genxml_emit(ibb, GFX9_3DSTATE_TE, te) { }
+
 	gen8_emit_gs(ibb);
 	gen9_emit_ds(ibb);
 	gen8_emit_vs(ibb);
@@ -1025,137 +958,109 @@ gen8_emit_null_state(struct intel_bb *ibb) {
 
 static void
 gen7_emit_clip(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN6_3DSTATE_CLIP | (4 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0); /*  pass-through */
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CLIP, clip) {
+		/* All fields zero = pass-through */
+	}
 }
 
 static void
 gen8_emit_sf(struct intel_bb *ibb)
 {
-	int i;
-
-	intel_bb_out(ibb, GEN7_3DSTATE_SBE | (6 - 2));
-	intel_bb_out(ibb, 1 << GEN7_SBE_NUM_OUTPUTS_SHIFT |
-		     GEN8_SBE_FORCE_URB_ENTRY_READ_LENGTH |
-		     GEN8_SBE_FORCE_URB_ENTRY_READ_OFFSET |
-		     1 << GEN7_SBE_URB_ENTRY_READ_LENGTH_SHIFT |
-		     1 << GEN8_SBE_URB_ENTRY_READ_OFFSET_SHIFT);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, GEN9_SBE_ACTIVE_COMPONENT_XYZW << 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SBE, sbe) {
+		sbe.NumberofSFOutputAttributes = 1;
+		sbe.ForceVertexURBEntryReadLength = true;
+		sbe.ForceVertexURBEntryReadOffset = true;
+		sbe.VertexURBEntryReadLength = 1;
+		sbe.VertexURBEntryReadOffset = 1;
+		sbe.AttributeActiveComponentFormat[0] = GFX9_ACTIVE_COMPONENT_XYZW;
+	}
 
-	intel_bb_out(ibb, GEN8_3DSTATE_SBE_SWIZ | (11 - 2));
-	for (i = 0; i < 8; i++)
-		intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SBE_SWIZ, swiz) { }
 
-	intel_bb_out(ibb, GEN8_3DSTATE_RASTER | (5 - 2));
-	intel_bb_out(ibb, GEN8_RASTER_FRONT_WINDING_CCW | GEN8_RASTER_CULL_NONE);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_RASTER, raster) {
+		raster.FrontWinding = 1; /* CCW */
+		raster.CullMode = GFX9_CULLMODE_NONE;
+	}
 
-	intel_bb_out(ibb, GEN6_3DSTATE_SF | (4 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SF, sf) { }
 }
 
 static void
 gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	const int max_threads = 63;
 
-	intel_bb_out(ibb, GEN6_3DSTATE_WM | (2 - 2));
-	intel_bb_out(ibb, /* XXX: I don't understand the BARYCENTRIC stuff, but it
-		   * appears we need it to put our setup data in the place we
-		   * expect (g6, see below) */
-		     GEN8_3DSTATE_PS_PERSPECTIVE_PIXEL_BARYCENTRIC);
-
-	intel_bb_out(ibb, GEN6_3DSTATE_CONSTANT_PS | (11-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_WM, wm) {
+		wm.BarycentricInterpolationMode = GFX9_BIM_PERSPECTIVE_PIXEL;
+	}
 
-	intel_bb_out(ibb, GEN7_3DSTATE_PS | (12-2));
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
-		intel_bb_out(ibb, kernel | 1);
-	else
-		intel_bb_out(ibb, kernel);
-	intel_bb_out(ibb, 0); /* kernel hi */
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CONSTANT_PS, cps) {
+		cps.MOCS = intel_get_wb_mocs(ibb->fd);
+	}
 
-	if (fast_clear)
-		intel_bb_out(ibb, 1 <<  GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT);
-	else
-		intel_bb_out(ibb, 1 << GEN6_3DSTATE_WM_SAMPLER_COUNT_SHIFT |
-		             2 << GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT);
-
-	intel_bb_out(ibb, 0); /* scratch space stuff */
-	intel_bb_out(ibb, 0); /* scratch hi */
-	intel_bb_out(ibb, (max_threads - 1) << GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
-	             GEN6_3DSTATE_WM_16_DISPATCH_ENABLE |
-	             (fast_clear ? GEN8_3DSTATE_FAST_CLEAR_ENABLE : 0));
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
-		intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT |
-			     GENXE_KERNEL0_POLY_PACK16_FIXED << GENXE_KERNEL0_PACKING_POLICY);
-	else
-		intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT);
-	intel_bb_out(ibb, 0); // kernel 1
-	intel_bb_out(ibb, 0); /* kernel 1 hi */
-	intel_bb_out(ibb, 0); // kernel 2
-	intel_bb_out(ibb, 0); /* kernel 2 hi */
+	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
+		igt_genxml_emit(ibb, GFX20_3DSTATE_PS, ps) {
+			ps.KernelStartPointer0 = kernel;
+			ps.Kernel0Enable = true;
+			ps.BindingTableEntryCount = fast_clear ? 1 : 2;
+			ps.SamplerCount = fast_clear ? 0 : 1;
+			ps.Kernel0SIMDWidth = GFX20_PS_SIMD16;
+			ps.RenderTargetFastClearEnable = fast_clear;
+			ps.MaximumNumberofThreadsPerPSD = max_threads - 1;
+			ps.DispatchGRFStartRegisterForConstantSetupData0 = 6;
+			ps.Kernel0PolyPackingPolicy = GFX20_POLY_PACK16_FIXED;
+		}
+	} else {
+		igt_genxml_emit(ibb, GFX9_3DSTATE_PS, ps) {
+			ps.KernelStartPointer0 = kernel;
+			ps.BindingTableEntryCount = fast_clear ? 1 : 2;
+			ps.SamplerCount = fast_clear ? 0 : 1;
+			ps._16PixelDispatchEnable = true;
+			ps.RenderTargetFastClearEnable = fast_clear;
+			ps.MaximumNumberofThreadsPerPSD = max_threads - 1;
+			ps.DispatchGRFStartRegisterForConstantSetupData0 = 6;
+		}
+	}
 
-	intel_bb_out(ibb, GEN8_3DSTATE_PS_BLEND | (2 - 2));
-	intel_bb_out(ibb, GEN8_PS_BLEND_HAS_WRITEABLE_RT);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_PS_BLEND, blend) {
+		blend.HasWriteableRT = true;
+	}
 
-	intel_bb_out(ibb, GEN8_3DSTATE_PS_EXTRA | (2 - 2));
-	intel_bb_out(ibb, GEN8_PSX_PIXEL_SHADER_VALID | GEN8_PSX_ATTRIBUTE_ENABLE);
+	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
+		igt_genxml_emit(ibb, GFX20_3DSTATE_PS_EXTRA, extra) {
+			extra.PixelShaderValid = true;
+		}
+	} else {
+		igt_genxml_emit(ibb, GFX9_3DSTATE_PS_EXTRA, extra) {
+			extra.PixelShaderValid = true;
+			extra.AttributeEnable = true;
+		}
+	}
 }
 
 static void
 gen9_emit_depth(struct intel_bb *ibb)
 {
-	bool need_10dw = HAS_4TILE(ibb->devid);
+	uint8_t mocs = intel_get_wb_mocs(ibb->fd);
 
-	intel_bb_out(ibb, GEN8_3DSTATE_WM_DEPTH_STENCIL | (4 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_WM_DEPTH_STENCIL, wds) { }
 
-	intel_bb_out(ibb, GEN7_3DSTATE_DEPTH_BUFFER | (need_10dw ? (10-2) : (8-2)));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	if (need_10dw) {
-		intel_bb_out(ibb, 0);
-		intel_bb_out(ibb, 0);
+	if (HAS_4TILE(ibb->devid)) {
+		igt_genxml_emit(ibb, GFX125_3DSTATE_DEPTH_BUFFER, db) {
+			db.MOCS = mocs;
+		}
+	} else {
+		igt_genxml_emit(ibb, GFX9_3DSTATE_DEPTH_BUFFER, db) {
+			db.MOCS = mocs;
+		}
 	}
 
-	intel_bb_out(ibb, GEN8_3DSTATE_HIER_DEPTH_BUFFER | (5-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_HIER_DEPTH_BUFFER, hdb) {
+		hdb.MOCS = mocs;
+	}
 
-	intel_bb_out(ibb, GEN8_3DSTATE_STENCIL_BUFFER | (5-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_STENCIL_BUFFER, sb) {
+		sb.MOCS = mocs;
+	}
 }
 
 static void
@@ -1163,46 +1068,45 @@ gen7_emit_clear(struct intel_bb *ibb) {
 	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
 		return;
 
-	intel_bb_out(ibb, GEN7_3DSTATE_CLEAR_PARAMS | (3-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 1); // clear valid
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CLEAR_PARAMS, cp) {
+		cp.DepthClearValueValid = true;
+	}
 }
 
 static void
 gen6_emit_drawing_rectangle(struct intel_bb *ibb, const struct intel_buf *dst)
 {
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
-		intel_bb_out(ibb, GENXE2_3DSTATE_DRAWING_RECTANGLE_FAST | (4 - 2));
-	else
-		intel_bb_out(ibb, GEN4_3DSTATE_DRAWING_RECTANGLE | (4 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, (intel_buf_height(dst) - 1) << 16 | (intel_buf_width(dst) - 1));
-	intel_bb_out(ibb, 0);
+	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
+		igt_genxml_emit(ibb, GFX20_3DSTATE_DRAWING_RECTANGLE_FAST, dr) {
+			dr.ClippedDrawingRectangleXMax = intel_buf_width(dst) - 1;
+			dr.ClippedDrawingRectangleYMax = intel_buf_height(dst) - 1;
+		}
+	} else {
+		igt_genxml_emit(ibb, GFX9_3DSTATE_DRAWING_RECTANGLE, dr) {
+			dr.ClippedDrawingRectangleXMax = intel_buf_width(dst) - 1;
+			dr.ClippedDrawingRectangleYMax = intel_buf_height(dst) - 1;
+		}
+	}
 }
 
 static void gen8_emit_vf_topology(struct intel_bb *ibb)
 {
-	intel_bb_out(ibb, GEN8_3DSTATE_VF_TOPOLOGY);
-	intel_bb_out(ibb, _3DPRIM_RECTLIST);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_VF_TOPOLOGY, vft) {
+		vft.PrimitiveTopologyType = GFX9_3DPRIM_RECTLIST;
+	}
 }
 
 /* Vertex elements MUST be defined before this according to spec */
 static void gen8_emit_primitive(struct intel_bb *ibb, uint32_t offset)
 {
-	intel_bb_out(ibb, GEN8_3DSTATE_VF | (2 - 2));
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_VF, vf) { }
 
-	intel_bb_out(ibb, GEN8_3DSTATE_VF_INSTANCING | (3 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_VF_INSTANCING, vfi) { }
 
-	intel_bb_out(ibb, GEN4_3DPRIMITIVE | (7-2));
-	intel_bb_out(ibb, 0);	/* gen8+ ignore the topology type field */
-	intel_bb_out(ibb, 3);	/* vertex count */
-	intel_bb_out(ibb, 0);	/*  We're specifying this instead with offset in GEN6_3DSTATE_VERTEX_BUFFERS */
-	intel_bb_out(ibb, 1);	/* single instance */
-	intel_bb_out(ibb, 0);	/* start instance location */
-	intel_bb_out(ibb, 0);	/* index buffer offset, ignored */
+	igt_genxml_emit(ibb, GFX9_3DPRIMITIVE, prim) {
+		prim.VertexCountPerInstance = 3;
+		prim.InstanceCount = 1;
+	}
 }
 
 #define PIPE_CONTROL_RENDER_TARGET_FLUSH    (1 << 12)
-- 
2.43.0

