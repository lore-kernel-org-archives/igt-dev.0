Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9265F89B0B
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Feb 2021 04:46:53 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Tue,  2 Feb 2021 10:14:30 +0530
Message-Id: <20210202044430.12542-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t][V2] i915/gem_basic: Added test description
 test case.
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
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com, arjun.melkaveri@intel.com, katarzyna.dec@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: sai gowtham <sai.gowtham.ch@intel.com>

Added test description to all the available subtests.

Cc: Dec Katarzyna <katarzyna.dec@intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_basic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
index 984bdf60..5605b514 100644
--- a/tests/i915/gem_basic.c
+++ b/tests/i915/gem_basic.c
@@ -39,6 +39,8 @@
 #include "drm.h"
 #include "i915/gem.h"
 
+IGT_TEST_DESCRIPTION("Tests basic gem_create and gem_close IOCTLs");
+
 static void
 test_bad_close(int fd)
 {
@@ -83,10 +85,16 @@ igt_main
 	igt_fixture
 		fd = drm_open_driver(DRIVER_INTEL);
 
+	igt_describe("Check error on DRM_IOCTL_GEM_CLOSE, category=Gem, category=SW_only");
 	igt_subtest("bad-close")
 		test_bad_close(fd);
+
+	igt_describe("Check creating an object using DRM_IOCTL_I915_GEM_CREATE and "
+			"closing it using DRM_IOCTL_GEM_CLOSE, category=Gem, category=SW_only");
 	igt_subtest("create-close")
 		test_create_close(fd);
+
+	igt_describe("Check closing fd with an object allocated, category=Gem, category=SW_only");
 	igt_subtest("create-fd-close")
 		test_create_fd_close(fd);
 }
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
