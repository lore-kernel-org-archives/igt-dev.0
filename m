Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3329A6EAD2
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 08:17:39 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu, 16 Sep 2021 13:40:29 +0530
Message-Id: <20210916081029.885986-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/prime_vgem: use device_coherent mmap
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, matthew.auld@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Update mmap__wc with mmap__device_coherent, as it works
on discrete platforms, while still using an explicit WC mmap on
integrated platforms.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/prime_vgem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index b837f2bfa..5fa6e537f 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -217,7 +217,7 @@ static void test_fence_blt(int i915, int vgem)
 
 		native = gem_create(i915, scratch.size);
 
-		ptr = gem_mmap__wc(i915, native, 0, scratch.size, PROT_READ);
+		ptr = gem_mmap__device_coherent(i915, native, 0, scratch.size, PROT_READ);
 		for (i = 0; i < scratch.height; i++)
 			igt_assert_eq_u32(ptr[scratch.pitch * i / sizeof(*ptr)],
 					  0);
@@ -393,7 +393,7 @@ static void test_blt(int vgem, int i915)
 
 	native = gem_create(i915, scratch.size);
 
-	ptr = gem_mmap__wc(i915, native, 0, scratch.size, PROT_WRITE);
+	ptr = gem_mmap__device_coherent(i915, native, 0, scratch.size, PROT_WRITE);
 	for (i = 0; i < scratch.height; i++)
 		ptr[scratch.pitch * i / sizeof(*ptr)] = i;
 	munmap(ptr, scratch.size);
@@ -421,7 +421,7 @@ static void test_blt(int vgem, int i915)
 			     scratch.size);
 	gem_sync(i915, native);
 
-	ptr = gem_mmap__wc(i915, native, 0, scratch.size, PROT_READ);
+	ptr = gem_mmap__device_coherent(i915, native, 0, scratch.size, PROT_READ);
 	for (i = 0; i < scratch.height; i++)
 		igt_assert_eq_u32(ptr[scratch.pitch * i / sizeof(*ptr)], ~i);
 	munmap(ptr, scratch.size);
@@ -534,7 +534,7 @@ static void test_blt_interleaved(int vgem, int i915)
 	native = gem_create(i915, scratch.size);
 
 	foreign = vgem_mmap(vgem, &scratch, PROT_WRITE);
-	local = gem_mmap__wc(i915, native, 0, scratch.size, PROT_WRITE);
+	local = gem_mmap__device_coherent(i915, native, 0, scratch.size, PROT_WRITE);
 
 	for (i = 0; i < scratch.height; i++) {
 		local[scratch.pitch * i / sizeof(*local)] = i;
@@ -612,7 +612,7 @@ static void work(int i915, uint64_t ahnd, uint64_t scratch_offset, int dmabuf,
 		obj[BATCH].flags = EXEC_OBJECT_PINNED;
 	}
 
-	batch = gem_mmap__wc(i915, obj[BATCH].handle, 0, size, PROT_WRITE);
+	batch = gem_mmap__device_coherent(i915, obj[BATCH].handle, 0, size, PROT_WRITE);
 	gem_set_domain(i915, obj[BATCH].handle,
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
@@ -1125,7 +1125,7 @@ igt_main
 		i915 = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(i915);
 		igt_require(has_prime_import(i915));
-		gem_require_mmap_wc(i915);
+		gem_require_mmap_device_coherent(i915);
 	}
 
 	igt_subtest("basic-read")
-- 
2.25.1
