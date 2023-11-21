Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF2C10E250
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Nov 2023 10:14:41 +0000 (UTC)
From: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Nov 2023 11:14:20 +0100
Message-ID: <20231121101420.1390606-1-daniel.t.mrzyglod@intel.com>
In-Reply-To: <20231115155626.756378-1-daniel.t.mrzyglod@intel.com>
References: <20231115155626.756378-1-daniel.t.mrzyglod@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] tests/intel/xe_waitfence: add subtest
 with provided engine class instance
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

Postive test to check XE_WAIT_USER_FENCE ioctl where
engine class instance is provided.

v2: Fix review comments (Kamil)
    provide ABSTIME as proper time format.

v3: Fix review comments (Kamil)
    recent uapi defines changes

Signed-off-by: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
---
 tests/intel/xe_waitfence.c | 48 +++++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index b1cae0d9b..ed672de0c 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -37,9 +37,32 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 	xe_vm_bind_async(fd, vm, 0, bo, offset, addr, size, sync, 1);
 }
 
+static int64_t wait_with_eci_abstime(int fd, uint64_t *addr, uint64_t value,
+				     struct drm_xe_engine_class_instance *eci,
+				     int64_t timeout)
+{
+	struct drm_xe_wait_user_fence wait = {
+		.addr = to_user_pointer(addr),
+		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
+		.flags = !eci ? 0 : DRM_XE_UFENCE_WAIT_FLAG_ABSTIME,
+		.value = value,
+		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
+		.timeout = timeout,
+		.num_engines = eci ? 1 : 0,
+		.instances = eci ? to_user_pointer(eci) : 0,
+	};
+	struct timespec ts;
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
+	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &ts), 0);
+
+	return ts.tv_sec * 1e9 + ts.tv_nsec;
+}
+
 enum waittype {
 	RELTIME,
 	ABSTIME,
+	ENGINE,
 };
 
 /**
@@ -50,10 +73,18 @@ enum waittype {
  * SUBTEST: abstime
  * Description: Check basic waitfences functionality with timeout
  *              passed as absolute time in nanoseconds
+ *
+ * SUBTEST: engine
+ * Description: Check basic waitfences functionality with timeout
+ *              passed as relative time in nanoseconds and provide engine class
+ *              instance
  */
 static void
 waitfence(int fd, enum waittype wt)
 {
+	struct drm_xe_engine_class_instance *eci = NULL;
+	struct timespec ts;
+	int64_t current, signalled;
 	uint32_t bo_1;
 	uint32_t bo_2;
 	uint32_t bo_3;
@@ -83,10 +114,18 @@ waitfence(int fd, enum waittype wt)
 		timeout = xe_wait_ufence(fd, &wait_fence, 7, NULL, MS_TO_NS(10));
 		igt_debug("wait type: RELTIME - timeout: %ld, timeout left: %ld\n",
 			  MS_TO_NS(10), timeout);
+	} else if (wt == ENGINE) {
+		eci = xe_hw_engine(fd, 1);
+		igt_assert(eci);
+		clock_gettime(CLOCK_MONOTONIC, &ts);
+		current = ts.tv_sec * 1e9 + ts.tv_nsec;
+		timeout = current + MS_TO_NS(10);
+		signalled = wait_with_eci_abstime(fd, &wait_fence, 7, eci, timeout);
+		igt_debug("wait type: ENGINE ABSTIME - timeout: %" PRId64
+			  ", signalled: %" PRId64
+			  ", elapsed: %" PRId64 "\n",
+			  timeout, signalled, signalled - current);
 	} else {
-		struct timespec ts;
-		int64_t current, signalled;
-
 		clock_gettime(CLOCK_MONOTONIC, &ts);
 		current = ts.tv_sec * 1e9 + ts.tv_nsec;
 		timeout = current + MS_TO_NS(10);
@@ -205,6 +244,9 @@ igt_main
 	igt_subtest("abstime")
 		waitfence(fd, ABSTIME);
 
+	igt_subtest("engine")
+		waitfence(fd, ENGINE);
+
 	igt_subtest("invalid-flag")
 		invalid_flag(fd);
 
-- 
2.42.0
