Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5418410ECE5
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 11:17:26 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 kamil.konieczny@linux.intel.com, janga.rahul.kumar@intel.com
Date: Fri, 28 Apr 2023 16:49:27 +0530
Message-Id: <20230428111927.3237470-1-janga.rahul.kumar@intel.com>
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

Add test to XE BAT.

CC: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/xe/xe_query.c                      | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index ecf44ca7..4082ecd1 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -141,6 +141,7 @@ igt@xe_query@query-gts
 igt@xe_query@query-config
 igt@xe_query@query-hwconfig
 igt@xe_query@query-topology
+igt@xe_query@query-invalid-extension
 igt@xe_query@query-invalid-query
 igt@xe_query@query-invalid-size
 #igt@xe_vm@bind-once
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
