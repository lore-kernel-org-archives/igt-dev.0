Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291DF10ED2C
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 12:52:20 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Sep 2022 17:54:12 +0530
Message-Id: <20220909122413.25271-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_addfb_basic: Skip y-tile-legacy
 subtest on platforms w/o fences
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As set/get_tiling ioctls are not supported on platforms without fences,
this test will fail. Add check to skip the subtest on these platforms.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_addfb_basic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 6b2323a9..afb4bdf6 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -387,6 +387,7 @@ static void tiling_tests(int fd)
 		f.pitches[0] = 1024*4;
 		igt_subtest("basic-y-tiled-legacy") {
 			igt_require(!gem_has_lmem(fd));
+			igt_require(gem_available_fences(fd) > 0);
 			f.handles[0] = tiled_y_bo;
 
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
-- 
2.22.0
