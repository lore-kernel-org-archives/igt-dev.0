Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FBD10E2AE
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 23:13:03 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 12 Dec 2022 15:12:37 -0800
Message-Id: <20221212231254.2303-3-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221212231254.2303-1-niranjana.vishwanathapura@intel.com>
References: <20221212231254.2303-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 02/19] lib/i915: Move common syncobj
 functions to library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In preparation for the VM_BIND tests, move some syncobj functions
to the library.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/igt_syncobj.c           | 21 +++++++++++++++++++++
 lib/igt_syncobj.h           |  9 +++++++++
 tests/i915/gem_exec_fence.c | 21 ---------------------
 tests/syncobj_timeline.c    |  8 --------
 tests/syncobj_wait.c        |  8 --------
 5 files changed, 30 insertions(+), 37 deletions(-)

diff --git a/lib/igt_syncobj.c b/lib/igt_syncobj.c
index a24ed10b7..5280c272e 100644
--- a/lib/igt_syncobj.c
+++ b/lib/igt_syncobj.c
@@ -22,6 +22,7 @@
  */
 
 #include <errno.h>
+#include <sys/poll.h>
 #include <xf86drm.h>
 
 #include "igt.h"
@@ -543,3 +544,23 @@ syncobj_timeline_to_timeline(int fd,
 					 timeline_dst, point_dst,
 					 timeline_src, point_src, 0), 0);
 }
+
+/**
+ * syncobj_busy:
+ * @fd: The DRM file descriptor
+ * @handle: The handle to the syncobj to check
+ * Check if a syncobj is busy.
+ */
+bool
+syncobj_busy(int fd, uint32_t handle)
+{
+	bool result;
+	int sf;
+
+	sf = syncobj_handle_to_fd(fd, handle,
+				  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE);
+	result = poll(&(struct pollfd){sf, POLLIN}, 1, 0) == 0;
+	close(sf);
+
+	return result;
+}
diff --git a/lib/igt_syncobj.h b/lib/igt_syncobj.h
index e6725671d..8a1480a97 100644
--- a/lib/igt_syncobj.h
+++ b/lib/igt_syncobj.h
@@ -65,5 +65,14 @@ void syncobj_timeline_to_timeline(int fd,
 				  uint64_t timeline_src, uint32_t point_src);
 void syncobj_timeline_signal(int fd, uint32_t *handles, uint64_t *points,
 			     uint32_t count);
+bool syncobj_busy(int fd, uint32_t handle);
+
+/* Used along with syncobj_timeline_wait() */
+static inline uint64_t gettime_ns(void)
+{
+	struct timespec current;
+	clock_gettime(CLOCK_MONOTONIC, &current);
+	return (uint64_t)current.tv_sec * NSEC_PER_SEC + current.tv_nsec;
+}
 
 #endif /* IGT_SYNCOBJ_H */
diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 6bf1cdb57..2c43fd291 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -1110,19 +1110,6 @@ static uint32_t syncobj_import(int fd, int syncobj)
 	return syncobj_fd_to_handle(fd, syncobj, 0);
 }
 
-static bool syncobj_busy(int fd, uint32_t handle)
-{
-	bool result;
-	int sf;
-
-	sf = syncobj_handle_to_fd(fd, handle,
-				  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE);
-	result = poll(&(struct pollfd){sf, POLLIN}, 1, 0) == 0;
-	close(sf);
-
-	return result;
-}
-
 static void test_syncobj_unused_fence(int fd)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -1916,14 +1903,6 @@ static void test_syncobj_timeline_invalid_flags(int fd)
 	syncobj_destroy(fd, fence.handle);
 }
 
-static uint64_t
-gettime_ns(void)
-{
-	struct timespec current;
-	clock_gettime(CLOCK_MONOTONIC, &current);
-	return (uint64_t)current.tv_sec * NSEC_PER_SEC + current.tv_nsec;
-}
-
 static const char *test_syncobj_timeline_signal_desc =
 	"Verifies proper signaling of a timeline syncobj through execbuf";
 static void test_syncobj_timeline_signal(int fd)
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index 7f5ff6f6c..352b0fa40 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -38,14 +38,6 @@ IGT_TEST_DESCRIPTION("Tests for the drm timeline sync object API");
 
 #define NSECS_PER_SEC 1000000000ull
 
-static uint64_t
-gettime_ns(void)
-{
-	struct timespec current;
-	clock_gettime(CLOCK_MONOTONIC, &current);
-	return (uint64_t)current.tv_sec * NSECS_PER_SEC + current.tv_nsec;
-}
-
 static void
 sleep_nsec(uint64_t time_nsec)
 {
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index 427b6b119..3415c78f8 100644
--- a/tests/syncobj_wait.c
+++ b/tests/syncobj_wait.c
@@ -38,14 +38,6 @@ IGT_TEST_DESCRIPTION("Tests for the drm sync object wait API");
 
 #define NSECS_PER_SEC 1000000000ull
 
-static uint64_t
-gettime_ns(void)
-{
-	struct timespec current;
-	clock_gettime(CLOCK_MONOTONIC, &current);
-	return (uint64_t)current.tv_sec * NSECS_PER_SEC + current.tv_nsec;
-}
-
 static void
 sleep_nsec(uint64_t time_nsec)
 {
-- 
2.21.0.rc0.32.g243a4c7e27
