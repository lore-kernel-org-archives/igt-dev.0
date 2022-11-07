Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54A610E3C6
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 15:20:55 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Nov 2022 17:20:51 +0200
Message-Id: <20221107152052.29137-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] Revert "tests/kms_invalid_mode: Avoid
 usage of same pipe on multiple outputs"
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

This reverts commit 52c06782816c1dfaf721308d70d9dca83f7eff16.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_invalid_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index f1c38669860d..8c345766d192 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -185,7 +185,6 @@ test_output(data_t *data)
 	int ret;
 	drmModeModeInfo *mode;
 
-	igt_display_reset(&data->display);
 	igt_output_set_pipe(output, data->pipe);
 
 	igt_create_fb(data->drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
@@ -203,6 +202,7 @@ test_output(data_t *data)
 	igt_remove_fb(data->drm_fd, &fb);
 	igt_output_override_mode(output, NULL);
 	/*unset_all_crtcs*/
+	igt_display_reset(&data->display);
 	igt_display_commit(&data->display);
 }
 
-- 
2.37.4
