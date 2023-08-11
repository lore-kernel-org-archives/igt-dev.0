Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1303F10E6F8
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:55:57 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:24 +0530
Message-Id: <20230811184655.157060-51-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 50/81] tests/kms_getfb: Document each subtest
 for testplan
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

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Fix functionality

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_getfb.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index afcf07fe8..1caa46e23 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -27,6 +27,11 @@
  *
  */
 
+/**
+ * TEST: kms getfb
+ * Category: Display
+ * Description: Tests GETFB and GETFB2 ioctls.
+ */
 #include "igt.h"
 #include <unistd.h>
 #include <stdlib.h>
@@ -169,6 +174,22 @@ static uint32_t get_any_prop_id(int fd)
 	return 0;
 }
 
+/**
+ * SUBTEST: getfb-handle-%s
+ * Description: Tests error handling %arg[1]
+ * Driver requirement: any
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @closed:       when passing a handle that has been closed.
+ * @not-fb:       when passing an invalid handle.
+ * @valid:        when passing an valid handle.
+ * @zero:         for a zero'd input.
+ */
 static void test_handle_input(int fd)
 {
 	struct drm_mode_fb_cmd2 add = {};
@@ -224,6 +245,30 @@ static void test_handle_input(int fd)
 		gem_close(fd, add.handles[0]);
 }
 
+/**
+ * SUBTEST: getfb-reject-ccs
+ * Description: Tests error handling while requesting CCS buffers it should
+ *              refuse because getfb supports returning a single buffer handle.
+ * Driver requirement: any
+ * Functionality: ccs, kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: getfb-%s-different-handles
+ * Description: Tests error handling while requesting for two different handles
+ *              from %arg[1].
+ * Driver requirement: any
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @addfb:           same fd
+ * @repeated:        different fd
+ */
 static void test_duplicate_handles(int fd)
 {
 	struct drm_mode_fb_cmd2 add = {};
@@ -289,6 +334,37 @@ static void test_duplicate_handles(int fd)
 	}
 }
 
+/**
+ * SUBTEST: getfb2-accept-ccs
+ * Description: Tests outputs are correct when retrieving a CCS framebuffer.
+ * Driver requirement: any
+ * Functionality: ccs, kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: getfb2-into-addfb2
+ * Description: Output check by passing the output of GETFB2 into ADDFB2.
+ * Driver requirement: any
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: getfb2-handle-%s
+ * Description: Tests error handling %arg[1].
+ * Driver requirement: any
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @closed:                  when passing a handle that has been closed
+ * @not-fb:                  when passing an invalid handle
+ * @zero:                    for a zero'd input
+ */
 static void test_getfb2(int fd)
 {
 	struct drm_mode_fb_cmd2 add_basic = {};
@@ -397,6 +473,20 @@ static void test_getfb2(int fd)
 	}
 }
 
+/**
+ * SUBTEST: %s-handle-protection
+ * Description: Make sure %arg[1] return handles if caller is non-root or non-master.
+ * Driver requirement: any
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @getfb:      GETFB ioctl
+ * @getfb2:     GETFB2 ioctl
+ */
 static void test_handle_protection(void) {
 	int non_master_fd;
 	struct drm_mode_fb_cmd2 non_master_add = {};
-- 
2.40.0
