Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B4689B49
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 19:02:58 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Tue, 19 May 2020 12:02:57 -0700
Message-Id: <20200519190257.16709-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_tiled_wb: skip on devices without
 mappable aperture
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

From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>

Skip on devices without mappable aperture.

Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_tiled_wb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_tiled_wb.c b/tests/i915/gem_tiled_wb.c
index b7f352fc7..b61a1b2e8 100644
--- a/tests/i915/gem_tiled_wb.c
+++ b/tests/i915/gem_tiled_wb.c
@@ -139,6 +139,7 @@ igt_simple_main
 	uint32_t handle;
 
 	fd = drm_open_driver(DRIVER_INTEL);
+	gem_require_mappable_ggtt(fd);
 
 	handle = create_bo(fd);
 	get_tiling(fd, handle, &tiling, &swizzle);
-- 
2.26.2.593.gb994622632

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
