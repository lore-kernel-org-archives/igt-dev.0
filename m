Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360E010E3EE
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:39:50 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 May 2023 12:02:29 +0530
Message-Id: <20230523063243.669540-69-bhanuprakash.modem@intel.com>
In-Reply-To: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 68/82] tests/kms_properties: Document each
 subtest for testplan
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_properties.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 2fe8dfa66..b32bac4af 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -28,6 +28,31 @@
 #include <stdio.h>
 #include <string.h>
 #include <time.h>
+/**
+ * TEST: kms properties
+ * Category: Display
+ *
+ * SUBTEST: %s-properties-%s
+ * Description: Tests %arg[1] properties with %arg[2] commit
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @connector:       Connector
+ * @crtc:            CRTC
+ * @plane:           Plane
+ * @invalid:         Invalid (connector/crtc/plane)
+ *
+ * arg[2]:
+ *
+ * @atomic:          atomic
+ * @legacy:          legacy
+ */
+
 
 struct additional_test {
 	const char *name;
@@ -687,6 +712,21 @@ static void expect_no_props(int fd, uint32_t obj_type, uint32_t obj_id)
 	igt_assert_neq(drmIoctl(fd, DRM_IOCTL_MODE_OBJ_GETPROPERTIES, &properties), 0);
 }
 
+/**
+ * SUBTEST: get_properties-sanity-%s
+ * Description: Test validates the properties of all planes, crtc and connectors
+ *              with %arg[1] commit
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @atomic:          atomic
+ * @non-atomic:      legacy
+ */
 static void get_prop_sanity(igt_display_t *display, bool atomic)
 {
 	int fd = display->drm_fd;
-- 
2.40.0
