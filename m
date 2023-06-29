Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE7410E3F8
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:58 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:55 +0530
Message-Id: <20230629144910.3055377-67-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 66/81] tests/kms_prop_blob: Document each
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
 tests/kms_prop_blob.c | 46 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
index fc172b5a3..e4f5dd71f 100644
--- a/tests/kms_prop_blob.c
+++ b/tests/kms_prop_blob.c
@@ -26,8 +26,9 @@
  */
 
 /**
- * TEST: Tests behaviour of mass-data 'blob' properties
+ * TEST: kms prop blob
  * Category: Display
+ * Description: Tests behaviour of mass-data 'blob' properties.
  */
 #include "igt.h"
 #include <errno.h>
@@ -122,6 +123,29 @@ destroy_prop(int fd, uint32_t prop_id)
 	return 0;
 }
 
+/**
+ * SUBTEST: blob-multiple
+ * Description: Test validates destroying multiple properties explicitly works as needed.
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: blob-prop-%s
+ * Description: Tests validates the %arg[1] of the properties created.
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @core:        validity
+ * @lifetime:    lifetime
+ * @validate:    blob size
+ */
 static void
 test_validate(int fd)
 {
@@ -245,6 +269,7 @@ test_core(int fd)
 /**
  * SUBTEST: basic
  * Description: Test to ensure property support exists
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: kms_core
@@ -260,6 +285,25 @@ test_basic(int fd)
 	igt_assert_eq(destroy_prop(fd, prop_id), 0);
 }
 
+/**
+ * SUBTEST: invalid-%s-%s
+ * Description: Tests error handling when invalid properties are %ar[1] with %arg[2].
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @get:            fetched
+ * @set:            set
+ *
+ * arg[2]:
+ *
+ * @prop:           blob object type
+ * @prop-any:       object of any type
+ */
 static void prop_tests(int fd)
 {
 	struct drm_mode_obj_get_properties get_props = {};
-- 
2.40.0
