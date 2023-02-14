Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA58510E97F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 19:28:49 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 20:28:29 +0100
Message-Id: <20230214192830.51997-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230214192830.51997-1-kamil.konieczny@linux.intel.com>
References: <20230214192830.51997-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/i915/gem_close_race: fix
 multi-gpu subtests
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

Change subtests and open cards in order, starting from first and
ending on last one.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_close_race.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
index 9c646f42..0ee46bf4 100644
--- a/tests/i915/gem_close_race.c
+++ b/tests/i915/gem_close_race.c
@@ -255,17 +255,34 @@ static void thread(int fd, struct drm_gem_open name,
 	free(history);
 }
 
+static void multigpu_open(int *fds, int gpu_count)
+{
+	for (int i = 1; i < gpu_count; i++) {
+		fds[i] = i ? __drm_open_driver_another(i, DRIVER_INTEL) : drm_open_driver(DRIVER_INTEL);
+		igt_assert(fds[i] >= 0);
+	}
+}
+
+static void multigpu_close(int *fds, int gpu_count)
+{
+	for (int i = gpu_count - 1; i >= 0; i--)
+		close(fds[i]);
+}
+
 static void multigpu_threads(int timeout, unsigned int flags, int gpu_count)
 {
 	int size = sysconf(_SC_NPROCESSORS_ONLN);
+#define MAX_GPU 16
+	int fds[MAX_GPU];
 
+	multigpu_open(fds, gpu_count);
 	size /= gpu_count;
 	if (size < 1)
 		size = 1;
 
 	igt_multi_fork(gpu, gpu_count) {
 		struct drm_gem_open name;
-		int fd = __drm_open_driver_another(gpu, DRIVER_INTEL);
+		int fd = gem_reopen_driver(fds[gpu]);
 
 		igt_assert(fd > 0);
 
@@ -278,6 +295,7 @@ static void multigpu_threads(int timeout, unsigned int flags, int gpu_count)
 	}
 
 	igt_waitchildren();
+	multigpu_close(fds, gpu_count);
 }
 
 static void threads(int timeout, unsigned int flags)
@@ -334,10 +352,14 @@ igt_main
 
 	igt_describe("Basic workload submission on multi-GPU machine.");
 	igt_subtest("multigpu-basic-process") {
+		int fds[MAX_GPU];
+
 		igt_require(gpu_count > 1);
+		igt_require(gpu_count <= MAX_GPU);
+		multigpu_open(fds, gpu_count);
 
 		igt_multi_fork(child, gpu_count) {
-			int fd = __drm_open_driver_another(child, DRIVER_INTEL);
+			int fd = gem_reopen_driver(fds[child]);
 
 			igt_assert(fd > 0);
 			process(fd, child);
@@ -346,6 +368,7 @@ igt_main
 		}
 
 		igt_waitchildren();
+		multigpu_close(fds, gpu_count);
 	}
 
 	igt_describe("Share buffer handle across different drm fd's and trying to race "
-- 
2.37.2
