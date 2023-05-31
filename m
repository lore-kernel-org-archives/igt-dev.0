Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE2210E50F
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 19:31:02 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 May 2023 21:30:43 +0200
Message-Id: <20230531193043.558461-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230531193043.558461-1-zbigniew.kempczynski@intel.com>
References: <20230531193043.558461-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/xe_waitfence: Add abstime wait
 subtest
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

User fence wait supports two methods of passing timeout - relative
and absolute. Add absolute with passing timeout as nanoseconds.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

---
Requires changes in kernel uapi proposed in:
https://patchwork.freedesktop.org/series/118670/
---
 tests/xe/xe_waitfence.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
index cdfcacdb47..1440ae4e7e 100644
--- a/tests/xe/xe_waitfence.c
+++ b/tests/xe/xe_waitfence.c
@@ -37,12 +37,23 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 	xe_vm_bind(fd, vm, bo, offset, addr, size, sync, 1);
 }
 
+#define MS_TO_NS(ms) (((long)ms) * 1000000)
+enum waittype {
+	RELATIVE,
+	ABSTIME,
+};
+
 /**
  * SUBTEST: test
- * Description: Check basic waitfences functionality
+ * Description: Check basic waitfences functionality with timeout
+ *              as relative timeout in nanoseconds
+ *
+ * SUBTEST: test-abstime
+ * Description: Check basic waitfences functionality with timeout
+ *              passed as absolute time in nanoseconds
  */
 static void
-test(int fd)
+test(int fd, enum waittype wt)
 {
 	uint32_t bo_1;
 	uint32_t bo_2;
@@ -51,6 +62,7 @@ test(int fd)
 	uint32_t bo_5;
 	uint32_t bo_6;
 	uint32_t bo_7;
+	long timeout;
 
 	uint32_t vm = xe_vm_create(fd, 0, 0);
 	bo_1 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
@@ -67,7 +79,22 @@ test(int fd)
 	do_bind(fd, vm, bo_6, 0, 0xc0040000, 0x1c0000, 6);
 	bo_7 = xe_bo_create_flags(fd, vm, 0x10000, MY_FLAG);
 	do_bind(fd, vm, bo_7, 0, 0xeffff0000, 0x10000, 7);
-	xe_wait_ufence(fd, &wait_fence, 7, NULL, 2000);
+
+	if (wt == RELATIVE) {
+		timeout = xe_wait_ufence(fd, &wait_fence, 7, NULL, MS_TO_NS(10));
+		igt_info("wait type: RELATIVE - timeout: %ld, timeout left: %ld\n",
+			  MS_TO_NS(10), timeout);
+	} else {
+		struct timespec ts;
+		long left;
+
+		clock_gettime(CLOCK_MONOTONIC, &ts);
+		timeout = ts.tv_sec * 1e9 + ts.tv_nsec + (long) MS_TO_NS(10);
+		left = xe_wait_ufence_abstime(fd, &wait_fence, 7, NULL, timeout);
+		igt_info("wait type: ABSTIME - timeout: %ld, left: %ld\n",
+			  timeout, left);
+	}
+
 	xe_vm_unbind_sync(fd, vm, 0, 0x200000, 0x40000);
 	xe_vm_unbind_sync(fd, vm, 0, 0xc0000000, 0x40000);
 	xe_vm_unbind_sync(fd, vm, 0, 0x180000000, 0x40000);
@@ -94,7 +121,10 @@ igt_main
 	}
 
 	igt_subtest("test")
-		test(fd);
+		test(fd, RELATIVE);
+
+	igt_subtest("test-abstime")
+		test(fd, ABSTIME);
 
 	igt_fixture {
 		xe_device_put(fd);
-- 
2.34.1
