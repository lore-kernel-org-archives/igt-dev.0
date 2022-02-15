Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E99A10E5CD
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 14:11:11 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 15 Feb 2022 19:40:53 +0530
Message-Id: <20220215141053.27928-3-anshuman.gupta@intel.com>
In-Reply-To: <20220215141053.27928-1-anshuman.gupta@intel.com>
References: <20220215141053.27928-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] perf/perf_pmu: Nuke unload_i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: chris.p.wilson@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Nuke unload_i915, instead use lib igt_i915_driver_unload()
and __igt_i915_driver_unload().

Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/perf_pmu.c | 31 +++----------------------------
 1 file changed, 3 insertions(+), 28 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 1665dc5e6..4f3cb6145 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -2039,31 +2039,6 @@ static void faulting_read(int gem_fd, const struct mmap_offset *t)
 	munmap(ptr, 4096);
 }
 
-static int unload_i915(void)
-{
-	bind_fbcon(false);
-
-	if (igt_kmod_is_loaded("snd_hda_intel")) {
-		igt_terminate_process(SIGTERM, "alsactl");
-		kick_snd_hda_intel();
-		if (igt_kmod_unload("snd_hda_intel", 0))
-			return -EAGAIN;
-	}
-
-	if (igt_kmod_is_loaded("snd_hdmi_lpe_audio")) {
-		igt_terminate_process(SIGTERM, "alsactl");
-		if (igt_kmod_unload("snd_hdmi_lpe_audio", 0))
-			return -EAGAIN;
-	}
-
-	if (igt_kmod_is_loaded("i915")) {
-		if (igt_kmod_unload("i915", 0))
-			return -EBUSY;
-	}
-
-	return 0;
-}
-
 static void test_unload(unsigned int num_engines)
 {
 	igt_fork(child, 1) {
@@ -2126,7 +2101,7 @@ static void test_unload(unsigned int num_engines)
 
 		igt_debug("Read %d events from perf and trial unload\n", count);
 		pmu_read_multi(fd[0], count, buf);
-		igt_assert_eq(unload_i915(), -EBUSY);
+		igt_assert_eq(__igt_i915_driver_unload(NULL), IGT_EXIT_SKIP);
 		pmu_read_multi(fd[0], count, buf);
 
 		igt_debug("Close perf\n");
@@ -2139,7 +2114,7 @@ static void test_unload(unsigned int num_engines)
 	igt_waitchildren();
 
 	igt_debug("Final unload\n");
-	igt_assert_eq(unload_i915(), 0);
+	igt_assert_eq(__igt_i915_driver_unload(NULL), IGT_EXIT_SUCCESS);
 }
 
 #define test_each_engine(T, i915, ctx, e) \
@@ -2419,7 +2394,7 @@ igt_main
 	}
 
 	igt_subtest("module-unload") {
-		igt_require(unload_i915() == 0);
+		igt_require(igt_i915_driver_unload() == IGT_EXIT_SUCCESS);
 		for (int pass = 0; pass < 3; pass++)
 			test_unload(num_engines);
 	}
-- 
2.26.2
