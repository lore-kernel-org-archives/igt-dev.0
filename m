Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B828BC19F32
	for <igt-dev@archiver.kernel.org>; Fri,  7 Mar 2025 15:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DED310E33A;
	Fri,  7 Mar 2025 15:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWGzmr2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5BB10E33A
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Mar 2025 15:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741362551; x=1772898551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kvKIoWw2TiONxvUS9QueS8ZyHibUqiwWC78+m5u3Odw=;
 b=WWGzmr2Wo0qe2sf0o5Iynf6Au5NQIstxnXGn6gxd2UFTMh5s9u9NkhdM
 0hrSY7pqEgdXcwm/vqa3saBpYLZ4PPvkKZohunutpdc6s6DrVGlZ1bb5H
 0ljWkFtuhnauencLYGMBzR0JT4etcY1maIe9v3W7hIUxY6xGyZayrUrLF
 cOrHipSdembPRdUgpyMgd/+NA4gqyazGK3B3cF76YR49lRc4dX2uXSWpw
 /SVG/o7UbUw1COfL7H3zuA3FguqK5gRVn9Fa4Nt8vaElg8w8mBZMrtMmv
 Xm7bLN9WBNrZBp5KyNvtFcNsxKsqVHDLTGIlYmnJijjPK8v2nWseqsoTX g==;
X-CSE-ConnectionGUID: Dnmk6rMVSWGnrLepe5MtUg==
X-CSE-MsgGUID: bZePxVtWRJGTmXZ+IsUFug==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52620630"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="52620630"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 07:49:11 -0800
X-CSE-ConnectionGUID: oCsOozK6R2OBrAEEI3ln9A==
X-CSE-MsgGUID: R/SWrbwHQVWXRmGZdjBovw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="124267072"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.232])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 07:49:07 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 juha-pekka.heikkila@intel.com, jani.saarinen@intel.com
Subject: [PATCH i-g-t v1] tests/intel/kms_fbc_dirty_rect: cleanup the dirty
 rect tests
Date: Fri,  7 Mar 2025 17:48:54 +0200
Message-ID: <20250307154854.246073-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

These tests rely on FBC is enabled, some FIFO underruns can
disable FBC and can trigger asserts. In case if such asserts
are triggered, we end up not clearing the used fbs and crcs.
Use  common functions to prepare and clear igt test parameters
as required for each tests

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 231 ++++++++++++-------------------
 1 file changed, 90 insertions(+), 141 deletions(-)

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index ea7a73124..4484355b2 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -51,6 +51,10 @@
 #define SQUARE_OFFSET 100
 #define SQUARE_OFFSET_2 600
 
+#define N_FBS				4
+#define MAIN_FB_IDX			0
+#define DIRTY_RECT_FBS_START_IDX	1
+
 typedef struct {
 	int drm_fd;
 	int debugfs_fd;
@@ -61,7 +65,7 @@ typedef struct {
 	enum pipe pipe;
 	u32 format;
 
-	igt_crc_t ref_crc;
+	struct igt_fb fb[N_FBS];
 
 	enum {
 		FEATURE_NONE  = 0,
@@ -73,17 +77,12 @@ typedef struct {
 	} feature;
 } data_t;
 
-static void set_damage_clip(struct drm_mode_rect *damage, int x1, int y1, int x2, int y2)
+static void set_damage_clip_w(struct drm_mode_rect *damage, int x1, int y1, int width, int height)
 {
 	damage->x1 = x1;
 	damage->y1 = y1;
-	damage->x2 = x2;
-	damage->y2 = y2;
-}
-
-static void set_damage_clip_w(struct drm_mode_rect *damage, int x1, int y1, int width, int height)
-{
-	set_damage_clip(damage, x1, y1, x1 + width, y1 + height);
+	damage->x2 = x1 + width;
+	damage->y2 = y1 + height;
 }
 
 static void dirty_rect_draw_white_rects(data_t *data, struct igt_fb *fb,
@@ -116,16 +115,11 @@ set_damage_area(igt_plane_t *plane,  struct drm_mode_rect *rects,
 
 static void
 set_fb_and_collect_crc(data_t *data, igt_plane_t *plane, struct igt_fb *fb,
-		       igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
+		       igt_crc_t *crc)
 {
 	igt_plane_set_fb(plane, fb);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	if (!data->pipe_crc) {
-		data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-						  IGT_PIPE_CRC_SOURCE_AUTO);
-	}
-
 	igt_pipe_crc_start(data->pipe_crc);
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, crc);
 	igt_pipe_crc_stop(data->pipe_crc);
@@ -186,52 +180,45 @@ update_rect_with_dirtyfb(data_t *data, struct igt_fb *fb1, struct igt_fb *fb2,
 
 static void fbc_dirty_rectangle_dirtyfb(data_t *data)
 {
-	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
-	igt_display_t *display = &data->display;
-	igt_output_t *output = data->output;
 	igt_plane_t *primary;
-	drmModeModeInfo *mode;
-	struct igt_fb main_fb, fb2, fb3;
 	struct drm_mode_rect full_rect, rect1, rect2;
 	igt_crc_t main_crc, fb2_crc, fb3_crc, crc;
 
-	mode = igt_output_get_mode(output);
-	igt_output_set_pipe(output, data->pipe);
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 
-	set_damage_clip_w(&full_rect, 0, 0, mode->hdisplay, mode->vdisplay);
+	set_damage_clip_w(&full_rect, 0, 0, data->mode->hdisplay, data->mode->vdisplay);
 	set_damage_clip_w(&rect1, SQUARE_OFFSET, SQUARE_OFFSET, SQUARE_SIZE, SQUARE_SIZE);
 	set_damage_clip_w(&rect2, SQUARE_OFFSET_2, SQUARE_OFFSET_2, SQUARE_SIZE, SQUARE_SIZE);
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
-			    data->format, DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &main_fb);
+			    data->format, DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[MAIN_FB_IDX]);
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
-			    data->format, DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &fb2);
-	dirty_rect_draw_white_rects(data, &fb2, 1, &rect1);
+			    data->format, DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[1]);
+	dirty_rect_draw_white_rects(data, &data->fb[1], 1, &rect1);
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
-			    data->format, DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &fb3);
-	dirty_rect_draw_white_rects(data, &fb3, 1, &rect2);
+			    data->format, DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[2]);
+	dirty_rect_draw_white_rects(data, &data->fb[2], 1, &rect2);
 
 	/* 1st screen - Empty blue screen */
 	set_damage_area(primary, &full_rect, sizeof(full_rect));
-	set_fb_and_collect_crc(data, primary, &main_fb, pipe_crc, &main_crc);
+	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &main_crc);
 
 	/* 2nd screen - 1st white rect at 100, 100 - using damage area */
 	set_damage_area(primary, &rect1, sizeof(rect1));
-	set_fb_and_collect_crc(data, primary, &fb2, pipe_crc, &fb2_crc);
+	set_fb_and_collect_crc(data, primary, &data->fb[1], &fb2_crc);
 
 	/* 3rd screen - 2nd white rect at 600, 600 - using damage area.
 	 * Now two white rects on screen
 	 */
 	set_damage_area(primary, &rect2, sizeof(rect2));
-	set_fb_and_collect_crc(data, primary, &fb3, pipe_crc, &fb3_crc);
+	set_fb_and_collect_crc(data, primary, &data->fb[2], &fb3_crc);
 
 	/* 4th screen - clear the 2nd white rect at 600,600 with dirtyfb.
 	 * Copy rect2 area from main_fb to fb3.
 	 */
-	update_rect_with_dirtyfb(data, &main_fb, &fb3, &rect2);
+	update_rect_with_dirtyfb(data, &data->fb[MAIN_FB_IDX], &data->fb[2], &rect2);
 	/* Now the screen must match 1st screen - with whole blue */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
 	igt_assert_crc_equal(&crc, &main_crc);
@@ -239,21 +226,10 @@ static void fbc_dirty_rectangle_dirtyfb(data_t *data)
 	/* 5th screen - Copy the first rect at 100,100 with dirtyfb.
 	 * Copy rect1 area from fb2 to fb3.
 	 */
-	update_rect_with_dirtyfb(data, &fb2, &fb3, &rect1);
+	update_rect_with_dirtyfb(data, &data->fb[1], &data->fb[2], &rect1);
 	/* Now the screen must match 2nd screen - with one rect at 100,100 */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
 	igt_assert_crc_equal(&crc, &fb2_crc);
-
-	igt_plane_set_fb(primary, NULL);
-	igt_remove_fb(data->drm_fd, &main_fb);
-	igt_remove_fb(data->drm_fd, &fb2);
-	igt_remove_fb(data->drm_fd, &fb3);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	if (data->pipe_crc) {
-		igt_pipe_crc_free(data->pipe_crc);
-		data->pipe_crc = NULL;
-	}
 }
 
 /**
@@ -270,56 +246,43 @@ static void fbc_dirty_rectangle_dirtyfb(data_t *data)
  */
 static void fbc_dirty_rectangle_outside_visible_region(data_t *data)
 {
-	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
-	igt_display_t *display = &data->display;
-	igt_output_t *output = data->output;
 	igt_plane_t *primary;
-	struct igt_fb main_fb, rect_fb[3];
-	struct drm_mode_rect rect[3], full_rect;
-	igt_crc_t main_crc, rect_crc[3];
+	struct drm_mode_rect rect[N_FBS];
+	igt_crc_t rect_crc[N_FBS];
 
-	igt_output_set_pipe(output, data->pipe);
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+
+	set_damage_clip_w(&rect[0], 0, 0, data->mode->hdisplay + 200, data->mode->vdisplay + 200);
 
-	set_damage_clip(&full_rect, 0, 0, data->mode->hdisplay + 200, data->mode->vdisplay + 200);
 	/* Rect Horizontally outside visible region */
-	set_damage_clip_w(&rect[0], data->mode->hdisplay + 10, 100, SQUARE_SIZE, SQUARE_SIZE);
+	set_damage_clip_w(&rect[1], data->mode->hdisplay + 10, 100, SQUARE_SIZE, SQUARE_SIZE);
+
 	/* Rect vertically outside visible region */
-	set_damage_clip_w(&rect[1], 10, data->mode->vdisplay + 50, SQUARE_SIZE, SQUARE_SIZE);
+	set_damage_clip_w(&rect[2], 10, data->mode->vdisplay + 50, SQUARE_SIZE, SQUARE_SIZE);
+
 	/* Rect Horizontally and vertically outside visible region */
-	set_damage_clip_w(&rect[2], data->mode->hdisplay + 10, data->mode->vdisplay + 50,
+	set_damage_clip_w(&rect[3], data->mode->hdisplay + 10, data->mode->vdisplay + 50,
 			  SQUARE_SIZE, SQUARE_SIZE);
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay + 200,
 			    data->mode->vdisplay + 200, data->format,
-			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0, &main_fb);
+			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0, &data->fb[MAIN_FB_IDX]);
 
-	for (int i = 0; i < 3; i++) {
+	for (int i = DIRTY_RECT_FBS_START_IDX; i < N_FBS; i++) {
 		igt_create_color_fb(data->drm_fd, data->mode->hdisplay + 200,
 				    data->mode->vdisplay + 200, data->format,
-				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0, &rect_fb[i]);
-		dirty_rect_draw_white_rects(data, &rect_fb[i], 1, &rect[i]);
+				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0, &data->fb[i]);
+		dirty_rect_draw_white_rects(data, &data->fb[i], 1, &rect[i]);
 	}
 
 	/* Main rect */
-	set_damage_area(primary, &full_rect, sizeof(full_rect));
-	set_fb_and_collect_crc(data, primary, &main_fb, pipe_crc, &main_crc);
+	set_damage_area(primary, &rect[MAIN_FB_IDX], sizeof(rect[MAIN_FB_IDX]));
+	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &rect_crc[MAIN_FB_IDX]);
 
-	for (int i = 0; i < 3; i++) {
+	for (int i = DIRTY_RECT_FBS_START_IDX; i < N_FBS; i++) {
 		set_damage_area(primary, &rect[i], sizeof(rect[i]));
-		set_fb_and_collect_crc(data, primary, &rect_fb[i], pipe_crc, &rect_crc[i]);
-		igt_assert_crc_equal(&rect_crc[i], &main_crc);
-	}
-
-	igt_plane_set_fb(primary, NULL);
-	igt_remove_fb(data->drm_fd, &main_fb);
-	for (int i = 0; i < 3; i++)
-		igt_remove_fb(data->drm_fd, &rect_fb[i]);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	if (data->pipe_crc) {
-		igt_pipe_crc_free(data->pipe_crc);
-		data->pipe_crc = NULL;
+		set_fb_and_collect_crc(data, primary, &data->fb[i], &rect_crc[i]);
+		igt_assert_crc_equal(&rect_crc[i], &rect_crc[MAIN_FB_IDX]);
 	}
 }
 
@@ -359,115 +322,119 @@ static void fbc_dirty_rectangle_outside_visible_region(data_t *data)
  */
 static void fbc_dirty_rectangle_basic(data_t *data)
 {
-	igt_display_t *display = &data->display;
-	igt_output_t *output = data->output;
 	igt_plane_t *primary;
-	struct igt_fb main_fb;
-	struct igt_fb rect_1_fb;
-	struct igt_fb rect_2_fb;
-	struct igt_fb rect_combined_fb;
 	struct drm_mode_rect rect1;
 	struct drm_mode_rect rect2;
 	struct drm_mode_rect rect_combined[2];
 	struct drm_mode_rect full_rect;
 	igt_crc_t main_fb_crc, rect_1_fb_crc, rect_2_fb_crc, rect_combined_fb_crc, crc;
 
-	igt_output_set_pipe(output, data->pipe);
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 
-	set_damage_clip(&full_rect, 0, 0, data->mode->hdisplay-1, data->mode->vdisplay-1);
-	set_damage_clip(&rect1, SQUARE_OFFSET, SQUARE_OFFSET, SQUARE_OFFSET + SQUARE_SIZE,
-			SQUARE_OFFSET + SQUARE_SIZE);
-	set_damage_clip(&rect2, SQUARE_OFFSET_2, SQUARE_OFFSET_2, SQUARE_OFFSET_2 + SQUARE_SIZE,
-			SQUARE_OFFSET_2 + SQUARE_SIZE);
-	set_damage_clip(&rect_combined[0], rect1.x1, rect1.y1, rect1.x2, rect1.y2);
-	set_damage_clip(&rect_combined[1], rect2.x1, rect2.y1, rect2.x2, rect2.y2);
+	set_damage_clip_w(&full_rect, 0, 0, data->mode->hdisplay, data->mode->vdisplay);
+	set_damage_clip_w(&rect1, SQUARE_OFFSET, SQUARE_OFFSET, SQUARE_SIZE, SQUARE_SIZE);
+	set_damage_clip_w(&rect2, SQUARE_OFFSET_2, SQUARE_OFFSET_2, SQUARE_SIZE, SQUARE_SIZE);
+	rect_combined[0] = rect1;
+	rect_combined[1] = rect2;
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay, data->format,
-			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &main_fb);
+			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[MAIN_FB_IDX]);
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay, data->format,
-			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &rect_1_fb);
-	dirty_rect_draw_white_rects(data, &rect_1_fb, 1, &rect1);
+			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[1]);
+	dirty_rect_draw_white_rects(data, &data->fb[1], 1, &rect1);
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay, data->format,
-			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &rect_2_fb);
-	dirty_rect_draw_white_rects(data, &rect_2_fb, 1, &rect2);
+			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[2]);
+	dirty_rect_draw_white_rects(data, &data->fb[2], 1, &rect2);
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay, data->format,
-			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &rect_combined_fb);
-	dirty_rect_draw_white_rects(data, &rect_combined_fb, ARRAY_SIZE(rect_combined),
+			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 1.0, &data->fb[3]);
+	dirty_rect_draw_white_rects(data, &data->fb[3], ARRAY_SIZE(rect_combined),
 				    rect_combined);
 
 	/* main_fb blank blue screen - get and store crc */
-	set_fb_and_collect_crc(data, primary, &main_fb, data->pipe_crc, &main_fb_crc);
+	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &main_fb_crc);
 
 	/* Whole blue screen with one white rect and collect crc */
 	set_damage_area(primary, &full_rect, sizeof(full_rect));
-	set_fb_and_collect_crc(data, primary, &rect_1_fb, data->pipe_crc, &rect_1_fb_crc);
+	set_fb_and_collect_crc(data, primary, &data->fb[1], &rect_1_fb_crc);
 
 	/* Second white rect and collect crc */
 	set_damage_area(primary, &full_rect, sizeof(full_rect));
-	set_fb_and_collect_crc(data, primary, &rect_2_fb, data->pipe_crc, &rect_2_fb_crc);
+	set_fb_and_collect_crc(data, primary, &data->fb[2], &rect_2_fb_crc);
 
 	/* Both rects and collect crc */
 	set_damage_area(primary, &full_rect, sizeof(full_rect));
-	set_fb_and_collect_crc(data, primary, &rect_combined_fb, data->pipe_crc,
-			       &rect_combined_fb_crc);
+	set_fb_and_collect_crc(data, primary, &data->fb[3], &rect_combined_fb_crc);
 
 	/* Put full blank screen back */
 	set_damage_area(primary, &full_rect, sizeof(full_rect));
-	set_fb_and_collect_crc(data, primary, &main_fb, data->pipe_crc, &crc);
+	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &crc);
 	igt_assert_crc_equal(&crc, &main_fb_crc);
 
 	/* Set combined rect - draw two white rects using damage area */
 	set_damage_area(primary, rect_combined, sizeof(rect_combined));
-	set_fb_and_collect_crc(data, primary, &rect_combined_fb, data->pipe_crc, &crc);
+	set_fb_and_collect_crc(data, primary, &data->fb[3], &crc);
 	igt_assert_crc_equal(&crc, &rect_combined_fb_crc);
 
 	/* Clear first rect using damage area. Only the second rect should be visible here! */
 	set_damage_area(primary, &rect1, sizeof(rect1));
-	set_fb_and_collect_crc(data, primary, &main_fb, data->pipe_crc, &crc);
+	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &crc);
 	igt_assert_crc_equal(&crc, &rect_2_fb_crc);
 
 	/* Clear the second rect as well. Now back to original blank screen */
 	set_damage_area(primary, &rect2, sizeof(rect2));
-	set_fb_and_collect_crc(data, primary, &main_fb, data->pipe_crc, &crc);
+	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &crc);
 	igt_assert_crc_equal(&crc, &main_fb_crc);
+}
 
-	igt_plane_set_fb(primary, NULL);
-	igt_remove_fb(data->drm_fd, &main_fb);
-	igt_remove_fb(data->drm_fd, &rect_1_fb);
-	igt_remove_fb(data->drm_fd, &rect_2_fb);
-	igt_remove_fb(data->drm_fd, &rect_combined_fb);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+static void cleanup(data_t *data)
+{
+	igt_remove_fb(data->drm_fd, &data->fb[0]);
+	igt_remove_fb(data->drm_fd, &data->fb[1]);
+	igt_remove_fb(data->drm_fd, &data->fb[2]);
+	igt_remove_fb(data->drm_fd, &data->fb[3]);
 
-	if (data->pipe_crc) {
-		igt_pipe_crc_free(data->pipe_crc);
-		data->pipe_crc = NULL;
-	}
+	igt_pipe_crc_free(data->pipe_crc);
+
+	igt_output_set_pipe(data->output, PIPE_NONE);
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
-static void prepare_test(data_t *data, igt_output_t *output)
+static bool prepare_test(data_t *data)
 {
+	igt_display_reset(&data->display);
+
+	data->mode = igt_output_get_mode(data->output);
+	igt_output_set_pipe(data->output, data->pipe);
+	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
+
 	igt_require_f(intel_fbc_supported_on_chipset(data->drm_fd, data->pipe),
 		      "FBC not supported by the chipset on pipe\n");
 
 	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
-		psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, NULL) ||
-		psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL)) {
+	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, NULL) ||
+	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL)) {
 		igt_info("PSR is supported by the sink. Disabling PSR to test Dirty FBC functionality.\n");
-		psr_disable(data->drm_fd, data->debugfs_fd, output);
+		psr_disable(data->drm_fd, data->debugfs_fd, data->output);
 	}
 
 	if (data->feature & FEATURE_FBC)
 		intel_fbc_enable(data->drm_fd);
+
+	return intel_pipe_output_combo_valid(&data->display);
 }
 
 static void fbc_dirty_rectangle_test(data_t *data, void (*test_func)(data_t *))
 {
-	prepare_test(data, data->output);
+	if (!prepare_test(data))
+		return;
+
 	test_func(data);
+	cleanup(data);
 }
 
 igt_main
@@ -491,13 +458,7 @@ igt_main
 
 		for_each_pipe(&data.display, data.pipe) {
 			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
-				data.mode = igt_output_get_mode(data.output);
 				data.format = DRM_FORMAT_XRGB8888;
-				igt_display_reset(&data.display);
-				igt_output_set_pipe(data.output, data.pipe);
-
-				if (!intel_pipe_output_combo_valid(&data.display))
-					continue;
 
 				igt_dynamic_f("pipe-%s-%s",
 					       kmstest_pipe_name(data.pipe),
@@ -514,13 +475,7 @@ igt_main
 
 		for_each_pipe(&data.display, data.pipe) {
 			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
-				data.mode = igt_output_get_mode(data.output);
 				data.format = DRM_FORMAT_XRGB8888;
-				igt_display_reset(&data.display);
-				igt_output_set_pipe(data.output, data.pipe);
-
-				if (!intel_pipe_output_combo_valid(&data.display))
-					continue;
 
 				igt_dynamic_f("pipe-%s-%s",
 					       kmstest_pipe_name(data.pipe),
@@ -540,12 +495,6 @@ igt_main
 
 		for_each_pipe(&data.display, data.pipe) {
 			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
-				data.mode = igt_output_get_mode(data.output);
-				igt_display_reset(&data.display);
-				igt_output_set_pipe(data.output, data.pipe);
-
-				if (!intel_pipe_output_combo_valid(&data.display))
-					continue;
 
 				for (int i = 0; i < num_formats; i++) {
 					igt_dynamic_f("pipe-%s-%s-format-%s",
-- 
2.43.0

