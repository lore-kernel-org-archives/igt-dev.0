Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DFF6ED24
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2020 23:03:46 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Mon,  3 Feb 2020 15:03:40 -0800
Message-Id: <20200203230341.33099-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_set_tiling_vs_pwrite: Check
 if gtt aperture is mappable
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

The test relies on gtt mapping and fences to be meaningful, therefore
skip if the aperture is not mappable.

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
---
 tests/i915/gem_set_tiling_vs_pwrite.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_set_tiling_vs_pwrite.c b/tests/i915/gem_set_tiling_vs_pwrite.c
index 25a28191..b37a2ee4 100644
--- a/tests/i915/gem_set_tiling_vs_pwrite.c
+++ b/tests/i915/gem_set_tiling_vs_pwrite.c
@@ -55,6 +55,7 @@ igt_simple_main
 	uint32_t handle;
 
 	fd = drm_open_driver(DRIVER_INTEL);
+	gem_require_mappable_ggtt(fd);
 
 	for (i = 0; i < OBJECT_SIZE/4; i++)
 		data[i] = i;
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
