Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690076E264
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2020 05:03:15 +0000 (UTC)
From: ranjeet1.kumar@intel.com
Date: Thu, 26 Mar 2020 10:32:08 +0530
Message-Id: <20200326050208.29377-1-ranjeet1.kumar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t] i915/gem_set_tilling_vs_gtt: Minor
 Changes
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
To: igt-dev@lists.freedesktop.org, ranjeet1.kumar@intel.com, jari.tahvanainen@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: ranjeet kumar <ranjeet1.kumar@intel.com>

Check for the correct tilling and set domains in both scenario untile and tile.
Changes the function syntax call and used actual driver i915.

Cc: Tahvanainen Jari <jari.tahvanainen@intel.com>
Signed-off-by: ranjeet kumar <ranjeet1.kumar@intel.com>
---
 tests/i915/gem_set_tiling_vs_gtt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_set_tiling_vs_gtt.c b/tests/i915/gem_set_tiling_vs_gtt.c
index cee9c02c..38614192 100644
--- a/tests/i915/gem_set_tiling_vs_gtt.c
+++ b/tests/i915/gem_set_tiling_vs_gtt.c
@@ -58,8 +58,11 @@ igt_simple_main
 
 	fd = drm_open_driver(DRIVER_INTEL);
 	igt_require(gem_available_fences(fd) > 0);
-	igt_require(gem_has_mappable_ggtt(fd));
-
+	void gem_require_mappable_ggtt(int i915)
+	{
+		igt_require_f(gem_has_mappable_ggtt(i915),
+			      "HW & kernel support for indirect detiling aperture\n");
+	}	
 	if (IS_GEN2(intel_get_drm_devid(fd)))
 		tile_height = 16;
 	else
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
