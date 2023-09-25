Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Mon, 25 Sep 2023 14:15:39 +0100
Message-Id: <20230925131539.32743-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC/CI] prime_vgem: Add mmap forwarding tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

...

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/prime_vgem.c | 45 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 876e04ed02a1..29eb7eccad61 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -72,6 +72,21 @@
  * Feature: gtt, prime
  * Run type: BAT
  *
+ * SUBTEST: forwarded-wc
+ * Description: Examine access path through imported buffer mmap forwarding
+ * Feature: mmap, prime
+ * Run type: FULL
+ *
+ * SUBTEST: forwarded-uc
+ * Description: Examine access path through imported buffer mmap forwarding
+ * Feature: mmap, prime
+ * Run type: FULL
+ *
+ * SUBTEST: forwarded-wb
+ * Description: Examine access path through imported buffer mmap forwarding
+ * Feature: mmap, prime
+ * Run type: FULL
+ *
  * SUBTEST: basic-read
  * Description: Examine read access path.
  * Feature: gtt, prime
@@ -420,7 +435,7 @@ static void test_write(int vgem, int i915)
 	munmap(ptr, scratch.size);
 }
 
-static void test_gtt(int vgem, int i915)
+static void test_mmap_offset(int vgem, int i915, unsigned int flags)
 {
 	struct vgem_bo scratch;
 	uint32_t handle;
@@ -436,7 +451,16 @@ static void test_gtt(int vgem, int i915)
 	handle = prime_fd_to_handle(i915, dmabuf);
 	close(dmabuf);
 
-	ptr = gem_mmap__gtt(i915, handle, scratch.size, PROT_WRITE);
+	ptr = __gem_mmap_offset(i915, handle, 0, scratch.size, PROT_WRITE,
+				flags);
+	if (flags == I915_MMAP_OFFSET_GTT) {
+		/* Only allowed to fail if no aperture. */
+		igt_require(ptr || !gem_mappable_aperture_size(i915));
+
+	} else {
+		/* Skip on old kernels. */
+		igt_require(ptr);
+	}
 	for (i = 0; i < 1024; i++)
 		ptr[1024*i] = i;
 	munmap(ptr, scratch.size);
@@ -448,7 +472,8 @@ static void test_gtt(int vgem, int i915)
 	}
 	munmap(ptr, scratch.size);
 
-	ptr = gem_mmap__gtt(i915, handle, scratch.size, PROT_READ);
+	ptr = __gem_mmap_offset(i915, handle, 0, scratch.size, PROT_READ,
+				flags);
 	for (i = 0; i < 1024; i++)
 		igt_assert_eq(ptr[1024*i], ~i);
 	munmap(ptr, scratch.size);
@@ -1225,9 +1250,21 @@ igt_main
 	igt_describe("Examine access path through GTT.");
 	igt_subtest("basic-gtt") {
 		gem_require_mappable_ggtt(i915);
-		test_gtt(vgem, i915);
+		test_mmap_offset(vgem, i915, I915_MMAP_OFFSET_GTT);
 	}
 
+	igt_describe("Examine access path through mmap forwarding.");
+	igt_subtest("forwarded-wc")
+		test_mmap_offset(vgem, i915, I915_MMAP_OFFSET_WC);
+
+	igt_describe("Examine access path through mmap forwarding.");
+	igt_subtest("forwarded-uc")
+		test_mmap_offset(vgem, i915, I915_MMAP_OFFSET_UC);
+
+	igt_describe("Examine access path through mmap forwarding.");
+	igt_subtest("forwarded-wb")
+		test_mmap_offset(vgem, i915, I915_MMAP_OFFSET_WB);
+
 	igt_describe("Examine blitter access path.");
 	igt_subtest("basic-blt")
 		test_blt(vgem, i915);
-- 
2.39.2
