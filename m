Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAFC10E804
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Apr 2022 10:39:03 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 20 Apr 2022 16:09:09 +0530
Message-Id: <20220420103909.17175-5-jeevan.b@intel.com>
In-Reply-To: <20220420103909.17175-1-jeevan.b@intel.com>
References: <20220420103909.17175-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/4] tests/kms_getfb: Add flat ccs
 modifier support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>

Add support for testing/skipping flat ccs modifiers

Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_getfb.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 75f5f30c..b3a8d265 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -88,11 +88,18 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 		.flags = DRM_MODE_FB_MODIFIERS,
 	};
 	int size;
+	uint32_t devid;
 
 	igt_require(has_addfb2_iface(fd));
 	igt_require_intel(fd);
+	devid = intel_get_drm_devid(fd);
 
-	if ((intel_display_ver(intel_get_drm_devid(fd))) >= 12) {
+	if (HAS_FLATCCS(devid)) {
+		add.modifier[0] = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
+		add.pitches[0] = ALIGN(add.width * 4, 4 * 512);
+		size = add.pitches[0] * ALIGN(add.height, 8);
+		size = ALIGN(size, 4096);
+	} else if ((intel_display_ver(devid)) >= 12) {
 		add.modifier[0] = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
 		add.modifier[1] = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
 
@@ -130,7 +137,9 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 
 	add.handles[0] = gem_buffer_create_fb_obj(fd, size);
 	igt_require(add.handles[0] != 0);
-	add.handles[1] = add.handles[0];
+
+	if (!HAS_FLATCCS(intel_get_drm_devid(fd)))
+		add.handles[1] = add.handles[0];
 
 	if (drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &add) == 0)
 		*ret = add;
@@ -256,6 +265,9 @@ static void test_duplicate_handles(int fd)
 		struct drm_mode_fb_cmd2 add_ccs = { };
 		struct drm_mode_fb_cmd get = { };
 
+		igt_require_f(!HAS_FLATCCS(intel_get_drm_devid(fd)),
+			      "skip because flat ccs has only one buffer.\n");
+
 		get_ccs_fb(fd, &add_ccs);
 		igt_require(add_ccs.handles[0] != 0);
 		get.fb_id = add_ccs.fb_id;
@@ -350,7 +362,9 @@ static void test_getfb2(int fd)
 				igt_assert_eq_u64(get.modifier[i], 0);
 			}
 		}
-		igt_assert_eq_u32(get.handles[0], get.handles[1]);
+
+		if (!HAS_FLATCCS(intel_get_drm_devid(fd)))
+			igt_assert_eq_u32(get.handles[0], get.handles[1]);
 
 		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &get.fb_id);
 		gem_close(fd, add_ccs.handles[0]);
-- 
2.35.1
