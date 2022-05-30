Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE5410EAE2
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 06:07:23 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 May 2022 09:07:00 +0300
Message-Id: <20220530060701.406219-4-jouni.hogander@intel.com>
In-Reply-To: <20220530060701.406219-1-jouni.hogander@intel.com>
References: <20220530060701.406219-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/i915/kms_psr2_sf: Make setting fb
 and plane sz/pos more clear
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Make setting framebuffer and plane sizes/positions more clear. This
eases adding more big framebuffer testcases in future.
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_sf.c | 42 +++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 2916b7e5..47a431b6 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -710,6 +710,7 @@ static void plane_move_continuous(data_t *data)
 static void damaged_plane_update(data_t *data)
 {
 	igt_plane_t *test_plane = data->test_plane;
+	struct igt_fb *fb_test;
 	uint32_t h, v;
 	int x, y;
 
@@ -736,26 +737,27 @@ static void damaged_plane_update(data_t *data)
 		igt_assert(false);
 	}
 
-	if (data->screen_changes & 1) {
-		igt_plane_set_fb(test_plane, data->fb_continuous);
-	} else {
-		igt_plane_set_fb(test_plane, &data->fb_test);
-
-		if (data->test_plane_id == DRM_PLANE_TYPE_CURSOR)
-			igt_plane_replace_prop_blob(test_plane,
-						    IGT_PLANE_FB_DAMAGE_CLIPS,
-						    &data->cursor_clip,
-						    sizeof(struct drm_mode_rect));
-		else
-			igt_plane_replace_prop_blob(test_plane,
-						    IGT_PLANE_FB_DAMAGE_CLIPS,
-						    &data->plane_update_clip,
-						    sizeof(struct drm_mode_rect)*
-						    data->damage_area_count);
-	}
-
-	igt_fb_set_position(data->fb_continuous, test_plane, x, y);
-	igt_fb_set_size(data->fb_continuous, test_plane, h, v);
+	if (data->screen_changes & 1)
+		fb_test = data->fb_continuous;
+	else
+		fb_test = &data->fb_test;
+
+	igt_plane_set_fb(test_plane, fb_test);
+
+	if (data->test_plane_id == DRM_PLANE_TYPE_CURSOR)
+		igt_plane_replace_prop_blob(test_plane,
+					    IGT_PLANE_FB_DAMAGE_CLIPS,
+					    &data->cursor_clip,
+					    sizeof(struct drm_mode_rect));
+	else
+		igt_plane_replace_prop_blob(test_plane,
+					    IGT_PLANE_FB_DAMAGE_CLIPS,
+					    &data->plane_update_clip,
+					    sizeof(struct drm_mode_rect)*
+					    data->damage_area_count);
+
+	igt_fb_set_position(fb_test, test_plane, x, y);
+	igt_fb_set_size(fb_test, test_plane, h, v);
 	igt_plane_set_size(test_plane, h, v);
 	igt_plane_set_position(data->test_plane, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
-- 
2.25.1
