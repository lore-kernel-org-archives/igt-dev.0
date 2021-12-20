Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5348711A43E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Dec 2021 09:45:18 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
Date: Mon, 20 Dec 2021 15:11:52 +0530
Message-Id: <20211220094153.282527-2-ananya.sharma@intel.com>
In-Reply-To: <20211220094153.282527-1-ananya.sharma@intel.com>
References: <20211220094153.282527-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_draw_crc: replacing
 drmModeRmFb with igt_remove_fb
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

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_draw_crc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
index 5e3252b7..b40a84a7 100644
--- a/tests/kms_draw_crc.c
+++ b/tests/kms_draw_crc.c
@@ -160,6 +160,10 @@ static bool format_is_supported(uint32_t format, uint64_t modifier)
 	unsigned int offsets[4] = {};
 	unsigned int strides[4] = {};
 	int ret;
+	struct igt_fb fb;
+	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
+                      format, modifier, &fb);
+
 
 	gem_handle = igt_create_bo_with_dimensions(drm_fd, 64, 64,
 						   format, modifier,
@@ -167,7 +171,7 @@ static bool format_is_supported(uint32_t format, uint64_t modifier)
 	ret =  __kms_addfb(drm_fd, gem_handle, 64, 64,
 			   format, modifier, strides, offsets, 1,
 			   DRM_MODE_FB_MODIFIERS, &fb_id);
-	drmModeRmFB(drm_fd, fb_id);
+	igt_remove_fb(drm_fd, &fb);
 	gem_close(drm_fd, gem_handle);
 
 	return ret == 0;
-- 
2.25.1
