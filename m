Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED706FA80
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 06:56:03 +0000 (UTC)
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Date: Fri, 31 Jan 2020 12:24:56 +0530
Message-Id: <20200131065456.16467-2-ayaz.siddiqui@intel.com>
In-Reply-To: <20200131065456.16467-1-ayaz.siddiqui@intel.com>
References: <20200131065456.16467-1-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/1] Add check for HW tiling support in
 gem_set_tiling_vs_blt test
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
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This  test is currently assuming that platform always support HW tiling.
A check has been added to skip the test if HW tiling is not supported
by platform.

Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
---
 tests/i915/gem_set_tiling_vs_blt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_set_tiling_vs_blt.c b/tests/i915/gem_set_tiling_vs_blt.c
index c317d1ef..0cb3fdf1 100644
--- a/tests/i915/gem_set_tiling_vs_blt.c
+++ b/tests/i915/gem_set_tiling_vs_blt.c
@@ -232,7 +232,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
-
+		igt_require(gem_available_fences(fd) > 0);
 		bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
 		drm_intel_bufmgr_gem_enable_reuse(bufmgr);
 		devid = intel_get_drm_devid(fd);
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
