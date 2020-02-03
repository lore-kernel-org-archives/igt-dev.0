Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CB56E1A7
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2020 07:22:12 +0000 (UTC)
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Date: Mon,  3 Feb 2020 12:50:57 +0530
Message-Id: <20200203072057.25593-3-ayaz.siddiqui@intel.com>
In-Reply-To: <20200203072057.25593-1-ayaz.siddiqui@intel.com>
References: <20200203072057.25593-1-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/2] i915/gem_render_tiled_blits: Add
 check for hardware based FENCE support
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

This test is verifying the integrity of blitter render copy on platforms
which support FENCE based tiling. Since blitter does not use FENCE after
Gen4+ so this test can only be useful for Platform prior to Gen4.
A check has been added to skip this test if fences  are not available in
platform.

Test to check effects of different physical address values on render
copy is being developed as Kernel selftest.

Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_render_tiled_blits.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_render_tiled_blits.c b/tests/i915/gem_render_tiled_blits.c
index 1de1b72c..5f49b3fe 100644
--- a/tests/i915/gem_render_tiled_blits.c
+++ b/tests/i915/gem_render_tiled_blits.c
@@ -204,6 +204,7 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
+		igt_require(gem_available_fences(fd) > 0);
 	}
 
 	igt_subtest("basic") {
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
