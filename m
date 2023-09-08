Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A707910E0E6
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 17:50:46 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 23:20:37 +0530
Message-Id: <20230908175039.1291593-4-swati2.sharma@intel.com>
In-Reply-To: <20230908175039.1291593-1-swati2.sharma@intel.com>
References: <20230908175039.1291593-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] tests/intel/kms_pm_dc: Use linear
 modifier to set primary plane
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

To setup primary plane, use DRM_FORMAT_MOD_LINEAR instead of
I915_FORMAT_MOD_X_TILED.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_pm_dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 895fe4b4c..b5779eaa5 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -231,7 +231,7 @@ static void setup_primary(data_t *data)
 	igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    I915_FORMAT_MOD_X_TILED,
+			    DRM_FORMAT_MOD_LINEAR,
 			    1.0, 1.0, 1.0,
 			    &data->fb_white);
 	igt_plane_set_fb(primary, &data->fb_white);
-- 
2.25.1
