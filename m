Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE376FBAD
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 17:31:32 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 31 Jan 2020 23:01:09 +0530
Message-Id: <20200131173109.12527-10-ramalingam.c@intel.com>
In-Reply-To: <20200131173109.12527-1-ramalingam.c@intel.com>
References: <20200131173109.12527-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 9/9] tests/gem_tiling_max_stride: Skip if
 set tiling is not supported
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
To: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When mmapable aperture is not supported set tiling also not supported.
Hence skip the test.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 tests/i915/gem_tiling_max_stride.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_tiling_max_stride.c b/tests/i915/gem_tiling_max_stride.c
index 0e99d979f0ca..77f7223ba19b 100644
--- a/tests/i915/gem_tiling_max_stride.c
+++ b/tests/i915/gem_tiling_max_stride.c
@@ -71,6 +71,7 @@ igt_simple_main
 	fd = drm_open_driver(DRIVER_INTEL);
 
 	devid = intel_get_drm_devid(fd);
+	gem_require_mappable_ggtt(fd);
 
 	if (intel_gen(devid) >= 7) {
 		stride = 256 * 1024;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
