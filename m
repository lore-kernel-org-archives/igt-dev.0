Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Wed,  4 Mar 2020 10:58:41 +0100
Message-Id: <20200304095841.8781-4-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200304095841.8781-1-janusz.krzysztofik@linux.intel.com>
References: <20200304095841.8781-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 3/3] tests/gem_userptr_blits: Add active
 variant of mmap-offset-invalidate
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

Add a variant that also attaches a igt_spin_t to the userptr, waits for
it to start executing, call igt_spin_set_timeout and then do the munmap.

Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/i915/gem_userptr_blits.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 95e90c40a..68fc6aee4 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -797,10 +797,13 @@ static int test_map_fixed_invalidate(int fd, uint32_t flags)
 	return 0;
 }
 
-static void test_mmap_offset_invalidate(int fd, const struct mmap_offset *t)
+static void test_mmap_offset_invalidate(int fd, const struct mmap_offset *t,
+					int flags)
+#define MMOI_ACTIVE	0x1
 {
 	void *ptr, *map;
 	uint32_t handle;
+	igt_spin_t *spin;
 
 	/* check if mmap_offset type is supported by hardware, skip if not */
 	handle = gem_create(fd, PAGE_SIZE);
@@ -823,13 +826,26 @@ static void test_mmap_offset_invalidate(int fd, const struct mmap_offset *t)
 		      t->name);
 	igt_assert(map);
 
-	/* set object pages in order to activate MMU notifier for it */
-	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+	/* activate MMU notifier for the object */
+	if (flags & MMOI_ACTIVE) {
+		/* attach a time limited dummy load to the object */
+		spin = igt_spin_new(fd, .dependency = handle);
+		usleep(USEC_PER_SEC/MSEC_PER_SEC);
+		igt_spin_set_timeout(spin, NSEC_PER_SEC);
+	} else {
+		/* just set object pages */
+		gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT,
+					   I915_GEM_DOMAIN_GTT);
+	}
 
 	/* trigger the notifier */
+	igt_set_timeout(3, "deadlock");
 	munmap(ptr, PAGE_SIZE);
+	igt_reset_timeout();
 
 	/* cleanup */
+	if (flags & MMOI_ACTIVE)
+		igt_spin_free(fd, spin);
 	munmap(map, PAGE_SIZE);
 	gem_close(fd, handle);
 }
@@ -2207,11 +2223,18 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 			}
 		}
 
-		igt_describe("Invalidate pages of userptr with mmap-offset on top");
+		igt_describe("Invalidate pages of idle userptr with mmap-offset on top");
 		igt_subtest_with_dynamic("mmap-offset-invalidate")
 			for_each_mmap_offset_type(fd, t)
 				igt_dynamic_f("%s", t->name)
-					test_mmap_offset_invalidate(fd, t);
+					test_mmap_offset_invalidate(fd, t, 0);
+
+		igt_describe("Invalidate pages of active userptr with mmap-offset on top");
+		igt_subtest_with_dynamic("mmap-offset-invalidate-active")
+			for_each_mmap_offset_type(fd, t)
+				igt_dynamic_f("%s", t->name)
+					test_mmap_offset_invalidate(fd, t,
+								   MMOI_ACTIVE);
 
 		igt_subtest("coherency-sync")
 			test_coherency(fd, count);
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
