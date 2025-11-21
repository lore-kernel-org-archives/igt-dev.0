Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA824CFC29A
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 19:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBC210E8F7;
	Fri, 21 Nov 2025 19:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9O5zaQR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B26610E037
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 19:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763752034; x=1795288034;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TTVvo1bh3IvLp17hQMJfkRf5GRrnNJLKLeOGVtyJBfI=;
 b=Z9O5zaQROjUPOjgcMAfbF7HcVIQ27/ZPrgygUeSqwqBB+L8Wu18QtXXk
 InlLOiVqEkRdMaPfuLD50Jlws9upTsHZUaAa1tP2j9MWab08sAYaCsNaY
 F0pPBf8xJHr+ID9cKixaCD9YURlMKP0o2ZX56AFJuhE/IXRiStVq2vypE
 y5nPQIsp7W3e/Cac6b7QZdSXh1Iw3FpvbdFAvzz7IgSbEkSBtchm5xhv+
 /dPsrObTZZ663gSjE1vRA/OFPLPZTkggtyMF9p+ZFfhIAJGHENGzLdXc+
 gJKZ38zYTct2bmfDrJv5P8yqX3X9lo2ISMnufb8PnOP8YIV2jyhWQhQZy A==;
X-CSE-ConnectionGUID: Z+OXp72EQ4iqdwwjlV5N+w==
X-CSE-MsgGUID: dlme+oIAS9SvkiGyUoeM6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69718575"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="69718575"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:07:14 -0800
X-CSE-ConnectionGUID: BowlDvj4TuiyBMkbTlNkuw==
X-CSE-MsgGUID: vXYJ5UYfR3q5jIi8aga1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="196053118"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.31])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:07:13 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 8/8] test/kms_color: Don't dig around in
 display->pipes[] so much
Date: Fri, 21 Nov 2025 21:06:33 +0200
Message-ID: <20251121190633.24522-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
References: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Don't take pointless detours via display->pipes[] when
we don't have to. My plan is to completely hide the
display->pipes[] stuff inside igt_kms.[ch]. Getting
rid of the completely pointless uses is the first step.

Done with cocci:
\#include "scripts/iterators.cocci"

@plane@
igt_display_t *display;
igt_plane_t *plane;
identifier M;
@@
(
- display->pipes[plane->pipe->pipe].M
+ plane->pipe->M
|
- &display->pipes[plane->pipe->pipe]
+ plane->pipe
)

@depends on plane@
expression E;
identifier display;
@@
- igt_display_t *display = E;
... when != display;

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 16155bc4bcaf..42dce9a0e5e9 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -82,7 +82,6 @@ static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
 {
 	igt_output_t *output = data->output;
-	igt_display_t *display = &data->display;
 	gamma_lut_t *degamma_linear, *degamma_full;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
@@ -132,7 +131,7 @@ static bool test_pipe_degamma(data_t *data,
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit(&data->display);
 	igt_wait_for_vblank(data->drm_fd,
-			    display->pipes[primary->pipe->pipe].crtc_offset);
+			    primary->pipe->crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
 	/*
@@ -144,7 +143,7 @@ static bool test_pipe_degamma(data_t *data,
 	set_degamma(data, primary->pipe, degamma_full);
 	igt_display_commit(&data->display);
 	igt_wait_for_vblank(data->drm_fd,
-			    display->pipes[primary->pipe->pipe].crtc_offset);
+			    primary->pipe->crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
 	/*
@@ -174,7 +173,6 @@ static bool test_pipe_gamma(data_t *data,
 			    igt_plane_t *primary)
 {
 	igt_output_t *output = data->output;
-	igt_display_t *display = &data->display;
 	gamma_lut_t *gamma_full;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
@@ -222,7 +220,7 @@ static bool test_pipe_gamma(data_t *data,
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit(&data->display);
 	igt_wait_for_vblank(data->drm_fd,
-			    display->pipes[primary->pipe->pipe].crtc_offset);
+			    primary->pipe->crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
 	/*
@@ -233,7 +231,7 @@ static bool test_pipe_gamma(data_t *data,
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit(&data->display);
 	igt_wait_for_vblank(data->drm_fd,
-			    display->pipes[primary->pipe->pipe].crtc_offset);
+			    primary->pipe->crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
 	/*
@@ -263,7 +261,6 @@ static bool test_pipe_legacy_gamma(data_t *data,
 				   igt_plane_t *primary)
 {
 	igt_output_t *output = data->output;
-	igt_display_t *display = &data->display;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
@@ -319,7 +316,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit(&data->display);
 	igt_wait_for_vblank(data->drm_fd,
-			    display->pipes[primary->pipe->pipe].crtc_offset);
+			    primary->pipe->crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
 	/*
@@ -336,7 +333,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
 	igt_display_commit(&data->display);
 	igt_wait_for_vblank(data->drm_fd,
-			    display->pipes[primary->pipe->pipe].crtc_offset);
+			    primary->pipe->crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
 	/*
@@ -518,7 +515,6 @@ static bool test_pipe_ctm(data_t *data,
 	gamma_lut_t *degamma_linear = NULL, *gamma_linear = NULL;
 	igt_output_t *output = data->output;
 	bool ret = true;
-	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode = data->mode;
 	struct igt_fb fb_modeset, fb;
 	igt_crc_t crc_software, crc_hardware;
@@ -579,7 +575,7 @@ static bool test_pipe_ctm(data_t *data,
 	set_ctm(primary->pipe, ctm_identity);
 	igt_display_commit(&data->display);
 	igt_wait_for_vblank(data->drm_fd,
-			    display->pipes[primary->pipe->pipe].crtc_offset);
+			    primary->pipe->crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
 
 	/* With CTM transformation. */
@@ -588,7 +584,7 @@ static bool test_pipe_ctm(data_t *data,
 	set_ctm(primary->pipe, ctm_matrix);
 	igt_display_commit(&data->display);
 	igt_wait_for_vblank(data->drm_fd,
-			    display->pipes[primary->pipe->pipe].crtc_offset);
+			    primary->pipe->crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
 
 	/*
@@ -645,7 +641,6 @@ static void test_pipe_limited_range_ctm(data_t *data,
 	gamma_lut_t *degamma_linear, *gamma_linear;
 	igt_output_t *output;
 	bool has_broadcast_rgb_output = false;
-	igt_display_t *display = &data->display;
 
 	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
@@ -691,7 +686,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		igt_plane_set_fb(primary, &fb);
 		igt_display_commit(&data->display);
 		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[primary->pipe->pipe].crtc_offset);
+				primary->pipe->crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
 
 		/* Set the output into limited range. */
@@ -700,7 +695,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		igt_plane_set_fb(primary, &fb);
 		igt_display_commit(&data->display);
 		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[primary->pipe->pipe].crtc_offset);
+				primary->pipe->crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);
 
 		/* And reset.. */
-- 
2.49.1

