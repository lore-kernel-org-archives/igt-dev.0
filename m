Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD365D3EE62
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 13:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0F010E9B3;
	Thu, 22 Jan 2026 13:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQPXqYaJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805E310E9A2
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 13:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769086820; x=1800622820;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+HS6en5PJNr2eA09cdH34WJpBiiO8IhKGGolCoSfs10=;
 b=hQPXqYaJcXY1e+Bb5/KtfdZz9sPdZEHsF2wXnfBg88+PCC/Y3oaU1L0s
 R/V3QezCwIT1ClL00HCcSWsK771Fn3aA0P5gq3UxuJo5h0YTwekAJd6+h
 s29GIZ8MzKjBevawDd0hlILCp3xrvZiuC8T4qOwiRx9+htvI5l7fRyb/6
 EzodXVShL4chmqw54qrJ0E9FETJoLlCF3OZGd/H0k6q80URThQhM92YkC
 azySwF09rjUv8kmITwEaAQSTrTlppPUvPGSGPANeIzoxpKJnly/eF4GrS
 D16Gpzvqo1p6PshSXxrZFlXab5fm+iW4+6cjIqqaYNmFVzdHdEkjsDv60 Q==;
X-CSE-ConnectionGUID: +cizJWkeRka/gR1aYDxBWA==
X-CSE-MsgGUID: TTeN1fvCS0OAHLU2kC923A==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70235040"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70235040"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 05:00:20 -0800
X-CSE-ConnectionGUID: opD9wMldR3+s/dJUPgKAlA==
X-CSE-MsgGUID: fmDTxu/XTcq06vqbss0HnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211243253"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.38])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 05:00:18 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/10] lib/kms: Use igt_crtc_name() where appropriate
Date: Thu, 22 Jan 2026 14:59:36 +0200
Message-ID: <20260122125937.10807-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Use igt_crtc_name() instead of kmstest_pipe_name()
when we already have a suitable igt_crtc_t around.

Done with cocci:
 #include "scripts/iterators.cocci"

@@
@@
- static
const char *igt_crtc_name(...)
{ ... }

@@
typedef igt_crtc_t;
@@
+ const char *igt_crtc_name(igt_crtc_t *crtc);
+
static inline igt_crtc_t *igt_crtc_for_pipe(...)
{ ... }

@@
igt_crtc_t *CRTC;
@@
- kmstest_pipe_name(CRTC->pipe)
+ igt_crtc_name(CRTC)

@@
identifier CRTC;
@@
igt_crtc_name(igt_crtc_t *CRTC)
{
<...
- igt_crtc_name(CRTC)
+ kmstest_pipe_name(CRTC->pipe)
...>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 48 ++++++++++++++++++++++++------------------------
 lib/igt_kms.h |  2 ++
 2 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 46751d19706b..0fdb83d8205e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3804,14 +3804,14 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_crtc_t *crtc,
 
 	LOG(display,
 	    "populating plane data: %s.%d, fb %u\n",
-	    kmstest_pipe_name(crtc->pipe),
+	    igt_crtc_name(crtc),
 	    plane->index,
 	    igt_plane_get_fb_id(plane));
 
 	for (i = 0; i < IGT_NUM_PLANE_PROPS; i++) {
 		if (igt_atomic_ignore_plane_prop(crtc, i)) {
 			igt_debug("plane %s.%d: Ignoring property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
-				   kmstest_pipe_name(crtc->pipe),
+				   igt_crtc_name(crtc),
 				   plane->index, igt_plane_prop_names[i],
 				   plane->values[i], plane->values[i]);
 			continue;
@@ -3824,7 +3824,7 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_crtc_t *crtc,
 		igt_assert(plane->props[i]);
 
 		igt_debug("plane %s.%d: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
-			kmstest_pipe_name(crtc->pipe), plane->index,
+			igt_crtc_name(crtc), plane->index,
 			igt_plane_prop_names[i],
 			plane->values[i], plane->values[i]);
 
@@ -3847,7 +3847,7 @@ igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_crtc_t *crtc,
 	while (colorop) {
 		LOG(display,
 		    "populating colorop data: %s.%d\n",
-		    kmstest_pipe_name(crtc->pipe),
+		    igt_crtc_name(crtc),
 		    colorop->id);
 
 		for (i = 0; i < IGT_NUM_COLOROP_PROPS; i++) {
@@ -3858,7 +3858,7 @@ igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_crtc_t *crtc,
 			igt_assert(colorop->props[i]);
 
 			igt_debug("colorop %s.%d: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
-				kmstest_pipe_name(crtc->pipe), colorop->id,
+				igt_crtc_name(crtc), colorop->id,
 				igt_colorop_prop_names[i],
 				colorop->values[i], colorop->values[i]);
 
@@ -3925,7 +3925,7 @@ static int igt_drm_plane_commit(igt_plane_t *plane,
 	if (setplane && fb_id == 0) {
 		LOG(display,
 		    "SetPlane pipe %s, plane %d, disabling\n",
-		    kmstest_pipe_name(crtc->pipe),
+		    igt_crtc_name(crtc),
 		    plane->index);
 
 		ret = drmModeSetPlane(display->drm_fd,
@@ -3954,7 +3954,7 @@ static int igt_drm_plane_commit(igt_plane_t *plane,
 		LOG(display,
 		    "SetPlane %s.%d, fb %u, src = (%d, %d) "
 			"%ux%u dst = (%u, %u) %ux%u\n",
-		    kmstest_pipe_name(crtc->pipe),
+		    igt_crtc_name(crtc),
 		    plane->index,
 		    fb_id,
 		    src_x >> 16, src_y >> 16, src_w >> 16, src_h >> 16,
@@ -3980,7 +3980,7 @@ static int igt_drm_plane_commit(igt_plane_t *plane,
 			continue;
 
 		LOG(display, "SetProp plane %s.%d \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
-			kmstest_pipe_name(crtc->pipe), plane->index,
+			igt_crtc_name(crtc), plane->index,
 			igt_plane_prop_names[i],
 			plane->values[i], plane->values[i]);
 
@@ -4016,14 +4016,14 @@ static int igt_cursor_commit_legacy(igt_plane_t *cursor,
 		if (cursor->gem_handle)
 			LOG(display,
 			    "SetCursor pipe %s, fb %u %dx%d\n",
-			    kmstest_pipe_name(crtc->pipe),
+			    igt_crtc_name(crtc),
 			    cursor->gem_handle,
 			    (unsigned)cursor->values[IGT_PLANE_CRTC_W],
 			    (unsigned)cursor->values[IGT_PLANE_CRTC_H]);
 		else
 			LOG(display,
 			    "SetCursor pipe %s, disabling\n",
-			    kmstest_pipe_name(crtc->pipe));
+			    igt_crtc_name(crtc));
 
 		ret = drmModeSetCursor(display->drm_fd, crtc_id,
 				       cursor->gem_handle,
@@ -4039,7 +4039,7 @@ static int igt_cursor_commit_legacy(igt_plane_t *cursor,
 
 		LOG(display,
 		    "MoveCursor pipe %s, (%d, %d)\n",
-		    kmstest_pipe_name(crtc->pipe),
+		    igt_crtc_name(crtc),
 		    x, y);
 
 		ret = drmModeMoveCursor(display->drm_fd, crtc_id, x, y);
@@ -4090,7 +4090,7 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 		    "%s: SetCrtc pipe %s, fb %u, src (%d, %d), "
 		    "mode %dx%d\n",
 		    igt_output_name(output),
-		    kmstest_pipe_name(crtc->pipe),
+		    igt_crtc_name(crtc),
 		    fb_id,
 		    src_x, src_y,
 		    mode->hdisplay, mode->vdisplay);
@@ -4105,7 +4105,7 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 	} else {
 		LOG(display,
 		    "SetCrtc pipe %s, disabling\n",
-		    kmstest_pipe_name(crtc->pipe));
+		    igt_crtc_name(crtc));
 
 		ret = drmModeSetCrtc(display->drm_fd,
 				     crtc_id,
@@ -4130,7 +4130,7 @@ static int igt_plane_fixup_rotation(igt_plane_t *plane,
 		return 0;
 
 	LOG(crtc->display, "Fixing up initial rotation pipe %s, plane %d\n",
-	    kmstest_pipe_name(crtc->pipe), plane->index);
+	    igt_crtc_name(crtc), plane->index);
 
 	/* First try the easy case, can we change rotation without problems? */
 	ret = igt_plane_set_property(plane, plane->props[IGT_PLANE_ROTATION],
@@ -4785,7 +4785,7 @@ static void igt_atomic_prepare_crtc_commit(igt_crtc_t *crtc,
 			continue;
 
 		igt_debug("Pipe %s: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
-			kmstest_pipe_name(crtc->pipe), igt_crtc_prop_names[i],
+			igt_crtc_name(crtc), igt_crtc_prop_names[i],
 			crtc->values[i], crtc->values[i]);
 
 		igt_assert_lt(0,
@@ -5336,7 +5336,7 @@ igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source)
 					 source);
 }
 
-static const char *igt_crtc_name(igt_crtc_t *crtc)
+const char *igt_crtc_name(igt_crtc_t *crtc)
 {
 	if (crtc == NULL)
 		return "None";
@@ -5626,7 +5626,7 @@ void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb)
 	igt_display_t *display = crtc->display;
 
 	LOG(display, "%s.%d: plane_set_fb(%d)\n",
-	    kmstest_pipe_name(crtc->pipe),
+	    igt_crtc_name(crtc),
 	    plane->index, fb ? fb->fb_id : 0);
 
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID,
@@ -5724,7 +5724,7 @@ void igt_plane_set_position(igt_plane_t *plane, int x, int y)
 	igt_display_t *display = crtc->display;
 
 	LOG(display, "%s.%d: plane_set_position(%d,%d)\n",
-	    kmstest_pipe_name(crtc->pipe), plane->index, x, y);
+	    igt_crtc_name(crtc), plane->index, x, y);
 
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_X, x);
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_Y, y);
@@ -5746,7 +5746,7 @@ void igt_plane_set_size(igt_plane_t *plane, int w, int h)
 	igt_display_t *display = crtc->display;
 
 	LOG(display, "%s.%d: plane_set_size (%dx%d)\n",
-	    kmstest_pipe_name(crtc->pipe), plane->index, w, h);
+	    igt_crtc_name(crtc), plane->index, w, h);
 
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_W, w);
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_H, h);
@@ -5769,7 +5769,7 @@ void igt_fb_set_position(struct igt_fb *fb, igt_plane_t *plane,
 	igt_display_t *display = crtc->display;
 
 	LOG(display, "%s.%d: fb_set_position(%d,%d)\n",
-	    kmstest_pipe_name(crtc->pipe), plane->index, x, y);
+	    igt_crtc_name(crtc), plane->index, x, y);
 
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_X, IGT_FIXED(x, 0));
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_Y, IGT_FIXED(y, 0));
@@ -5793,7 +5793,7 @@ void igt_fb_set_size(struct igt_fb *fb, igt_plane_t *plane,
 	igt_display_t *display = crtc->display;
 
 	LOG(display, "%s.%d: fb_set_size(%dx%d)\n",
-	    kmstest_pipe_name(crtc->pipe), plane->index, w, h);
+	    igt_crtc_name(crtc), plane->index, w, h);
 
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_W, IGT_FIXED(w, 0));
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_H, IGT_FIXED(h, 0));
@@ -5836,7 +5836,7 @@ void igt_plane_set_rotation(igt_plane_t *plane, igt_rotation_t rotation)
 	igt_display_t *display = crtc->display;
 
 	LOG(display, "%s.%d: plane_set_rotation(%s°)\n",
-	    kmstest_pipe_name(crtc->pipe),
+	    igt_crtc_name(crtc),
 	    plane->index, igt_plane_rotation_name(rotation));
 
 	igt_plane_set_prop_value(plane, IGT_PLANE_ROTATION, rotation);
@@ -7257,7 +7257,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 
 			if (!igt_crtc_for_pipe(display, pipes[i].idx + 1)->valid) {
 				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
-					 kmstest_pipe_name(igt_crtc_for_pipe(display, pipes[i].idx + 1)->pipe));
+					 igt_crtc_name(igt_crtc_for_pipe(display, pipes[i].idx + 1)));
 				return false;
 			}
 
@@ -7279,7 +7279,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 
 			if (!igt_crtc_for_pipe(display, pipes[i - 1].idx + 1)->valid) {
 				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
-					 kmstest_pipe_name(igt_crtc_for_pipe(display, pipes[i - 1].idx + 1)->pipe));
+					 igt_crtc_name(igt_crtc_for_pipe(display, pipes[i - 1].idx + 1)));
 				return false;
 			}
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 65ebb5a917ce..b8f163fabc35 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -576,6 +576,8 @@ void igt_display_require_output(igt_display_t *display);
 void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
 int igt_display_n_crtcs(igt_display_t *display);
 
+const char *igt_crtc_name(igt_crtc_t *crtc);
+
 static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
 {
 	if (pipe == PIPE_NONE)
-- 
2.52.0

