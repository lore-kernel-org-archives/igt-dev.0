Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 31 Jan 2020 14:12:34 +0100
Message-Id: <20200131131234.23058-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200131131234.23058-1-janusz.krzysztofik@linux.intel.com>
References: <20200131131234.23058-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 1/1] tests/gem_mmap_offset: Exercise
 mapping to userptr
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Creating a mapping to a userptr backed GEM object may cause a currently
unavoidable lockdep splat inside the i915 driver.  Then, such operation
is expected to fail to prevent from that badness to happen.

Add a respective subtest for each mapping type.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_mmap_offset.c | 55 ++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 7c4088cdf..a5f28328b 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -141,6 +141,36 @@ static void bad_extensions(int i915)
 	gem_close(i915, arg.handle);
 }
 
+static bool has_userptr(int i915)
+{
+	uint32_t handle = 0;
+	void *ptr;
+
+	igt_assert_eq(posix_memalign(&ptr, 4096, 4096), 0);
+	if (__gem_userptr(i915, ptr, 4096, 0, 0, &handle) == 0)
+		gem_close(i915, handle);
+	free(ptr);
+
+	return handle;
+}
+
+static void userptr(int i915, uint64_t flags)
+{
+	struct drm_i915_gem_mmap_offset arg = {
+		.flags = flags,
+	};
+	void *ptr;
+
+	igt_assert_eq(posix_memalign(&ptr, 4096, 4096), 0);
+
+	gem_userptr(i915, ptr, 4096, 0, 0, &arg.handle);
+
+	igt_assert_eq(mmap_offset_ioctl(i915, &arg), -EINVAL);
+
+	gem_close(i915, arg.handle);
+	free(ptr);
+}
+
 static void basic_uaf(int i915)
 {
 	const uint32_t obj_size = 4096;
@@ -461,6 +491,31 @@ igt_main
 	igt_subtest_f("bad-extensions")
 		bad_extensions(i915);
 
+	igt_subtest_group {
+		igt_fixture
+			igt_require(has_userptr(i915));
+
+		for_each_mmap_offset_type(t) {
+			igt_describe_f("Verify %s mapping to userptr backed GEM object will fail",
+				       t->name);
+			igt_subtest_f("userptr-%s-mapping", t->name) {
+				switch (t->type) {
+				case I915_MMAP_OFFSET_GTT:
+					gem_require_mappable_ggtt(i915);
+					break;
+				case I915_MMAP_OFFSET_WC:
+				case I915_MMAP_OFFSET_UC:
+					igt_require(gem_mmap_offset__has_wc(i915));
+					break;
+				defalut:
+					break;
+				}
+
+				userptr(i915, t->type);
+			}
+		}
+	}
+
 	igt_describe("Check buffer object mapping persists after gem_close");
 	igt_subtest_f("basic-uaf")
 		basic_uaf(i915);
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
