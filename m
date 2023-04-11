Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFA310E0E1
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 19:46:04 +0000 (UTC)
From: "Chang, Bruce" <yu.bruce.chang@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Apr 2023 19:45:55 +0000
Message-Id: <20230411194555.17672-1-yu.bruce.chang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe_vm: make sure test can finish
 within time
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

the BAT takes a lot longer (> 48s) than expected (~5s). This seems
due to the system is too busy to wake up the main thread which is in
sleep.

So, change the test to run in a timeout instead of relying on main
thread.

on another hand, also change the logic to make sure all threads start
together.

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
---
 tests/xe/xe_prime_self_import.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
index 5710cff92..fb677b50b 100644
--- a/tests/xe/xe_prime_self_import.c
+++ b/tests/xe/xe_prime_self_import.c
@@ -58,7 +58,8 @@ IGT_TEST_DESCRIPTION("Check whether prime import/export works on the same"
 #define BO_SIZE (16*1024)
 
 static char counter;
-volatile int pls_die = 0;
+static int g_time_out = 5;
+static pthread_barrier_t g_barrier;
 
 static void
 check_bo(int fd1, uint32_t handle1, int fd2, uint32_t handle2)
@@ -272,7 +273,9 @@ static void *thread_fn_reimport_vs_close(void *p)
 	int dma_buf_fd = fds[1];
 	uint32_t handle;
 
-	while (!pls_die) {
+	pthread_barrier_wait(&g_barrier);
+
+	igt_until_timeout(g_time_out) {
 		handle = prime_fd_to_handle(fd, dma_buf_fd);
 
 		close_bo.handle = handle;
@@ -306,6 +309,7 @@ static void *thread_fn_reimport_vs_close(void *p)
 	obj_count = 0;
 
 	num_threads = sysconf(_SC_NPROCESSORS_ONLN);
+	igt_info("create %d threads\n", num_threads);
 
 	threads = calloc(num_threads, sizeof(pthread_t));
 
@@ -315,6 +319,7 @@ static void *thread_fn_reimport_vs_close(void *p)
 	handle = xe_bo_create(fds[0], 0, 0, BO_SIZE);
 
 	fds[1] = prime_handle_to_fd(fds[0], handle);
+	pthread_barrier_init(&g_barrier, NULL, num_threads);
 
 	for (i = 0; i < num_threads; i++) {
 		r = pthread_create(&threads[i], NULL,
@@ -323,15 +328,12 @@ static void *thread_fn_reimport_vs_close(void *p)
 		igt_assert_eq(r, 0);
 	}
 
-	sleep(5);
-
-	pls_die = 1;
-
 	for (i = 0;  i < num_threads; i++) {
 		pthread_join(threads[i], &status);
 		igt_assert(status == 0);
 	}
 
+	pthread_barrier_destroy(&g_barrier);
 	xe_device_put(fds[0]);
 	close(fds[0]);
 	close(fds[1]);
@@ -353,7 +355,9 @@ static void *thread_fn_export_vs_close(void *p)
 	int fd = (uintptr_t)p;
 	uint32_t handle;
 
-	while (!pls_die) {
+	pthread_barrier_wait(&g_barrier);
+
+	igt_until_timeout(g_time_out) {
 		/* We want to race gem close against prime export on handle one.*/
 		handle = xe_bo_create(fd, 0, 0, 4096);
 		if (handle != 1)
@@ -395,6 +399,7 @@ static void test_export_close_race(void)
 	int fake;
 
 	num_threads = sysconf(_SC_NPROCESSORS_ONLN);
+	igt_info("create %d threads\n", num_threads);
 
 	threads = calloc(num_threads, sizeof(pthread_t));
 
@@ -408,6 +413,7 @@ static void test_export_close_race(void)
 
 	fd = drm_open_driver(DRIVER_XE);
 	xe_device_get(fd);
+	pthread_barrier_init(&g_barrier, NULL, num_threads);
 
 	for (i = 0; i < num_threads; i++) {
 		r = pthread_create(&threads[i], NULL,
@@ -416,15 +422,12 @@ static void test_export_close_race(void)
 		igt_assert_eq(r, 0);
 	}
 
-	sleep(5);
-
-	pls_die = 1;
-
 	for (i = 0;  i < num_threads; i++) {
 		pthread_join(threads[i], &status);
 		igt_assert(status == 0);
 	}
 
+	pthread_barrier_destroy(&g_barrier);
 	xe_device_put(fd);
 	close(fd);
 
-- 
2.25.1
