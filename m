Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBBF72009
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Jan 2020 00:02:01 +0000 (UTC)
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date: Fri, 24 Jan 2020 16:01:35 -0800
Message-Id: <20200125000135.7315-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v2 PATCH-i-g-t] tests/i915/gem_mmap_wc: Skip gtt test if
 aperture is missing
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
List-ID: <igt-dev@lists.freedesktop.org>

Skip subtest on platforms that do not have mappable aperture.

v2: Skip the test_write_gtt as well when there is no aperture.
It seems like the purpose of this test was to mmap the buffer in
gtt even though it uses the incorrect mapping call. Until this
can be fixed, might be better to skip it. Also remove all subtests
that use run_without_prefault, since this debugfs is being removed.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_mmap_wc.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
index 375a9b50..c836aa20 100644
--- a/tests/i915/gem_mmap_wc.c
+++ b/tests/i915/gem_mmap_wc.c
@@ -461,15 +461,6 @@ test_pf_nonblock(int i915)
 	igt_spin_free(i915, spin);
 }
 
-static void
-run_without_prefault(int fd,
-			void (*func)(int fd))
-{
-	igt_disable_prefault();
-	func(fd);
-	igt_enable_prefault();
-}
-
 static int mmap_ioctl(int i915, struct drm_i915_gem_mmap *arg)
 {
 	int err = 0;
@@ -577,8 +568,10 @@ igt_main
 		test_write(fd);
 	igt_subtest("coherency")
 		test_coherency(fd);
-	igt_subtest("write-gtt")
+	igt_subtest("write-gtt") {
+		gem_require_mappable_ggtt(fd);
 		test_write_gtt(fd);
+	}
 	igt_subtest("read-write")
 		test_read_write(fd, READ_BEFORE_WRITE);
 	igt_subtest("write-read")
@@ -589,18 +582,14 @@ igt_main
 		test_read_write2(fd, READ_AFTER_WRITE);
 	igt_subtest("fault-concurrent")
 		test_fault_concurrent(fd);
-	igt_subtest("read-no-prefault")
-		run_without_prefault(fd, test_read);
-	igt_subtest("write-no-prefault")
-		run_without_prefault(fd, test_write);
-	igt_subtest("write-gtt-no-prefault")
-		run_without_prefault(fd, test_write_gtt);
 	igt_subtest("write-cpu-read-wc")
 		test_write_cpu_read_wc(fd, 1);
 	igt_subtest("write-cpu-read-wc-unflushed")
 		test_write_cpu_read_wc(fd, 0);
-	igt_subtest("write-gtt-read-wc")
+	igt_subtest("write-gtt-read-wc") {
+		gem_require_mappable_ggtt(fd);
 		test_write_gtt_read_wc(fd);
+	}
 	igt_subtest("pf-nonblock")
 		test_pf_nonblock(fd);
 	igt_subtest("set-cache-level")
-- 
2.22.0.245.g4d8ec15c66

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
