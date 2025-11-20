Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC5DCF9C7A
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 19:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E070C10E7D1;
	Thu, 20 Nov 2025 19:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJqqghan";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D2910E7CC
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 19:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763666071; x=1795202071;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Xd+F2oozEBeml5k77jaIA/w+2j4fX/dN8LCZDg0cUJQ=;
 b=KJqqghan9/Lc+RZL24DSAvrB65Bd1EABkNGuyjiPmDbX4OQQ2zInEDPb
 NjnA6PNF4T+yN7JhV1ypJDqhQvZXwU9Fuxu9UD9QLC4ulFR/gVf3tmi5D
 lqVVWX29UVRskRHv2Dh/briwMWtMHE23r/DYM12f+kS1kvRx/U3uxbRxj
 j8NbJByFjadLbGIrubl8WesZ4tPE69+U3y+1ASdJaondAolOt/9KckbQy
 N64+aLpgWXu9yEBifv2MT2g4QnZ7mEptvjaIN/h+zH/ltDeC6F0zcH1U0
 DzNejVPRNGbawJUWtgMTvA4iZ2Rfr5IPuhrhaK0BgWBYRRrInJYZoC2og Q==;
X-CSE-ConnectionGUID: Fnyenoz1Tfy684WGUXBltg==
X-CSE-MsgGUID: 3rEAjRc9ShOWGP4D0yozBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65448709"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65448709"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:30 -0800
X-CSE-ConnectionGUID: YoT8r5cGSJ2gWJGH5tac+A==
X-CSE-MsgGUID: 8n+ukJT5R7OBlCucxo7aow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="195753467"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.92])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:29 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/7] igt: Make igt_subtest_group look like an iterator
Date: Thu, 20 Nov 2025 21:14:10 +0200
Message-ID: <20251120191415.4236-3-ville.syrjala@linux.intel.com>
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

Turn igt_subtest_group into igt_subtest_group(). This allows coccinelle
to parse it when given a helping hand with the
'iterator name igt_subtest_group' directive.

Conversion done via:
$ find -type f -name \*.[ch] -exec sed -i 's/igt_subtest_group\([^_(]\|$\)/igt_subtest_group()\1/g' {} +

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_core.c                         |  8 ++--
 lib/igt_core.h                         | 14 +++----
 lib/tests/igt_audio.c                  |  2 +-
 lib/tests/igt_describe.c               |  6 +--
 lib/tests/igt_hook.c                   |  2 +-
 lib/tests/igt_nesting.c                |  6 +--
 lib/tests/igt_subtest_group.c          |  8 ++--
 lib/tests/igt_types.c                  |  8 ++--
 runner/runner_kmemleak_test.c          |  2 +-
 runner/runner_tests.c                  | 56 +++++++++++++-------------
 tests/chamelium/kms_chamelium_audio.c  |  4 +-
 tests/chamelium/kms_chamelium_color.c  |  2 +-
 tests/chamelium/kms_chamelium_edid.c   |  6 +--
 tests/chamelium/kms_chamelium_frames.c |  6 +--
 tests/chamelium/kms_chamelium_hpd.c    |  8 ++--
 tests/core_auth.c                      |  2 +-
 tests/core_hotunplug.c                 | 16 ++++----
 tests/core_setmaster.c                 |  2 +-
 tests/device_reset.c                   |  2 +-
 tests/fbdev.c                          |  4 +-
 tests/intel/gem_busy.c                 | 12 +++---
 tests/intel/gem_concurrent_all.c       | 18 ++++-----
 tests/intel/gem_create.c               |  2 +-
 tests/intel/gem_ctx_exec.c             |  2 +-
 tests/intel/gem_ctx_param.c            |  2 +-
 tests/intel/gem_ctx_persistence.c      |  6 +--
 tests/intel/gem_ctx_shared.c           |  6 +--
 tests/intel/gem_ctx_sseu.c             |  2 +-
 tests/intel/gem_ctx_switch.c           |  6 +--
 tests/intel/gem_eio.c                  |  6 +--
 tests/intel/gem_exec_async.c           |  2 +-
 tests/intel/gem_exec_balancer.c        | 10 ++---
 tests/intel/gem_exec_endless.c         |  2 +-
 tests/intel/gem_exec_fence.c           | 16 ++++----
 tests/intel/gem_exec_flush.c           |  2 +-
 tests/intel/gem_exec_latency.c         |  4 +-
 tests/intel/gem_exec_nop.c             |  4 +-
 tests/intel/gem_exec_reloc.c           |  4 +-
 tests/intel/gem_exec_schedule.c        | 18 ++++-----
 tests/intel/gem_exec_whisper.c         |  2 +-
 tests/intel/gem_linear_blits.c         |  2 +-
 tests/intel/gem_mmap_gtt.c             |  2 +-
 tests/intel/gem_mmap_wc.c              |  2 +-
 tests/intel/gem_ppgtt.c                |  2 +-
 tests/intel/gem_pxp.c                  | 10 ++---
 tests/intel/gem_reset_stats.c          |  2 +-
 tests/intel/gem_softpin.c              |  4 +-
 tests/intel/gem_spin_batch.c           |  2 +-
 tests/intel/gem_sync.c                 |  2 +-
 tests/intel/gem_tiled_blits.c          |  2 +-
 tests/intel/gem_tiled_fence_blits.c    |  2 +-
 tests/intel/gem_userptr_blits.c        |  8 ++--
 tests/intel/gem_vm_create.c            |  2 +-
 tests/intel/gem_wait.c                 |  4 +-
 tests/intel/gem_watchdog.c             |  2 +-
 tests/intel/gem_workarounds.c          |  2 +-
 tests/intel/gen7_exec_parse.c          |  2 +-
 tests/intel/i915_drm_fdinfo.c          |  2 +-
 tests/intel/i915_pm_rc6_residency.c    |  2 +-
 tests/intel/i915_query.c               |  2 +-
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 tests/intel/kms_joiner.c               |  8 ++--
 tests/intel/perf.c                     |  6 +--
 tests/intel/perf_pmu.c                 |  6 +--
 tests/intel/prime_busy.c               |  2 +-
 tests/intel/xe_eudebug.c               |  4 +-
 tests/intel/xe_eudebug_online.c        |  2 +-
 tests/intel/xe_exec_queue_property.c   |  2 +-
 tests/intel/xe_exec_sip_eudebug.c      |  4 +-
 tests/intel/xe_mmap.c                  |  2 +-
 tests/intel/xe_oa.c                    | 10 ++---
 tests/intel/xe_pmu.c                   |  8 ++--
 tests/intel/xe_pxp.c                   |  8 ++--
 tests/kms_addfb_basic.c                | 16 ++++----
 tests/kms_async_flips.c                |  2 +-
 tests/kms_color.c                      |  4 +-
 tests/kms_content_protection.c         |  4 +-
 tests/kms_cursor_crc.c                 |  6 +--
 tests/kms_cursor_legacy.c              | 18 ++++-----
 tests/kms_feature_discovery.c          |  4 +-
 tests/kms_getfb.c                      |  8 ++--
 tests/kms_lease.c                      |  4 +-
 tests/kms_plane_scaling.c              |  4 +-
 tests/kms_prime.c                      |  4 +-
 tests/kms_properties.c                 |  6 +--
 tests/kms_vrr.c                        |  2 +-
 tests/prime_vgem.c                     |  6 +--
 tests/vgem_basic.c                     |  4 +-
 tests/vmwgfx/vmw_prime.c               |  2 +-
 89 files changed, 253 insertions(+), 253 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 190f59c3411a..94236bf2ee87 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -122,7 +122,7 @@
  * of subtests and automatically skips the subtest code blocks themselves. For
  * special cases igt_only_list_subtests() is also provided. For setup code only
  * shared by a group of subtest encapsulate the #igt_fixture() block and all the
- * subtestest in a #igt_subtest_group block.
+ * subtestest in a #igt_subtest_group() block.
  *
  * # Magic Control Blocks
  *
@@ -1500,7 +1500,7 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
 {
 	internal_assert(!igt_can_fail(),
 			"igt_subtest can be nested only in igt_main"
-			" or igt_subtest_group\n");
+			" or igt_subtest_group()\n");
 
 	if (!valid_name_for_subtest(subtest_name)) {
 		igt_critical("Invalid subtest name \"%s\".\n",
@@ -1627,7 +1627,7 @@ bool igt_only_list_subtests(void)
 void __igt_subtest_group_save(int *save, int *desc)
 {
 	internal_assert(test_with_subtests,
-			"igt_subtest_group is not allowed in igt_simple_main\n");
+			"igt_subtest_group() is not allowed in igt_simple_main\n");
 
 	if (__current_description[0] != '\0') {
 		struct description_node *new = calloc(1, sizeof(*new));
@@ -1992,7 +1992,7 @@ bool igt_can_fail(void)
  * @fmt: format string containing description
  * @...: argument used by the format string
  *
- * Attach a description to the following #igt_subtest or #igt_subtest_group
+ * Attach a description to the following #igt_subtest or #igt_subtest_group()
  * block.
  *
  * Check #igt_describe for more details.
diff --git a/lib/igt_core.h b/lib/igt_core.h
index e03df8888453..422711b5e372 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -388,7 +388,7 @@ bool igt_only_list_subtests(void);
 void __igt_subtest_group_save(int *, int *);
 void __igt_subtest_group_restore(int, int);
 /**
- * igt_subtest_group:
+ * igt_subtest_group():
  *
  * Group a set of subtests together with their common setup code
  *
@@ -402,7 +402,7 @@ void __igt_subtest_group_restore(int, int);
  * clauses. If any common setup in a fixture fails, only the subtests in this
  * group will fail or skip. Subtest groups can be arbitrarily nested.
  */
-#define igt_subtest_group for (int igt_unique(__tmpint) = 0, \
+#define igt_subtest_group() for (int igt_unique(__tmpint) = 0, \
 			       igt_unique(__save) = 0, \
 			       igt_unique(__desc) = 0; \
 			       igt_unique(__tmpint) < 1 && \
@@ -556,7 +556,7 @@ void igt_describe_f(const char *fmt, ...);
  * igt_describe:
  * @dsc: string containing description
  *
- * Attach a description to the following #igt_subtest or #igt_subtest_group
+ * Attach a description to the following #igt_subtest or #igt_subtest_group()
  * block.
  *
  * The description should complement the test/subtest name and provide more
@@ -588,7 +588,7 @@ void igt_describe_f(const char *fmt, ...);
  *
  *
  * Resulting #igt_subtest documentation is a concatenation of its own
- * description and all the parenting #igt_subtest_group descriptions, starting
+ * description and all the parenting #igt_subtest_group() descriptions, starting
  * from the outermost one. Example:
  *
  * |[<!-- language="C" -->
@@ -598,7 +598,7 @@ void igt_describe_f(const char *fmt, ...);
  * igt_main
  * {
  * 	igt_describe("Desc of the subgroup with A and B");
- * 	igt_subtest_group {
+ * 	igt_subtest_group() {
  * 		igt_describe("Desc of the subtest A");
  * 		igt_subtest("subtest-a") {
  * 			...
@@ -638,7 +638,7 @@ void igt_describe_f(const char *fmt, ...);
  * ]|
  *
  * Every single #igt_subtest does not have to be preceded with a #igt_describe
- * as long as it has good-enough explanation provided on the #igt_subtest_group
+ * as long as it has good-enough explanation provided on the #igt_subtest_group()
  * level.
  *
  * Example:
@@ -649,7 +649,7 @@ void igt_describe_f(const char *fmt, ...);
  * igt_main
  * {
  * 	igt_describe("check xyz with different tilings");
- * 	igt_subtest_group {
+ * 	igt_subtest_group() {
  * 		// no need for extra description, group is enough and tiling is
  * 		// obvious from the test name
  * 		igt_subtest("foo-tiling-x") {
diff --git a/lib/tests/igt_audio.c b/lib/tests/igt_audio.c
index 7716ef28c9f4..c559f2e16a07 100644
--- a/lib/tests/igt_audio.c
+++ b/lib/tests/igt_audio.c
@@ -180,7 +180,7 @@ igt_main
 	int ret;
 	size_t i;
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			signal = audio_signal_init(CHANNELS, SAMPLING_RATE);
 
diff --git a/lib/tests/igt_describe.c b/lib/tests/igt_describe.c
index 54bd729ad1f4..2a09809296ec 100644
--- a/lib/tests/igt_describe.c
+++ b/lib/tests/igt_describe.c
@@ -46,7 +46,7 @@ __noreturn static void fake_main(void)
 		printf("should not be executed!\n");
 
 	igt_describe("Group with B, C & D");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Basic B");
 		igt_subtest("B")
 			;
@@ -55,7 +55,7 @@ __noreturn static void fake_main(void)
 			printf("should not be executed!\n");
 
 		igt_describe("Group with C & D");
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_describe("Basic C");
 			igt_subtest("C")
 				printf("should not be executed!\n");
@@ -67,7 +67,7 @@ __noreturn static void fake_main(void)
 	}
 
 	// NO DOC
-	igt_subtest_group {
+	igt_subtest_group() {
 		// NO DOC
 		igt_subtest("E")
 			;
diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
index 90b4657af3cb..b5d820c94ae0 100644
--- a/lib/tests/igt_hook.c
+++ b/lib/tests/igt_hook.c
@@ -156,7 +156,7 @@ igt_main
 	igt_subtest("help-description")
 		test_print_help();
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require_f(system(NULL), "Shell seems not to be available\n");
 		}
diff --git a/lib/tests/igt_nesting.c b/lib/tests/igt_nesting.c
index 16ffbaf6ebd1..526c7a75ab9e 100644
--- a/lib/tests/igt_nesting.c
+++ b/lib/tests/igt_nesting.c
@@ -47,8 +47,8 @@ __noreturn static void all_valid(void)
 	igt_fixture() {
 	}
 
-	igt_subtest_group {
-		igt_subtest_group {
+	igt_subtest_group() {
+		igt_subtest_group() {
 		}
 
 		igt_fixture() {
@@ -101,7 +101,7 @@ __noreturn static void invalid_subtest_group_in_simple_test(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 	}
 
 	igt_exit();
diff --git a/lib/tests/igt_subtest_group.c b/lib/tests/igt_subtest_group.c
index e42b1ef1305e..3568276dee71 100644
--- a/lib/tests/igt_subtest_group.c
+++ b/lib/tests/igt_subtest_group.c
@@ -36,12 +36,12 @@ igt_main
 	volatile bool t1 = false;
 	volatile int t2 = 0;
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(true);
 		}
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				igt_require(false);
 			}
@@ -50,7 +50,7 @@ igt_main
 				internal_assert(0);
 			}
 
-			igt_subtest_group {
+			igt_subtest_group() {
 				/* need to make sure we don't accidentally
 				 * restore to "run testcases" when an outer
 				 * group is already in SKIP state. */
@@ -66,7 +66,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			internal_assert(t2 == 0);
 			t2 = 1;
diff --git a/lib/tests/igt_types.c b/lib/tests/igt_types.c
index eb05393616bf..e75a77157cda 100644
--- a/lib/tests/igt_types.c
+++ b/lib/tests/igt_types.c
@@ -73,7 +73,7 @@ igt_main
 
 	/* But not before we go out of scope! */
 	cleanup_called = 0;
-	igt_subtest_group {
+	igt_subtest_group() {
 		scoped_int_t(x);
 
 		igt_fixture() {
@@ -112,7 +112,7 @@ igt_main
 	 * will get cleanup on the outer scope.
 	 */
 	cleanup_called = 0;
-	igt_subtest_group {
+	igt_subtest_group() {
 		scoped_int_t(x);
 
 		igt_describe("Check skipping a subtest group");
@@ -131,7 +131,7 @@ igt_main
 		igt_assert(cleanup_called);
 
 	cleanup_called = 0;
-	igt_subtest_group
+	igt_subtest_group()
 		delegate();
 	igt_describe("Check cleanup after group delegation");
 	igt_subtest("cleanup-after-group-delegation")
@@ -145,7 +145,7 @@ igt_main
 		igt_assert(cleanup_called);
 
 	cleanup_called = 0;
-	igt_subtest_group
+	igt_subtest_group()
 		skip_delegate();
 	igt_describe("Check cleanup after skipping group delegation");
 	igt_subtest("cleanup-after-group-skipped-delegation")
diff --git a/runner/runner_kmemleak_test.c b/runner/runner_kmemleak_test.c
index 8030ff621c62..31b0e3b91b32 100644
--- a/runner/runner_kmemleak_test.c
+++ b/runner/runner_kmemleak_test.c
@@ -246,7 +246,7 @@ igt_main
 		igt_assert(runner_kmemleak_init(unit_testing_kmemleak_filepath));
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_subtest("test_runner_kmemleak_once")
 			igt_assert(runner_kmemleak(NULL, resdirfd, false, true));
 
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index b360cdd8bfcf..bdba0bdd2077 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -16,7 +16,7 @@
 
 /*
  * NOTE: this test is using a lot of variables that are changed in igt_fixture(),
- * igt_subtest_group and igt_subtests blocks but defined outside of them.
+ * igt_subtest_group() and igt_subtests blocks but defined outside of them.
  *
  * Such variables have to be either non-local or volatile, otherwise their
  * contents is undefined due to longjmps the framework performs.
@@ -323,7 +323,7 @@ igt_main
 		igt_assert_eq(settings->dmesg_warn_level, 4);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char *cwd;
 		char *path;
 
@@ -355,7 +355,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const char tmptestlist[] = "tmp.testlist";
 		char dirname[] = "tmpdirXXXXXX";
 		char pathtotestlist[64];
@@ -757,7 +757,7 @@ igt_main
 		igt_assert(settings->sync);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char filename[] = "tmplistXXXXXX";
 
 		igt_fixture() {
@@ -798,7 +798,7 @@ igt_main
 		igt_assert(!validate_settings(settings));
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char dirname[] = "tmpdirXXXXXX";
 		struct job_list *list = malloc(sizeof(*list));
 
@@ -833,7 +833,7 @@ igt_main
 	job_list_filter_test("piglit-names", "-t", "igt@successtest", 2, 1);
 	job_list_filter_test("piglit-names-subtest", "-t", "igt@successtest@first", 1, 1);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char filename[] = "tmplistXXXXXX";
 		const char testlisttext[] = "igt@successtest@first-subtest\n"
 			"igt@successtest@second-subtest\n"
@@ -903,7 +903,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char filename[] = "tmplistXXXXXX";
 		const char testlisttext[] = "igt@dynamic@dynamic-subtest@passing\n"
 			"igt@dynamic@dynamic-subtest@failing\n"
@@ -963,7 +963,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char dirname[] = "tmpdirXXXXXX";
 		volatile int dirfd = -1, fd = -1;
 		struct settings *cmp_settings = malloc(sizeof(*cmp_settings));
@@ -1028,7 +1028,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char dirname[] = "tmpdirXXXXXX";
 		volatile int dirfd = -1, fd = -1;
 		struct job_list *list, *cmp_list;
@@ -1086,7 +1086,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char dirname[] = "tmpdirXXXXXX";
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
@@ -1170,7 +1170,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char dirname[] = "tmpdirXXXXXX";
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, fd = -1;
@@ -1219,7 +1219,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char dirname[] = "tmpdirXXXXXX";
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
@@ -1276,7 +1276,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char dirname[] = "tmpdirXXXXXX";
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
@@ -1332,7 +1332,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char dirname[] = "tmpdirXXXXXX";
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
@@ -1388,7 +1388,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char dirname[] = "tmpdirXXXXXX";
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
@@ -1444,7 +1444,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char dirname[] = "tmpdirXXXXXX";
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
@@ -1503,7 +1503,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		char dirname[] = "tmpdirXXXXXX";
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
@@ -1563,7 +1563,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
 		int multiple;
@@ -1633,7 +1633,7 @@ igt_main
 			free(list);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_subtest("metadata-read-old-style-infer-dmesg-warn-piglit-style") {
 			char metadata[] = "piglit_style_dmesg : 1\n";
 			FILE *f = fmemopen(metadata, strlen(metadata), "r");
@@ -1699,7 +1699,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
 		int multiple;
@@ -1786,7 +1786,7 @@ igt_main
 			free(list);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const char testlisttext[] = "igt@dynamic@dynamic-subtest@passing\n";
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1;
@@ -1849,7 +1849,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const char testlisttext[] = "igt@successtest";
 		const char blocktext[] = "igt@successtest@first";
 		const char blocktext_upper[] = "igt@successTEST@first";
@@ -1944,7 +1944,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1;
 		char dirname[] = "tmpdirXXXXXX";
@@ -1990,7 +1990,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1;
 		char dirname[] = "tmpdirXXXXXX";
@@ -2036,7 +2036,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1;
 
@@ -2092,7 +2092,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1;
 
@@ -2152,7 +2152,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1;
 
@@ -2215,7 +2215,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1;
 
diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index c7eabdf4f367..b296bdf7ef0a 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -859,7 +859,7 @@ igt_main
 	}
 
 	igt_describe("DisplayPort tests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
@@ -877,7 +877,7 @@ igt_main
 	}
 
 	igt_describe("HDMI tests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_HDMIA,
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 3d5be31c3de7..4658678ae693 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -763,7 +763,7 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 	}
 
-	igt_subtest_group
+	igt_subtest_group()
 		run_tests_for_pipe(&data);
 
 	igt_fixture() {
diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 44ddd302db71..9e21a68f7db8 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -530,7 +530,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_describe("DisplayPort tests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
@@ -584,7 +584,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_describe("HDMI tests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_HDMIA,
@@ -632,7 +632,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_describe("VGA tests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_VGA,
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index e16a2eb58f07..5194938b7564 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -995,7 +995,7 @@ igt_main
 	}
 
 	igt_describe("DisplayPort tests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
@@ -1023,7 +1023,7 @@ igt_main
 	}
 
 	igt_describe("HDMI tests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_HDMIA,
@@ -1136,7 +1136,7 @@ igt_main
 	}
 
 	igt_describe("VGA tests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_VGA,
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index f475e0ed8f14..078166cbd955 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -471,7 +471,7 @@ igt_main
 	}
 
 	igt_describe("DisplayPort tests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
@@ -523,7 +523,7 @@ igt_main
 	}
 
 	igt_describe("HDMI tests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_HDMIA,
@@ -575,7 +575,7 @@ igt_main
 	}
 
 	igt_describe("VGA tests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			chamelium_require_connector_present(
 				data.ports, DRM_MODE_CONNECTOR_VGA,
@@ -616,7 +616,7 @@ igt_main
 	}
 
 	igt_describe("Tests that operate on all connectors");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(data.port_count);
 		}
diff --git a/tests/core_auth.c b/tests/core_auth.c
index ef9cd2c1c3d5..2cdaa2f2bec6 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -241,7 +241,7 @@ igt_main
 	}
 
 	/* above tests require that no drm fd is open */
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fd_t(master);
 
 		igt_fixture()
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index fe8cefd1769c..9d8d3f1302bc 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -715,7 +715,7 @@ igt_main
 		prepare(&priv);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Check if the driver can be cleanly unbound from a device believed to be closed, then rebound");
 		igt_subtest("unbind-rebind")
 			unbind_rebind(&priv);
@@ -727,7 +727,7 @@ igt_main
 	igt_fixture()
 		post_healthcheck(&priv);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Check if a device believed to be closed can be cleanly unplugged, then restored");
 		igt_subtest("unplug-rescan")
 			unplug_rescan(&priv);
@@ -739,7 +739,7 @@ igt_main
 	igt_fixture()
 		post_healthcheck(&priv);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Check if the driver can be cleanly unbound from an open device, then released and rebound");
 		igt_subtest("hotunbind-rebind")
 			hotunbind_rebind(&priv);
@@ -751,7 +751,7 @@ igt_main
 	igt_fixture()
 		post_healthcheck(&priv);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Check if an open device can be cleanly unplugged, then released and restored");
 		igt_subtest("hotunplug-rescan")
 			hotunplug_rescan(&priv);
@@ -763,7 +763,7 @@ igt_main
 	igt_fixture()
 		post_healthcheck(&priv);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Check if the driver can be cleanly rebound to a device with a still open hot unbound driver instance");
 		igt_subtest("hotrebind")
 			hotrebind(&priv);
@@ -775,7 +775,7 @@ igt_main
 	igt_fixture()
 		post_healthcheck(&priv);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Check if a hot unplugged and still open device can be cleanly restored");
 		igt_subtest("hotreplug")
 			hotreplug(&priv);
@@ -787,7 +787,7 @@ igt_main
 	igt_fixture()
 		post_healthcheck(&priv);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Check if a hot unbound driver instance still open after hot rebind can be cleanly released");
 		igt_subtest("hotrebind-lateclose")
 			hotrebind_lateclose(&priv);
@@ -799,7 +799,7 @@ igt_main
 	igt_fixture()
 		post_healthcheck(&priv);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Check if an instance of a still open while hot replugged device can be cleanly released");
 		igt_subtest("hotreplug-lateclose")
 			hotreplug_lateclose(&priv);
diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index a929b7f5187f..7f6373c73780 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -150,7 +150,7 @@ igt_main
 	}
 
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		uint8_t saved_perm;
 		char buf[255];
 
diff --git a/tests/device_reset.c b/tests/device_reset.c
index 2c25ed79afc0..8ef7792003de 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -470,7 +470,7 @@ igt_main
 	}
 
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Unbinds driver from device, initiates cold reset"
 			     " then rebinds driver to device");
 		igt_subtest("unbind-cold-reset-rebind") {
diff --git a/tests/fbdev.c b/tests/fbdev.c
index cd478add5411..387b99660fb5 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -470,12 +470,12 @@ igt_main
 	}
 
 	igt_describe("Check modesetting");
-	igt_subtest_group {
+	igt_subtest_group() {
 		mode_tests(fd);
 	}
 
 	igt_describe("Check framebuffer access");
-	igt_subtest_group {
+	igt_subtest_group() {
 		framebuffer_tests(fd);
 	}
 
diff --git a/tests/intel/gem_busy.c b/tests/intel/gem_busy.c
index ffeba1d44a1a..16831aee0ba1 100644
--- a/tests/intel/gem_busy.c
+++ b/tests/intel/gem_busy.c
@@ -481,7 +481,7 @@ igt_main
 		ctx = intel_ctx_create_all_physical(fd);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			intel_allocator_multiprocess_start();
 			igt_fork_hang_detector(fd);
@@ -514,12 +514,12 @@ igt_main
 	}
 
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_fork_hang_detector(fd);
 		}
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				igt_require(has_extended_busy_ioctl(fd));
 				gem_require_mmap_device_coherent(fd);
@@ -543,7 +543,7 @@ igt_main
 			}
 		}
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				igt_require(has_extended_busy_ioctl(fd));
 				igt_require(has_semaphores(fd));
@@ -564,7 +564,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_hang_t hang;
 
 		igt_fixture() {
@@ -579,7 +579,7 @@ igt_main
 			gem_quiescent_gpu(fd);
 		}
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				igt_require(has_extended_busy_ioctl(fd));
 				gem_require_mmap_device_coherent(fd);
diff --git a/tests/intel/gem_concurrent_all.c b/tests/intel/gem_concurrent_all.c
index ede34f698d7d..5235de888b38 100644
--- a/tests/intel/gem_concurrent_all.c
+++ b/tests/intel/gem_concurrent_all.c
@@ -1577,7 +1577,7 @@ run_mode(const char *prefix,
 				igt_fork_hang_detector(fd);
 
 		for (p = all ? pipelines : pskip; p->prefix; p++) {
-			igt_subtest_group  {
+			igt_subtest_group()  {
 				igt_fixture() p->require();
 
 				igt_subtest_f("%s-%s-%s-sanitycheck0%s%s", prefix, mode->name, p->prefix, suffix, h->suffix) {
@@ -1735,7 +1735,7 @@ run_modes(const char *style,
 	};
 
 	while (mode->name) {
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				if (mode->require)
 					mode->require(create, num);
@@ -1920,7 +1920,7 @@ igt_main
 			/* Minimum test set */
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "tiny");
-			igt_subtest_group {
+			igt_subtest_group() {
 				igt_fixture() {
 					count = num_buffers(0, s, c, CHECK_RAM);
 				}
@@ -1930,7 +1930,7 @@ igt_main
 			/* "Average" test set */
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "small");
-			igt_subtest_group {
+			igt_subtest_group() {
 				igt_fixture() {
 					count = num_buffers(gem_mappable_aperture_size(fd)/4,
 							    s, c, CHECK_RAM);
@@ -1941,7 +1941,7 @@ igt_main
 			/* Use the entire mappable aperture */
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "thrash");
-			igt_subtest_group {
+			igt_subtest_group() {
 				igt_fixture() {
 					count = num_buffers(gem_mappable_aperture_size(fd),
 							    s, c, CHECK_RAM);
@@ -1952,7 +1952,7 @@ igt_main
 			/* Use the entire global GTT */
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "global");
-			igt_subtest_group {
+			igt_subtest_group() {
 				igt_fixture() {
 					count = num_buffers(gem_global_aperture_size(fd),
 							    s, c, CHECK_RAM);
@@ -1963,7 +1963,7 @@ igt_main
 			/* Use the entire per-process GTT */
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "full");
-			igt_subtest_group {
+			igt_subtest_group() {
 				igt_fixture() {
 					count = num_buffers(gem_aperture_size(fd),
 							    s, c, CHECK_RAM);
@@ -1973,7 +1973,7 @@ igt_main
 
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "shrink");
-			igt_subtest_group {
+			igt_subtest_group() {
 				igt_fixture() {
 					count = num_buffers(gem_mappable_aperture_size(fd),
 							    s, c, CHECK_RAM);
@@ -1989,7 +1989,7 @@ igt_main
 			/* Use the entire mappable aperture, force swapping */
 			snprintf(name, sizeof(name), "%s%s-%s",
 				 c->name, s->name, "swap");
-			igt_subtest_group {
+			igt_subtest_group() {
 				igt_fixture() {
 					if (igt_get_avail_ram_mb() > gem_mappable_aperture_size(fd)/(1024*1024)) {
 						pin_sz = igt_get_avail_ram_mb() - gem_mappable_aperture_size(fd)/(1024*1024);
diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
index 7d80b2707382..4253a055f0e8 100644
--- a/tests/intel/gem_create.c
+++ b/tests/intel/gem_create.c
@@ -984,7 +984,7 @@ igt_main
 	}
 
 	igt_describe("Create buffer objects while GPU is busy.");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture()
 			igt_fork_hang_detector(fd);
 
diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/gem_ctx_exec.c
index f5fa2938eed1..025f25a20e8b 100644
--- a/tests/intel/gem_ctx_exec.c
+++ b/tests/intel/gem_ctx_exec.c
@@ -540,7 +540,7 @@ igt_main
 
 	igt_describe("Race the execution and interrupt handlers along a context,"
 	             " while closing it at a random time.");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			intel_allocator_multiprocess_start();
 		}
diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
index 0edf3a357906..44bde4dee93b 100644
--- a/tests/intel/gem_ctx_param.c
+++ b/tests/intel/gem_ctx_param.c
@@ -482,7 +482,7 @@ igt_main
 	}
 
 	igt_describe("Test performed with context param set to priority");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(gem_scheduler_has_ctx_priority(fd));
 		}
diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
index cbf5ff142a63..2fc82bdc3c6f 100644
--- a/tests/intel/gem_ctx_persistence.c
+++ b/tests/intel/gem_ctx_persistence.c
@@ -1400,7 +1400,7 @@ igt_main
 	igt_subtest("heartbeat-hostile")
 		test_noheartbeat_close(i915, IGT_SPIN_NO_PREEMPTION);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture()
 			gem_require_contexts(i915);
 
@@ -1420,7 +1420,7 @@ igt_main
 
 	/* New way of selecting engines. */
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const struct intel_execution_engine2 *e;
 
 		igt_fixture()
@@ -1456,7 +1456,7 @@ igt_main
 			many_contexts(i915, &ctx->cfg);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			gem_require_contexts(i915);
 			intel_allocator_multiprocess_start();
diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
index 0c1d687c7a9a..575e0cebd80f 100644
--- a/tests/intel/gem_ctx_shared.c
+++ b/tests/intel/gem_ctx_shared.c
@@ -1035,7 +1035,7 @@ igt_main
 		cfg = intel_ctx_cfg_all_physical(i915);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(gem_has_vm(i915));
 			igt_fork_hang_detector(i915);
@@ -1071,7 +1071,7 @@ igt_main
 		 * enough to reduce the queue into just another context,
 		 * and so rely on gem_exec_schedule to prove the rest.
 		 */
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				igt_require(gem_scheduler_enabled(i915));
 				igt_require(gem_scheduler_has_ctx_priority(i915));
@@ -1100,7 +1100,7 @@ igt_main
 			}
 		}
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				igt_require(gem_scheduler_enabled(i915));
 				igt_require(gem_scheduler_has_ctx_priority(i915));
diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
index 11bbf5764455..45fcb16e6fa6 100644
--- a/tests/intel/gem_ctx_sseu.c
+++ b/tests/intel/gem_ctx_sseu.c
@@ -528,7 +528,7 @@ igt_main
 		igt_require(kernel_has_per_context_sseu_support(fd));
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			drm_i915_getparam_t gp;
 
diff --git a/tests/intel/gem_ctx_switch.c b/tests/intel/gem_ctx_switch.c
index 1880a3ce2a0d..0fa31b4c27f9 100644
--- a/tests/intel/gem_ctx_switch.c
+++ b/tests/intel/gem_ctx_switch.c
@@ -737,7 +737,7 @@ igt_main
 		e2 = &e2__;
 
 		for (typeof(*phases) *p = phases; p->name; p++) {
-			igt_subtest_group {
+			igt_subtest_group() {
 				igt_fixture() {
 					gem_require_ring(fd, e2->flags);
 					if (p->require)
@@ -766,7 +766,7 @@ igt_main
 	/* Must come after legacy subtests. */
 	for_each_ctx_cfg_engine(fd, &engines_cfg, e2) {
 		for (typeof(*phases) *p = phases; p->name; p++) {
-			igt_subtest_group {
+			igt_subtest_group() {
 				igt_fixture() {
 					if (p->require)
 						igt_require(p->require(fd));
@@ -794,7 +794,7 @@ igt_main
 	igt_subtest("all-heavy")
 		all(fd, heavy, &engines_cfg, 0, 2);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			gem_require_vm(fd);
 		}
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index 844562a0e861..e589a62d534c 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -1152,7 +1152,7 @@ igt_main
 	igt_subtest("in-flight-suspend")
 		test_inflight_suspend(fd);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(gem_has_contexts(fd));
 		}
@@ -1164,7 +1164,7 @@ igt_main
 			test_reset_stress(fd, TEST_WEDGE);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const struct {
 			unsigned int wait;
 			const char *name;
@@ -1193,7 +1193,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_display_t display = {
 			.drm_fd = -1, .n_pipes = IGT_MAX_PIPES
 		};
diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
index 4b5c03553a7d..de5bc9caca31 100644
--- a/tests/intel/gem_exec_async.c
+++ b/tests/intel/gem_exec_async.c
@@ -209,7 +209,7 @@ igt_main
 	test_each_engine("concurrent-writes", fd, ctx, e)
 		one(fd, ctx, e->flags, 0);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			intel_allocator_multiprocess_start();
 		}
diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index 57f30f73aa68..a7d88952f650 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -3440,7 +3440,7 @@ igt_main
 	igt_subtest("busy")
 		busy(i915);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		static const struct {
 			const char *name;
 			unsigned int flags;
@@ -3483,7 +3483,7 @@ igt_main
 	igt_subtest("bonded-semaphore")
 		bonded_semaphore(i915);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			intel_allocator_multiprocess_start();
 		}
@@ -3509,7 +3509,7 @@ igt_main
 		igt_stop_hang_detector();
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(has_logical_mapping(i915));
 			igt_require(has_parallel_execbuf(i915));
@@ -3546,7 +3546,7 @@ igt_main
 			parallel_balancer(i915, 0);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_hang_t  hang;
 
 		igt_fixture()
@@ -3565,7 +3565,7 @@ igt_main
 			hangme(i915);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require_gem(i915); /* reset parameters */
 			igt_require(has_persistence(i915));
diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
index fb70a9cc87f1..0b0e755e1191 100644
--- a/tests/intel/gem_exec_endless.c
+++ b/tests/intel/gem_exec_endless.c
@@ -353,7 +353,7 @@ igt_main
 		igt_require_gem(i915);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		struct intel_mmio_data mmio;
 		int sysfs;
 
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index 62d090847698..b9855f2e3347 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -3171,7 +3171,7 @@ igt_main
 		gem_submission_print_method(i915);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_hang_t hang;
 
 		igt_fixture() {
@@ -3207,13 +3207,13 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		for_each_ctx_engine(i915, ctx, e) {
 			igt_fixture() {
 				igt_require(gem_class_can_store_dword(i915, e->class));
 			}
 		}
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				igt_fork_hang_detector(i915);
 				intel_allocator_multiprocess_start();
@@ -3336,7 +3336,7 @@ igt_main
 			}
 		}
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_hang_t hang;
 
 			igt_fixture() {
@@ -3383,7 +3383,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		long ring_size = 0;
 
 		igt_fixture() {
@@ -3404,7 +3404,7 @@ igt_main
 			test_long_history(i915, ctx, ring_size, EXPIRED);
 	}
 
-	igt_subtest_group { /* syncobj */
+	igt_subtest_group() { /* syncobj */
 		igt_fixture() {
 			igt_require(exec_has_fence_array(i915));
 			igt_assert(has_syncobj(i915));
@@ -3462,7 +3462,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group { /* syncobj timeline */
+	igt_subtest_group() { /* syncobj timeline */
 		igt_fixture() {
 			igt_require(exec_has_timeline_fences(i915));
 			igt_require(has_syncobj_timeline(i915));
@@ -3505,7 +3505,7 @@ igt_main
 		igt_subtest("syncobj-timeline-multiple-ext-nodes")
 			test_syncobj_timeline_multiple_ext_nodes(i915);
 
-		igt_subtest_group { /* syncobj timeline engine chaining */
+		igt_subtest_group() { /* syncobj timeline engine chaining */
 			igt_fixture() {
 				/*
 				 * We need support for MI_ALU on all
diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
index d8fe78377994..84e3d82fbe5e 100644
--- a/tests/intel/gem_exec_flush.c
+++ b/tests/intel/gem_exec_flush.c
@@ -2123,7 +2123,7 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
-	for (e = intel_execution_rings; e->name; e++) igt_subtest_group {
+	for (e = intel_execution_rings; e->name; e++) igt_subtest_group() {
 		unsigned ring = eb_ring(e);
 		unsigned timeout = 5 + 120*!!e->exec_id;
 
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
index 65937d109d7d..f86b9b1da6c5 100644
--- a/tests/intel/gem_exec_latency.c
+++ b/tests/intel/gem_exec_latency.c
@@ -956,7 +956,7 @@ igt_main
 		rcs_clock = 1e9 / rcs_clock;
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture()
 			igt_require(intel_gen(intel_get_drm_devid(device)) >= 7);
 
@@ -986,7 +986,7 @@ igt_main
 		test_each_engine("wakeup-latency", device, ctx, e)
 			wakeup_latency(device, ctx, e);
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				gem_require_contexts(device);
 				igt_require(gem_scheduler_has_preemption(device));
diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
index 072be55f3c95..d7664bfa37b8 100644
--- a/tests/intel/gem_exec_nop.c
+++ b/tests/intel/gem_exec_nop.c
@@ -1077,7 +1077,7 @@ igt_main
 	igt_subtest("context-sequential")
 		sequential(device, handle, ctx, FORKED | CONTEXT, 20);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			gem_require_contexts(device);
 			igt_require(gem_scheduler_has_ctx_priority(device));
@@ -1091,7 +1091,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_device_set_master(device);
 		}
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index 1aed353b586b..8bdfc78da6e0 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -1677,7 +1677,7 @@ igt_main
 	for (f = flags; f->name; f++) {
 		igt_hang_t hang;
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				if (f->flags & HANG)
 					hang = igt_allow_hang(fd, 0, 0);
@@ -1752,7 +1752,7 @@ igt_main
 	igt_subtest("invalid-domains")
 		invalid_domains(fd);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_display_t display = {
 			.drm_fd = fd,
 			.n_pipes = IGT_MAX_PIPES
diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index 5a4665284104..5e5fa2877908 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -3222,7 +3222,7 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const struct intel_execution_engine2 *e;
 
 		test_each_ggtt_binder_nonblocking_engine("fifo", fd, ctx, e)
@@ -3244,7 +3244,7 @@ igt_main
 			independent(fd, ctx, e->flags, IGT_SPIN_USERPTR);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const struct intel_execution_engine2 *e;
 
 		igt_fixture() {
@@ -3266,7 +3266,7 @@ igt_main
 		test_each_engine("u-lateslice", fd, ctx, e)
 			lateslice(fd, &ctx->cfg, e->flags, IGT_SPIN_USERPTR);
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				igt_require(gem_scheduler_has_timeslicing(fd));
 				igt_require(intel_gen(intel_get_drm_devid(fd)) >= 8);
@@ -3345,7 +3345,7 @@ igt_main
 		test_each_ggtt_binder_nonblocking_engine("promotion", fd, ctx, e)
 			promotion(fd, &ctx->cfg, e->flags);
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				igt_require(gem_scheduler_has_preemption(fd));
 			}
@@ -3371,7 +3371,7 @@ igt_main
 			test_each_engine_store("preempt-engines", fd, ctx, e)
 				preempt_engines(fd, e, 0);
 
-			igt_subtest_group {
+			igt_subtest_group() {
 				igt_fixture() {
 					igt_require(!gem_scheduler_has_static_priority(fd));
 				}
@@ -3388,7 +3388,7 @@ igt_main
 					preempt_queue(fd, &ctx->cfg, e->flags, CONTEXTS | CHAIN);
 			}
 
-			igt_subtest_group {
+			igt_subtest_group() {
 				igt_hang_t hang;
 
 				igt_fixture() {
@@ -3431,7 +3431,7 @@ igt_main
 		test_each_engine_store("smoketest", fd, ctx, e)
 			smoketest(fd, &ctx->cfg, e->flags, 5);
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				igt_require(!gem_scheduler_has_static_priority(fd));
 			}
@@ -3441,7 +3441,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const struct intel_execution_engine2 *e;
 
 		igt_fixture() {
@@ -3466,7 +3466,7 @@ igt_main
 			test_pi_iova(fd, &ctx->cfg, e->flags, SHARED);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(gem_scheduler_enabled(fd));
 			igt_require(gem_scheduler_has_semaphores(fd));
diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
index 0200d50e8b03..649847354c42 100644
--- a/tests/intel/gem_exec_whisper.c
+++ b/tests/intel/gem_exec_whisper.c
@@ -756,7 +756,7 @@ igt_main
 		igt_stop_hang_detector();
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		for (const struct mode *m = modes; m->name; m++) {
 			if (m->flags & INTERRUPTIBLE)
 				continue;
diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
index c81866aec84d..ac07d4ef0adc 100644
--- a/tests/intel/gem_linear_blits.c
+++ b/tests/intel/gem_linear_blits.c
@@ -300,7 +300,7 @@ igt_main
 	igt_subtest("basic")
 		run_test(fd, 2, do_relocs);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			intel_allocator_multiprocess_start();
 		}
diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c
index 2cd02b281804..fe944f161e9b 100644
--- a/tests/intel/gem_mmap_gtt.c
+++ b/tests/intel/gem_mmap_gtt.c
@@ -1750,7 +1750,7 @@ igt_main
 	igt_subtest("huge-bo-tiledY")
 		test_huge_bo(fd, 1, I915_TILING_Y);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const struct copy_size {
 			const char *prefix;
 			int size;
diff --git a/tests/intel/gem_mmap_wc.c b/tests/intel/gem_mmap_wc.c
index 3a6b12f56fe8..2d77b3ede410 100644
--- a/tests/intel/gem_mmap_wc.c
+++ b/tests/intel/gem_mmap_wc.c
@@ -637,7 +637,7 @@ igt_main
 	igt_subtest("write-cpu-read-wc-unflushed")
 		test_write_cpu_read_wc(fd, 0);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() gem_require_mappable_ggtt(fd);
 		igt_subtest("write-wc-read-gtt")
 			test_write_wc_read_gtt(fd);
diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/gem_ppgtt.c
index 9c8c5e3dec97..7e242ae24c5b 100644
--- a/tests/intel/gem_ppgtt.c
+++ b/tests/intel/gem_ppgtt.c
@@ -474,7 +474,7 @@ igt_main
 		flink_and_close();
 
 	igt_describe("Regression test to verify GTT eviction can't randomly fail due to object lock contention");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_subtest("shrink-vs-evict-any")
 			shrink_vs_evict(IGT_USE_ANY);
 		igt_subtest("shrink-vs-evict-pinned")
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index ecff502c1427..73ba7c230546 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1319,7 +1319,7 @@ igt_main
 		rendercopy = igt_get_render_copyfunc(i915);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Verify protected buffer on unsupported hw:");
 		igt_subtest("hw-rejects-pxp-buffer") {
 			require_nopxp(pxp_supported, devid);
@@ -1332,7 +1332,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Verify protected buffer on supported hw:");
 		igt_subtest("create-regular-buffer") {
 			require_pxp(pxp_supported, devid);
@@ -1379,7 +1379,7 @@ igt_main
 			test_ctx_mod_protected_to_all_invalid(i915);
 		}
 	}
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Verify protected render operations:");
 		igt_subtest("regular-baseline-src-copy-readible") {
 			require_pxp_render(pxp_supported, devid, rendercopy);
@@ -1398,7 +1398,7 @@ igt_main
 			test_pxp_dmabuffshare_refcnt(i915);
 		}
 	}
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Verify suspend-resume teardown management:");
 		igt_subtest("verify-pxp-key-change-after-suspend-resume") {
 			require_pxp_render(pxp_supported, devid, rendercopy);
@@ -1426,7 +1426,7 @@ igt_main
 			test_pxp_pwrcycle_staleasset_execution(i915, &pm);
 		}
 	}
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Test the display CRC");
 		igt_subtest("display-protected-crc") {
 			require_pxp_render(pxp_supported, devid, rendercopy);
diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
index 712183cf65af..e0fe9c420e71 100644
--- a/tests/intel/gem_reset_stats.c
+++ b/tests/intel/gem_reset_stats.c
@@ -1156,7 +1156,7 @@ igt_main
 			RUN_TEST(defer_hangcheck(e));
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const struct intel_execution_engine2 *e2;
 		intel_ctx_cfg_t cfg = {};
 
diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
index 7e772b927c32..dfa33b7c7a38 100644
--- a/tests/intel/gem_softpin.c
+++ b/tests/intel/gem_softpin.c
@@ -1484,7 +1484,7 @@ igt_main
 	igt_subtest("invalid")
 		test_invalid(fd);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		/* Under full-ppgtt, we have complete control of the GTT */
 
 		igt_fixture() {
@@ -1553,7 +1553,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(gem_uses_full_ppgtt(fd));
 			intel_allocator_multiprocess_start();
diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
index 36e1d759ab24..72fd736e902d 100644
--- a/tests/intel/gem_spin_batch.c
+++ b/tests/intel/gem_spin_batch.c
@@ -302,7 +302,7 @@ igt_main
 
 #undef test_each_engine
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture()
 			intel_allocator_multiprocess_start();
 
diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index 6a2644b1ebbb..95e40f7802a1 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -1502,7 +1502,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			gem_require_contexts(fd);
 			igt_require(gem_scheduler_has_ctx_priority(fd));
diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/gem_tiled_blits.c
index 735ef4800e3e..183c938dd26a 100644
--- a/tests/intel/gem_tiled_blits.c
+++ b/tests/intel/gem_tiled_blits.c
@@ -212,7 +212,7 @@ igt_main
 	igt_subtest("basic")
 		run_test(fd, 2);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			intel_allocator_multiprocess_start();
 		}
diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
index 5753f9ad8455..7a81074f0634 100644
--- a/tests/intel/gem_tiled_fence_blits.c
+++ b/tests/intel/gem_tiled_fence_blits.c
@@ -325,7 +325,7 @@ igt_main
 	igt_subtest("basic")
 		run_test(fd, 2, end);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			intel_allocator_multiprocess_start();
 		}
diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
index 83c9f8888348..eb5b0d0621c6 100644
--- a/tests/intel/gem_userptr_blits.c
+++ b/tests/intel/gem_userptr_blits.c
@@ -2532,7 +2532,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			/* Either mode will do for parameter checking */
 			gem_userptr_test_synchronized();
@@ -2577,7 +2577,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		gem_userptr_test_unsynchronized();
 
 		igt_fixture() {
@@ -2671,7 +2671,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_stop_signal_helper();
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		gem_userptr_test_synchronized();
 
 		igt_fixture() {
@@ -2797,7 +2797,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_stop_signal_helper();
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			gem_userptr_test_synchronized();
 			if (!has_userptr(fd))
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index 18b049cc0551..435549cdfec9 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -396,7 +396,7 @@ igt_main
 	igt_subtest("invalid-destroy")
 		invalid_destroy(i915);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			gem_context_require_param(i915, I915_CONTEXT_PARAM_VM);
 		}
diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
index a08fda9beefd..6247ed7441ad 100644
--- a/tests/intel/gem_wait.c
+++ b/tests/intel/gem_wait.c
@@ -248,7 +248,7 @@ igt_main
 	igt_subtest("invalid-buf")
 		invalid_buf(fd);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		static const struct {
 			const char *name;
 			unsigned int flags;
@@ -278,7 +278,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		static const struct {
 			const char *name;
 			unsigned int flags;
diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
index 9b69f534399a..6d9b95018766 100644
--- a/tests/intel/gem_watchdog.c
+++ b/tests/intel/gem_watchdog.c
@@ -592,7 +592,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_subtest("default-physical")
 			physical(i915, ctx);
 
diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index b639b061a786..54fd2c4c13e1 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -349,7 +349,7 @@ igt_main
 	}
 
 	for (op = ops; op->name; op++) {
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_hang_t hang = {};
 
 			igt_fixture() {
diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
index 8a25805f00d6..de92f9e186b4 100644
--- a/tests/intel/gen7_exec_parse.c
+++ b/tests/intel/gen7_exec_parse.c
@@ -579,7 +579,7 @@ igt_main
 		test_allocations(fd);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 #define REG(R, MSK, INI, V, OK, MIN_V) { #R, R, MSK, INI, V, OK, MIN_V }
 		struct test_lri lris[] = {
 			/* dummy head pointer */
diff --git a/tests/intel/i915_drm_fdinfo.c b/tests/intel/i915_drm_fdinfo.c
index 902c0cb8e551..4505dea9ce64 100644
--- a/tests/intel/i915_drm_fdinfo.c
+++ b/tests/intel/i915_drm_fdinfo.c
@@ -1092,7 +1092,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		int newfd;
 
 		igt_fixture()
diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index e56263ff27ef..3d6bb5a6f445 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -647,7 +647,7 @@ igt_main
 				rc6_fence(i915, gt);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		unsigned int rc6_enabled = 0;
 		unsigned int devid = 0;
 
diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
index 9545a35c1836..25443f6f35b9 100644
--- a/tests/intel/i915_query.c
+++ b/tests/intel/i915_query.c
@@ -1515,7 +1515,7 @@ igt_main
 		test_query_regions_unallocated(fd);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(query_engine_info_supported(fd));
 		}
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 4e1214d165f1..50b118f1d754 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4148,7 +4148,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		plane_fbc_rte_subtest(&t);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_subtest_with_dynamic("pipe-fbc-rte") {
 
 			enum pipe default_pipe = prim_mode_params.pipe;
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index efb109604d1a..07efc74e6f14 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -627,7 +627,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(data.big_joiner_output_count > 0);
 			igt_require(data.n_pipes > 1);
@@ -657,7 +657,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(data.non_big_joiner_output_count > 0);
 			igt_require(data.n_pipes > 1);
@@ -699,7 +699,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(data.ultra_joiner_output_count > 0);
 			igt_require(data.n_pipes > 3);
@@ -723,7 +723,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(ultra_joiner_supported);
 			igt_require(data.non_ultra_joiner_output_count > 0);
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index 7f27e70ace25..ee607b13efb2 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -6053,7 +6053,7 @@ igt_main
 		gen8_test_single_ctx_render_target_writes_a_counter();
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Test MI REPORT PERF COUNT for Gen 12");
 		igt_subtest_with_dynamic("gen12-mi-rpc") {
 			igt_require(intel_gen(devid) >= 12);
@@ -6079,7 +6079,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Verify invalid class instance");
 		igt_subtest("gen12-invalid-class-instance") {
 			igt_require(i915_perf_revision(drm_fd) >= 6);
@@ -6117,7 +6117,7 @@ igt_main
 		__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 			test_stress_open_close(e);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Verify invalid SSEU opening parameters");
 		igt_subtest_with_dynamic("global-sseu-config-invalid") {
 			igt_require(i915_perf_revision(drm_fd) >= 4);
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 20e68e4b10fd..f7d3e0cefbd5 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -2423,7 +2423,7 @@ igt_main
 	 * Check that reported usage is correct when PMU is
 	 * enabled after two batches are running.
 	 */
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() gem_require_contexts(fd);
 
 		test_each_engine("busy-double-start", fd, ctx, e)
@@ -2437,7 +2437,7 @@ igt_main
 	test_each_engine("enable-race", fd, ctx, e)
 		test_enable_race(fd, ctx, e);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const unsigned int pct[] = { 2, 50, 98 };
 
 		/**
@@ -2537,7 +2537,7 @@ igt_main
 	/**
 	 * Check render nodes are counted.
 	 */
-	igt_subtest_group {
+	igt_subtest_group() {
 		int render_fd = -1;
 		const intel_ctx_t *render_ctx = NULL;
 
diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c
index 2777d0aa92e6..ee4c7c73ab2c 100644
--- a/tests/intel/prime_busy.c
+++ b/tests/intel/prime_busy.c
@@ -159,7 +159,7 @@ igt_main
 		ctx = intel_ctx_create_all_physical(fd);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const struct mode {
 			const char *name;
 			unsigned int flags;
diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 6e5409df4ff0..fa4d5361cad9 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2830,7 +2830,7 @@ igt_main
 		test_basic_sessions_th(fd, 0, 1, true);
 
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		uint32_t flags[] = {0, TEST_FAULTABLE};
 		const char *suffix[] = {"", "-faultable"};
 
@@ -2926,7 +2926,7 @@ igt_main
 		drm_close_driver(fd);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			gpu_count = drm_prepare_filtered_multigpu(DRIVER_XE);
 
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 470d94022a45..a3e8d60953c9 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -2637,7 +2637,7 @@ igt_main
 	test_gt_render_or_compute("interrupt-other-debuggable", fd, hwe)
 		test_interrupt_other(fd, hwe, SHADER_LOOP);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		test_gt_render_or_compute("interrupt-other", fd, hwe) {
 			engine_class = hwe->engine_class;
 
diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index cf8a9800ceed..f612fdf196bf 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -239,7 +239,7 @@ igt_main
 		igt_waitchildren();
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			int sys_fd = igt_sysfs_open(xe);
 
diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
index 7f739b120fa6..e3afa372776f 100644
--- a/tests/intel/xe_exec_sip_eudebug.c
+++ b/tests/intel/xe_exec_sip_eudebug.c
@@ -324,7 +324,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 
 	/* Debugger disabled (TD_CTL not set) */
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			was_enabled = xe_eudebug_enable(fd, false);
 			igt_require(!xe_eudebug_debugger_available(fd));
@@ -341,7 +341,7 @@ igt_main
 	}
 
 	/* Debugger enabled (TD_CTL set) */
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			was_enabled = xe_eudebug_enable(fd, true);
 		}
diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index c9c00ee894a2..5952ce0bdd69 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -458,7 +458,7 @@ igt_main
 		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		int fw_handle = -1;
 
 		igt_subtest("pci-membarrier") {
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index c9507b583e91..9da5eb5a63b5 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -5131,7 +5131,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 	igt_subtest("short-reads")
 		test_short_reads();
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_subtest_with_dynamic("mi-rpc")
 			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
 				test_mi_rpc(oau);
@@ -5150,7 +5150,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_subtest("oa-unit-exclusive-stream-sample-oa")
 			test_oa_unit_exclusive_stream(true);
 
@@ -5185,7 +5185,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 	igt_subtest("whitelisted-registers-userspace-config")
 		test_whitelisted_registers_userspace_config();
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_subtest_with_dynamic("map-oa-buffer")
 			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
 				test_mapped_oa_buffer(check_reports_from_mapped_buffer, oau);
@@ -5219,7 +5219,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 			test_tail_address_wrap(oau, buf_sizes[k].size);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			perf_init_whitelist();
 		}
@@ -5241,7 +5241,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(oau->capabilities & DRM_XE_OA_CAPS_SYNCS);
 		}
diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index d3cf7ca00fbf..96723ec867e1 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -1130,7 +1130,7 @@ igt_main
 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const unsigned int percent[] = { 2, 50, 90 };
 
 		for (unsigned int i = 0; i < ARRAY_SIZE(percent); i++) {
@@ -1152,7 +1152,7 @@ igt_main
 	test_each_engine("engine-activity-multi-client", fd, eci)
 		engine_activity_multi_client(fd, eci);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		int render_fd;
 
 		igt_fixture() {
@@ -1176,7 +1176,7 @@ igt_main
 			drm_close_driver(render_fd);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		unsigned int num_fns;
 
 		igt_fixture()
@@ -1202,7 +1202,7 @@ igt_main
 			unprovision_and_disable_vfs(fd);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		bool has_freq0_node, needs_freq_restore = false;
 		uint32_t *stash_min, *stash_max;
 
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 88db5cecc3cf..cae8f5a7e73c 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -1116,7 +1116,7 @@ igt_main
 			igt_install_exit_handler(exit_handler);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Verify PXP allocations work as expected");
 		igt_subtest("pxp-bo-alloc")
 			test_pxp_bo_alloc(xe_fd, pxp_supported);
@@ -1125,7 +1125,7 @@ igt_main
 			test_pxp_queue_creation(xe_fd, pxp_supported);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Verify protected render operations:");
 		igt_subtest("regular-src-to-pxp-dest-rendercopy") {
 			require_pxp_render(xe_fd, pxp_supported);
@@ -1137,7 +1137,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		const struct mode {
 			enum termination_type type;
 			const char *tag;
@@ -1159,7 +1159,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_display_t display;
 
 		igt_describe("Test the flip of PXP objects to display");
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 3f9c5fef4121..9699bd8398c1 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -477,7 +477,7 @@ static void tiling_tests(int fd)
 	f.pixel_format = DRM_FORMAT_XRGB8888;
 	f.pitches[0] = 1024*4;
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require_intel(fd);
 			tiled_x_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
@@ -704,7 +704,7 @@ static void addfb25_tests(int fd)
 		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require_intel(fd);
 			if (is_i915_device(fd)) {
@@ -989,22 +989,22 @@ igt_main
 		igt_require(has_addfb2_iface(fd));
 	}
 
-	igt_subtest_group
+	igt_subtest_group()
 		invalid_tests(fd);
 
-	igt_subtest_group
+	igt_subtest_group()
 		pitch_tests(fd);
 
-	igt_subtest_group
+	igt_subtest_group()
 		prop_tests(fd);
 
-	igt_subtest_group
+	igt_subtest_group()
 		master_tests(fd);
 
-	igt_subtest_group
+	igt_subtest_group()
 		tiling_tests(fd);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture()
 			igt_display_require(&display, fd);
 
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index ae64574a89fa..c1be4c5a947d 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -1087,7 +1087,7 @@ igt_main
 	}
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture()
 			require_monotonic_timestamp(data.drm_fd);
 
diff --git a/tests/kms_color.c b/tests/kms_color.c
index ab3c0caea475..5ffc9ddadd19 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1184,10 +1184,10 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 	}
 
-	igt_subtest_group
+	igt_subtest_group()
 		run_tests_for_pipe(&data);
 
-	igt_subtest_group
+	igt_subtest_group()
 		run_invalid_tests_for_pipe(&data);
 
 	igt_fixture() {
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 38de54da1547..f0c2993598e7 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -995,7 +995,7 @@ igt_main
 		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture()
 			igt_require(data.display.is_atomic);
 
@@ -1018,7 +1018,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture()
 			igt_require(data.display.is_atomic);
 
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 1cbf26f55663..bb3bbd5cb7b6 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -1226,7 +1226,7 @@ static void run_tests_on_pipe(data_t *data)
 		int w = cursor_size;
 		int h = cursor_size;
 
-		igt_subtest_group
+		igt_subtest_group()
 			run_size_tests(data, w, h);
 
 		/*
@@ -1236,7 +1236,7 @@ static void run_tests_on_pipe(data_t *data)
 		 */
 		h /= 3;
 
-		igt_subtest_group
+		igt_subtest_group()
 			run_size_tests(data, w, h);
 	}
 
@@ -1300,7 +1300,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	data.cursor_max_w = cursor_width;
 	data.cursor_max_h = cursor_height;
 
-	igt_subtest_group
+	igt_subtest_group()
 		run_tests_on_pipe(&data);
 
 	igt_fixture() {
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index d5d564410756..fea50b3b1b16 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1858,7 +1858,7 @@ igt_main
 
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
 		     "on single/all pipes with different modes, priority and number of processes");
-	igt_subtest_group {
+	igt_subtest_group() {
 		enum pipe n;
 		struct {
 			const char *name;
@@ -1891,7 +1891,7 @@ igt_main
 
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
 		    "on all pipes with different modes, priority and number of processes");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture()
 			igt_display_require_output(&display);
 
@@ -1904,7 +1904,7 @@ igt_main
 
 	igt_describe("Test changes the cursor hotspot and checks that the "
 		      "property is updated accordignly");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture()
 			igt_display_require_output(&display);
 
@@ -1915,7 +1915,7 @@ igt_main
 
 	igt_describe("This test executes flips on both CRTCs "
 		     "while running cursor updates in parallel");
-	igt_subtest_group {
+	igt_subtest_group() {
 		struct {
 			const char *name;
 			int nloops;
@@ -1944,7 +1944,7 @@ igt_main
 
 	igt_describe("This test executes flips on both CRTCs "
 		     "while running cursor updates in parallel");
-	igt_subtest_group {
+	igt_subtest_group() {
 		struct {
 			const char *name;
 			int nloops;
@@ -1968,7 +1968,7 @@ igt_main
 	}
 
 	igt_describe("Test will first does a page flip and then cursor update");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require_pipe_crc(display.drm_fd);
 			igt_display_require_output(&display);
@@ -1982,7 +1982,7 @@ igt_main
 	}
 
 	igt_describe("this test perform a busy bo update followed by a cursor update");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require_intel(display.drm_fd);
 			igt_require_pipe_crc(display.drm_fd);
@@ -2001,7 +2001,7 @@ igt_main
 		"* atomic-transition: alternates between a full screen sprite plane "
 			"and full screen primary plane.\n"
 		"* toggle: which toggles cursor visibility and make sure cursor moves between updates.");
-	igt_subtest_group {
+	igt_subtest_group() {
 		struct {
 			const char *name;
 			enum basic_flip_cursor order;
@@ -2043,7 +2043,7 @@ igt_main
 
 	igt_describe("The essence of the basic test is that neither the cursor nor the "
 		     "nonblocking flip stall the application of the next");
-	igt_subtest_group {
+	igt_subtest_group() {
 		struct {
 			const char *name;
 			int cursor_pipe;
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index c5b33aaa4eef..6dea20541b16 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -80,7 +80,7 @@ igt_main {
 		debugfs_fd = igt_debugfs_dir(fd);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_display_require(&display, fd);
 		}
@@ -90,7 +90,7 @@ igt_main {
 			/* will skip because of the fixture */
 		}
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			volatile int output_count = 0;
 			igt_output_t *output;
 			enum pipe pipe;
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 0f89c54728cc..7bb8e2839f8c 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -436,16 +436,16 @@ igt_main
 		igt_display_require(&display, fd);
 	}
 
-	igt_subtest_group
+	igt_subtest_group()
 		test_handle_input(&display);
 
-	igt_subtest_group
+	igt_subtest_group()
 		test_duplicate_handles(&display);
 
-	igt_subtest_group
+	igt_subtest_group()
 		test_getfb2(&display);
 
-	igt_subtest_group
+	igt_subtest_group()
 		test_handle_protection();
 
 	igt_fixture() {
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index f8c3dda99c24..cd1c6fb6cf0c 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1252,7 +1252,7 @@ igt_main
 	}
 
 	//Display dependent subtests
-	igt_subtest_group {
+	igt_subtest_group() {
 
 		const struct {
 			const char *name;
@@ -1312,7 +1312,7 @@ igt_main
 	}
 
 	//Display independent subtests
-	igt_subtest_group {
+	igt_subtest_group() {
 
 		igt_describe("Tests error handling while creating invalid corner-cases for "
 			     "create-lease ioctl");
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index cdfcc60ef43b..9ca958866897 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1360,7 +1360,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_require(data.display.is_atomic);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_output_t *output;
 
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
@@ -1607,7 +1607,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_subtest_group
+	igt_subtest_group()
 		invalid_parameter_tests(&data);
 
 	igt_describe("Tests scaling with multi-pipe.");
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 6f8c24e86a1b..fb7320d2bf58 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -567,7 +567,7 @@ igt_main
 	}
 
 	igt_describe("Hybrid GPU subtests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			second_fd_hybrid = __drm_open_driver_another(1, DRIVER_ANY);
 			igt_require(second_fd_hybrid >= 0);
@@ -630,7 +630,7 @@ igt_main
 	}
 
 	igt_describe("VGEM subtests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			second_fd_vgem = __drm_open_driver_another(1, DRIVER_VGEM);
 			igt_require(second_fd_vgem >= 0);
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 68091e043b24..b17032d6cad6 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -862,7 +862,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Checks each property of any type with combination of mode object "
 			     "with legacy commit and make sure only valid properties are set to "
 			     "mode object else return with relevant error");
@@ -876,7 +876,7 @@ igt_main
 			invalid_properties(&display, true);
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_describe("Test validates the properties of all planes, crtc and connectors with legacy commit");
 		igt_subtest("get_properties-sanity-non-atomic") {
 			if (display.is_atomic)
@@ -887,7 +887,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture()
 			igt_require(display.is_atomic);
 
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 804c0114ee8f..81101ea33c36 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1184,7 +1184,7 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 	igt_subtest_with_dynamic("max-min")
 		run_vrr_test(&data, test_basic, TEST_MAXMIN);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture()
 			igt_require_intel(data.drm_fd);
 
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 7bcd731faeb9..19b0839261ff 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -1213,7 +1213,7 @@ igt_main
 	}
 
 	/* Fence testing */
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(vgem_has_fences(vgem));
 		}
@@ -1236,7 +1236,7 @@ igt_main
 		igt_subtest("basic-fence-flip")
 			test_flip(i915, vgem, 0);
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				igt_require(vgem_fence_has_flag(vgem, WIP_VGEM_FENCE_NOTIMEOUT));
 			}
@@ -1257,7 +1257,7 @@ igt_main
 	}
 
 	/* Fence testing, requires multiprocess allocator */
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(vgem_has_fences(vgem));
 			intel_allocator_multiprocess_start();
diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index 96d0d77ad840..35739b0e82c1 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -559,7 +559,7 @@ igt_main
 	igt_subtest("busy-fence")
 		test_busy_fence(fd);
 
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			igt_require(has_prime_export(fd));
 		}
@@ -574,7 +574,7 @@ igt_main
 		igt_subtest("dmabuf-mmap")
 			test_dmabuf_mmap(fd);
 
-		igt_subtest_group {
+		igt_subtest_group() {
 			igt_fixture() {
 				igt_require(vgem_has_fences(fd));
 			}
diff --git a/tests/vmwgfx/vmw_prime.c b/tests/vmwgfx/vmw_prime.c
index 4265a13943f0..5346ed4336bf 100644
--- a/tests/vmwgfx/vmw_prime.c
+++ b/tests/vmwgfx/vmw_prime.c
@@ -557,7 +557,7 @@ igt_main
 	}
 
 	igt_describe("VGEM subtests");
-	igt_subtest_group {
+	igt_subtest_group() {
 		igt_fixture() {
 			second_fd_vgem =
 				__drm_open_driver_another(1, DRIVER_VGEM);
-- 
2.49.1

