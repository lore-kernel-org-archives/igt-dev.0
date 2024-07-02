Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB700C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6855A10E4A1;
	Tue,  2 Jul 2024 23:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLM+8ZMO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C30110E6F8
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962919; x=1751498919;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QlwRdaHl9aKYWIec9Wsj63LxbxOlMjl6ZS8iLFzWwpE=;
 b=nLM+8ZMO8x+j8iaLpytFMrpRDawDx7SzEEXdzPCTcrJwa1UjVHUPVfss
 q+i+MBTFGhU3yRBqwu5hm/ImZQdZa4qPpktTf0rjPWyaZ9xVfzbggNtKx
 bshBdHeyq28SRqSS5z3VmyF+9+TSAu4rIIYQ7FSQbeMgSNeAmiT12GEDg
 X29AWeTtaRo61P/yXzIQhr6L7sVO9eTJzk1TNlSfYFjBBVQN992KPW86M
 SgDQrn3p+a9ZzoK4f+Yo6LtTXBcM/1AGEBz8iPhjRQ+FVcnqanbJlfBWP
 lZab7burJ58HJ0PwhqBZVVJufOomc9QzNY7bB4Er5wQXbL+eUCF5oCcA5 w==;
X-CSE-ConnectionGUID: AlwiyWkpTpqYEY1ix9mEcA==
X-CSE-MsgGUID: 917G2kFERdOQqxoh/ptFnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559509"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559509"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:28:39 -0700
X-CSE-ConnectionGUID: cTGe2DiMQTmLEa5Xha3KoQ==
X-CSE-MsgGUID: ZB0cR4HDRTuqg8QvPJ52tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043772"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:28:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:28:35 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/37] lib/rendercopy: Always setup clear color for TGL
Date: Wed,  3 Jul 2024 02:27:46 +0300
Message-ID: <20240702232817.31147-7-ville.syrjala@linux.intel.com>
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

TGL apparently automagically converts regular output to fast
clears when the output matches the configured clear color.
And if we don't enable the clear color packet at all then we
just get some rainbow gibberish on all black parts of the
output.

To avoid always set up the clear color packet when using
using a non-clear color modifier. We'll just stick a bunch
of NaNs into the clear value so it'll never match any
legitimate output, and thus automagic fast clear should not
happen.

TODO: Hide this better inside rendercopy_gen9.c without
      requring extra allocation in the FB BO
TODO: Figure out if other platforms need this sort stuff

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c          | 24 ++++++++++++++++++++++++
 lib/intel_bufops.h    |  1 +
 lib/rendercopy_gen9.c | 14 +++++++++++---
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 9d7808ba8312..857ffb6547a3 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -963,6 +963,16 @@ void igt_calc_fb_size(struct igt_fb *fb)
 		size += calc_plane_size(fb, plane);
 	}
 
+	/*
+	 * We always need a clear color on TGL, make some extra
+	 * room for one it if it's not explicit in the modifier.
+	 *
+	 * TODO: probably better to allocate this as part of the
+	 * batch instead so the fb size doesn't need to change...
+	 */
+	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS)
+		size = ALIGN(size + 64, 64);
+
 	if (is_xe_device(fb->fd))
 		size = ALIGN(size, xe_get_default_alignment(fb->fd));
 
@@ -2661,6 +2671,20 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 	if (fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
 		buf->cc.offset = fb->offsets[1];
 
+	/*
+	 * TGL appears to do automagic fast clear when rendering
+	 * black and the clear color isn't specified, or when the
+	 * output matches the specified clear color. Force a
+	 * non-sensical clear color to prevent it from doing this
+	 * when using a non-clear color modifier.
+	 *
+	 * TODO: figure out if other platforms are affected...
+	 */
+	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS) {
+		buf->cc.disable = true;
+		buf->cc.offset = fb->size - 64;
+	}
+
 	return buf;
 }
 
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 84e71d41a2c2..06e72ba4ba93 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -38,6 +38,7 @@ struct intel_buf {
 	} ccs[2];
 	struct {
 		uint32_t offset;
+		bool disable;
 	} cc;
 	struct {
 		uint64_t offset;
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 5ee4c89f5cdb..f0757a8e6b78 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -1133,15 +1133,23 @@ void _gen9_render_op(struct intel_bb *ibb,
 
 	gen12_emit_aux_pgtable_state(ibb, aux_pgtable_state, true);
 
-	if (fast_clear) {
+	if (fast_clear || dst->cc.disable) {
 		for (int i = 0; i < 4; i++) {
 			intel_bb_out(ibb, MI_STORE_DWORD_IMM_GEN4);
 			intel_bb_emit_reloc(ibb, dst->handle,
 					    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
                                             dst->cc.offset + i*sizeof(float),
 					    dst->addr.offset);
-			intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
-               }
+			if (fast_clear) {
+				intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
+			} else {
+				/*
+				 * Emit NaN so it'll match nothing and thus prevent
+				 * TGL from doing its automagic fast clear tricks.
+				 */
+				intel_bb_out(ibb, 0xffffffff);
+			}
+		}
        }
 
 
-- 
2.44.2

