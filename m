Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B243BEF9014
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 13:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655E710E29D;
	Thu,  5 Mar 2026 13:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ed2K86e0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE0B10E29D
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 13:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772718047; x=1804254047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HTvqnfYyu31UrWi8gWy58BB10tdXkGOjlbqPC4/gF6M=;
 b=ed2K86e0/Gxh9E+K48ocLrr6argCRTebLov0Z/dzlPs9jCNexlpm8FGJ
 fPBTw7A3TlY/ErR3/lYkPVPpg3/yTUYYYQGHWngLHOZQC0E7OwyO7MZ4M
 foN9MIZEmahD9rBWYSx7zP6ZCBOcwJgAU9HLDbYMfJDEceZKj4jQ5mx/1
 8dhHS6AAEwvvuG4UgCcwYYBY7SCW+6b/f0NEJeuhR7mUCG4zf3AVZJ1bk
 JZszr9M472y0MSeiYcYc72/5rsJUNPflI5xdfAwU34HFHxuuQpiIp9kt1
 Pi0M2nKe/G92a/pcyff80IPVTqC6EKLhB27JqiX932EB2d7T60DUYvl+6 Q==;
X-CSE-ConnectionGUID: uESHUky7TZ63EslNfDa8/Q==
X-CSE-MsgGUID: P+y0scLaTGWTW9XpffWKSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="99270800"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="99270800"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:40:47 -0800
X-CSE-ConnectionGUID: 8k9mw8aRRdGScGoMMNvDtw==
X-CSE-MsgGUID: s5I3zHxDQVOkAo6u1TTkJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="218818829"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:40:46 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>
Subject: [PATCH i-g-t 1/5] tests/nouveau_crc: Extract {setup,cleanup}_test()
Date: Thu,  5 Mar 2026 15:40:34 +0200
Message-ID: <20260305134038.6995-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
References: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
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

Prep for dynamic subtests by extracting the per-subtest setup/cleanup
fixtures to separate functions.

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/nouveau_crc.c | 89 +++++++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 39 deletions(-)

diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index c080ded3e621..393414339ab0 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -317,6 +317,54 @@ static void test_source_outp_inactive(data_t *data)
 	destroy_crc_colors(data, colors, n_colors);
 }
 
+static void setup_test(data_t *data)
+{
+	int dir;
+
+	igt_display_require_output_on_crtc(data->crtc);
+
+	/* Disable the output from the previous iteration of pipe tests, if there is
+	 * one
+	 */
+	if (data->output) {
+		igt_output_set_crtc(data->output, NULL);
+		igt_display_commit(&data->display);
+	}
+
+	data->output = igt_get_single_output_for_crtc(data->crtc);
+	data->mode = igt_output_get_mode(data->output);
+
+	/* None of these tests need to perform modesets, just page flips. So running
+	 * display setup here is fine
+	 */
+	igt_output_set_crtc(data->output,
+			    data->crtc);
+	data->primary = igt_output_get_plane(data->output, 0);
+	igt_create_color_fb(data->drm_fd,
+			    data->mode->hdisplay,
+			    data->mode->vdisplay,
+			    DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR,
+			    0.0, 0.0, 0.0,
+			    &data->default_fb);
+	igt_plane_set_fb(data->primary, &data->default_fb);
+	igt_display_commit(&data->display);
+
+	dir = igt_debugfs_crtc_dir(data->drm_fd,
+				   data->crtc->pipe,
+				   O_DIRECTORY);
+	igt_require_fd(dir);
+	data->nv_crc_dir = openat(dir, "nv_crc", O_DIRECTORY);
+	close(dir);
+	igt_require_fd(data->nv_crc_dir);
+}
+
+static void cleanup_test(data_t *data)
+{
+	igt_remove_fb(data->drm_fd, &data->default_fb);
+	close(data->nv_crc_dir);
+}
+
 data_t data = {0};
 
 #define pipe_test(name) igt_subtest_f("pipe-%s-" name, kmstest_pipe_name(pipe))
@@ -337,46 +385,10 @@ int igt_main()
 
 	for_each_pipe_static(pipe) {
 		igt_fixture() {
-			int dir;
-
 			data.crtc = igt_crtc_for_pipe(&data.display, pipe);
 			igt_require(data.crtc->valid);
-			igt_display_require_output_on_crtc(data.crtc);
 
-			/* Disable the output from the previous iteration of pipe tests, if there is
-			 * one
-			 */
-			if (data.output) {
-				igt_output_set_crtc(data.output, NULL);
-				igt_display_commit(&data.display);
-			}
-
-			data.output = igt_get_single_output_for_crtc(data.crtc);
-			data.mode = igt_output_get_mode(data.output);
-
-			/* None of these tests need to perform modesets, just page flips. So running
-			 * display setup here is fine
-			 */
-			igt_output_set_crtc(data.output,
-					    data.crtc);
-			data.primary = igt_output_get_plane(data.output, 0);
-			igt_create_color_fb(data.drm_fd,
-					    data.mode->hdisplay,
-					    data.mode->vdisplay,
-					    DRM_FORMAT_XRGB8888,
-					    DRM_FORMAT_MOD_LINEAR,
-					    0.0, 0.0, 0.0,
-					    &data.default_fb);
-			igt_plane_set_fb(data.primary, &data.default_fb);
-			igt_display_commit(&data.display);
-
-			dir = igt_debugfs_crtc_dir(data.drm_fd,
-						   data.crtc->pipe,
-						   O_DIRECTORY);
-			igt_require_fd(dir);
-			data.nv_crc_dir = openat(dir, "nv_crc", O_DIRECTORY);
-			close(dir);
-			igt_require_fd(data.nv_crc_dir);
+			setup_test(&data);
 		}
 
 		/* We don't need to test this on every pipe, but the setup is the same */
@@ -414,8 +426,7 @@ int igt_main()
 			test_source_outp_inactive(&data);
 
 		igt_fixture() {
-			igt_remove_fb(data.drm_fd, &data.default_fb);
-			close(data.nv_crc_dir);
+			cleanup_test(&data);
 		}
 	}
 
-- 
2.52.0

