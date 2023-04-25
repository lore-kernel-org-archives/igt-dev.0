Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A293510E509
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 18:38:05 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Wed, 26 Apr 2023 00:10:03 +0530
Message-Id: <20230425184003.3089338-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/xe/xe_query: Add subtest
 query-invalid-extension
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Check query with invalid extension returns expected error code.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/xe/xe_query.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index 3f038225..6c35730c 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -435,6 +435,23 @@ test_query_invalid_size(int fd)
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), -1);
 }
 
+/**
+ * SUBTEST: query-invalid-extension
+ * Description: Check query with invalid extension returns expected error code.
+ */
+static void
+test_query_invalid_extension(int fd)
+{
+	struct drm_xe_device_query query = {
+		.extensions = -1,
+		.query = DRM_XE_DEVICE_QUERY_CONFIG,
+		.size = 0,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), -1);
+}
+
 igt_main
 {
 	int xe;
@@ -468,6 +485,9 @@ igt_main
 	igt_subtest("query-invalid-size")
 		test_query_invalid_size(xe);
 
+	igt_subtest("query-invalid-extension")
+		test_query_invalid_extension(xe);
+
 	igt_fixture {
 		xe_device_put(xe);
 		close(xe);
-- 
2.25.1
