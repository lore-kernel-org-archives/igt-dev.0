Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9776E8E4
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 21:24:47 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri,  3 Sep 2021 14:24:41 -0700
Message-Id: <9535ad74c5f053e2b7c38787200603cc3302ebad.1630704099.git.ashutosh.dixit@intel.com>
In-Reply-To: <cover.1630704099.git.ashutosh.dixit@intel.com>
References: <cover.1630704099.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/i915_fb_tiling: Check if device
 supports tiling
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

From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>

Skip this test if the platform does not support setting tiling for frame
buffer object.

Signed-off-by: Vanshidhar Konda <vanshidhar.r.kondai@ntel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_fb_tiling.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/i915_fb_tiling.c b/tests/i915/i915_fb_tiling.c
index 725ad3ad34b..cafa5233c9d 100644
--- a/tests/i915/i915_fb_tiling.c
+++ b/tests/i915/i915_fb_tiling.c
@@ -32,6 +32,8 @@ igt_simple_main
 	struct igt_fb fb;
 	int ret;
 
+	igt_require(gem_available_fences(drm_fd) > 0);
+
 	igt_create_fb(drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
 		      I915_FORMAT_MOD_X_TILED, &fb);
 
-- 
2.31.1
