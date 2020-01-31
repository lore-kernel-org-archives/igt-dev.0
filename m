Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ADC6FBAB
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 17:31:15 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 31 Jan 2020 23:01:03 +0530
Message-Id: <20200131173109.12527-4-ramalingam.c@intel.com>
In-Reply-To: <20200131173109.12527-1-ramalingam.c@intel.com>
References: <20200131173109.12527-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/9] tests/prime_mmap_coherency: use device
 coherent mapping instead of mmap_gtt
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
 tests/prime_mmap_coherency.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/prime_mmap_coherency.c b/tests/prime_mmap_coherency.c
index 39538767c68f..32d78ee1a771 100644
--- a/tests/prime_mmap_coherency.c
+++ b/tests/prime_mmap_coherency.c
@@ -69,7 +69,7 @@ static int test_read_flush(void)
 
 	/* STEP #3: write 0x11 into BO 1. */
 	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
-	ptr_gtt = gem_mmap__gtt(fd, bo_2->handle, width * height, PROT_READ | PROT_WRITE);
+	ptr_gtt = gem_mmap__device_coherent(fd, bo_2->handle, 0, width * height, PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, bo_2->handle,
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	memset(ptr_gtt, 0xc5, width * height);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
