Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9BE6E3A4
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2020 07:05:32 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu,  9 Jan 2020 12:34:41 +0530
Message-Id: <20200109070441.27511-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20200109070441.27511-1-mohammed.khajapasha@intel.com>
References: <20200109070441.27511-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/1] tests: update the test with close() for
 prime fd
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
List-ID: <igt-dev@lists.freedesktop.org>

Include close() for prime file descriptor and
call mumap() in mmap() success case only.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/prime_mmap_kms.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/prime_mmap_kms.c b/tests/prime_mmap_kms.c
index 29aec499..746e2abe 100644
--- a/tests/prime_mmap_kms.c
+++ b/tests/prime_mmap_kms.c
@@ -207,6 +207,9 @@ static void run_test(gpu_process_t *gpu)
 		igt_waitchildren();
 
 		igt_debug_wait_for_keypress("paint");
+
+		close(prime_fd);
+
 		cleanup_crtc(gpu);
 
 		/* once is enough */
@@ -227,11 +230,12 @@ check_for_dma_buf_mmap(int fd)
 	handle = gem_create(fd, 4096);
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	ptr = mmap(NULL, 4096, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
-	if (ptr != MAP_FAILED)
+	if (ptr != MAP_FAILED) {
 		ret = 0;
-	munmap(ptr, 4096);
-	gem_close(fd, handle);
+		munmap(ptr, 4096);
+	}
 	close(dma_buf_fd);
+	gem_close(fd, handle);
 	return ret;
 }
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
