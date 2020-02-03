Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7D86E1A5
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2020 07:22:10 +0000 (UTC)
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Date: Mon,  3 Feb 2020 12:50:56 +0530
Message-Id: <20200203072057.25593-2-ayaz.siddiqui@intel.com>
In-Reply-To: <20200203072057.25593-1-ayaz.siddiqui@intel.com>
References: <20200203072057.25593-1-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/2] i915/gem_tiled_pread_*: Add check
 for FENCE based tiling support
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

These tests are verifying integrity of the tiled data read and write operation
on platforms which supports FENCE based tiling.

A check has been added to skip these tests if FENCES  are not available
in platform.
Tests updated in this patch :
1. gem_tiled_pread_basic
2. gem_tiled_pread_pwrite

Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
---
 tests/i915/gem_tiled_pread_basic.c  | 2 +-
 tests/i915/gem_tiled_pread_pwrite.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/i915/gem_tiled_pread_basic.c
index 1ac9eccd..7cb64410 100644
--- a/tests/i915/gem_tiled_pread_basic.c
+++ b/tests/i915/gem_tiled_pread_basic.c
@@ -124,7 +124,7 @@ igt_simple_main
 	uint32_t devid;
 
 	fd = drm_open_driver(DRIVER_INTEL);
-
+	igt_require(gem_available_fences(fd) > 0);
 	handle = create_bo(fd);
 	igt_require(gem_get_tiling(fd, handle, &tiling, &swizzle));
 
diff --git a/tests/i915/gem_tiled_pread_pwrite.c b/tests/i915/gem_tiled_pread_pwrite.c
index 0988a4e8..0bbb3a20 100644
--- a/tests/i915/gem_tiled_pread_pwrite.c
+++ b/tests/i915/gem_tiled_pread_pwrite.c
@@ -113,6 +113,7 @@ igt_simple_main
 	int fd;
 	
 	fd = drm_open_driver(DRIVER_INTEL);
+	igt_require(gem_available_fences(fd) > 0);
 	count = SLOW_QUICK(intel_get_total_ram_mb() * 9 / 10, 8) ;
 
 	for (int i = 0; i < count/2; i++) {
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
