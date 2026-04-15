Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15C1F433CE
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 22:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7AB10E1FA;
	Wed, 15 Apr 2026 22:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkNudEaU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A0910E1FA
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 22:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776290862; x=1807826862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F2hIt/JUfYJ3lGSql4CzUbJecNHLzIM8D38UxxEQCh8=;
 b=IkNudEaUttxFLUKdWL4lxul2acv3mw7eVB3R62r7CxpSvwVIvWC3xpvp
 XhhbFgltJPEre0dd+pDlOaa2NsU6f4sLiX22fVZ71Sg6405vNxG5+M4lV
 uBtY+V3CvLtCLpsXiFBiTwt67beu6mb1Twa6xNwVO+zkpjpv4WTJVctDx
 Ccpy2vIDB0ZFjzUh4KhlMJ9VHIEZiTksJcLORrdNqR7rS45boAdnPabGj
 8LwXwMskFcaFb5ZiM9JPA5qwlmrS4O2CkVYe7QfxZAlpXhmZAqU24BIJf
 nuHj8lVgRSjhE6xOoplcQST4Xo1yKKin+7wWExS7Gni7NardpvRaA/qYd Q==;
X-CSE-ConnectionGUID: 5NXpDMimSl2V9BORRh6/MQ==
X-CSE-MsgGUID: reu5rNn3SJ+Kpyl08GQHRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77397192"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77397192"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:41 -0700
X-CSE-ConnectionGUID: N4WqD+X4RQK3oO2HekdEFg==
X-CSE-MsgGUID: 68T/lKnZRNyvXztC/1ZmMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="234926133"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:40 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 07/10] lib/rendercopy: Convert vertex data and CC state to
 genxml
Date: Thu, 16 Apr 2026 00:07:17 +0200
Message-Id: <20260415220720.1594414-8-jan.maslak@intel.com>
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

Replace intel_bb_out() calls in vertex buffer, vertex element, and
color-calc state functions with igt_genxml_pack_state macros backed by
the genxml pack headers.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/rendercopy_gen9.c | 193 +++++++++++++++++++++++++-----------------
 1 file changed, 115 insertions(+), 78 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 9c5833a74..2379b6469 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -563,50 +563,62 @@ gen7_fill_vertex_buffer_data(struct intel_bb *ibb,
  */
 static void
 gen6_emit_vertex_elements(struct intel_bb *ibb) {
+	void *ve_ptr;
+
 	/*
 	 * The VUE layout
 	 *    dword 0-3: pad (0, 0, 0. 0)
 	 *    dword 4-7: position (x, y, 0, 1.0),
 	 *    dword 8-11: texture coordinate 0 (u0, v0, 0, 1.0)
 	 */
-	intel_bb_out(ibb, GEN4_3DSTATE_VERTEX_ELEMENTS | (3 * 2 + 1 - 2));
+	{
+		struct GFX9_3DSTATE_VERTEX_ELEMENTS ves = { GFX9_3DSTATE_VERTEX_ELEMENTS_header };
+		ves.DWordLength = 3 * GFX9_VERTEX_ELEMENT_STATE_length - 1;
+		GFX9_3DSTATE_VERTEX_ELEMENTS_pack(ibb, intel_bb_ptr(ibb), &ves);
+		intel_bb_ptr_add(ibb, 4);
+	}
 
-	/* Element state 0. These are 4 dwords of 0 required for the VUE format.
-	 * We don't really know or care what they do.
-	 */
-	intel_bb_out(ibb, 0 << GEN6_VE0_VERTEX_BUFFER_INDEX_SHIFT | GEN6_VE0_VALID |
-		     SURFACEFORMAT_R32G32B32A32_FLOAT << VE0_FORMAT_SHIFT |
-		     0 << VE0_OFFSET_SHIFT); /* we specify 0, but it's really does not exist */
-	intel_bb_out(ibb, GEN4_VFCOMPONENT_STORE_0 << VE1_VFCOMPONENT_0_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_0 << VE1_VFCOMPONENT_1_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_0 << VE1_VFCOMPONENT_2_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_0 << VE1_VFCOMPONENT_3_SHIFT);
-
-	/* Element state 1 - Our "destination" vertices. These are passed down
-	 * through the pipeline, and eventually make it to the pixel shader as
-	 * the offsets in the destination surface. It's packed as the 16
-	 * signed/scaled because of gen6 rendercopy. I see no particular reason
-	 * for doing this though.
-	 */
-	intel_bb_out(ibb, 0 << GEN6_VE0_VERTEX_BUFFER_INDEX_SHIFT | GEN6_VE0_VALID |
-		     SURFACEFORMAT_R16G16_SSCALED << VE0_FORMAT_SHIFT |
-		     0 << VE0_OFFSET_SHIFT); /* offsets vb in bytes */
-	intel_bb_out(ibb, GEN4_VFCOMPONENT_STORE_SRC << VE1_VFCOMPONENT_0_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_SRC << VE1_VFCOMPONENT_1_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_0 << VE1_VFCOMPONENT_2_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_1_FLT << VE1_VFCOMPONENT_3_SHIFT);
-
-	/* Element state 2. Last but not least we store the U,V components as
-	 * normalized floats. These will be used in the pixel shader to sample
-	 * from the source buffer.
-	 */
-	intel_bb_out(ibb, 0 << GEN6_VE0_VERTEX_BUFFER_INDEX_SHIFT | GEN6_VE0_VALID |
-		     SURFACEFORMAT_R32G32_FLOAT << VE0_FORMAT_SHIFT |
-		     4 << VE0_OFFSET_SHIFT);	/* offset vb in bytes */
-	intel_bb_out(ibb, GEN4_VFCOMPONENT_STORE_SRC << VE1_VFCOMPONENT_0_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_SRC << VE1_VFCOMPONENT_1_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_0 << VE1_VFCOMPONENT_2_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_1_FLT << VE1_VFCOMPONENT_3_SHIFT);
+	/* Element state 0. These are 4 dwords of 0 required for the VUE format. */
+	ve_ptr = intel_bb_ptr(ibb);
+	igt_genxml_pack_state(ibb, GFX9_VERTEX_ELEMENT_STATE, ve_ptr, ve0) {
+		ve0.VertexBufferIndex = 0;
+		ve0.Valid = true;
+		ve0.SourceElementFormat = SURFACEFORMAT_R32G32B32A32_FLOAT;
+		ve0.SourceElementOffset = 0;
+		ve0.Component0Control = GFX9_VFCOMP_STORE_0;
+		ve0.Component1Control = GFX9_VFCOMP_STORE_0;
+		ve0.Component2Control = GFX9_VFCOMP_STORE_0;
+		ve0.Component3Control = GFX9_VFCOMP_STORE_0;
+	}
+	intel_bb_ptr_add(ibb, GFX9_VERTEX_ELEMENT_STATE_length * 4);
+
+	/* Element state 1 - destination vertices (16-bit signed/scaled). */
+	ve_ptr = intel_bb_ptr(ibb);
+	igt_genxml_pack_state(ibb, GFX9_VERTEX_ELEMENT_STATE, ve_ptr, ve1) {
+		ve1.VertexBufferIndex = 0;
+		ve1.Valid = true;
+		ve1.SourceElementFormat = SURFACEFORMAT_R16G16_SSCALED;
+		ve1.SourceElementOffset = 0;
+		ve1.Component0Control = GFX9_VFCOMP_STORE_SRC;
+		ve1.Component1Control = GFX9_VFCOMP_STORE_SRC;
+		ve1.Component2Control = GFX9_VFCOMP_STORE_0;
+		ve1.Component3Control = GFX9_VFCOMP_STORE_1_FP;
+	}
+	intel_bb_ptr_add(ibb, GFX9_VERTEX_ELEMENT_STATE_length * 4);
+
+	/* Element state 2 - texture coordinates (normalized floats). */
+	ve_ptr = intel_bb_ptr(ibb);
+	igt_genxml_pack_state(ibb, GFX9_VERTEX_ELEMENT_STATE, ve_ptr, ve2) {
+		ve2.VertexBufferIndex = 0;
+		ve2.Valid = true;
+		ve2.SourceElementFormat = SURFACEFORMAT_R32G32_FLOAT;
+		ve2.SourceElementOffset = 4;
+		ve2.Component0Control = GFX9_VFCOMP_STORE_SRC;
+		ve2.Component1Control = GFX9_VFCOMP_STORE_SRC;
+		ve2.Component2Control = GFX9_VFCOMP_STORE_0;
+		ve2.Component3Control = GFX9_VFCOMP_STORE_1_FP;
+	}
+	intel_bb_ptr_add(ibb, GFX9_VERTEX_ELEMENT_STATE_length * 4);
 }
 
 /*
@@ -617,82 +629,107 @@ gen6_emit_vertex_elements(struct intel_bb *ibb) {
  */
 static void gen7_emit_vertex_buffer(struct intel_bb *ibb, uint32_t offset)
 {
-	intel_bb_out(ibb, GEN4_3DSTATE_VERTEX_BUFFERS | (1 + (4 * 1) - 2));
-	intel_bb_out(ibb, 0 << GEN6_VB0_BUFFER_INDEX_SHIFT | /* VB 0th index */
-		     GEN8_VB0_BUFFER_ADDR_MOD_EN | /* Address Modify Enable */
-		     VERTEX_SIZE << VB0_BUFFER_PITCH_SHIFT);
-	intel_bb_emit_reloc(ibb, ibb->handle,
-			    I915_GEM_DOMAIN_VERTEX, 0,
-			    offset, ibb->batch_offset);
-	intel_bb_out(ibb, 3 * VERTEX_SIZE);
+	void *vb_ptr;
+
+	/* Variable-length: 1 header dword + VERTEX_BUFFER_STATE element */
+	{
+		struct GFX9_3DSTATE_VERTEX_BUFFERS vbs = { GFX9_3DSTATE_VERTEX_BUFFERS_header };
+		/* Default DWordLength=3 is correct for 1 element (1 + 4 - 2 = 3) */
+		GFX9_3DSTATE_VERTEX_BUFFERS_pack(ibb, intel_bb_ptr(ibb), &vbs);
+		intel_bb_ptr_add(ibb, 4);
+	}
+
+	vb_ptr = intel_bb_ptr(ibb);
+	igt_genxml_pack_state(ibb, GFX9_VERTEX_BUFFER_STATE, vb_ptr, vb) {
+		vb.VertexBufferIndex = 0;
+		vb.AddressModifyEnable = true;
+		vb.MOCS = intel_get_wb_mocs(ibb->fd);
+		vb.BufferPitch = VERTEX_SIZE;
+		vb.BufferStartingAddress = (struct igt_address){
+			.offset = ibb->batch_offset + offset,
+			.handle = ibb->handle,
+			.read_domains = I915_GEM_DOMAIN_VERTEX,
+			.write_domain = 0,
+			.presumed_offset = ibb->batch_offset,
+		};
+		vb.BufferSize = 3 * VERTEX_SIZE;
+	}
+	intel_bb_ptr_add(ibb, GFX9_VERTEX_BUFFER_STATE_length * 4);
 }
 
 static uint32_t
 gen6_create_cc_state(struct intel_bb *ibb)
 {
-	struct gen6_color_calc_state *cc_state;
+	void *ptr = intel_bb_ptr_align(ibb, 64);
 
-	cc_state = intel_bb_ptr_align(ibb, 64);
+	igt_genxml_pack_state(ibb, GFX9_COLOR_CALC_STATE, ptr, cc_state) { }
 
-	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*cc_state));
+	return intel_bb_ptr_add_return_prev_offset(ibb,
+						   GFX9_COLOR_CALC_STATE_length * 4);
 }
 
 static uint32_t
 gen8_create_blend_state(struct intel_bb *ibb)
 {
-	struct gen8_blend_state *blend;
-	int i;
-
-	blend = intel_bb_ptr_align(ibb, 64);
+	void *ptr = intel_bb_ptr_align(ibb, 64);
 
-	for (i = 0; i < 16; i++) {
-		blend->bs[i].dest_blend_factor = GEN6_BLENDFACTOR_ZERO;
-		blend->bs[i].source_blend_factor = GEN6_BLENDFACTOR_ONE;
-		blend->bs[i].color_blend_func = GEN6_BLENDFUNCTION_ADD;
-		blend->bs[i].pre_blend_color_clamp = 1;
-		blend->bs[i].color_buffer_blend = 0;
+	/* Blend state header (1 dword) - all defaults (zeros) */
+	igt_genxml_pack_state(ibb, GFX9_BLEND_STATE, ptr, bs) { }
+	ptr += GFX9_BLEND_STATE_length * 4;
+
+	/* 16 per-RT blend state entries */
+	for (int i = 0; i < 16; i++) {
+		igt_genxml_pack_state(ibb, GFX9_BLEND_STATE_ENTRY, ptr, entry) {
+			entry.DestinationBlendFactor = GFX9_BLENDFACTOR_ZERO;
+			entry.SourceBlendFactor = GFX9_BLENDFACTOR_ONE;
+			entry.ColorBlendFunction = GFX9_BLENDFUNCTION_ADD;
+			entry.PreBlendColorClampEnable = true;
+		}
+		ptr += GFX9_BLEND_STATE_ENTRY_length * 4;
 	}
 
-	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*blend));
+	return intel_bb_ptr_add_return_prev_offset(ibb,
+		(GFX9_BLEND_STATE_length + 16 * GFX9_BLEND_STATE_ENTRY_length) * 4);
 }
 
 static uint32_t
 gen6_create_cc_viewport(struct intel_bb *ibb)
 {
-	struct gen4_cc_viewport *vp;
-
-	vp = intel_bb_ptr_align(ibb, 32);
+	void *ptr = intel_bb_ptr_align(ibb, 32);
 
-	/* XXX I don't understand this */
-	vp->min_depth = -1.e35;
-	vp->max_depth = 1.e35;
+	igt_genxml_pack_state(ibb, GFX9_CC_VIEWPORT, ptr, vp) {
+		vp.MinimumDepth = -1.e35;
+		vp.MaximumDepth = 1.e35;
+	}
 
-	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*vp));
+	return intel_bb_ptr_add_return_prev_offset(ibb,
+						   GFX9_CC_VIEWPORT_length * 4);
 }
 
 static uint32_t
 gen7_create_sf_clip_viewport(struct intel_bb *ibb) {
-	/* XXX these are likely not needed */
-	struct gen7_sf_clip_viewport *scv_state;
-
-	scv_state = intel_bb_ptr_align(ibb, 64);
+	void *ptr = intel_bb_ptr_align(ibb, 64);
 
-	scv_state->guardband.xmin = 0;
-	scv_state->guardband.xmax = 1.0f;
-	scv_state->guardband.ymin = 0;
-	scv_state->guardband.ymax = 1.0f;
+	igt_genxml_pack_state(ibb, GFX9_SF_CLIP_VIEWPORT, ptr, scv) {
+		scv.XMinClipGuardband = 0;
+		scv.XMaxClipGuardband = 1.0f;
+		scv.YMinClipGuardband = 0;
+		scv.YMaxClipGuardband = 1.0f;
+	}
 
-	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*scv_state));
+	return intel_bb_ptr_add_return_prev_offset(ibb,
+						   GFX9_SF_CLIP_VIEWPORT_length * 4);
 }
 
 static uint32_t
 gen6_create_scissor_rect(struct intel_bb *ibb)
 {
-	struct gen6_scissor_rect *scissor;
+	void *ptr = intel_bb_ptr_align(ibb, 64);
 
-	scissor = intel_bb_ptr_align(ibb, 64);
+	igt_genxml_pack_state(ibb, GFX9_SCISSOR_RECT, ptr, sr) { }
 
-	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*scissor));
+	return intel_bb_ptr_add_return_prev_offset(ibb,
+						   GFX9_SCISSOR_RECT_length * 4);
 }
 
 static void
-- 
2.34.1

