Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464726F8A6
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2020 00:40:41 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Thu, 13 Feb 2020 16:40:37 -0800
Message-Id: <20200214004037.5847-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_threaded_access_tiled:
 Require fences
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
Cc: Dixit@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The test tries to allocate tiled objects which is not possible without
fences.

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>
---
 tests/i915/gem_threaded_access_tiled.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_threaded_access_tiled.c b/tests/i915/gem_threaded_access_tiled.c
index 64a00026..6442d589 100644
--- a/tests/i915/gem_threaded_access_tiled.c
+++ b/tests/i915/gem_threaded_access_tiled.c
@@ -98,6 +98,8 @@ igt_simple_main
 	fd = drm_open_driver(DRIVER_INTEL);
 	igt_assert(fd >= 0);
 
+	igt_require(gem_available_fences(fd) > 0);
+
 	bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
 	igt_assert(bufmgr);
 
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
