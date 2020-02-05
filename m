Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0156F526
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2020 10:22:49 +0000 (UTC)
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Date: Wed,  5 Feb 2020 15:51:36 +0530
Message-Id: <20200205102136.25808-2-ayaz.siddiqui@intel.com>
In-Reply-To: <20200205102136.25808-1-ayaz.siddiqui@intel.com>
References: <20200205102136.25808-1-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/1] i915/gem_blits: Add check for hardware
 based FENCE support
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

This test is verifying various tiled source and destination data
combination for blitter using FENCE based tiling. Since blitter don't use
FENCE after Gen4+ so this test can only be useful for Platform prior to Gen4.

A check has been added to skip this test if fences are not available in
platform.

Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
---
 tests/i915/gem_blits.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
index f9cb12bb..cc24a6c8 100644
--- a/tests/i915/gem_blits.c
+++ b/tests/i915/gem_blits.c
@@ -722,10 +722,12 @@ igt_main
 		device.fd = drm_open_driver_render(DRIVER_INTEL);
 		igt_require_gem(device.fd);
 		gem_require_blitter(device.fd);
+		igt_require(gem_available_fences(device.fd) > 0);
 
 		device.pciid = intel_get_drm_devid(device.fd);
 		device.gen = intel_gen(device.pciid);
 		device.llc = gem_has_llc(device.fd);
+
 	}
 
 	igt_subtest("basic") {
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
