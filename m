Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2626A6E8DB
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2020 16:33:16 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 11 Jun 2020 17:33:09 +0100
Message-Id: <20200611163309.262209-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_mmap_gtt: Increase concurrent
 stress
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
To: intel-gx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Rather than just try to look at the first fault of each mmap in each
thread, keep the threads running for the test duration and watch for
refaults.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/2012
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_mmap_gtt.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index 3a4681a18..79c242c68 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -1043,6 +1043,7 @@ test_write_cpu_read_gtt(int fd)
 struct thread_fault_concurrent {
 	pthread_t thread;
 	int id;
+	int *ctl;
 	uint32_t **ptr;
 };
 
@@ -1053,11 +1054,14 @@ thread_fault_concurrent(void *closure)
 	uint32_t val = 0;
 	int n;
 
-	for (n = 0; n < 32; n++) {
+	for (n = 0; READ_ONCE(t->ctl); n++) {
 		unsigned int id = (n + t->id) % 32;
 		uint32_t sz = *t->ptr[id] - 1;
 		int idx = rand() % sz + 1;
 
+		igt_assert(t->ptr[id][0]);
+		igt_assert(idx); /* avoid overwriting the size */
+
 		if (n & 1)
 			t->ptr[id][idx] = val;
 		else
@@ -1074,8 +1078,12 @@ test_fault_concurrent(int fd)
 {
 	uint32_t *ptr[32];
 	struct thread_fault_concurrent thread[64];
+	int *ctl;
 	int n;
 
+	ctl = create_pointer_size(fd, 4096);
+	*ctl = 1;
+
 	for (n = 0; n < 32; n++) {
 		uint32_t sz = (n + 1) << 19; /* 512KiB increments */
 
@@ -1083,19 +1091,25 @@ test_fault_concurrent(int fd)
 		*ptr[n] = sz / sizeof(uint32_t); /* num_elems for convenience */
 	}
 
+	__sync_synchronize();
 	for (n = 0; n < 64; n++) {
 		thread[n].ptr = ptr;
 		thread[n].id = n;
-		pthread_create(&thread[n].thread, NULL, thread_fault_concurrent, &thread[n]);
+		thread[n].ctl = ctl;
+		pthread_create(&thread[n].thread, NULL,
+				thread_fault_concurrent, &thread[n]);
 	}
 
 	sleep(2);
+	*ctl = 0;
 
+	__sync_synchronize();
 	for (n = 0; n < 64; n++)
 		pthread_join(thread[n].thread, NULL);
 
 	for (n = 0; n < 32; n++)
 		munmap(ptr[n], *ptr[n] * sizeof(uint32_t));
+	munmap(ctl, 4096);
 }
 
 static int mmap_ioctl(int i915, struct drm_i915_gem_mmap_gtt *arg)
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
