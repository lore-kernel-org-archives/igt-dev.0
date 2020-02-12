Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Wed, 12 Feb 2020 13:43:17 +0100
Message-Id: <20200212124317.23017-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3] tests/gem_userptr_blits: Enhance invalid
 mapping exercise
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
v3: Use dynamic subtests, with skips handled at mmap-offset attempt
    performed by the test anyway (Chris),
  - for better clarity of the patch, drop cosmetic only changes,
  - use more concise wording in subtest description.

Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/i915/gem_userptr_blits.c | 43 +++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index a8d3783fb..74d441a60 100644
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
+static int test_invalid_mapping(int fd, const struct mmap_offset *t)
 {
-	struct drm_i915_gem_mmap_gtt arg;
+	struct drm_i915_gem_mmap_offset arg;
 	uint32_t handle;
-	char *gtt, *map;
+	char *ptr, *map;
 
 	/* Anonymous mapping to find a hole */
 	map = mmap(NULL, sizeof(linear) + 2 * PAGE_SIZE,
@@ -602,28 +603,35 @@ static int test_invalid_gtt_mapping(int fd)
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
+	arg.flags = t->type;
+	igt_skip_on_f(igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFSET, &arg),
+		      "HW & kernel support for mmap_offset(%s)\n", t->name);
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
+		      "lockdep loop preventive failure possibly occurred\n");
+	igt_warn("userptr(mmap_offset(%s)) succeeded, risk of lockdep loop exists\n",
+		 t->name);
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
 
@@ -2009,8 +2017,11 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_subtest("invalid-null-pointer")
 			test_invalid_null_pointer(fd);
 
-		igt_subtest("invalid-gtt-mapping")
-			test_invalid_gtt_mapping(fd);
+		igt_describe("Verify userptr on mmap-offset mappings fails");
+		igt_subtest_with_dynamic("invalid-mmap-offset")
+			for_each_mmap_offset_type(t)
+				igt_dynamic_f("%s", t->name)
+					test_invalid_mapping(fd, t);
 
 		igt_subtest("forked-access")
 			test_forked_access(fd);
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
