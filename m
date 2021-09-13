Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651966ECC9
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Sep 2021 16:55:55 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 13 Sep 2021 09:55:50 -0700
Message-Id: <20210913165550.16528-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_addfb_basic: Skip
 basic-y-tiled-legacy on discrete
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

The test will fail on discrete and needs to be skipped.

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/kms_addfb_basic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 0f641e7dd78..eed7038c39d 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -393,6 +393,7 @@ static void tiling_tests(int fd)
 		igt_describe("Test that addfb2 call fails correctly for basic y-tiling test");
 		f.pitches[0] = 1024*4;
 		igt_subtest("basic-y-tiled-legacy") {
+			igt_require(!gem_has_lmem(fd));
 			f.handles[0] = tiled_y_bo;
 
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
-- 
2.31.1
