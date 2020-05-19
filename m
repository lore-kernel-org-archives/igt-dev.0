Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA7089F6E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 19:13:48 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Tue, 19 May 2020 12:13:45 -0700
Message-Id: <20200519191346.17210-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915_fb_tiling: Check if device
 supports tiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>

Skip this test if the platform does not support setting tiling for frame
buffer object.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_fb_tiling.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/i915_fb_tiling.c b/tests/i915/i915_fb_tiling.c
index 7d5c3f1fa..02b3f4c4b 100644
--- a/tests/i915/i915_fb_tiling.c
+++ b/tests/i915/i915_fb_tiling.c
@@ -32,6 +32,8 @@ igt_simple_main
 	struct igt_fb fb;
 	int ret;
 
+	igt_require(gem_available_fences(drm_fd) > 0);
+
 	igt_create_fb(drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
 		      LOCAL_I915_FORMAT_MOD_X_TILED, &fb);
 
-- 
2.26.2.593.gb994622632

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
