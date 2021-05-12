Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BAF6E0DE
 for <igt-dev@lists.freedesktop.org>; Wed, 12 May 2021 06:37:47 +0000 (UTC)
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
Date: Tue, 11 May 2021 23:37:42 -0700
Message-Id: <20210512063742.185593-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t] tests/kms_invalid_dotclock: Test every
 mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Implementing:

/*
 * FIXME test every mode we have to be more
 * sure everything is really getting rejected?
 */

Output of the test  will look like the following:
...
Checking pipe A connector DP-2 with mode  720x400 70 720 738 846 900 400 412 414 449 0x6 0x40 1305601
Checking pipe B connector DP-2 with mode  720x400 70 720 738 846 900 400 412 414 449 0x6 0x40 1305601
Checking pipe C connector DP-2 with mode  720x400 70 720 738 846 900 400 412 414 449 0x6 0x40 1305601
Checking pipe D connector DP-2 with mode  720x400 70 720 738 846 900 400 412 414 449 0x6 0x40 1305601
SUCCESS (0.743s)

Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 tests/kms_invalid_dotclock.c | 54 +++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/tests/kms_invalid_dotclock.c b/tests/kms_invalid_dotclock.c
index 402629ab097f..aab765136d0e 100644
--- a/tests/kms_invalid_dotclock.c
+++ b/tests/kms_invalid_dotclock.c
@@ -48,9 +48,10 @@ static int
 test_output(data_t *data)
 {
 	igt_output_t *output = data->output;
-	drmModeModeInfo mode;
+	drmModeConnector *connector = output->config.connector;
+	drmModeModeInfo *mode;
 	struct igt_fb fb;
-	int i;
+	int i, j;
 
 	/*
 	 * FIXME When we have a fixed mode, the kernel will ignore
@@ -63,33 +64,30 @@ test_output(data_t *data)
 	if (has_scaling_mode_prop(data))
 		return 0;
 
-	/*
-	 * FIXME test every mode we have to be more
-	 * sure everything is really getting rejected?
-	 */
-	mode = *igt_output_get_mode(output);
-	mode.clock = data->max_dotclock + 1;
-
-	igt_create_fb(data->drm_fd,
-		      mode.hdisplay, mode.vdisplay,
-		      DRM_FORMAT_XRGB8888,
-		      LOCAL_DRM_FORMAT_MOD_NONE,
-		      &fb);
-
-	for (i = 0; i < data->res->count_crtcs; i++) {
-		int ret;
-
-		igt_info("Checking pipe %c connector %s with mode %s\n",
-			 'A'+i, output->name, mode.name);
-
-		ret = drmModeSetCrtc(data->drm_fd, data->res->crtcs[i],
-				     fb.fb_id, 0, 0,
-				     &output->id, 1, &mode);
-		igt_assert_lt(ret, 0);
+	for (j = 0; j < connector->count_modes; j++) {
+		mode = &connector->modes[j];
+		mode->clock = data->max_dotclock + 1;
+
+		igt_create_fb(data->drm_fd,
+			mode->hdisplay, mode->vdisplay,
+			DRM_FORMAT_XRGB8888,
+			LOCAL_DRM_FORMAT_MOD_NONE,
+			&fb);
+
+		for (i = 0; i < data->res->count_crtcs; i++) {
+			int ret;
+
+			igt_info("Checking pipe %c connector %s with mode",
+				'A'+i, output->name);
+			kmstest_dump_mode(mode);
+			ret = drmModeSetCrtc(data->drm_fd, data->res->crtcs[i],
+					fb.fb_id, 0, 0,
+					&output->id, 1, mode);
+			igt_assert_lt(ret, 0);
+		}
+
+		igt_remove_fb(data->drm_fd, &fb);
 	}
-
-	igt_remove_fb(data->drm_fd, &fb);
-
 	return 1;
 }
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
