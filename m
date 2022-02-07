Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE72B10F98D
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Feb 2022 18:23:01 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Mon,  7 Feb 2022 23:51:51 +0530
Message-Id: <20220207182152.31211-17-jeevan.b@intel.com>
In-Reply-To: <20220207182152.31211-1-jeevan.b@intel.com>
References: <20220207182152.31211-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t 16/17] tests/kms_plane_scaling: Adding
 Tile-4 support
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
List-ID: <igt-dev@lists.freedesktop.org>

adding tile-4 changes for 2x-scaler-multi-pipe subtest to support on dg2

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_plane_scaling.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 85db11ee..1ab7e5ce 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -613,8 +613,15 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_output_t *output1, *output2;
 	drmModeModeInfo *mode1, *mode2;
 	enum pipe pipe1, pipe2;
-	uint64_t modifier = is_i915_device(display->drm_fd) ?
-		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_LINEAR;
+	bool has_4tile = intel_get_device_info(intel_get_drm_devid(d->drm_fd))->has_4tile;
+	uint64_t modifier;
+
+	if (is_i915_device(display->drm_fd) && has_4tile)
+		modifier = I915_FORMAT_MOD_4_TILED;
+	else if (is_i915_device(display->drm_fd))
+		modifier = I915_FORMAT_MOD_Y_TILED;
+	else
+		modifier = DRM_FORMAT_MOD_LINEAR;
 
 	cleanup_crtc(d);
 
-- 
2.17.1
