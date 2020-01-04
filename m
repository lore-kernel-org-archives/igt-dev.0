Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5532489DB9
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jan 2020 10:09:02 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Sat,  4 Jan 2020 15:38:26 +0530
Message-Id: <20200104100826.21067-2-ramalingam.c@intel.com>
In-Reply-To: <20200104100826.21067-1-ramalingam.c@intel.com>
References: <20200104100826.21067-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 2/2] tests/dumb_duffer: extending for lmem coverage.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

if lmem is available on intel platforms, dumb buffers are created out of
lmem. Hence tests are extended to cover the dumb buffers from lmem.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 tests/dumb_buffer.c | 80 ++++++++++++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 26 deletions(-)

diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index 3d2dc9966d0b..9717ac7641a2 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -43,6 +43,9 @@
 #include <getopt.h>
 #include <pthread.h>
 #include <stdatomic.h>
+#include <igt_debugfs.h>
+
+#include <i915/intel_memory_region.h>
 
 #include <drm.h>
 
@@ -52,7 +55,12 @@
 
 IGT_TEST_DESCRIPTION("This is a test for the generic dumb buffer interface.");
 
-#define PAGE_SIZE 4096
+static struct dumb_buffer_data {
+	int drm_fd;
+	bool lmem;
+	_Atomic(uint64_t) max;
+	int page_size;
+} data;
 
 static int __dumb_create(int fd, struct drm_mode_create_dumb *create)
 {
@@ -212,13 +220,13 @@ static void valid_nonaligned_size(int fd)
 		.height = 24,
 		.bpp = 32,
 	};
-	char buf[PAGE_SIZE];
+	char buf[data.page_size];
 
 	igt_require(is_i915_device(fd));
 
 	dumb_create(fd, &create);
 
-	gem_write(fd, create.handle, PAGE_SIZE / 2, buf, PAGE_SIZE / 2);
+	gem_write(fd, create.handle, data.page_size / 2, buf, data.page_size / 2);
 
 	dumb_destroy(fd, create.handle);
 }
@@ -235,14 +243,15 @@ static void invalid_nonaligned_size(int fd)
 		.height = 24,
 		.bpp = 32,
 	};
-	char buf[PAGE_SIZE];
+	char buf[data.page_size];
 
 	igt_require(is_i915_device(fd));
 
 	dumb_create(fd, &create);
+
 	/* This should fail. Hence cannot use gem_write. */
 	igt_assert(__gem_write(fd, create.handle,
-			       create.size - (PAGE_SIZE / 2), buf, PAGE_SIZE));
+			       create.size - (data.page_size / 2), buf, data.page_size));
 	dumb_destroy(fd, create.handle);
 }
 
@@ -273,13 +282,15 @@ struct thread_clear {
 	int fd;
 };
 
-#define MAX_PAGE_TO_REQUEST	102400
+#define MAX_SMEM_PAGE	102400
+#define MAX_LMEM_PAGE	1024
 
-static void *thread_clear(void *data)
+static void *thread_clear(void *thread_data)
 {
-	struct thread_clear *arg = data;
+	struct thread_clear *arg = thread_data;
 	unsigned long checked = 0;
 	int fd = arg->fd;
+	int max_page = data.lmem ? MAX_LMEM_PAGE : MAX_SMEM_PAGE;
 	void *ptr;
 
 	igt_until_timeout(arg->timeout) {
@@ -293,16 +304,14 @@ static void *thread_clear(void *data)
 
 		for (uint64_t _npages = npages; npages > 0; npages -= _npages) {
 			create.bpp = 32;
-			create.width = PAGE_SIZE / (create.bpp / 8);
-			_npages = npages <= MAX_PAGE_TO_REQUEST ? npages :
-				  MAX_PAGE_TO_REQUEST;
+			create.width = data.page_size / (create.bpp / 8);
+			_npages = npages <= max_page ? npages : max_page;
 			create.height = _npages;
 
 			dumb_create(fd, &create);
-			igt_assert_eq(PAGE_SIZE * create.height, create.size);
+			igt_assert_eq(data.page_size * create.height, create.size);
 
-			ptr = dumb_map(fd,
-				       create.handle, create.size,
+			ptr = dumb_map(fd, create.handle, create.size,
 				       PROT_WRITE);
 
 			for (uint64_t page = 0; page < create.height; page++) {
@@ -330,7 +339,7 @@ static void always_clear(int fd, int timeout)
 	struct thread_clear arg = {
 		.fd = fd,
 		.timeout = timeout,
-		.max = intel_get_avail_ram_mb() << (20 - 12), /* in pages */
+		.max = data.max, /* in pages */
 	};
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	unsigned long checked;
@@ -348,35 +357,54 @@ static void always_clear(int fd, int timeout)
 	igt_info("Checked %'lu page allocations\n", checked);
 }
 
-igt_main
+static int parse_lmem_details(void)
 {
-	int fd = -1;
+	if (gem_has_lmem(data.drm_fd)) {
+		data.lmem = true;
+		data.page_size = 65536;
+		data.max = gem_lmem_total_size(data.drm_fd);
+		igt_assert_f(data.max, "Lmem with 0Bytes\n");
+		data.max = data.max / data.page_size;
+	}
 
+	return 0;
+}
+
+igt_main
+{
 	igt_fixture {
-		fd = drm_open_driver(DRIVER_ANY);
+		data.drm_fd = drm_open_driver(DRIVER_ANY);
+		data.lmem = false;
+		data.page_size = 4096;
+		if (is_i915_device(data.drm_fd)) {
+			igt_assert(parse_lmem_details() == 0);
+			if (!data.lmem)
+				/* In pages */
+				data.max = intel_get_avail_ram_mb() << 8;
+		}
 	}
 
 	igt_subtest("invalid-bpp")
-		invalid_dimensions_test(fd);
+		invalid_dimensions_test(data.drm_fd);
 
 	igt_subtest("create-valid-dumb")
-		valid_dumb_creation_test(fd);
+		valid_dumb_creation_test(data.drm_fd);
 
 	igt_subtest("create-valid-nonaligned")
-		valid_nonaligned_size(fd);
+		valid_nonaligned_size(data.drm_fd);
 
 	igt_subtest("create-invalid-nonaligned")
-		invalid_nonaligned_size(fd);
+		invalid_nonaligned_size(data.drm_fd);
 
 	igt_subtest("map-valid")
-		valid_map(fd);
+		valid_map(data.drm_fd);
 
 	igt_subtest("map-uaf")
-		uaf_map(fd);
+		uaf_map(data.drm_fd);
 
 	igt_subtest("map-invalid-size")
-		invalid_size_map(fd);
+		invalid_size_map(data.drm_fd);
 
 	igt_subtest("create-clear")
-		always_clear(fd, 30);
+		always_clear(data.drm_fd, 30);
 }
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
