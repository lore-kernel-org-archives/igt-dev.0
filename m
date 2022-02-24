Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E5510EBF1
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 12:49:18 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Feb 2022 18:16:32 +0530
Message-Id: <20220224124633.33327-2-ananya.sharma@intel.com>
In-Reply-To: <20220224124633.33327-1-ananya.sharma@intel.com>
References: <20220224124633.33327-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 1/2] tests/i915/kms_draw_crc-replacing
 drmModeRmFb with igt_remove_fb.
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

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/i915/kms_draw_crc.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 82c368e1..7072c572 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -156,21 +156,14 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
 
 static bool format_is_supported(uint32_t format, uint64_t modifier)
 {
-	uint32_t gem_handle, fb_id;
-	unsigned int offsets[4] = {};
-	unsigned int strides[4] = {};
-	int ret;
-
-	gem_handle = igt_create_bo_with_dimensions(drm_fd, 64, 64,
-						   format, modifier,
-						   0, NULL, &strides[0], NULL);
-	ret =  __kms_addfb(drm_fd, gem_handle, 64, 64,
-			   format, modifier, strides, offsets, 1,
-			   DRM_MODE_FB_MODIFIERS, &fb_id);
-	drmModeRmFB(drm_fd, fb_id);
-	gem_close(drm_fd, gem_handle);
-
-	return ret == 0;
+	struct igt_fb fb;
+	unsigned int fd_id;
+
+	fd_id = igt_create_fb(drm_fd, 64, 64, format, modifier, &fb);
+	
+	igt_remove_fb(drm_fd, &fb);
+
+	return fd_id >= 0;
 }
 
 static void draw_method_subtest(enum igt_draw_method method,
-- 
2.25.1
