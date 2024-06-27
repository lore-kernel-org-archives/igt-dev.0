Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA64C3064D
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 11:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C91910EA82;
	Thu, 27 Jun 2024 11:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxZfuiIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEB710EA73
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 11:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719487342; x=1751023342;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tz2PO0UWyHmypjpIZwpNodJgUs9yyc0dcGI0RHmpVr8=;
 b=fxZfuiIzG3d9yYovHliPGr0O2LCMh1zNyJn7Z+/XMCF+CuDHsKbsDVUk
 LCG2dZUwjcf+R0pf8eHDPOxfNS8Ke4TSooI7r4aCY5+R/a3AHixxwLQl6
 SXc+CiQ/DTeMeN6AVzYt3zKuCQeMtnmKskBgTn5X0CSPHj4INMycTpKHC
 cE/7aWCMKGjWjpgwu3yolqxqMfa8ujbkfSbTzjfvhVZ7iw0Emggh4M8JR
 eLdfuAvkMy6xinQ8kujRVnCUMnYb205l9U3s6ywBmjmxgsB9XLLagy2eA
 Q+mq+CwPnfmgJmfYGGk/CphYsPZMdeFo60zxwDSbcE3vOaKGh4yUhiFpK A==;
X-CSE-ConnectionGUID: urLIdpTwS8KWZ+RlGNKnBw==
X-CSE-MsgGUID: MxpIfasoQkyKIEqPMFlp0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27745144"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="27745144"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 04:22:21 -0700
X-CSE-ConnectionGUID: aW/InehlSY+0QTfy97V+Iw==
X-CSE-MsgGUID: dWDNrUgsSJyU66LJEOrZuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="44312258"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 27 Jun 2024 04:22:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 27 Jun 2024 14:22:18 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 1/6] lib/rendercopy: Add deltas to all surface relocs
Date: Thu, 27 Jun 2024 14:22:18 +0300
Message-ID: <20240627112218.9839-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240625174032.10398-2-ville.syrjala@linux.intel.com>
References: <20240625174032.10398-2-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

In order to copy stuff not at offset 0 in the BO we need
to include the delta in the relocs/etc.

v2: fix the address in the command packets
v3: Fix intel_bb_offset_reloc_with_delta() argument order on gen7

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen4.c | 11 ++++++-----
 lib/rendercopy_gen6.c | 11 ++++++-----
 lib/rendercopy_gen7.c | 11 ++++++-----
 lib/rendercopy_gen8.c | 13 +++++++------
 lib/rendercopy_gen9.c | 13 +++++++------
 lib/rendercopy_i830.c | 10 +++++++---
 lib/rendercopy_i915.c |  6 ++++--
 7 files changed, 43 insertions(+), 32 deletions(-)

diff --git a/lib/rendercopy_gen4.c b/lib/rendercopy_gen4.c
index 8536d6b632c5..8582e0efb886 100644
--- a/lib/rendercopy_gen4.c
+++ b/lib/rendercopy_gen4.c
@@ -148,11 +148,12 @@ gen4_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
 	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
 	ss->ss0.color_blend = 1;
 
-	address = intel_bb_offset_reloc(ibb, buf->handle,
-					read_domain, write_domain,
-					intel_bb_offset(ibb) + 4,
-					buf->addr.offset);
-	ss->ss1.base_addr = (uint32_t) address;
+	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
+						   read_domain, write_domain,
+						   buf->surface[0].offset,
+						   intel_bb_offset(ibb) + 4,
+						   buf->addr.offset);
+	ss->ss1.base_addr = address + buf->surface[0].offset;
 
 	ss->ss2.height = intel_buf_height(buf) - 1;
 	ss->ss2.width  = intel_buf_width(buf) - 1;
diff --git a/lib/rendercopy_gen6.c b/lib/rendercopy_gen6.c
index e941257eb606..ec197661702f 100644
--- a/lib/rendercopy_gen6.c
+++ b/lib/rendercopy_gen6.c
@@ -91,11 +91,12 @@ gen6_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
 	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
 	ss->ss0.color_blend = 1;
 
-	address = intel_bb_offset_reloc(ibb, buf->handle,
-					read_domain, write_domain,
-					intel_bb_offset(ibb) + 4,
-					buf->addr.offset);
-	ss->ss1.base_addr = (uint32_t) address;
+	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
+						   read_domain, write_domain,
+						   buf->surface[0].offset,
+						   intel_bb_offset(ibb) + 4,
+						   buf->addr.offset);
+	ss->ss1.base_addr = address + buf->surface[0].offset;
 
 	ss->ss2.height = intel_buf_height(buf) - 1;
 	ss->ss2.width  = intel_buf_width(buf) - 1;
diff --git a/lib/rendercopy_gen7.c b/lib/rendercopy_gen7.c
index 9fadb0772e9e..e3657b5d1035 100644
--- a/lib/rendercopy_gen7.c
+++ b/lib/rendercopy_gen7.c
@@ -86,11 +86,12 @@ gen7_bind_buf(struct intel_bb *ibb,
 		 gen7_tiling_bits(buf->tiling) |
 		format << GEN7_SURFACE_FORMAT_SHIFT);
 
-	address = intel_bb_offset_reloc(ibb, buf->handle,
-					read_domain, write_domain,
-					intel_bb_offset(ibb) + 4,
-					buf->addr.offset);
-	ss[1] = address;
+	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
+						   read_domain, write_domain,
+						   buf->surface[0].offset,
+						   intel_bb_offset(ibb) + 4,
+						   buf->addr.offset);
+	ss[1] = address + buf->surface[0].offset;
 	ss[2] = ((intel_buf_width(buf) - 1)  << GEN7_SURFACE_WIDTH_SHIFT |
 		 (intel_buf_height(buf) - 1) << GEN7_SURFACE_HEIGHT_SHIFT);
 	ss[3] = (buf->surface[0].stride - 1) << GEN7_SURFACE_PITCH_SHIFT;
diff --git a/lib/rendercopy_gen8.c b/lib/rendercopy_gen8.c
index bbfa6d28f525..23bea56ad1ba 100644
--- a/lib/rendercopy_gen8.c
+++ b/lib/rendercopy_gen8.c
@@ -109,12 +109,13 @@ gen8_bind_buf(struct intel_bb *ibb,
 		ss->ss1.memory_object_control = BDW_MOCS_PTE |
 			BDW_MOCS_TC_L3_PTE | BDW_MOCS_AGE(0);
 
-	address = intel_bb_offset_reloc(ibb, buf->handle,
-					read_domain, write_domain,
-					intel_bb_offset(ibb) + 4 * 8,
-					buf->addr.offset);
-	ss->ss8.base_addr = address;
-	ss->ss9.base_addr_hi = address >> 32;
+	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
+						   read_domain, write_domain,
+						   buf->surface[0].offset,
+						   intel_bb_offset(ibb) + 4 * 8,
+						   buf->addr.offset);
+	ss->ss8.base_addr = (address + buf->surface[0].offset);
+	ss->ss9.base_addr_hi = (address + buf->surface[0].offset) >> 32;
 
 	ss->ss2.height = intel_buf_height(buf) - 1;
 	ss->ss2.width  = intel_buf_width(buf) - 1;
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 726f1a087bd2..9b2d1ff688de 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -210,12 +210,13 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 	if (intel_buf_pxp(buf))
 		ss->ss1.pxp = 1;
 
-	address = intel_bb_offset_reloc(ibb, buf->handle,
-					read_domain, write_domain,
-					intel_bb_offset(ibb) + 4 * 8,
-					buf->addr.offset);
-	ss->ss8.base_addr = address;
-	ss->ss9.base_addr_hi = address >> 32;
+	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
+						   read_domain, write_domain,
+						   buf->surface[0].offset,
+						   intel_bb_offset(ibb) + 4 * 8,
+						   buf->addr.offset);
+	ss->ss8.base_addr = (address + buf->surface[0].offset);
+	ss->ss9.base_addr_hi = (address + buf->surface[0].offset) >> 32;
 
 	ss->ss2.height = intel_buf_height(buf) - 1;
 	ss->ss2.width  = intel_buf_width(buf) - 1;
diff --git a/lib/rendercopy_i830.c b/lib/rendercopy_i830.c
index 4c4271493b4b..4b0ea3b859e2 100644
--- a/lib/rendercopy_i830.c
+++ b/lib/rendercopy_i830.c
@@ -158,8 +158,10 @@ static void gen2_emit_target(struct intel_bb *ibb,
 	intel_bb_out(ibb, _3DSTATE_BUF_INFO_CMD);
 	intel_bb_out(ibb, BUF_3D_ID_COLOR_BACK | tiling |
 		     BUF_3D_PITCH(dst->surface[0].stride));
-	intel_bb_emit_reloc(ibb, dst->handle, I915_GEM_DOMAIN_RENDER,
-			    I915_GEM_DOMAIN_RENDER, 0, dst->addr.offset);
+	intel_bb_emit_reloc(ibb, dst->handle,
+			    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
+			    dst->surface[0].offset,
+			    dst->addr.offset);
 
 	intel_bb_out(ibb, _3DSTATE_DST_BUF_VARS_CMD);
 	intel_bb_out(ibb, format |
@@ -199,7 +201,9 @@ static void gen2_emit_texture(struct intel_bb *ibb,
 		tiling |= TM0S1_TILE_WALK;
 
 	intel_bb_out(ibb, _3DSTATE_LOAD_STATE_IMMEDIATE_2 | LOAD_TEXTURE_MAP(unit) | 4);
-	intel_bb_emit_reloc(ibb, src->handle, I915_GEM_DOMAIN_SAMPLER, 0, 0,
+	intel_bb_emit_reloc(ibb, src->handle,
+			    I915_GEM_DOMAIN_SAMPLER, 0,
+			    src->surface[0].offset,
 			    src->addr.offset);
 	intel_bb_out(ibb, (intel_buf_height(src) - 1) << TM0S1_HEIGHT_SHIFT |
 		     (intel_buf_width(src) - 1) << TM0S1_WIDTH_SHIFT |
diff --git a/lib/rendercopy_i915.c b/lib/rendercopy_i915.c
index 3e421301e6a6..94cdfb99af9a 100644
--- a/lib/rendercopy_i915.c
+++ b/lib/rendercopy_i915.c
@@ -112,7 +112,8 @@ void gen3_render_copyfunc(struct intel_bb *ibb,
 		intel_bb_out(ibb, (1 << TEX_COUNT) - 1);
 		intel_bb_emit_reloc(ibb, src->handle,
 				    I915_GEM_DOMAIN_SAMPLER, 0,
-				    0, src->addr.offset);
+				    src->surface[0].offset,
+				    src->addr.offset);
 		intel_bb_out(ibb, format_bits | tiling_bits |
 			     (intel_buf_height(src) - 1) << MS3_HEIGHT_SHIFT |
 			     (intel_buf_width(src) - 1) << MS3_WIDTH_SHIFT);
@@ -155,7 +156,8 @@ void gen3_render_copyfunc(struct intel_bb *ibb,
 			     BUF_3D_PITCH(dst->surface[0].stride));
 		intel_bb_emit_reloc(ibb, dst->handle,
 				    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
-				    0, dst->addr.offset);
+				    dst->surface[0].offset,
+				    dst->addr.offset);
 
 		intel_bb_out(ibb, _3DSTATE_DST_BUF_VARS_CMD);
 		intel_bb_out(ibb, format_bits |
-- 
2.44.2

