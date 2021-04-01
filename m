Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBE66EBA7
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Apr 2021 00:43:18 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Wed, 31 Mar 2021 17:43:13 -0700
Message-Id: <20210401004313.65166-1-ashutosh.dixit@intel.com>
In-Reply-To: <20210330035056.52019-1-ashutosh.dixit@intel.com>
References: <20210330035056.52019-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915: Avoid set_domain -ENOMEM error with
 large objects
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
To: igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

When pread/pwrite are unavailable, the pread/pwrite replacement implemented
in ad5eb02eb3f1 ("lib/ioctl_wrappers: Keep IGT working without pread/pwrite
ioctls") uses gem_set_domain which pins the entire gem object, even when
the actual read/write size is small. This causes gem_set_domain to return
-ENOMEM for large objects with a trace such as:

ioctl_wrappers-CRITICAL: Test assertion failure function gem_set_domain, file ../lib/ioctl_wrappers.c:563:
ioctl_wrappers-CRITICAL: Failed assertion: __gem_set_domain(fd, handle, read, write) == 0
ioctl_wrappers-CRITICAL: Last errno: 12, Cannot allocate memory
ioctl_wrappers-CRITICAL: error: -12 != 0
igt_core-INFO: Stack trace:
igt_core-INFO:   #0 ../lib/igt_core.c:1746 __igt_fail_assert()
igt_core-INFO:   #1 [gem_set_domain+0x44]
igt_core-INFO:   #2 ../lib/ioctl_wrappers.c:367 gem_write()
igt_core-INFO:   #3 ../tests/prime_mmap.c:67 test_aperture_limit()
igt_core-INFO:   #4 ../tests/prime_mmap.c:578 __real_main530()
igt_core-INFO:   #5 ../tests/prime_mmap.c:530 main()

Therefore avoid using the pread/pwrite replacement for large objects, mmap
and write instead. This fixes failures seen in
prime_mmap@test_aperture_limit and gem_exec_params@larger-than-life-batch
when pread/pwrite are unavailable.

v2: Remove fill_bo calls in prime_mmap@test_aperture_limit (Mike Ruhl)
v3: s/gem_mmap__device_coherent/gem_mmap__wc/ (Matt Auld)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_params.c |  5 ++++-
 tests/prime_mmap.c           | 25 ++++++++++++++-----------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
index 6840cf40ce..df4c5c8f54 100644
--- a/tests/i915/gem_exec_params.c
+++ b/tests/i915/gem_exec_params.c
@@ -254,9 +254,12 @@ static uint32_t batch_create_size(int fd, uint64_t size)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t handle;
+	char *ptr;
 
 	handle = gem_create(fd, size);
-	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
+	ptr = gem_mmap__wc(fd, handle, 0, sizeof(bbe), PROT_WRITE);
+	memcpy(ptr, &bbe, sizeof(bbe));
+	munmap(ptr, sizeof(bbe));
 
 	return handle;
 }
diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
index cdf2d51497..9a783257d4 100644
--- a/tests/prime_mmap.c
+++ b/tests/prime_mmap.c
@@ -68,9 +68,13 @@ fill_bo(uint32_t handle, size_t size)
 }
 
 static void
-fill_bo_cpu(char *ptr)
+fill_bo_cpu(char *ptr, size_t size)
 {
-	memcpy(ptr, pattern, sizeof(pattern));
+	off_t i;
+	for (i = 0; i < size; i += sizeof(pattern))
+	{
+		memcpy(ptr + i, pattern, sizeof(pattern));
+	}
 }
 
 static void
@@ -208,7 +212,7 @@ test_correct_cpu_write(void)
 	igt_assert(ptr != MAP_FAILED);
 
 	/* Fill bo using CPU */
-	fill_bo_cpu(ptr);
+	fill_bo_cpu(ptr, BO_SIZE);
 
 	/* Check pattern correctness */
 	igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
@@ -236,7 +240,7 @@ test_forked_cpu_write(void)
 	igt_fork(childno, 1) {
 		ptr = mmap(NULL, BO_SIZE, PROT_READ | PROT_WRITE , MAP_SHARED, dma_buf_fd, 0);
 		igt_assert(ptr != MAP_FAILED);
-		fill_bo_cpu(ptr);
+		fill_bo_cpu(ptr, BO_SIZE);
 
 		igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
 		munmap(ptr, BO_SIZE);
@@ -452,20 +456,19 @@ test_aperture_limit(void)
 	uint64_t size2 = (gem_mappable_aperture_size(fd) * 3) / 8;
 
 	handle1 = gem_create(fd, size1);
-	fill_bo(handle1, BO_SIZE);
-
-	dma_buf_fd1 = prime_handle_to_fd(fd, handle1);
+	dma_buf_fd1 = prime_handle_to_fd_for_mmap(fd, handle1);
 	igt_assert(errno == 0);
-	ptr1 = mmap(NULL, size1, PROT_READ, MAP_SHARED, dma_buf_fd1, 0);
+	ptr1 = mmap(NULL, size1, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd1, 0);
 	igt_assert(ptr1 != MAP_FAILED);
+	fill_bo_cpu(ptr1, BO_SIZE);
 	igt_assert(memcmp(ptr1, pattern, sizeof(pattern)) == 0);
 
 	handle2 = gem_create(fd, size1);
-	fill_bo(handle2, BO_SIZE);
-	dma_buf_fd2 = prime_handle_to_fd(fd, handle2);
+	dma_buf_fd2 = prime_handle_to_fd_for_mmap(fd, handle2);
 	igt_assert(errno == 0);
-	ptr2 = mmap(NULL, size2, PROT_READ, MAP_SHARED, dma_buf_fd2, 0);
+	ptr2 = mmap(NULL, size2, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd2, 0);
 	igt_assert(ptr2 != MAP_FAILED);
+	fill_bo_cpu(ptr2, BO_SIZE);
 	igt_assert(memcmp(ptr2, pattern, sizeof(pattern)) == 0);
 
 	igt_assert(memcmp(ptr1, ptr2, BO_SIZE) == 0);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
