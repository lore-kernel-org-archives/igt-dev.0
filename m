Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1164D10E2AE
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 19:12:09 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/xe_create: Use separate VMs per process
Date: Mon, 18 Dec 2023 06:50:51 -0800
Message-Id: <20231218145051.1869466-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lucas.demarchi@intel.com, jonathan.cavitt@intel.com,
 saurabhg.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We currently exercise cross-user impact in xe_create by attempting to
concurrently create a large number of exec queues on a single vm using
forked child processes.  This is unrealistic, as multiple users are more
likely to be using separate file descriptors for creating exec queues.

Update the test to reflect this use case.

Suggested-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_create.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 0aa32c788a..22f9464161 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -167,13 +167,9 @@ enum exec_queue_destroy {
 static void create_execqueues(int fd, enum exec_queue_destroy ed)
 {
 	struct timespec tv = { };
-	uint32_t num_engines, exec_queues_per_process, vm;
+	uint32_t exec_queues_per_process;
 	int nproc = sysconf(_SC_NPROCESSORS_ONLN), seconds;
 
-	fd = drm_reopen_driver(fd);
-	num_engines = xe_number_engines(fd);
-	vm = xe_vm_create(fd, 0, 0);
-
 	exec_queues_per_process = max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
 	igt_debug("nproc: %u, exec_queues per process: %u\n", nproc, exec_queues_per_process);
 
@@ -182,8 +178,13 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
 	igt_fork(n, nproc) {
 		struct drm_xe_engine *engine;
 		uint32_t exec_queue, exec_queues[exec_queues_per_process];
+		uint32_t num_engines, vm;
 		int idx, err, i;
 
+		fd = drm_reopen_driver(fd);
+		num_engines = xe_number_engines(fd);
+		vm = xe_vm_create(fd, 0, 0);
+
 		srandom(n);
 
 		for (i = 0; i < exec_queues_per_process; i++) {
@@ -206,12 +207,12 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
 				xe_exec_queue_destroy(fd, exec_queues[i]);
 			}
 		}
+
+		xe_vm_destroy(fd, vm);
+		drm_close_driver(fd);
 	}
 	igt_waitchildren();
 
-	xe_vm_destroy(fd, vm);
-	drm_close_driver(fd);
-
 	seconds = igt_seconds_elapsed(&tv);
 	igt_assert_f(seconds < MAXTIME,
 		     "Creating %d exec_queues tooks too long: %d [limit: %d]\n",
-- 
2.25.1
