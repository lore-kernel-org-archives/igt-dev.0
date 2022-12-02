Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3B210E72D
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Dec 2022 20:57:38 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  2 Dec 2022 21:57:05 +0100
Message-Id: <20221202205705.58879-8-kamil.konieczny@linux.intel.com>
In-Reply-To: <20221202205705.58879-1-kamil.konieczny@linux.intel.com>
References: <20221202205705.58879-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/7] tests/i915/gem_close_race: add multiGPU
 subtests
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

Add two multiGPU subtests multigpu-basic-threads and
multigpu-basic-process.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_close_race.c | 54 +++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
index e37a8882..3ef073b8 100644
--- a/tests/i915/gem_close_race.c
+++ b/tests/i915/gem_close_race.c
@@ -47,6 +47,7 @@
 #include "i915/gem_mman.h"
 #include "igt.h"
 #include "igt_aux.h"
+#include "igt_device_scan.h"
 
 #define OBJECT_SIZE (256 * 1024)
 
@@ -254,6 +255,31 @@ static void thread(int fd, struct drm_gem_open name,
 	free(history);
 }
 
+static void multigpu_threads(int timeout, unsigned int flags, int gpu_count)
+{
+	int size = sysconf(_SC_NPROCESSORS_ONLN);
+
+	size /= gpu_count;
+	if (size < 1)
+		size = 1;
+
+	igt_multi_fork(gpu, gpu_count) {
+		struct drm_gem_open name;
+		int fd = __drm_open_driver_another(gpu, DRIVER_INTEL);
+
+		igt_assert(fd > 0);
+
+		igt_fork(child, size)
+			thread(fd, name, timeout, flags);
+
+		igt_waitchildren();
+		gem_quiescent_gpu(fd);
+		close(fd);
+	}
+
+	igt_waitchildren();
+}
+
 static void threads(int timeout, unsigned int flags)
 {
 	struct drm_gem_open name;
@@ -272,6 +298,8 @@ static void threads(int timeout, unsigned int flags)
 
 igt_main
 {
+	int gpu_count;
+
 	igt_fixture {
 		int fd;
 
@@ -286,6 +314,10 @@ igt_main
 		exec_addr = max_t(exec_addr, exec_addr, data_addr);
 		data_addr += exec_addr;
 
+		gpu_count = igt_device_filter_count();
+		if (gpu_count < 2)
+			gpu_count = 1;
+
 		igt_fork_hang_detector(fd);
 		close(fd);
 	}
@@ -302,11 +334,33 @@ igt_main
 		close(fd);
 	}
 
+	igt_describe("Basic workload submission on multi-GPU machine.");
+	igt_subtest("multigpu-basic-process") {
+		igt_require(gpu_count > 1);
+
+		igt_multi_fork(child, gpu_count) {
+			int fd = __drm_open_driver_another(child, DRIVER_INTEL);
+
+			igt_assert(fd > 0);
+			process(fd, child);
+			gem_quiescent_gpu(fd);
+			close(fd);
+		}
+
+		igt_waitchildren();
+	}
+
 	igt_describe("Share buffer handle across different drm fd's and trying to race "
 		     " gem_close against continuous workload with minimum timeout.");
 	igt_subtest("basic-threads")
 		threads(1, 0);
 
+	igt_describe("Run basic-threads race on multi-GPU machine.");
+	igt_subtest("multigpu-basic-threads") {
+		igt_require(gpu_count > 1);
+		multigpu_threads(1, 0, gpu_count);
+	}
+
 	igt_describe("Test try to race gem_close against submission of continuous"
 		     " workload.");
 	igt_subtest("process-exit") {
-- 
2.34.1
