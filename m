Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542BE10E11B
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 11:53:10 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Apr 2023 13:52:57 +0200
Message-Id: <20230428115257.59885-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/drmtest: Change do_ioctl_err() macro to
 function
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

Chris enlightened me after I did some review do_ioctl_err() macro
is a little bit problematic when it catches unexpected error (debug
output isn't much descriptive). As we plan to use it widely in xe
uapi verification lets make error callstack more readable.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/drmtest.c | 12 ++++++++++++
 lib/drmtest.h | 10 +++-------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index c91a914257..759e889874 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -681,3 +681,15 @@ void igt_require_xe(int fd)
 {
 	igt_require(is_xe_device(fd));
 }
+
+void do_ioctl_err(int fd, unsigned long ioc, void *ioc_data, int err)
+{
+	int ret;
+
+	ret = igt_ioctl(fd, ioc, ioc_data);
+	igt_assert_f(ret == -1,
+		     "ioctl should fail with -1 but returned %d\n", ret);
+	igt_assert_f(errno == err,
+		     "errno fail - returned: %d, expected: %d\n", errno, err);
+	errno = 0;
+}
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 3c88b85c6f..792996dd28 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -153,13 +153,9 @@ bool is_intel_device(int fd);
  * @ioc_data: data pointer for the ioctl operation
  * @err: value to expect in errno
  *
- * This macro wraps drmIoctl() and uses igt_assert to check that it fails,
- * returning a particular value in errno.
+ * This function wraps drmIoctl() and uses igt_assert to check that it fails,
+ * verifying expected errno in @err.
  */
-#define do_ioctl_err(fd, ioc, ioc_data, err) do { \
-	igt_assert_eq(igt_ioctl((fd), (ioc), (ioc_data)), -1); \
-	igt_assert_eq(errno, err); \
-	errno = 0; \
-} while (0)
+void do_ioctl_err(int fd, unsigned long ioc, void *ioc_data, int err);
 
 #endif /* DRMTEST_H */
-- 
2.34.1
