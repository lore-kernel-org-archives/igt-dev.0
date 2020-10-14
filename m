Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 14 Oct 2020 11:40:29 +0100
Message-Id: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 01/10] i915/gem_userptr_blits: Tighten
 has_userptr()
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

We use has_userptr() to determine if the different flags are supported,
so it helps not to override the flags inside the test.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_userptr_blits.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 268423dcd..01498edad 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -71,8 +71,7 @@
 #define PAGE_SIZE 4096
 #endif
 
-static uint32_t userptr_flags = I915_USERPTR_UNSYNCHRONIZED;
-
+static uint32_t userptr_flags;
 static bool *can_mmap;
 
 #define WIDTH 512
@@ -504,14 +503,11 @@ static int has_userptr(int fd)
 {
 	uint32_t handle = 0;
 	void *ptr;
-	uint32_t oldflags;
 	int ret;
 
 	igt_assert(posix_memalign(&ptr, PAGE_SIZE, PAGE_SIZE) == 0);
-	oldflags = userptr_flags;
-	gem_userptr_test_unsynchronized();
 	ret = __gem_userptr(fd, ptr, PAGE_SIZE, 0, userptr_flags, &handle);
-	userptr_flags = oldflags;
+	errno = 0;
 	if (ret != 0) {
 		free(ptr);
 		return 0;
@@ -2112,6 +2108,10 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 
 	igt_subtest_group {
 		igt_fixture {
+			/* Either mode will do for parameter checking */
+			gem_userptr_test_synchronized();
+			if (!has_userptr(fd))
+				gem_userptr_test_unsynchronized();
 			igt_require(has_userptr(fd));
 		}
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
