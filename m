Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C593210E299
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 14:03:34 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 14 Sep 2023 19:33:59 +0530
Message-Id: <20230914140401.11101-4-swati2.sharma@intel.com>
In-Reply-To: <20230914140401.11101-1-swati2.sharma@intel.com>
References: <20230914140401.11101-1-swati2.sharma@intel.com>
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
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_pm_dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 76c662f1f..037c5ad2d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -224,7 +224,7 @@ static void setup_primary(data_t *data)
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
