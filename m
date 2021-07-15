Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Thu, 15 Jul 2021 11:09:32 +0100
Message-Id: <20210715100932.2605648-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] igt/gem_userptr: Exercise new PROBE flag
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Exercise new API to probe that the userptr range is valid (backed by
struct pages and not pfn).

v2: remove POPULATE for now

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 tests/i915/gem_userptr_blits.c | 86 ++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 0616a937..532298dc 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -2127,6 +2127,87 @@ static int userfaultfd(int flags)
 	return syscall(SYS_userfaultfd, flags);
 }
 
+#define LOCAL_I915_PARAM_HAS_USERPTR_PROBE 56
+#define LOCAL_I915_USERPTR_PROBE 0x2
+
+static bool has_userptr_probe(int fd)
+{
+	struct drm_i915_getparam gp;
+	int value = 0;
+
+	memset(&gp, 0, sizeof(gp));
+	gp.param = LOCAL_I915_PARAM_HAS_USERPTR_PROBE;
+	gp.value = &value;
+
+	ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp, sizeof(gp));
+	errno = 0;
+
+	return value;
+}
+
+static void test_probe(int fd)
+{
+#define N_PAGES 5
+	struct drm_i915_gem_mmap_offset mmap_offset;
+	uint32_t handle;
+
+	/*
+	 * We allocate 5 pages, and apply various combinations of unmap,
+	 * remap-mmap-offset to the pages. Then we try to create a userptr from
+	 * the middle 3 pages and check if unexpectedly succeeds or fails.
+	 */
+	memset(&mmap_offset, 0, sizeof(mmap_offset));
+	mmap_offset.handle = gem_create(fd, PAGE_SIZE);
+	mmap_offset.flags = I915_MMAP_OFFSET_WB;
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFSET, &mmap_offset), 0);
+
+	for (unsigned long pass = 0; pass < 4 * 4 * 4 * 4 * 4; pass++) {
+		int expected = 0;
+		void *ptr;
+
+		ptr = mmap(NULL, N_PAGES * PAGE_SIZE,
+			   PROT_READ | PROT_WRITE,
+			   MAP_SHARED | MAP_ANONYMOUS,
+			   -1, 0);
+
+		for (int page = 0; page < N_PAGES; page++) {
+			int mode = (pass >> (2 * page)) & 3;
+			void *fixed = ptr + page * PAGE_SIZE;
+
+			switch (mode) {
+			default:
+			case 0:
+				break;
+
+			case 1:
+				munmap(fixed, PAGE_SIZE);
+				if (page >= 1 && page <= 3)
+					expected = -EFAULT;
+				break;
+
+			case 2:
+				fixed = mmap(fixed, PAGE_SIZE,
+					     PROT_READ | PROT_WRITE,
+					     MAP_SHARED | MAP_FIXED,
+					     fd, mmap_offset.offset);
+				igt_assert(fixed != MAP_FAILED);
+				if (page >= 1 && page <= 3)
+					expected = -EFAULT;
+				break;
+			}
+		}
+
+		igt_assert_eq(__gem_userptr(fd, ptr + PAGE_SIZE, 3*PAGE_SIZE,
+					    0, LOCAL_I915_USERPTR_PROBE, &handle),
+			      expected);
+
+		munmap(ptr, N_PAGES * PAGE_SIZE);
+	}
+
+	gem_close(fd, mmap_offset.handle);
+#undef N_PAGES
+}
+
 static void test_userfault(int i915)
 {
 	struct uffdio_api api = { .api = UFFD_API };
@@ -2516,4 +2597,9 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 
 	igt_subtest("access-control")
 		test_access_control(fd);
+
+	igt_subtest("probe") {
+		igt_require(has_userptr_probe(fd));
+		test_probe(fd);
+	}
 }
-- 
2.26.3

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
