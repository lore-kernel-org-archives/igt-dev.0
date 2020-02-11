Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 11 Feb 2020 15:30:48 +0100
Message-Id: <20200211143048.12260-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t v2] tests/gem_userptr_blits: Enhance
 invalid mapping exercise
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Working with a userptr GEM object backed by any type of mapping to
another GEM object, not only GTT mapping currently examined bu the
test, may cause a currently unavoidable lockdep splat inside the i915
driver.  Then, for as long as that issue is not resolved in the driver,
such operations are expected to fail in advance to prevent from that
badness to happen.

Extend the scope of the test by adding subtests which exercise other,
non-GTT mapping types.  Moreover, don't fail but skip should the driver
refuse to create a userptr object on top of the invalid mapping.  If it
succeeds however, warn about possible lockdep loop risk.

v2: For as long as the lockdep loop issue is not fixed, don't succeed
    if a preventive failure occurs but skip (Chris),
  - otherwise, warn about possible risk,
  - put a FIXME placeholder until we learn how to anger lockdep.

Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/i915/gem_userptr_blits.c | 66 ++++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index a8d3783fb..93bac9766 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -60,6 +60,7 @@
 
 #include "drm.h"
 #include "i915_drm.h"
+#include "i915/gem_mman.h"
 
 #include "intel_bufmgr.h"
 
@@ -577,11 +578,11 @@ static int test_invalid_null_pointer(int fd)
 	return 0;
 }
 
-static int test_invalid_gtt_mapping(int fd)
+static int test_invalid_mapping(int fd, uint64_t flags)
 {
-	struct drm_i915_gem_mmap_gtt arg;
+	struct drm_i915_gem_mmap_offset arg;
 	uint32_t handle;
-	char *gtt, *map;
+	char *ptr, *map;
 
 	/* Anonymous mapping to find a hole */
 	map = mmap(NULL, sizeof(linear) + 2 * PAGE_SIZE,
@@ -602,37 +603,43 @@ static int test_invalid_gtt_mapping(int fd)
 	igt_assert_eq(copy(fd, handle, handle), 0);
 	gem_close(fd, handle);
 
-	/* GTT mapping */
+	/* mmap-offset mapping */
 	memset(&arg, 0, sizeof(arg));
 	arg.handle = create_bo(fd, 0);
-	do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &arg);
-	gtt = mmap(map + PAGE_SIZE, sizeof(linear),
-		   PROT_READ | PROT_WRITE,
-		   MAP_SHARED | MAP_FIXED,
-		   fd, arg.offset);
-	igt_assert(gtt == map + PAGE_SIZE);
+	arg.flags = flags;
+	do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFSET, &arg);
+	ptr = mmap(map + PAGE_SIZE, sizeof(linear), PROT_READ | PROT_WRITE,
+		   MAP_SHARED | MAP_FIXED, fd, arg.offset);
+	igt_assert(ptr == map + PAGE_SIZE);
 	gem_close(fd, arg.handle);
-	igt_assert(((unsigned long)gtt & (PAGE_SIZE - 1)) == 0);
+	igt_assert(((unsigned long)ptr & (PAGE_SIZE - 1)) == 0);
 	igt_assert((sizeof(linear) & (PAGE_SIZE - 1)) == 0);
 
-	gem_userptr(fd, gtt, sizeof(linear), 0, userptr_flags, &handle);
+	/* FIXME: revisit as soon as lockdep loop issue is resolved */
+	igt_require_f(!__gem_userptr(fd, ptr, sizeof(linear), 0, userptr_flags,
+				     &handle),
+		      "lockdep loop preventive failure possibly occurred");
+	igt_warn("userptr(mmap_offset) succeeded, risk of lockdep loop exists");
+	/* FIXME: we should try harder to anger lockdep */
 	igt_assert_eq(copy(fd, handle, handle), -EFAULT);
 	gem_close(fd, handle);
 
-	gem_userptr(fd, gtt, PAGE_SIZE, 0, userptr_flags, &handle);
+	gem_userptr(fd, ptr, PAGE_SIZE, 0, userptr_flags, &handle);
 	igt_assert_eq(copy(fd, handle, handle), -EFAULT);
 	gem_close(fd, handle);
 
-	gem_userptr(fd, gtt + sizeof(linear) - PAGE_SIZE, PAGE_SIZE, 0, userptr_flags, &handle);
+	gem_userptr(fd, ptr + sizeof(linear) - PAGE_SIZE, PAGE_SIZE, 0,
+		    userptr_flags, &handle);
 	igt_assert_eq(copy(fd, handle, handle), -EFAULT);
 	gem_close(fd, handle);
 
 	/* boundaries */
-	gem_userptr(fd, map, 2*PAGE_SIZE, 0, userptr_flags, &handle);
+	gem_userptr(fd, map, 2 * PAGE_SIZE, 0, userptr_flags, &handle);
 	igt_assert_eq(copy(fd, handle, handle), -EFAULT);
 	gem_close(fd, handle);
 
-	gem_userptr(fd, map + sizeof(linear), 2*PAGE_SIZE, 0, userptr_flags, &handle);
+	gem_userptr(fd, map + sizeof(linear), 2 * PAGE_SIZE, 0, userptr_flags,
+		    &handle);
 	igt_assert_eq(copy(fd, handle, handle), -EFAULT);
 	gem_close(fd, handle);
 
@@ -2009,8 +2016,31 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_subtest("invalid-null-pointer")
 			test_invalid_null_pointer(fd);
 
-		igt_subtest("invalid-gtt-mapping")
-			test_invalid_gtt_mapping(fd);
+		igt_describe("Verify userptr on top of GTT mapping to GEM object will fail");
+		igt_subtest("invalid-gtt-mapping") {
+			gem_require_mappable_ggtt(fd);
+			test_invalid_mapping(fd, I915_MMAP_OFFSET_GTT);
+		}
+		igt_subtest_group {
+			igt_fixture
+				igt_require(gem_has_mmap_offset(fd));
+
+			igt_describe("Verify userptr on top of CPU mapping to GEM object will fail");
+			igt_subtest("invalid-wb-mapping")
+				test_invalid_mapping(fd, I915_MMAP_OFFSET_WB);
+
+			igt_subtest_group {
+				igt_fixture
+					igt_require(gem_mmap_offset__has_wc(fd));
+
+				igt_describe("Verify userptr on top of coherent mapping to GEM object will fail");
+				igt_subtest("invalid-wc-mapping")
+					test_invalid_mapping(fd, I915_MMAP_OFFSET_WC);
+				igt_describe("Verify userptr on top of uncached mapping to GEM object will fail");
+				igt_subtest("invalid-uc-mapping")
+					test_invalid_mapping(fd, I915_MMAP_OFFSET_UC);
+			}
+		}
 
 		igt_subtest("forked-access")
 			test_forked_access(fd);
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
