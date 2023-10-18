Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED3010E3C4
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Oct 2023 08:32:01 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Oct 2023 10:31:36 +0200
Message-ID: <20231018083136.9873-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_prime_self_import: Adjust
 buffer object sizes to min alignment
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Creating a buffer object in VRAM may require the size to be properly
aligned. Ensure the buffer object sizes are using the minimum required
alignment.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_prime_self_import.c | 40 +++++++++++++++---------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index 994fd99f5..536230f9f 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -56,11 +56,10 @@
 IGT_TEST_DESCRIPTION("Check whether prime import/export works on the same"
 		     " device... but with different fds.");
 
-#define BO_SIZE (16*1024)
-
 static char counter;
 static int g_time_out = 5;
 static pthread_barrier_t g_barrier;
+static size_t bo_size;
 
 static void
 check_bo(int fd1, uint32_t handle1, int fd2, uint32_t handle2)
@@ -69,25 +68,25 @@ check_bo(int fd1, uint32_t handle1, int fd2, uint32_t handle2)
 	int i;
 
 
-	ptr1 = xe_bo_map(fd1, handle1, BO_SIZE);
-	ptr2 = xe_bo_map(fd2, handle2, BO_SIZE);
+	ptr1 = xe_bo_map(fd1, handle1, bo_size);
+	ptr2 = xe_bo_map(fd2, handle2, bo_size);
 
 	/* TODO: Export fence for both and wait on them */
 	usleep(1000);
 
 	/* check whether it's still our old object first. */
-	for (i = 0; i < BO_SIZE; i++) {
+	for (i = 0; i < bo_size; i++) {
 		igt_assert(ptr1[i] == counter);
 		igt_assert(ptr2[i] == counter);
 	}
 
 	counter++;
 
-	memset(ptr1, counter, BO_SIZE);
-	igt_assert(memcmp(ptr1, ptr2, BO_SIZE) == 0);
+	memset(ptr1, counter, bo_size);
+	igt_assert(memcmp(ptr1, ptr2, bo_size) == 0);
 
-	munmap(ptr1, BO_SIZE);
-	munmap(ptr2, BO_SIZE);
+	munmap(ptr1, bo_size);
+	munmap(ptr2, bo_size);
 }
 
 /**
@@ -106,7 +105,7 @@ static void test_with_fd_dup(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
+	handle = xe_bo_create_flags(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
 
 	dma_buf_fd1 = prime_handle_to_fd(fd1, handle);
 	gem_close(fd1, handle);
@@ -139,8 +138,8 @@ static void test_with_two_bos(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle1 = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
-	handle2 = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
+	handle1 = xe_bo_create_flags(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
+	handle2 = xe_bo_create_flags(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
 
 	dma_buf_fd = prime_handle_to_fd(fd1, handle1);
 	handle_import = prime_fd_to_handle(fd2, dma_buf_fd);
@@ -175,7 +174,7 @@ static void test_with_one_bo_two_files(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle_orig = xe_bo_create_flags(fd1, 0, BO_SIZE,
+	handle_orig = xe_bo_create_flags(fd1, 0, bo_size,
 					 visible_vram_if_possible(fd1, 0));
 	dma_buf_fd1 = prime_handle_to_fd(fd1, handle_orig);
 
@@ -208,7 +207,7 @@ static void test_with_one_bo(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
+	handle = xe_bo_create_flags(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
 
 	dma_buf_fd = prime_handle_to_fd(fd1, handle);
 	handle_import1 = prime_fd_to_handle(fd2, dma_buf_fd);
@@ -294,7 +293,7 @@ static void *thread_fn_reimport_vs_close(void *p)
 
 	fds[0] = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create_flags(fds[0], 0, BO_SIZE,
+	handle = xe_bo_create_flags(fds[0], 0, bo_size,
 				    visible_vram_if_possible(fds[0], 0));
 
 	fds[1] = prime_handle_to_fd(fds[0], handle);
@@ -337,7 +336,7 @@ static void *thread_fn_export_vs_close(void *p)
 
 	igt_until_timeout(g_time_out) {
 		/* We want to race gem close against prime export on handle one.*/
-		handle = xe_bo_create_flags(fd, 0, 4096,
+		handle = xe_bo_create_flags(fd, 0, bo_size,
 					    visible_vram_if_possible(fd, 0));
 		if (handle != 1)
 			gem_close(fd, handle);
@@ -463,7 +462,7 @@ static void test_llseek_bad(void)
 
 	fd = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create_flags(fd, 0, BO_SIZE,
+	handle = xe_bo_create_flags(fd, 0, bo_size,
 				    visible_vram_if_possible(fd, 0));
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 
@@ -473,9 +472,9 @@ static void test_llseek_bad(void)
 
 	igt_assert(lseek(dma_buf_fd, -1, SEEK_END) == -1 && errno == EINVAL);
 	igt_assert(lseek(dma_buf_fd, 1, SEEK_SET) == -1 && errno == EINVAL);
-	igt_assert(lseek(dma_buf_fd, BO_SIZE, SEEK_SET) == -1 && errno == EINVAL);
-	igt_assert(lseek(dma_buf_fd, BO_SIZE + 1, SEEK_SET) == -1 && errno == EINVAL);
-	igt_assert(lseek(dma_buf_fd, BO_SIZE - 1, SEEK_SET) == -1 && errno == EINVAL);
+	igt_assert(lseek(dma_buf_fd, bo_size, SEEK_SET) == -1 && errno == EINVAL);
+	igt_assert(lseek(dma_buf_fd, bo_size + 1, SEEK_SET) == -1 && errno == EINVAL);
+	igt_assert(lseek(dma_buf_fd, bo_size - 1, SEEK_SET) == -1 && errno == EINVAL);
 
 	close(dma_buf_fd);
 
@@ -502,6 +501,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		bo_size = xe_get_default_alignment(fd);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
-- 
2.41.0
