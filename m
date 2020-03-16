Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 16 Mar 2020 09:45:42 +0100
Message-Id: <20200316084543.15421-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200316084543.15421-1-janusz.krzysztofik@linux.intel.com>
References: <20200316084543.15421-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RESUBMIT PATCH 1/2] tests/gem_userptr_blits: Refresh
 readonly-mmap-unsync exercise
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

Upgrade the subtest to use MMAP_GTT API v4 (aka MMAP_OFFSET),
dynamically examine each mapping type supported by i915 driver.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/i915/gem_userptr_blits.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index beced298a..975cd9dab 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -1277,7 +1277,7 @@ static void sigjmp_handler(int sig)
 	siglongjmp(sigjmp, sig);
 }
 
-static void test_readonly_mmap(int i915)
+static void test_readonly_mmap(int i915, const struct mmap_offset *t)
 {
 	char *original, *result;
 	uint32_t handle;
@@ -1294,6 +1294,14 @@ static void test_readonly_mmap(int i915)
 	 * on the GPU as well.
 	 */
 
+	handle = gem_create(i915, PAGE_SIZE);
+	ptr = __gem_mmap_offset(i915, handle, 0, PAGE_SIZE,
+				PROT_READ | PROT_WRITE, t->type);
+	gem_close(i915, handle);
+	igt_require_f(ptr, "HW & kernel support for mmap-offset(%s)\n",
+		      t->name);
+	munmap(ptr, PAGE_SIZE);
+
 	igt_require(igt_setup_clflush());
 
 	sz = 16 << 12;
@@ -1307,11 +1315,11 @@ static void test_readonly_mmap(int i915)
 	igt_clflush_range(pages, sz);
 	original = g_compute_checksum_for_data(G_CHECKSUM_SHA1, pages, sz);
 
-	ptr = __gem_mmap__gtt(i915, handle, sz, PROT_WRITE);
+	ptr = __gem_mmap_offset(i915, handle, 0, sz, PROT_WRITE, t->type);
 	igt_assert(ptr == NULL);
 
 	/* Optional kernel support for GTT mmaps of userptr */
-	ptr = __gem_mmap__gtt(i915, handle, sz, PROT_READ);
+	ptr = __gem_mmap_offset(i915, handle, 0, sz, PROT_READ, t->type);
 	gem_close(i915, handle);
 
 	if (ptr) { /* Check that a write into the GTT readonly map fails */
@@ -2110,8 +2118,11 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_subtest("readonly-unsync")
 			test_readonly(fd);
 
-		igt_subtest("readonly-mmap-unsync")
-			test_readonly_mmap(fd);
+		igt_describe("Examine mmap-offset mapping to read-only userptr");
+		igt_subtest_with_dynamic("readonly-mmap-unsync")
+			for_each_mmap_offset_type(fd, t)
+				igt_dynamic(t->name)
+					test_readonly_mmap(fd, t);
 
 		igt_subtest("readonly-pwrite-unsync")
 			test_readonly_pwrite(fd);
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
