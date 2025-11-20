Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424DECFA444
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 19:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E567A10E7CF;
	Thu, 20 Nov 2025 19:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="indeneLL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E0610E7CF
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 19:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763666081; x=1795202081;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HdGth3muthZhYvW+k+iRxhrCH30e/WsdoZzw4HTIt44=;
 b=indeneLLEFkgfWYQFYMJ6+w+sXQ7K5lyboWAfjTIKkIxjiRlYyFkF14/
 LowbN5t7Q9aD6moJEnirE1GbrP33g+ovAk1DRvMHIBZMIzP44vMj/3pw6
 PIlMzbHTLoGx89i/04jZnW0iGdTGGYpnzCnY7yMqtCezMuPQe9Lvw6KVZ
 aMBx0OWCf6T6DAXQq8x2zREpxHwrWYVPqWFK/oeVGb7bWp9p8Ehu7l0Nb
 NONbKi2QXT0T5EJmtDNeb6mhmBMF3aZj4GUIPTcF2RlgZIHniN9d5RfA7
 cWSqnpskxHSNLEM0ZUByZbKC0JX7jDALrfq3okaBaVE/neeX6r4vauQQG g==;
X-CSE-ConnectionGUID: 786mP4lbTCi7Dta5AdzZoQ==
X-CSE-MsgGUID: IhpG1q9lTPCuU/IVQWcY+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65448729"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65448729"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:40 -0800
X-CSE-ConnectionGUID: DO1P813ERV+p4IXNJhOQAg==
X-CSE-MsgGUID: lG3eJmNzTFGrzTwqSN6G+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="195753537"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.92])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:40 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/7] igt: Make igt_simple_main look more like a function
Date: Thu, 20 Nov 2025 21:14:12 +0200
Message-ID: <20251120191415.4236-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Turn igt_simple_main into igt_simple_main(). This is a step towads
allowing coccinelle to parse it.

Conversion done via:
$ find -type f -name \*.[ch] -exec sed -i 's/\([^_]\?\)igt_simple_main\([^_(]\|$\)/\1igt_simple_main()\2/g' {} +

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 benchmarks/kms_fb_stress.c               |  2 +-
 lib/igt_core.c                           | 16 ++++++++--------
 lib/igt_core.h                           |  6 +++---
 lib/igt_kmod.c                           |  2 +-
 lib/tests/igt_can_fail_simple.c          |  2 +-
 lib/tests/igt_edid.c                     |  2 +-
 lib/tests/igt_facts.c                    |  2 +-
 lib/tests/igt_simple_test_subtests.c     |  2 +-
 lib/tests/igt_stats.c                    |  2 +-
 lib/tests/igt_timeout.c                  |  2 +-
 runner/testdata/abort-simple.c           |  2 +-
 runner/testdata/no-subtests.c            |  2 +-
 tests/core_setmaster_vs_auth.c           |  2 +-
 tests/intel/gem_exec_lut_handle.c        |  2 +-
 tests/intel/gem_fd_exhaustion.c          |  2 +-
 tests/intel/gem_gtt_cpu_tlb.c            |  2 +-
 tests/intel/gem_gtt_hog.c                |  2 +-
 tests/intel/gem_lut_handle.c             |  2 +-
 tests/intel/gem_media_vme.c              |  2 +-
 tests/intel/gem_pwrite_snooped.c         |  2 +-
 tests/intel/gem_set_tiling_vs_gtt.c      |  2 +-
 tests/intel/gem_set_tiling_vs_pwrite.c   |  2 +-
 tests/intel/gem_tiled_pread_basic.c      |  2 +-
 tests/intel/gem_tiled_pread_pwrite.c     |  2 +-
 tests/intel/gem_tiled_wb.c               |  2 +-
 tests/intel/gem_tiled_wc.c               |  2 +-
 tests/intel/gem_tiling_max_stride.c      |  2 +-
 tests/intel/gem_unfence_active_buffers.c |  2 +-
 tests/intel/gem_unref_active_buffers.c   |  2 +-
 tests/intel/gen3_mixed_blits.c           |  2 +-
 tests/intel/gen3_render_linear_blits.c   |  2 +-
 tests/intel/gen3_render_mixed_blits.c    |  2 +-
 tests/intel/gen3_render_tiledx_blits.c   |  2 +-
 tests/intel/gen3_render_tiledy_blits.c   |  2 +-
 tests/intel/i915_pciid.c                 |  2 +-
 tests/intel/kms_fence_pin_leak.c         |  2 +-
 tests/intel/kms_pwrite_crc.c             |  2 +-
 tests/kms_dp_aux_dev.c                   |  2 +-
 tests/kms_sysfs_edid_timing.c            |  2 +-
 tests/prime_udl.c                        |  2 +-
 40 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 00eaa0a4931a..dff1467d840a 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -139,7 +139,7 @@ static struct kms_t default_kms = {
 };
 
 
-igt_simple_main
+igt_simple_main()
 {
 	struct data_t data = {0};
 	enum pipe pipe = PIPE_NONE;
diff --git a/lib/igt_core.c b/lib/igt_core.c
index a8cc5fa27e63..3ee670a41a91 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -772,7 +772,7 @@ bool __igt_fixture(void)
 	internal_assert(!in_subtest,
 			"nesting igt_fixture() in igt_subtest is invalid\n");
 	internal_assert(test_with_subtests,
-			"igt_fixture() in igt_simple_main is invalid\n");
+			"igt_fixture() in igt_simple_main() is invalid\n");
 
 	if (igt_only_list_subtests())
 		return false;
@@ -1627,7 +1627,7 @@ bool igt_only_list_subtests(void)
 void __igt_subtest_group_save(int *save, int *desc)
 {
 	internal_assert(test_with_subtests,
-			"igt_subtest_group() is not allowed in igt_simple_main\n");
+			"igt_subtest_group() is not allowed in igt_simple_main()\n");
 
 	if (__current_description[0] != '\0') {
 		struct description_node *new = calloc(1, sizeof(*new));
@@ -1805,7 +1805,7 @@ void igt_skip(const char *f, ...)
 		skip_subtests_henceforth = SKIP;
 		internal_assert(in_fixture,
 			"skipping is allowed only in fixtures, subtests"
-			" or igt_simple_main\n");
+			" or igt_simple_main()\n");
 		__igt_fixture_end();
 	} else {
 		igt_exitcode = IGT_EXIT_SKIP;
@@ -1938,7 +1938,7 @@ void igt_fail(int exitcode)
 		exit_subtest("FAIL");
 	} else {
 		internal_assert(igt_can_fail(), "failing test is only allowed"
-				" in fixtures, subtests and igt_simple_main\n");
+				" in fixtures, subtests and igt_simple_main()\n");
 
 		if (in_fixture) {
 			skip_subtests_henceforth = FAIL;
@@ -1975,7 +1975,7 @@ void igt_fatal_error(void)
  * igt_can_fail:
  *
  * Returns true if called from either an #igt_fixture(), #igt_subtest or a
- * testcase without subtests, i.e. #igt_simple_main. Returns false otherwise. In
+ * testcase without subtests, i.e. #igt_simple_main(). Returns false otherwise. In
  * other words, it checks whether it's legal to call igt_fail(), igt_skip_on()
  * and all the convenience macros build around those.
  *
@@ -2362,7 +2362,7 @@ void __igt_abort(const char *domain, const char *file, const int line,
  *
  * It is an error to normally exit a test calling igt_exit() - without it the
  * result reporting will be wrong. To avoid such issues it is highly recommended
- * to use #igt_main() or #igt_simple_main instead of a hand-rolled main() function.
+ * to use #igt_main() or #igt_simple_main() instead of a hand-rolled main() function.
  */
 void igt_exit(void)
 {
@@ -2598,7 +2598,7 @@ static pthread_mutex_t print_mutex = PTHREAD_MUTEX_INITIALIZER;
 bool __igt_fork(void)
 {
 	internal_assert(!test_with_subtests || in_subtest,
-			"forking is only allowed in subtests or igt_simple_main\n");
+			"forking is only allowed in subtests or igt_simple_main()\n");
 	internal_assert(!test_child,
 			"forking is not allowed from already forked children\n");
 
@@ -2654,7 +2654,7 @@ static void dyn_children_exit_handler(int sig)
 bool __igt_multi_fork(void)
 {
 	internal_assert(!test_with_subtests || in_subtest,
-			"multi-forking is only allowed in subtests or igt_simple_main\n");
+			"multi-forking is only allowed in subtests or igt_simple_main()\n");
 	internal_assert(!test_child,
 			"multi-forking is not allowed from already forked children\n");
 	internal_assert(!test_multi_fork_child,
diff --git a/lib/igt_core.h b/lib/igt_core.h
index ef70983eaa66..8fb25e1d53c5 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -461,7 +461,7 @@ void igt_simple_init_parse_opts(int *argc, char **argv,
  * This initializes a simple test without any support for subtests.
  *
  * If there's not a reason to the contrary it's less error prone to just use an
- * #igt_simple_main block instead of stitching the test's main() function together
+ * #igt_simple_main() block instead of stitching the test's main() function together
  * manually.
  */
 #define igt_simple_init(argc, argv) \
@@ -494,12 +494,12 @@ void igt_simple_init_parse_opts(int *argc, char **argv,
 
 
 /**
- * igt_simple_main:
+ * igt_simple_main():
  *
  * This is a magic control flow block used instead of a main() function for
  * simple tests. Open-coding the main() function is not recommended.
  */
-#define igt_simple_main igt_simple_main_args(NULL, NULL, NULL, NULL, NULL)
+#define igt_simple_main() igt_simple_main_args(NULL, NULL, NULL, NULL, NULL)
 
 /**
  * igt_constructor:
diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 6ef119174994..d1d7a384045b 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1211,7 +1211,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 
 	/*
 	 * We need to use igt_subtest here, as otherwise it may crash with:
-	 * "skipping is allowed only in fixtures, subtests or igt_simple_main"
+	 * "skipping is allowed only in fixtures, subtests or igt_simple_main()"
 	 * if used on igt_main(). This is also needed in order to provide
 	 * proper namespace for dynamic subtests, with is required for CI
 	 * and for documentation.
diff --git a/lib/tests/igt_can_fail_simple.c b/lib/tests/igt_can_fail_simple.c
index 8ff43d15fa6b..0f8d993d3464 100644
--- a/lib/tests/igt_can_fail_simple.c
+++ b/lib/tests/igt_can_fail_simple.c
@@ -26,7 +26,7 @@
 
 #include "igt_tests_common.h"
 
-igt_simple_main
+igt_simple_main()
 {
 	internal_assert(igt_can_fail());
 }
diff --git a/lib/tests/igt_edid.c b/lib/tests/igt_edid.c
index 8474d29e27bc..00feac3564a1 100644
--- a/lib/tests/igt_edid.c
+++ b/lib/tests/igt_edid.c
@@ -66,7 +66,7 @@ static bool edid_block_checksum(const unsigned char *raw_edid)
 
 typedef const struct edid *(*get_edid_func)(void);
 
-igt_simple_main
+igt_simple_main()
 {
 	const struct {
 		const char *desc;
diff --git a/lib/tests/igt_facts.c b/lib/tests/igt_facts.c
index 3cb8d1069a48..3433244c6478 100644
--- a/lib/tests/igt_facts.c
+++ b/lib/tests/igt_facts.c
@@ -10,7 +10,7 @@
 
 /* Tests are not defined here so we can keep most of the functions static */
 
-igt_simple_main
+igt_simple_main()
 {
 	igt_info("Running igt_facts_test\n");
 
diff --git a/lib/tests/igt_simple_test_subtests.c b/lib/tests/igt_simple_test_subtests.c
index abe8e40abefd..e153d3883efb 100644
--- a/lib/tests/igt_simple_test_subtests.c
+++ b/lib/tests/igt_simple_test_subtests.c
@@ -23,7 +23,7 @@
 
 #include "igt_core.h"
 
-igt_simple_main
+igt_simple_main()
 {
 	igt_subtest("subtest") {
 		igt_info("Invalid subtest.\n");
diff --git a/lib/tests/igt_stats.c b/lib/tests/igt_stats.c
index f42fbf86d692..d0c0ac6d3530 100644
--- a/lib/tests/igt_stats.c
+++ b/lib/tests/igt_stats.c
@@ -228,7 +228,7 @@ static void test_reallocation(void)
 	igt_stats_fini(&stats);
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	test_init_zero();
 	test_init();
diff --git a/lib/tests/igt_timeout.c b/lib/tests/igt_timeout.c
index d228041d493b..171bf15b82f6 100644
--- a/lib/tests/igt_timeout.c
+++ b/lib/tests/igt_timeout.c
@@ -1,7 +1,7 @@
 #include "igt_core.h"
 #include <unistd.h>
 
-igt_simple_main
+igt_simple_main()
 {
 	igt_set_timeout(1, "Testcase");
 	sleep(5);
diff --git a/runner/testdata/abort-simple.c b/runner/testdata/abort-simple.c
index 94eef72caa3d..88512ece9388 100644
--- a/runner/testdata/abort-simple.c
+++ b/runner/testdata/abort-simple.c
@@ -23,7 +23,7 @@
 
 #include "igt.h"
 
-igt_simple_main
+igt_simple_main()
 {
 	igt_abort_on_f(true, "I'm out!\n");
 }
diff --git a/runner/testdata/no-subtests.c b/runner/testdata/no-subtests.c
index 00c92e25ff36..ea517b69e1ef 100644
--- a/runner/testdata/no-subtests.c
+++ b/runner/testdata/no-subtests.c
@@ -1,6 +1,6 @@
 #include "igt.h"
 
-igt_simple_main
+igt_simple_main()
 {
 
 }
diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
index b48e51f51343..6867e46aeca5 100644
--- a/tests/core_setmaster_vs_auth.c
+++ b/tests/core_setmaster_vs_auth.c
@@ -57,7 +57,7 @@
 IGT_TEST_DESCRIPTION("Check that drop/setMaster correctly transfer master "
 		     "state");
 
-igt_simple_main
+igt_simple_main()
 {
 	int master1, master2, client;
 	drm_magic_t magic;
diff --git a/tests/intel/gem_exec_lut_handle.c b/tests/intel/gem_exec_lut_handle.c
index 432094bc2383..8abe1ca4f8fc 100644
--- a/tests/intel/gem_exec_lut_handle.c
+++ b/tests/intel/gem_exec_lut_handle.c
@@ -88,7 +88,7 @@ static int has_exec_lut(int fd)
 }
 
 #define ELAPSED(a,b) (1e6*((b)->tv_sec - (a)->tv_sec) + ((b)->tv_usec - (a)->tv_usec))
-igt_simple_main
+igt_simple_main()
 {
 	uint32_t batch[2] = {MI_BATCH_BUFFER_END};
 	uint32_t cycle[16];
diff --git a/tests/intel/gem_fd_exhaustion.c b/tests/intel/gem_fd_exhaustion.c
index 20c4f767c886..1c35614af49b 100644
--- a/tests/intel/gem_fd_exhaustion.c
+++ b/tests/intel/gem_fd_exhaustion.c
@@ -44,7 +44,7 @@
  * SUBTEST:
  */
 
-igt_simple_main
+igt_simple_main()
 {
 	int fd;
 
diff --git a/tests/intel/gem_gtt_cpu_tlb.c b/tests/intel/gem_gtt_cpu_tlb.c
index 4dc2f3ca8a37..1ee0732ad34b 100644
--- a/tests/intel/gem_gtt_cpu_tlb.c
+++ b/tests/intel/gem_gtt_cpu_tlb.c
@@ -82,7 +82,7 @@ create_bo(int fd)
 	return handle;
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	int fd;
 	int i;
diff --git a/tests/intel/gem_gtt_hog.c b/tests/intel/gem_gtt_hog.c
index 641dbecd3b91..b4226ac232c1 100644
--- a/tests/intel/gem_gtt_hog.c
+++ b/tests/intel/gem_gtt_hog.c
@@ -163,7 +163,7 @@ static void run(data_t *data, int child)
 	igt_assert_eq_u32(x, canary);
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	struct timeval start, end;
 	pid_t children[64];
diff --git a/tests/intel/gem_lut_handle.c b/tests/intel/gem_lut_handle.c
index 35f06ebe21f1..183da9620d44 100644
--- a/tests/intel/gem_lut_handle.c
+++ b/tests/intel/gem_lut_handle.c
@@ -173,7 +173,7 @@ static int many_exec(int fd, uint32_t batch, int num_exec, int num_reloc, unsign
 #define fail(x) igt_assert((x) == -ENOENT)
 #define pass(x) igt_assert((x) == 0)
 
-igt_simple_main
+igt_simple_main()
 {
 	uint32_t batch[2] = {MI_BATCH_BUFFER_END};
 	uint32_t handle;
diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
index 8e503fa0dee8..0d3d19eef67a 100644
--- a/tests/intel/gem_media_vme.c
+++ b/tests/intel/gem_media_vme.c
@@ -102,7 +102,7 @@ static void shut_non_vme_subslices(int drm_fd, uint32_t ctx)
 	gem_context_set_param(drm_fd, &arg);
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	struct buf_ops *bops;
 	struct intel_buf src, dst;
diff --git a/tests/intel/gem_pwrite_snooped.c b/tests/intel/gem_pwrite_snooped.c
index 60ccdc7aabe4..fc89310824fe 100644
--- a/tests/intel/gem_pwrite_snooped.c
+++ b/tests/intel/gem_pwrite_snooped.c
@@ -139,7 +139,7 @@ static void test(int w, int h)
 	intel_buf_destroy(dst);
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	fd = drm_open_driver(DRIVER_INTEL);
 	igt_require_gem(fd);
diff --git a/tests/intel/gem_set_tiling_vs_gtt.c b/tests/intel/gem_set_tiling_vs_gtt.c
index bfb9060be4c6..8c29b69b0388 100644
--- a/tests/intel/gem_set_tiling_vs_gtt.c
+++ b/tests/intel/gem_set_tiling_vs_gtt.c
@@ -59,7 +59,7 @@ IGT_TEST_DESCRIPTION("Check set_tiling vs gtt mmap coherency.");
  * Testcase: Check set_tiling vs gtt mmap coherency
  */
 
-igt_simple_main
+igt_simple_main()
 {
 	int fd;
 	uint32_t *ptr;
diff --git a/tests/intel/gem_set_tiling_vs_pwrite.c b/tests/intel/gem_set_tiling_vs_pwrite.c
index 1aa38cc4fa0b..7a6ed8cea8cd 100644
--- a/tests/intel/gem_set_tiling_vs_pwrite.c
+++ b/tests/intel/gem_set_tiling_vs_pwrite.c
@@ -59,7 +59,7 @@ IGT_TEST_DESCRIPTION("Check set_tiling vs pwrite coherency.");
  * Testcase: Check set_tiling vs pwrite coherency
  */
 
-igt_simple_main
+igt_simple_main()
 {
 	uint32_t data[OBJECT_SIZE/4];
 	uint32_t *ptr;
diff --git a/tests/intel/gem_tiled_pread_basic.c b/tests/intel/gem_tiled_pread_basic.c
index 49ce207a623a..e5f9c2a301ce 100644
--- a/tests/intel/gem_tiled_pread_basic.c
+++ b/tests/intel/gem_tiled_pread_basic.c
@@ -127,7 +127,7 @@ calculate_expected(int offset, struct offset *dbg)
 	return (dbg->base_y + dbg->tile_y) * WIDTH + dbg->base_x + dbg->tile_x;
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	int fd;
 	int i, iter = 100;
diff --git a/tests/intel/gem_tiled_pread_pwrite.c b/tests/intel/gem_tiled_pread_pwrite.c
index 3e9855d5a3d0..659e521f2c6c 100644
--- a/tests/intel/gem_tiled_pread_pwrite.c
+++ b/tests/intel/gem_tiled_pread_pwrite.c
@@ -117,7 +117,7 @@ static void copy_wc_page(void *dst, const void *src)
 	igt_memcpy_from_wc(dst, src, PAGE_SIZE);
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	uint32_t tiling, swizzle;
 	int count;
diff --git a/tests/intel/gem_tiled_wb.c b/tests/intel/gem_tiled_wb.c
index 0f8e66af446a..38838b00f782 100644
--- a/tests/intel/gem_tiled_wb.c
+++ b/tests/intel/gem_tiled_wb.c
@@ -146,7 +146,7 @@ get_tiling(int fd, uint32_t handle, uint32_t *tiling, uint32_t *swizzle)
 	*swizzle = arg.swizzle_mode;
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	int fd;
 	int i, iter = 100;
diff --git a/tests/intel/gem_tiled_wc.c b/tests/intel/gem_tiled_wc.c
index 20cc64aadf28..71517b018a6f 100644
--- a/tests/intel/gem_tiled_wc.c
+++ b/tests/intel/gem_tiled_wc.c
@@ -148,7 +148,7 @@ calculate_expected(int offset)
 	return (base_y + tile_y) * WIDTH + base_x + tile_x;
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	uint32_t tiling, swizzle;
 	uint32_t handle;
diff --git a/tests/intel/gem_tiling_max_stride.c b/tests/intel/gem_tiling_max_stride.c
index da3d481eff0f..56081b76478f 100644
--- a/tests/intel/gem_tiling_max_stride.c
+++ b/tests/intel/gem_tiling_max_stride.c
@@ -68,7 +68,7 @@ static void test_invalid_tiling(int fd, uint32_t handle, int stride)
  * Testcase: Check that max fence stride works
  */
 
-igt_simple_main
+igt_simple_main()
 {
 	int fd;
 	uint32_t *ptr;
diff --git a/tests/intel/gem_unfence_active_buffers.c b/tests/intel/gem_unfence_active_buffers.c
index ce0a68de8773..36d2b772d6ba 100644
--- a/tests/intel/gem_unfence_active_buffers.c
+++ b/tests/intel/gem_unfence_active_buffers.c
@@ -76,7 +76,7 @@ static uint32_t create_tiled(int i915)
 	return handle;
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	int i915, num_fences;
 	igt_spin_t *spin;
diff --git a/tests/intel/gem_unref_active_buffers.c b/tests/intel/gem_unref_active_buffers.c
index 21a5a07d919a..cbde235a48e3 100644
--- a/tests/intel/gem_unref_active_buffers.c
+++ b/tests/intel/gem_unref_active_buffers.c
@@ -74,7 +74,7 @@ static void alarm_handler(int sig)
 {
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	struct sigaction old_sa, sa = { .sa_handler = alarm_handler };
 	unsigned int last[2]= { -1, -1 }, count;
diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
index fbc98b68f114..466e95500dd7 100644
--- a/tests/intel/gen3_mixed_blits.c
+++ b/tests/intel/gen3_mixed_blits.c
@@ -455,7 +455,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 }
 
 
-igt_simple_main
+igt_simple_main()
 {
 	uint32_t *handle, *tiling, *start_val;
 	uint32_t start = 0;
diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
index 24e0acc841b7..c5f4cd3d8f3d 100644
--- a/tests/intel/gen3_render_linear_blits.c
+++ b/tests/intel/gen3_render_linear_blits.c
@@ -327,7 +327,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 	}
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	uint32_t *handle, *start_val;
 	uint32_t start = 0;
diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
index 74b085ff9275..b3a06d3879f7 100644
--- a/tests/intel/gen3_render_mixed_blits.c
+++ b/tests/intel/gen3_render_mixed_blits.c
@@ -348,7 +348,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 	munmap(v, WIDTH*HEIGHT*4);
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	uint32_t *handle, *tiling, *start_val;
 	uint32_t start = 0;
diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
index c6f92de8f20f..4b93d9ee638f 100644
--- a/tests/intel/gen3_render_tiledx_blits.c
+++ b/tests/intel/gen3_render_tiledx_blits.c
@@ -335,7 +335,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 	munmap(v, WIDTH*HEIGHT*4);
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	uint32_t *handle, *start_val;
 	uint32_t start = 0;
diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
index 649c89eaec22..b240c384d3ac 100644
--- a/tests/intel/gen3_render_tiledy_blits.c
+++ b/tests/intel/gen3_render_tiledy_blits.c
@@ -335,7 +335,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 	munmap(v, WIDTH*HEIGHT*4);
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	uint32_t *handle, *start_val;
 	uint32_t start = 0;
diff --git a/tests/intel/i915_pciid.c b/tests/intel/i915_pciid.c
index a8c5df9d9c1a..4c21c9603c3d 100644
--- a/tests/intel/i915_pciid.c
+++ b/tests/intel/i915_pciid.c
@@ -71,7 +71,7 @@ static bool has_known_intel_chipset(int fd)
 	return true;
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	int intel = drm_open_driver(DRIVER_INTEL);
 
diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
index 4c1ac2653750..f6f05d20e5be 100644
--- a/tests/intel/kms_fence_pin_leak.c
+++ b/tests/intel/kms_fence_pin_leak.c
@@ -227,7 +227,7 @@ static void run_test(data_t *data)
 	igt_skip("no valid crtc/connector combinations found\n");
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
index 981d7b38e3d5..e35fccb5c1b7 100644
--- a/tests/intel/kms_pwrite_crc.c
+++ b/tests/intel/kms_pwrite_crc.c
@@ -190,7 +190,7 @@ static void run_test(data_t *data)
 
 static data_t data;
 
-igt_simple_main
+igt_simple_main()
 {
 	data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 	kmstest_set_vt_graphics_mode();
diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index e74902111d04..55012ff0ec7b 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -144,7 +144,7 @@ static bool test(int drm_fd, uint32_t connector_id)
 	return false;
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	int valid_connectors = 0;
 	drmModeRes *res;
diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index bb900d709def..2b376015d5af 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -57,7 +57,7 @@ IGT_TEST_DESCRIPTION("This test checks the time it takes to reprobe each "
 		     "make sure that the mean time for all connectors is "
 		     "not too long.");
 
-igt_simple_main
+igt_simple_main()
 {
 	DIR *dirp;
 	struct dirent *de;
diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index 884bf69fea68..a383298ac9dc 100644
--- a/tests/prime_udl.c
+++ b/tests/prime_udl.c
@@ -121,7 +121,7 @@ static void test2(void)
 	gem_close(intel_fd, intel_handle);
 }
 
-igt_simple_main
+igt_simple_main()
 {
 	igt_assert(find_and_open_devices() >= 0);
 
-- 
2.49.1

