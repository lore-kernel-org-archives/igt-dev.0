Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F03310EB28
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 11:40:57 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Thu, 27 Apr 2023 17:12:56 +0530
Message-Id: <20230427114256.3182329-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_query: Add subtest
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

CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
CC: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/xe/xe_query.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index 3f038225..a0fb5422 100644
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
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
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
