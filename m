Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F39FF8868
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 14:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFEE10E2B3;
	Mon, 27 Apr 2026 14:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SifDVvb3";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2FC10E2B3
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 14:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mJ3CXS4FmD9QSwVMT8EVCdWnJKs+t1skbRUTUFTZk0Y=; b=SifDVvb3L/HzOImRJw3OWvuLWb
 5Ur/mCZNlwhE7NvnqMil7wAoOC2BteZT+q/Llw1kC9ZA7ZovVeFUjfD7WSucRVg/7QgIyCQYNc4Cn
 PBdUA0NvP7b51UktCtyEQG3tEqSoItR9Zmxy58eOPd0KD98V+c/cGWr7IFgQc6sgtnTNzjwv0/Yeq
 93yvKOPwI78iaAgz9pY7J9sw6Mhabr3vxgBrQi1pjdF9h4JmoftRO7ONdZrmF0zz67LddgeWgzE7k
 m02PJMOgtY9+m09AsRTPZE2DzdAwILS8ESNNOZceEBSgTk1JDiRmR2eNbAujWonyjxY2MztxYttkw
 Uw6CuaDA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wHMoR-002xLZ-IS
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 16:19:51 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/kms: Set display->has_plane_color_pipeline
 automatically
Date: Mon, 27 Apr 2026 07:19:05 -0700
Message-ID: <20260427141905.2535060-1-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
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

The pipeline presence flag was stored in the display object and used
by multiple tests. However, each test would explicitly set the flag
itself immediately after requiring the display. Except for
the kms_properties test which used it but never actually set it (and
therefore was not correctly testing color pipelines).

So instead, set it in the display require function next to other
property flag detections.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 lib/igt_kms.c              | 2 ++
 tests/kms_color_pipeline.c | 5 -----
 tests/kms_colorop.c        | 4 ----
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 38c28f45f..d2e96d1ef 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3194,6 +3194,8 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
 		display->has_virt_cursor_plane = 1;
+	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+		display->has_plane_color_pipeline = 1;
 
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 78860a845..6119a830f 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -349,7 +349,6 @@ run_tests_for_plane(data_t *data)
 
 int igt_main()
 {
-	int has_plane_color_pipeline = 0;
 	data_t data = {};
 
 	igt_fixture() {
@@ -364,13 +363,9 @@ int igt_main()
 		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
 			data.display.is_atomic = 1;
 
-		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
-			has_plane_color_pipeline = 1;
-
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
-		data.display.has_plane_color_pipeline = has_plane_color_pipeline;
 		igt_require(data.display.is_atomic);
 	}
 
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 16db0b8ad..4db83470d 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -418,14 +418,10 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
 
 		igt_display_require(&display, display.drm_fd);
-		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
-			display.has_plane_color_pipeline = 1;
 
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&display, display.drm_fd);
-		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
-			display.has_plane_color_pipeline = 1;
 
 		igt_require(display.is_atomic);
 	}
-- 
2.43.0

