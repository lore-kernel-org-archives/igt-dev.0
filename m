Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA06410E3BD
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:40:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:53 +0530
Message-Id: <20230517063323.4146387-52-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 51/81] tests/kms_getfb: Document each subtest
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_getfb.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 4adc7eee2..8ca724720 100644
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
@@ -164,6 +169,22 @@ static uint32_t get_any_prop_id(int fd)
 	return 0;
 }
 
+/**
+ * SUBTEST: getfb-handle-%s
+ * Description: Tests error handling %arg[1]
+ * Driver requirement: any
+ * Functionality: kms_core
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
@@ -219,6 +240,30 @@ static void test_handle_input(int fd)
 		gem_close(fd, add.handles[0]);
 }
 
+/**
+ * SUBTEST: getfb-reject-ccs
+ * Description: Tests error handling while requesting CCS buffers it should
+ *              refuse because getfb supports returning a single buffer handle.
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: getfb-%s-different-handles
+ * Description: Tests error handling while requesting for two different handles
+ *              from %arg[1].
+ * Driver requirement: any
+ * Functionality: kms_core
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
@@ -284,6 +329,37 @@ static void test_duplicate_handles(int fd)
 	}
 }
 
+/**
+ * SUBTEST: getfb2-accept-ccs
+ * Description: Tests outputs are correct when retrieving a CCS framebuffer.
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: getfb2-into-addfb2
+ * Description: Output check by passing the output of GETFB2 into ADDFB2.
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: getfb2-handle-%s
+ * Description: Tests error handling %arg[1].
+ * Driver requirement: any
+ * Functionality: kms_core
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
@@ -392,6 +468,20 @@ static void test_getfb2(int fd)
 	}
 }
 
+/**
+ * SUBTEST: %s-handle-protection
+ * Description: Make sure %arg[1] return handles if caller is non-root or non-master.
+ * Driver requirement: any
+ * Functionality: kms_core
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


