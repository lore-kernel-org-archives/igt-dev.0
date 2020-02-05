Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5DC6E9C9
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2020 17:00:32 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Wed,  5 Feb 2020 22:30:40 +0530
Message-Id: <20200205170040.17149-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/dumb_buffer: page_size for
 create_clear
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

For the dumb_buffer@clear_create test we need to detect the correct page
size for the buffer size calculation.

We create the least sized buffer and see the page aligned size returned
from kernel, which is minimum page size kernel will allocate.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/dumb_buffer.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index ad854c0696e7..d586d14f1804 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -52,8 +52,6 @@
 
 IGT_TEST_DESCRIPTION("This is a test for the generic dumb buffer interface.");
 
-#define PAGE_SIZE 4096
-
 static int __dumb_create(int fd, struct drm_mode_create_dumb *create)
 {
 	int err = 0;
@@ -225,6 +223,7 @@ struct thread_clear {
 	_Atomic(uint64_t) max;
 	int timeout;
 	int fd;
+	uint64_t page_size;
 };
 
 #define MAX_PAGE_TO_REQUEST	102400
@@ -247,14 +246,12 @@ static void *thread_clear(void *data)
 
 		for (uint64_t _npages = npages; npages > 0; npages -= _npages) {
 			create.bpp = 32;
-			create.width = PAGE_SIZE / (create.bpp / 8);
+			create.width = arg->page_size / (create.bpp / 8);
 			_npages = npages <= MAX_PAGE_TO_REQUEST ? npages :
 				  MAX_PAGE_TO_REQUEST;
 			create.height = _npages;
 
 			dumb_create(fd, &create);
-			igt_assert_eq(PAGE_SIZE * create.height, create.size);
-
 			ptr = dumb_map(fd,
 				       create.handle, create.size,
 				       PROT_WRITE);
@@ -307,7 +304,7 @@ static uint64_t estimate_largest_dumb_buffer(int fd)
 
 		igt_info("Largest dumb buffer sucessfully created: %'"PRIu64" bytes\n",
 			 largest);
-		return largest / PAGE_SIZE;
+		return largest;
 	}
 
 	for (create.height = 1; create.height; create.height *= 2) {
@@ -329,18 +326,34 @@ static uint64_t estimate_largest_dumb_buffer(int fd)
 	longjmp(sigjmp, SIGABRT);
 }
 
+static uint64_t probe_page_size(int fd)
+{
+	struct drm_mode_create_dumb create = {
+		.bpp = 32,
+		.width = 1, /* in pixels */
+		.height = 1, /* in rows */
+	};
+
+	dumb_create(fd, &create);
+	dumb_destroy(fd, create.handle);
+
+	return create.size;
+}
+
 static void always_clear(int fd, int timeout)
 {
 	struct thread_clear arg = {
 		.fd = fd,
 		.timeout = timeout,
-		.max = estimate_largest_dumb_buffer(fd), /* in pages */
 	};
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	unsigned long checked;
 	pthread_t thread[ncpus];
 	void *result;
 
+	arg.page_size = probe_page_size(fd);
+	arg.max = estimate_largest_dumb_buffer(fd) / arg.page_size;
+
 	for (int i = 0; i < ncpus; i++)
 		pthread_create(&thread[i], NULL, thread_clear, &arg);
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
