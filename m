Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83C910E8F0
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 04:49:59 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com
Date: Tue,  8 Mar 2022 10:19:43 +0530
Message-Id: <20220308044943.18449-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_basic: Added test
 description for test case.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

Added test description to all the available subtests.

Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Cc: Melkaveri Arjun <Arjun.Melkaveri@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_basic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
index 13ecce52..db6b1682 100644
--- a/tests/i915/gem_basic.c
+++ b/tests/i915/gem_basic.c
@@ -39,6 +39,8 @@
 #include "drm.h"
 #include "i915/gem_create.h"
 
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
+			" closing it using DRM_IOCTL_GEM_CLOSE, category=Gem, category=SW_only");
 	igt_subtest("create-close")
 		test_create_close(fd);
+
+	igt_describe("Check closing fd with an object allocated, category=Gem, category=SW_only");
 	igt_subtest("create-fd-close")
 		test_create_fd_close(fd);
 }
-- 
2.35.1
