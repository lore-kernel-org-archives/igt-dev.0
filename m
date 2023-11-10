Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D4110E933
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 11:08:27 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Date: Fri, 10 Nov 2023 16:37:59 +0530
Message-Id: <20231110110759.11719-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/xe_exec_queue_property:
 Negative tests for get exec_queue property ioctl.
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Add Negative tests for get exec_queue property ioctl.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_queue_property.c | 36 +++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 4e32aefa5..40546da03 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -4,7 +4,7 @@
  */
 
 /**
- * TEST: Basic tests to check exec_queue set property functionality
+ * TEST: Basic tests to check exec_queue set/get property functionality
  * Category: Software building block
  * Sub-category: exec queue property
  * Functionality: exec queue set property
@@ -108,6 +108,34 @@ static void test_property_min_max(int xe, int engine, const char **property)
 	test_set_property(xe, property_name, min - 1, -EINVAL);
 }
 
+/**
+ * SUBTEST: Invalid_exec_queue
+ * Description: Negative test to check the expected behaviour with invalid exec_queue_id.
+ * Test category: functionality test
+ */
+static void Invalid_exec_queue_id(int xe)
+{
+	struct drm_xe_exec_queue_get_property args = {
+		.exec_queue_id = 0xffff,
+	};
+
+	do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY, &args, ENOENT);
+}
+
+/**
+ * SUBTEST: non-zero-reserved
+ * Description: Negative test to check the expected behaviour with non-zero reserved.
+ * Test category: functionality test
+ */
+static void non_zero_reserved(int xe)
+{
+	struct drm_xe_exec_queue_get_property args = {
+		.reserved[0] = 0xffff,
+	};
+
+	do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY, &args, EINVAL);
+}
+
 igt_main
 {
 	static const struct {
@@ -182,6 +210,12 @@ igt_main
 		}
 	}
 
+	igt_subtest("Invalid-exec-queue")
+		Invalid_exec_queue_id(xe);
+
+	igt_subtest("non-zero-reserved")
+		non_zero_reserved(xe);
+
 	igt_fixture {
 		xe_device_put(xe);
 		drm_close_driver(xe);
-- 
2.39.1
