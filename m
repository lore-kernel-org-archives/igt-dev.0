Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1586E2E5
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2020 17:02:10 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Mon, 27 Jan 2020 22:32:04 +0530
Message-Id: <20200127170205.7195-4-ramalingam.c@intel.com>
In-Reply-To: <20200127170205.7195-1-ramalingam.c@intel.com>
References: <20200127170205.7195-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/5] tests/dumb_duffer: extending for lmem
 coverage.
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

If lmem is available on intel platforms, dumb buffers are created out of
lmem. Hence tests detect the lmem and adopt the corresponding page
size to cover the dumb buffers from lmem.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 tests/dumb_buffer.c | 54 ++++++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index ad854c0696e7..79a4fade5367 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -43,6 +43,9 @@
 #include <sys/ioctl.h>
 #include <sys/stat.h>
 #include <sys/time.h>
+#include <igt_debugfs.h>
+
+#include <i915/intel_memory_region.h>
 
 #include <drm.h>
 
@@ -52,7 +55,11 @@
 
 IGT_TEST_DESCRIPTION("This is a test for the generic dumb buffer interface.");
 
-#define PAGE_SIZE 4096
+static struct dumb_buffer_data {
+	int drm_fd;
+	bool lmem;
+	int page_size;
+} data;
 
 static int __dumb_create(int fd, struct drm_mode_create_dumb *create)
 {
@@ -227,13 +234,15 @@ struct thread_clear {
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
@@ -247,16 +256,14 @@ static void *thread_clear(void *data)
 
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
@@ -307,7 +314,7 @@ static uint64_t estimate_largest_dumb_buffer(int fd)
 
 		igt_info("Largest dumb buffer sucessfully created: %'"PRIu64" bytes\n",
 			 largest);
-		return largest / PAGE_SIZE;
+		return largest / data.page_size;
 	}
 
 	for (create.height = 1; create.height; create.height *= 2) {
@@ -354,27 +361,34 @@ static void always_clear(int fd, int timeout)
 
 igt_main
 {
-	int fd = -1;
-
 	igt_fixture {
-		fd = drm_open_driver(DRIVER_ANY);
+		data.drm_fd = drm_open_driver(DRIVER_ANY);
+		data.lmem = false;
+		data.page_size = 4096;
+		if (is_i915_device(data.drm_fd)) {
+			if (gem_has_lmem(data.drm_fd)) {
+				data.lmem = true;
+				data.page_size = 65536;
+			}
+		}
+
 	}
 
 	igt_subtest("invalid-bpp")
-		invalid_dimensions_test(fd);
+		invalid_dimensions_test(data.drm_fd);
 
 	igt_subtest("create-valid-dumb")
-		valid_dumb_creation_test(fd);
+		valid_dumb_creation_test(data.drm_fd);
 
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
