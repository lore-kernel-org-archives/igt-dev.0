Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCEC10E3C0
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:40:28 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:03:09 +0530
Message-Id: <20230517063323.4146387-68-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 67/81] tests/kms_properties: Document each
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
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


