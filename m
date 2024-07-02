Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F9FC3065C
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE1010E6FA;
	Tue,  2 Jul 2024 23:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mnd9PghF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1A210E6F9
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962924; x=1751498924;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WUoIXlcn0X8qV4u7aYs2AX5yZenHyz7h4xk8g6g5UFI=;
 b=Mnd9PghFUwVMetqtRpjmnS10DVMKiWQMvuzh/m3itHKaaS2wQj8/ofUe
 uT7oFyJ9QsU4LbZLhmVCNAfriaAc9tYirdOipiS0PJqnhcgZ+LC53HROg
 BHUSVkIKQedOnReR3R3pc2mT7guORBZy+6saFylbNRTpMh+qCYEny+EO3
 uIcZ2oNXIPyhQlBNOlX6XEZ4eGTYENXOJVhNHdEMS8LR9r79ih8S1DAA8
 v6z14VTcrE4ySekd/kk7R3PDM+SISUFTLr/c9mTfSoGUPybeiSJhi01v+
 uCrV3A9n71KXWjSVG6gPHuorG+quUGc9kLJ2iE3uxWpvEX25l4gdEeDJi w==;
X-CSE-ConnectionGUID: cH+5Y3QFTFOOeLVogW1khQ==
X-CSE-MsgGUID: IIdcgpwDRyardwMcgzzoVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559524"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559524"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:28:44 -0700
X-CSE-ConnectionGUID: WrEQNj1gQbWROBR026aafw==
X-CSE-MsgGUID: nnUlN9aURBy0nwf4cUKimg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043779"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:28:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:28:41 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/37] lib/rendercopy: Fix fastclear scaling
Date: Wed,  3 Jul 2024 02:27:48 +0300
Message-ID: <20240702232817.31147-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
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

The hardcoded 64x16 fastclear coordinate scaling
factors assume 32bpp+Y-tile. Determine the correct
scaling factors for other tilings and bpps.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen9.c | 105 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 99 insertions(+), 6 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 57b64dad1b1d..42a227916f15 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -346,6 +346,95 @@ gen8_fill_ps(struct intel_bb *ibb,
 	return intel_bb_copy_data(ibb, kernel, size, 64);
 }
 
+static void fast_clear_scale(const struct intel_buf *buf,
+			     int *x_scale, int *y_scale)
+{
+	switch (buf->tiling) {
+	case I915_TILING_4:
+		*x_scale = 1024 * 8 / buf->bpp;
+		*y_scale = 16;
+		break;
+	case I915_TILING_64:
+		switch (buf->bpp) {
+		case 8:
+			*x_scale = 128;
+			*y_scale = 128;
+			break;
+		case 16:
+			*x_scale = 128;
+			*y_scale = 64;
+			break;
+		case 32:
+			*x_scale = 64;
+			*y_scale = 64;
+			break;
+		case 64:
+			*x_scale = 64;
+			*y_scale = 32;
+			break;
+		case 128:
+			*x_scale = 32;
+			*y_scale = 32;
+			break;
+		}
+		break;
+	case I915_TILING_Y:
+		*x_scale = 256 * 8 / buf->bpp;
+		*y_scale = 16;
+		break;
+	case I915_TILING_Yf:
+		switch (buf->bpp) {
+		case 8:
+			*x_scale = 128;
+			*y_scale = 32;
+			break;
+		case 16:
+			*x_scale = 128;
+			*y_scale = 16;
+			break;
+		case 32:
+			*x_scale = 64;
+			*y_scale = 16;
+			break;
+		case 64:
+			*x_scale = 64;
+			*y_scale = 8;
+			break;
+		case 128:
+			*x_scale = 32;
+			*y_scale = 8;
+			break;
+		}
+		break;
+	case I915_TILING_Ys:
+		switch (buf->bpp) {
+		case 8:
+			*x_scale = 64;
+			*y_scale = 64;
+			break;
+		case 16:
+			*x_scale = 64;
+			*y_scale = 32;
+			break;
+		case 32:
+			*x_scale = 32;
+			*y_scale = 32;
+			break;
+		case 64:
+			*x_scale = 32;
+			*y_scale = 16;
+			break;
+		case 128:
+			*x_scale = 16;
+			*y_scale = 16;
+			break;
+		}
+		break;
+	default:
+		igt_assert(0);
+	}
+}
+
 /*
  * gen7_fill_vertex_buffer_data populate vertex buffer with data.
  *
@@ -360,6 +449,7 @@ static uint32_t
 gen7_fill_vertex_buffer_data(struct intel_bb *ibb,
 			     const struct intel_buf *src,
 			     uint32_t src_x, uint32_t src_y,
+			     const struct intel_buf *dst,
 			     uint32_t dst_x, uint32_t dst_y,
 			     uint32_t width, uint32_t height)
 {
@@ -384,17 +474,21 @@ gen7_fill_vertex_buffer_data(struct intel_bb *ibb,
 		emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
 		emit_vertex_normalized(ibb, src_y, intel_buf_height(src));
 	} else {
-		emit_vertex_2s(ibb, DIV_ROUND_UP(dst_x + width, 64), DIV_ROUND_UP(dst_y + height, 16));
+		int x_scale, y_scale;
+
+		fast_clear_scale(dst, &x_scale, &y_scale);
+
+		emit_vertex_2s(ibb, DIV_ROUND_UP(dst_x + width, x_scale), DIV_ROUND_UP(dst_y + height, y_scale));
 
 		emit_vertex_normalized(ibb, 0, 0);
 		emit_vertex_normalized(ibb, 0, 0);
 
-		emit_vertex_2s(ibb, dst_x/64, DIV_ROUND_UP(dst_y + height, 16));
+		emit_vertex_2s(ibb, dst_x/x_scale, DIV_ROUND_UP(dst_y + height, y_scale));
 
 		emit_vertex_normalized(ibb, 0, 0);
 		emit_vertex_normalized(ibb, 0, 0);
 
-		emit_vertex_2s(ibb, dst_x/64, dst_y/16);
+		emit_vertex_2s(ibb, dst_x/x_scale, dst_y/y_scale);
 
 		emit_vertex_normalized(ibb, 0, 0);
 		emit_vertex_normalized(ibb, 0, 0);
@@ -1108,9 +1202,8 @@ void _gen9_render_op(struct intel_bb *ibb,
 	ps_binding_table  = gen8_bind_surfaces(ibb, src, dst);
 	ps_sampler_state  = gen8_create_sampler(ibb);
 	ps_kernel_off = gen8_fill_ps(ibb, ps_kernel, ps_kernel_size);
-	vertex_buffer = gen7_fill_vertex_buffer_data(ibb, src,
-						     src_x, src_y,
-						     dst_x, dst_y,
+	vertex_buffer = gen7_fill_vertex_buffer_data(ibb, src, src_x, src_y,
+						     dst, dst_x, dst_y,
 						     width, height);
 	cc.cc_state = gen6_create_cc_state(ibb);
 	cc.blend_state = gen8_create_blend_state(ibb);
-- 
2.44.2

