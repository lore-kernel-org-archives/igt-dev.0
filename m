Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177236EA60
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 19:39:16 +0000 (UTC)
From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Date: Wed, 18 Dec 2019 11:39:14 -0800
Message-Id: <20191218193915.1375365-10-vanshidhar.r.konda@intel.com>
In-Reply-To: <20191218193915.1375365-1-vanshidhar.r.konda@intel.com>
References: <20191218193915.1375365-1-vanshidhar.r.konda@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 09/10] tests/kms_fence_pin_leak: Skip test on
 devices without HW tiling support
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

This test is utilizing fences associated with tiled buffer objects. On
devices that don't have HW support for tiling/de-tiling these fences are
not available.

Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
---
 tests/kms_fence_pin_leak.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_fence_pin_leak.c b/tests/kms_fence_pin_leak.c
index 8c9e10a5..a05039df 100644
--- a/tests/kms_fence_pin_leak.c
+++ b/tests/kms_fence_pin_leak.c
@@ -200,6 +200,8 @@ igt_simple_main
 
 	data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 	igt_require_gem(data.drm_fd);
+	igt_require(gem_has_legacy_hw_tiling(data.drm_fd));
+	igt_require(gem_has_mappable_ggtt(data.drm_fd));
 
 	data.devid = intel_get_drm_devid(data.drm_fd);
 
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
