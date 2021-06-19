Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17F16E042
 for <igt-dev@lists.freedesktop.org>; Sat, 19 Jun 2021 17:17:13 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Sat, 19 Jun 2021 22:37:41 +0530
Message-Id: <1624122461-19827-1-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <1624090135-437-1-git-send-email-vidya.srinivas@intel.com>
References: <1624090135-437-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Use alpha for
 primary plane for coverage-vs-premult-vs-constant
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Few Gen11 systems report CRC mismatch with higher alpha values if
primary plane with gray is enabled. So in order to get the coverage vs. premult vs. constant
crc to match use alpha buffer for primary plane as well in coverage-vs-premult-vs-constant.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_plane_alpha_blend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index a37cb27c7d62..52c273c71dad 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -449,7 +449,7 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
 
 	/* Set a background color on the primary fb for testing */
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY), &data->gray_fb);
+		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY), &data->argb_fb_cov_7e);
 
 	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
 	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
