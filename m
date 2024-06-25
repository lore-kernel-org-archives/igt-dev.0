Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACC8C30658
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 17:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E8010E703;
	Tue, 25 Jun 2024 17:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+3yMiWL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04E410E6F2
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 17:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719337238; x=1750873238;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VCHFbXqbuleqwKsN5JP3l853xQdMTKr9GNbGkVTHy8o=;
 b=F+3yMiWLAarpvqdaH+wKejCdbsh7+rRqsEbgTd/05DGQot9DLT5gISdQ
 IwQSKmfw71pYhH+vNZiD34DplXWKIedMV9FnXvxDaHYMdMx5ib5iF7pKq
 R6gcqPDzF6yjM1ytbfmbYKrJhSy8CgWS5EdGhXD1ZimvPy8ZTNjSEwIAd
 n6URPxSJn+s+yD23aubBD7XWMZEt7Q0GV4eF99bAHu1Jy8QhjJssfvdDW
 u94BjT2YzVzrnS7H4cClFl5SLhZ+2ymLFig84Sxpz57GYUVi0r/2nVN9s
 sqqw6JPDJAzjlSFfrripZ6tPk9pYVh/PlO8BkvSYJaw0B2d3beSfRG0cO w==;
X-CSE-ConnectionGUID: iTJrB2hVRgCjaD6W+5u1Bw==
X-CSE-MsgGUID: 81D0T3gnRcuEVRLC2f54Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20184360"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20184360"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 10:40:38 -0700
X-CSE-ConnectionGUID: uiuNivlAQ+KhCGtwxVciSA==
X-CSE-MsgGUID: emlgMBicRFSkDlYUZ2zl3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43701209"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 25 Jun 2024 10:40:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 20:40:35 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/6] lib/rendercopy: Add deltas to all surface relocs
Date: Tue, 25 Jun 2024 20:40:27 +0300
Message-ID: <20240625174032.10398-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
References: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
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
index 9fadb0772e9e..132c15baf925 100644
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
+						   intel_bb_offset(ibb) + 4,
+						   buf->surface[0].offset,
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

