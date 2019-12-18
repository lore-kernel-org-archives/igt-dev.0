Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B022B6E228
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 05:59:27 +0000 (UTC)
From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Date: Tue, 17 Dec 2019 21:59:21 -0800
Message-Id: <20191218055925.705070-7-vanshidhar.r.konda@intel.com>
In-Reply-To: <20191218055925.705070-1-vanshidhar.r.konda@intel.com>
References: <20191218055925.705070-1-vanshidhar.r.konda@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 06/10] i915/i915_fb_tiling: Skip on devices that
 don't support HW tiling
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
Cc: brian.welty@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

The test tries to change the tiling of a framebuffer object after it has
been set using a framebuffer modifier. If the device does not support HW
tiling/de-tiling the test should not be run.

Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
---
 tests/i915/i915_fb_tiling.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/i915_fb_tiling.c b/tests/i915/i915_fb_tiling.c
index 7d5c3f1f..4ec84962 100644
--- a/tests/i915/i915_fb_tiling.c
+++ b/tests/i915/i915_fb_tiling.c
@@ -32,6 +32,8 @@ igt_simple_main
 	struct igt_fb fb;
 	int ret;
 
+	igt_require(gem_has_legacy_hw_tiling(drm_fd));
+
 	igt_create_fb(drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
 		      LOCAL_I915_FORMAT_MOD_X_TILED, &fb);
 
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
