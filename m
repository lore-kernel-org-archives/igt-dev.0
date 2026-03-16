Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50D4F013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885C710E28E;
	Mon, 16 Mar 2026 08:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iwftzKvE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D53610E37E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649189; x=1805185189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cxdnd6u6X3vx4JD8FnaEMioVItzYPdEDJBotHgyka5o=;
 b=iwftzKvE4JPT/zUJY/8tVkQkETRueKROMItHSTPCnH1CmIUYOJ5OooJ6
 LJI636QZfqrCOjz/MryZ3uOK9f2qQaUodM9PJ0XCBBwTk+JVjf4kW6p5d
 X/lSBLHdmg6EfM5I820VNVns7+BE7R5v3lCui4kPqazH7WbK5BpWTnP1F
 HIExJLvcI8MOLHKyUOywEX0GayXG3jGqPRX4qxq2U54SUngaEwQ7Curor
 Slc3eSyEOV9s0i3t5ljN33ybUnXdeIMRozDNwNtKn9gllPU9Y7OcodUEF
 kVRZQnFOWsJR5uKgyRSXsvUxZMhMjpE594KvQQvjhaY+uT0rs+GG8d4TN g==;
X-CSE-ConnectionGUID: hafif1DNQ7GIxlwmumXVmQ==
X-CSE-MsgGUID: hYPplQXGRrm96ajAOiilSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359451"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359451"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:49 -0700
X-CSE-ConnectionGUID: 9ukGPP/gRViKch1+PdQzAA==
X-CSE-MsgGUID: t+vwD4OkRqKurHnsLtbs1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300744"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:48 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 14/17] tests/kms_plane_alpha_blend: Use CRC
 stop-on-fail assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:18 +0530
Message-ID: <20260316084021.419580-15-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316084021.419580-1-sowmiya.s@intel.com>
References: <20260316084021.419580-1-sowmiya.s@intel.com>
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

Replace igt_assert_crc_equal() with igt_assert_crc_equal_stop_on_fail()
to automatically stop CRC collection on mismatch.
Replace igt_pipe_crc_free() with igt_pipe_crc_cleanup() in prepare_crtc()
and add cleanup in fixture teardown.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_plane_alpha_blend.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 3a67dd8cd..947fcf998 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -217,7 +217,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, igt_crtc_t *crtc)
 						       DRM_PLANE_TYPE_PRIMARY);
 
 	/* create the pipe_crc object for this pipe */
-	igt_pipe_crc_free(data->pipe_crc);
+	igt_pipe_crc_cleanup(&data->pipe_crc);
 	data->pipe_crc = igt_crtc_crc_new(crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
@@ -321,8 +321,8 @@ static void basic_alpha(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 	igt_pipe_crc_stop(data->pipe_crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
 }
 
 static void argb_opaque(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
@@ -339,7 +339,7 @@ static void argb_opaque(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
 
-	igt_assert_crc_equal(&ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 }
 
 static void argb_transparent(data_t *data, igt_crtc_t *crtc,
@@ -357,7 +357,7 @@ static void argb_transparent(data_t *data, igt_crtc_t *crtc,
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
 
-	igt_assert_crc_equal(&ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 }
 
 static void constant_alpha_min(data_t *data, igt_crtc_t *crtc,
@@ -375,12 +375,12 @@ static void constant_alpha_min(data_t *data, igt_crtc_t *crtc,
 	igt_plane_set_fb(plane, &data->argb_fb_100);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 
 	igt_plane_set_fb(plane, &data->argb_fb_0);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 }
 
 static void constant_alpha_mid(data_t *data, igt_crtc_t *crtc,
@@ -402,12 +402,12 @@ static void constant_alpha_mid(data_t *data, igt_crtc_t *crtc,
 	igt_plane_set_fb(plane, &data->argb_fb_cov_0);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 
 	igt_plane_set_fb(plane, &data->argb_fb_100);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 }
 
 static void constant_alpha_max(data_t *data, igt_crtc_t *crtc,
@@ -427,17 +427,17 @@ static void constant_alpha_max(data_t *data, igt_crtc_t *crtc,
 	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "None");
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 
 	igt_plane_set_fb(plane, &data->argb_fb_cov_0);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 
 	igt_plane_set_fb(plane, &data->xrgb_fb);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 
 	igt_plane_set_fb(plane, NULL);
 }
@@ -465,7 +465,7 @@ static void alpha_7efc(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 
 	igt_pipe_crc_stop(data->pipe_crc);
 }
@@ -491,7 +491,7 @@ static void coverage_7efc(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 
 	igt_pipe_crc_stop(data->pipe_crc);
 }
@@ -517,14 +517,14 @@ static void coverage_premult_constant(data_t *data, igt_crtc_t *crtc,
 	igt_plane_set_fb(plane, &data->argb_fb_7e);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 
 	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "None");
 	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0x7e7e);
 	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &ref_crc, &crc);
 
 	igt_pipe_crc_stop(data->pipe_crc);
 }
@@ -775,6 +775,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	run_subtests(&data);
 
 	igt_fixture() {
+		igt_pipe_crc_cleanup(&data.pipe_crc);
 		remove_fbs(&data);
 		igt_display_reset(&data.display);
 		igt_display_commit2(&data.display, data.display.is_atomic ?
-- 
2.43.0

