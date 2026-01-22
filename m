Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E601D46952
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 13:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C27210E9A7;
	Thu, 22 Jan 2026 13:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAcnDEPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7895210E99F
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769086800; x=1800622800;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kyWmZV0WnYYMuTEK6mh5ic5W7x5ojwt8e8DlIvJtwjM=;
 b=jAcnDEPwU2FTpYhhS0SuMSijIM89roF11XN7nHd3JvCGpDfxwQvVemNc
 ikxr6JJSVxOjGgVs/z80inHOHuYdTrIPTiRwz5IgAFOn5Y2PXMYnLH5p1
 Nj0H51yr0wYKk1qrq9itGLlbNznC3/GTDir/U/BGqGKxI0gLXByvlu5df
 anF0Z1nZnTBOetWoAT4952Mzm4mPgAL9UjqNeLKNajbwc0PzWDEyTRJTj
 C4eX5hcOb9hKnYqry2kuEIvMDj97rJCPTDIzPMvOaLTzq8G4Zf9M+wfVc
 vNbxUXElwoxYyV9xWxU7eDI7urHzO6G7RpagORekXG8PI7iazxQAQ8IlJ w==;
X-CSE-ConnectionGUID: fi33HRUKRbuf1EInkUusgw==
X-CSE-MsgGUID: VCpncg31QoOfeyRnXXxAvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81045339"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81045339"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:59:59 -0800
X-CSE-ConnectionGUID: 4RIxD7suTjaPpRNXud66Vw==
X-CSE-MsgGUID: joQDRZk+QoG85/ggMkS/Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237987086"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.38])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:59:58 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/10] lib/kms: Rename display->pipes[] to
 display->crtcs[]
Date: Thu, 22 Jan 2026 14:59:31 +0200
Message-ID: <20260122125937.10807-6-ville.syrjala@linux.intel.com>
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

display->pipes[] actually contains igt_crtc_t's, so
rename it to display->crtcs[] to match.

Done with cocci:
 #include "scripts/iterators.cocci"

@@
@@
struct igt_display {
	...
-	igt_crtc_t *pipes;
+	igt_crtc_t *crtcs;
	...
 };

@@
typedef igt_display_t;
igt_display_t *S;
@@
- S->pipes
+ S->crtcs

@@
typedef igt_display_t;
igt_display_t S;
@@
- S.pipes
+ S.crtcs

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                     | 9 +++++----
 lib/igt_kms.h                     | 4 ++--
 tests/amdgpu/amd_cursor_overlay.c | 2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6f29a419b42d..30b237263e91 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3219,9 +3219,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		     resources->count_crtcs, IGT_MAX_PIPES);
 
 	display->n_crtcs = IGT_MAX_PIPES;
-	display->pipes = calloc(igt_display_n_crtcs(display),
+	display->crtcs = calloc(igt_display_n_crtcs(display),
 				sizeof(igt_crtc_t));
-	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n",
+	igt_assert_f(display->crtcs,
+		     "Failed to allocate memory for %d pipes\n",
 		     igt_display_n_crtcs(display));
 
 	for (i = 0; i < resources->count_crtcs; i++) {
@@ -3485,8 +3486,8 @@ void igt_display_fini(igt_display_t *display)
 
 	free(display->outputs);
 	display->outputs = NULL;
-	free(display->pipes);
-	display->pipes = NULL;
+	free(display->crtcs);
+	display->crtcs = NULL;
 	free(display->planes);
 	display->planes = NULL;
 	free(display->colorops);
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 73a907a2e474..0fbbeca754c8 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -533,7 +533,7 @@ struct igt_display {
 	igt_output_t *outputs;
 	igt_plane_t *planes;
 	igt_colorop_t *colorops;
-	igt_crtc_t *pipes;
+	igt_crtc_t *crtcs;
 	bool has_cursor_plane;
 	bool is_atomic;
 	bool has_virt_cursor_plane;
@@ -581,7 +581,7 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pi
 	if (pipe == PIPE_NONE)
 		return NULL;
 
-	return &display->pipes[pipe];
+	return &display->crtcs[pipe];
 }
 
 typedef struct _igt_pipe_crc igt_pipe_crc_t;
diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
index e500d9e34066..5c7dcb197b44 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -138,7 +138,7 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 
 	data->pipe_id = pipe_id;
 	data->available_overlay_planes = available_overlay_planes;
-	data->pipe = &data->display.pipes[data->pipe_id];
+	data->pipe = &data->display.crtcs[data->pipe_id];
 	data->output = output;
 	data->mode = igt_output_get_mode(data->output);
 	data->primary = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
-- 
2.52.0

