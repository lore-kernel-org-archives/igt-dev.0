Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB0D898AA
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Sep 2021 18:17:41 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon,  6 Sep 2021 21:17:31 +0300
Message-Id: <20210906181736.3914421-2-imre.deak@intel.com>
In-Reply-To: <20210906181736.3914421-1-imre.deak@intel.com>
References: <20210906181736.3914421-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 1/6] tests/kms_ccs: Make sure to free GEM and
 FB objects
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

At the moment we're leaking the GEM and FB objects that could lead to
OOM if multiple subtests are run (vs. each subtest in a separate test
run).

v2:
- Free things before calling igt_assert(), as this jumps to the next
  subtest if the check fails. (Juha-Pekka)

Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_ccs.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 586680ae1..61edad627 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -343,8 +343,14 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 
 	ret = drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f);
 	if (data->flags & TEST_FAIL_ON_ADDFB2) {
+		int addfb_errno = errno;
+
+		if (f.handles[index])
+			gem_close(data->drm_fd, f.handles[index]);
+
 		igt_assert_eq(ret, -1);
-		igt_assert_eq(errno, EINVAL);
+		igt_assert_eq(addfb_errno, EINVAL);
+
 		return;
 	} else
 		igt_assert_eq(ret, 0);
@@ -387,7 +393,8 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	drmModeModeInfo *drm_mode = igt_output_get_mode(data->output);
 	int fb_width = drm_mode->hdisplay;
 	enum igt_commit_style commit;
-	struct igt_fb fb, fb_sprite;
+	struct igt_fb fb = {};
+	struct igt_fb fb_sprite = {};
 	int ret;
 
 	if (data->display.is_atomic)
@@ -443,6 +450,10 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 		igt_plane_set_rotation(primary, IGT_ROTATION_90);
 
 	ret = igt_display_try_commit2(display, commit);
+
+	igt_remove_fb(data->drm_fd, &fb_sprite);
+	igt_remove_fb(data->drm_fd, &fb);
+
 	if (data->flags & TEST_BAD_ROTATION_90) {
 		igt_assert_eq(ret, -EINVAL);
 	} else {
@@ -458,16 +469,12 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 		igt_plane_set_position(data->plane, 0, 0);
 		igt_plane_set_size(data->plane, 0, 0);
 		igt_plane_set_fb(data->plane, NULL);
-		igt_remove_fb(display->drm_fd, &fb_sprite);
 	}
 
 	igt_plane_set_fb(primary, NULL);
 	igt_plane_set_rotation(primary, IGT_ROTATION_0);
 	igt_display_commit2(display, commit);
 
-	if (data->flags & TEST_CRC)
-		igt_remove_fb(data->drm_fd, &fb);
-
 	return true;
 }
 
-- 
2.27.0
