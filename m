Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B33F433CE
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 22:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC9010E1FA;
	Wed, 15 Apr 2026 22:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBkeW7my";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E188B10E750
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 22:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776290864; x=1807826864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fokxeGFmrfS8wQ8iSKOFuEkK3WrE/LRDAu0q6XFhSfs=;
 b=BBkeW7myLvhvMZMrj7+rN1PxrdL7XmHEBwkuI6wvKAlUlFVdEKE/l/IQ
 H9ewIH6sgqRccIHR5qxy1IYUajZcvV3oFPzTs9Uu+78mCc9JNXNrxgCrN
 6dcVZKC4xiYpUgZj4XM6BjH7jcIr9lcnZc3FOoRSx8EdS7FW9K4D8Skhb
 mLLqBpAHYn0JPMT98EAq1iJY4guvL2xyvtKLjNVEhev86b9eixL4dTZp3
 TnI1lMHMg+OuUT/syjw2JAhyXUYM8adSqxn2k7EfHsT+EGcST1QUcQ2k2
 +JbXV3A/Z2zcwDn4ruum4QtIRX6/WJqbawfsllrImlJIGkzoL4yaVsInM g==;
X-CSE-ConnectionGUID: FlQwkBLOSgmfRzY10QnLHQ==
X-CSE-MsgGUID: XTlBw2DGTbyXJB4BSKrN9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77397199"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77397199"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:44 -0700
X-CSE-ConnectionGUID: cXeTiDZHRB+9Xpax8QQ7Rw==
X-CSE-MsgGUID: fdH75u8MRvS7ZaTKWaz31A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="234926147"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:43 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 09/10] lib/rendercopy: Convert render op and entry points to
 genxml
Date: Thu, 16 Apr 2026 00:07:19 +0200
Message-Id: <20260415220720.1594414-10-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415220720.1594414-1-jan.maslak@intel.com>
References: <20260415220720.1594414-1-jan.maslak@intel.com>
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

Update _gen9_render_op() and the public render/clear entry points to use
igt_genxml_emit macros backed by the genxml pack headers.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/rendercopy_gen9.c | 52 +++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 1c3eff217..295c5cae5 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -1218,8 +1218,13 @@ void _gen9_render_op(struct intel_bb *ibb,
 
 	/* Start emitting the commands. The order roughly follows the mesa blorp
 	 * order */
-	intel_bb_out(ibb, G4X_PIPELINE_SELECT | PIPELINE_SELECT_3D |
-		     GEN9_PIPELINE_SELECTION_MASK);
+	igt_genxml_emit(ibb, GFX9_PIPELINE_SELECT, ps) {
+		ps.PipelineSelection = GFX9_3D;
+		/* MaskBits 15:8 is a write-enable mask for bits 5:4 (Force Media
+		 * Awake and Media Sampler DOP Clock Gate Enable).  Value 0x3
+		 * enables writes to both bits so PipelineSelection takes effect. */
+		ps.MaskBits = 3;
+	}
 
 	gen12_emit_aux_pgtable_state(ibb, aux_pgtable_state, true);
 
@@ -1250,17 +1255,21 @@ void _gen9_render_op(struct intel_bb *ibb,
 	gen9_emit_state_base_address(ibb);
 
 	if (HAS_4TILE(ibb->devid) || intel_gen(ibb->devid) > 12) {
-		intel_bb_out(ibb, GEN4_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2);
-		intel_bb_emit_reloc(ibb, ibb->handle,
-				    I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0,
-				    0, ibb->batch_offset);
-		intel_bb_out(ibb, 1 << 12);
+		igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POOL_ALLOC, btpa) {
+			btpa.MOCS = intel_get_wb_mocs(ibb->fd);
+			btpa.BindingTablePoolBaseAddress =
+				igt_address_of_batch(ibb,
+					I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0);
+			btpa.BindingTablePoolBufferSize = 1;
+		}
 	}
 
-	intel_bb_out(ibb, GEN7_3DSTATE_VIEWPORT_STATE_POINTERS_CC);
-	intel_bb_out(ibb, viewport.cc_state);
-	intel_bb_out(ibb, GEN8_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP);
-	intel_bb_out(ibb, viewport.sf_clip_state);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_VIEWPORT_STATE_POINTERS_CC, vp) {
+		vp.CCViewportPointer = viewport.cc_state;
+	}
+	igt_genxml_emit(ibb, GFX9_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP, vp) {
+		vp.SFClipViewportPointer = viewport.sf_clip_state;
+	}
 
 	gen7_emit_urb(ibb);
 
@@ -1270,11 +1279,7 @@ void _gen9_render_op(struct intel_bb *ibb,
 
 	gen8_emit_null_state(ibb);
 
-	intel_bb_out(ibb, GEN7_3DSTATE_STREAMOUT | (5 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_STREAMOUT, so) { }
 
 	gen7_emit_clip(ibb);
 
@@ -1282,14 +1287,17 @@ void _gen9_render_op(struct intel_bb *ibb,
 
 	gen8_emit_ps(ibb, ps_kernel_off, fast_clear);
 
-	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_PS);
-	intel_bb_out(ibb, ps_binding_table);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POINTERS_PS, bt) {
+		bt.PointertoPSBindingTable = ps_binding_table;
+	}
 
-	intel_bb_out(ibb, GEN7_3DSTATE_SAMPLER_STATE_POINTERS_PS);
-	intel_bb_out(ibb, ps_sampler_state);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SAMPLER_STATE_POINTERS_PS, sp) {
+		sp.PointertoPSSamplerState = ps_sampler_state;
+	}
 
-	intel_bb_out(ibb, GEN8_3DSTATE_SCISSOR_STATE_POINTERS);
-	intel_bb_out(ibb, scissor_state);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SCISSOR_STATE_POINTERS, ssp) {
+		ssp.ScissorRectPointer = scissor_state;
+	}
 
 	gen9_emit_depth(ibb);
 
-- 
2.34.1

