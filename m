Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D286C3064D
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 17:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B86F10E6F6;
	Tue, 25 Jun 2024 17:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNhhB+hJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F0F10E6F5
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719337249; x=1750873249;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eICyR00OeB8lb1oqM6E/rG2s3J7aB4+cOjkUdzqZd68=;
 b=DNhhB+hJQNPfZsrFYo2582O/RQRSHxMzE1ZhXSF2f1qhjZZlBDmovVgx
 J+IkXQtZrvA2MYlNYGcZvuQggnb1XQPBi9jQhYAIPR6Oj/fGd4Wig/KrI
 EffsA1gQiJmod6hl536256gV7H/kU7UbIglydtGe9tA48Tmvrpnet64fq
 p+4deAsXNmvve3xbr2mXchcmw9Yn3Pofa5WSKCkW9VidLOnXD/nQmMakk
 y61A9HcGX6P6velPIZu9D9tctzmx3yUvby3AnvW15uz7GQ39I6E0U18E2
 bobjx3CbOkphQ7u9rdxZ8nRzBmmm+S2AMz7jkpevJa1KA+kTOFGeuA9Wm g==;
X-CSE-ConnectionGUID: 8nn+Yn+SQH6l0mUsX/yciA==
X-CSE-MsgGUID: qYzBv+02QPCmZVYIqpeqIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20184379"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20184379"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 10:40:49 -0700
X-CSE-ConnectionGUID: hldX89yBQM2VdaZ4qjPGQw==
X-CSE-MsgGUID: JPvFVi+eTUm6Xy9nsunScw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43701234"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 25 Jun 2024 10:40:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 20:40:46 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/6] lib/rendercopy: Always setup clear color for TGL
Date: Tue, 25 Jun 2024 20:40:31 +0300
Message-ID: <20240625174032.10398-6-ville.syrjala@linux.intel.com>
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
index 9b2d1ff688de..04ec7ec99d9a 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -1130,15 +1130,23 @@ void _gen9_render_op(struct intel_bb *ibb,
 
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

