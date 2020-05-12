Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 12 May 2020 17:20:44 +0100
Message-Id: <20200512162046.674703-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] i915/pm_rpm: Drop obsolete "gem_idle"
 subtest
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

An obscure and very dated subtest, it's even covered by the other
subtests -- if the kernel still worked in any fashion assumed by the
test.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/i915_pm_rpm.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 47e74856e..22151aa73 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1393,16 +1393,6 @@ static void gem_execbuf_stress_subtest(int rounds, int wait_flags)
 	gem_close(drm_fd, handle);
 }
 
-/* When this test was written, it triggered WARNs and DRM_ERRORs on dmesg. */
-static void gem_idle_subtest(void)
-{
-	disable_all_screens_and_wait(&ms_data);
-
-	sleep(5);
-
-	gem_test_engine(drm_fd, -1);
-}
-
 static void gem_evict_pwrite_subtest(void)
 {
 	struct {
@@ -2047,8 +2037,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		gem_pread_subtest();
 	igt_subtest("gem-execbuf")
 		gem_execbuf_subtest();
-	igt_subtest("gem-idle")
-		gem_idle_subtest();
 	igt_subtest("gem-evict-pwrite") {
 		gem_require_mappable_ggtt(drm_fd);
 		gem_evict_pwrite_subtest();
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
