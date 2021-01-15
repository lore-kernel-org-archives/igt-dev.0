Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 15 Jan 2021 17:42:56 +0000
Message-Id: <20210115174256.1244801-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/gem_userptr_blits: Check set-domain
 on userptr for validation
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

We use set-domain on userptr to validate that get-user-pages is
applicable to the address range. Let's perform a very basic test to
exercise this combination.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_userptr_blits.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 8765123e0..1add307a2 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -2185,6 +2185,29 @@ static void test_invalidate_close_race(int fd, bool overlap, int timeout)
 	free(t_data.ptr);
 }
 
+static void test_sd_probe(int i915)
+{
+	uint32_t handle;
+	void *page;
+
+	page = mmap(NULL, 4096, PROT_READ | PROT_WRITE,
+		   MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+
+	gem_userptr(i915, page, 4096, 0, 0, &handle);
+	igt_assert_eq(__gem_set_domain(i915, handle,
+				       I915_GEM_DOMAIN_GTT, 0),
+		      0);
+	gem_close(i915, handle);
+
+	munmap(page, 4096);
+
+	gem_userptr(i915, page, 4096, 0, 0, &handle);
+	igt_assert_eq(__gem_set_domain(i915, handle,
+				       I915_GEM_DOMAIN_GTT, 0),
+		      -EFAULT);
+	gem_close(i915, handle);
+}
+
 struct ufd_thread {
 	uint32_t *page;
 	int i915;
@@ -2379,6 +2402,9 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_subtest("forbidden-operations")
 			test_forbidden_ops(fd);
 
+		igt_subtest("sd-probe")
+			test_sd_probe(fd);
+
 		igt_subtest("userfault")
 			test_userfault(fd);
 
-- 
2.30.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
