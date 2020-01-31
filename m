Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E2A6FBAD
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 17:31:18 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 31 Jan 2020 23:01:04 +0530
Message-Id: <20200131173109.12527-5-ramalingam.c@intel.com>
In-Reply-To: <20200131173109.12527-1-ramalingam.c@intel.com>
References: <20200131173109.12527-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/9] tests/prime_mmap: use device coherent
 mapping instead of mmap_gtt
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

Since on new discrete GPUs we dont have the mappable aperture, if that
is acceptable for the test purpose, we should use GEM_MMAP_OFFSET.
Hence using gem_mmap_device_coherent() which wraps the mmap options in
the order of gem_mmap_offset / gem_mmap / mmap_gtt

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 tests/prime_mmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
index fc985784407b..1433424109c8 100644
--- a/tests/prime_mmap.c
+++ b/tests/prime_mmap.c
@@ -85,8 +85,8 @@ test_correct(void)
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	igt_assert(errno == 0);
 
-	/* Check correctness vs GEM_MMAP_GTT */
-	ptr1 = gem_mmap__gtt(fd, handle, BO_SIZE, PROT_READ);
+	/* Check correctness vs GEM_MMAP */
+	ptr1 = gem_mmap__device_coherent(fd, handle, 0, BO_SIZE, PROT_READ);
 	ptr2 = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr1 != MAP_FAILED);
 	igt_assert(ptr2 != MAP_FAILED);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
