Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A9A1123D1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 21:53:50 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jun 2022 03:26:54 +0530
Message-Id: <20220616215654.5522-3-nidhi1.gupta@intel.com>
In-Reply-To: <20220616215654.5522-1-nidhi1.gupta@intel.com>
References: <20220616215654.5522-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/kms_draw_crc.c: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sanitize the system state before starting the subtest.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_draw_crc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 04cae0aa..2fe78c32 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -185,6 +185,7 @@ static void draw_method_subtest(enum igt_draw_method method,
 	igt_skip_on(method == IGT_DRAW_MMAP_GTT &&
 		    !gem_has_mappable_ggtt(drm_fd));
 
+	igt_display_reset(&display);
 	igt_require(format_is_supported(formats[format_index], modifier));
 
 	/* Use IGT_DRAW_MMAP_GTT/WC on an untiled buffer as the parameter for
@@ -229,6 +230,8 @@ static void fill_fb_subtest(void)
 	igt_crc_t base_crc, crc;
 	bool has_4tile = intel_get_device_info(intel_get_drm_devid(drm_fd))->has_4tile;
 
+	igt_display_reset(&display);
+
 	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
 		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
 
-- 
2.26.2
