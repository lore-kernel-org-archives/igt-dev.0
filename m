Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Tue,  1 Jun 2021 17:15:39 +0530
Message-Id: <1622547939-8157-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] [RFC] tests/kms_plane_alpha_blend: Fix
 coverage-vs-premult-vs-constant tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Few Gen11 systems show CRC mismatch. Make coverage-vs-premult-vs-constant
code similar to constant_alpha_min or basic_alpha

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_plane_alpha_blend.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index a37cb27c7d62..224d79bd1749 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -447,10 +447,6 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc = {}, crc = {};
 
-	/* Set a background color on the primary fb for testing */
-	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY), &data->gray_fb);
-
 	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
 	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
 	igt_display_commit2(display, COMMIT_ATOMIC);
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
