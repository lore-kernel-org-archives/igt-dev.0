Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E0B10E409
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:56 +0530
Message-Id: <20230629144910.3055377-68-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 67/81] tests/kms_properties: Document each
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
index 8645808d1..197c72065 100644
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
