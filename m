Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C7210E479
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Dec 2021 16:21:29 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
Date: Fri, 24 Dec 2021 21:47:44 +0530
Message-Id: <20211224161744.317138-3-ananya.sharma@intel.com>
In-Reply-To: <20211224161744.317138-1-ananya.sharma@intel.com>
References: <20211224161744.317138-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/2] tests/kms_draw_crc: replacing
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/i915/kms_draw_crc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 82c368e1..c76acad7 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
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
