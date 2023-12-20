Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DCD10E5FE
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Dec 2023 18:00:29 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/12] tests/kms_frontbuffer_tracking: Use
 igt_create_fb()
Date: Wed, 20 Dec 2023 19:59:29 +0200
Message-ID: <20231220175934.22849-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20231220175934.22849-1-ville.syrjala@linux.intel.com>
References: <20231220175934.22849-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Calling igt_calc_fb_size() and igt_create_fb_with_bo_size() like
this back to back is the same as just calling igt_create_fb().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 1daf27d2e006..f3dc30024691 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1615,8 +1615,7 @@ static void create_fb(enum pixel_format pformat, int width, int height,
 		      enum tiling_type tiling, int plane, struct igt_fb *fb)
 {
 	uint32_t format;
-	uint64_t size, modifier;
-	unsigned int stride;
+	uint64_t modifier;
 
 	switch (pformat) {
 	case FORMAT_RGB888:
@@ -1650,13 +1649,7 @@ static void create_fb(enum pixel_format pformat, int width, int height,
 
 	igt_warn_on(plane == PLANE_CUR && tiling != TILING_LINEAR);
 
-	igt_calc_fb_size(drm.fd, width, height, format, modifier, &size,
-			 &stride);
-
-	igt_create_fb_with_bo_size(drm.fd, width, height, format, modifier,
-				   IGT_COLOR_YCBCR_BT709,
-				   IGT_COLOR_YCBCR_LIMITED_RANGE,
-				   fb, size, stride);
+	igt_create_fb(drm.fd, width, height, format, modifier, fb);
 }
 
 static uint32_t pick_color(struct igt_fb *fb, enum color ecolor)
-- 
2.41.0
