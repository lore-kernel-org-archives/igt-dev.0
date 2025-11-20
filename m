Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5135BCFA443
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 19:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080EA10E7D0;
	Thu, 20 Nov 2025 19:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Or3bgNnN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232CC10E7CF
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 19:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763666091; x=1795202091;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eLeUg7ALG4P5vMrUb4PEqOY6wwcrRB8bCYHX15hTscA=;
 b=Or3bgNnNUwaheOA5C9fALbnQrzgvXHsEqXMxGd0sBgD8rQm4W60uQA2F
 jk3hFmj/CRkiK3v9/X7Ny4Wwbp4C7pdOstJF5uODdwtIPi4JECDHBdrWu
 mhpPquigYimMuMTlcggWBFRtaTZj6TiqEH8lT9zy1gUG/d6gKaYsG0qmi
 sbch3DWz6wnGY4keWnerYMVCDttFgd9KAb5l4tSkU7MbwB1ocvf7HLat6
 PoQJo5cU5109CtV7AHNkk7S3P8kWGpt5fG/x8HTfeCmmcDjfwuyCiHmVo
 lCu4b6jpma0QdxylBjKTth9L++5h5PDLEgpeKgB3jh6I/AfG1LmKicS0u g==;
X-CSE-ConnectionGUID: Hgv6e3lBRhGfGiK/Cma1ig==
X-CSE-MsgGUID: atRgX8CuRj2ugZ+GlgJWoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65838684"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65838684"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:51 -0800
X-CSE-ConnectionGUID: q33Dge+GTkK6ynf4j791KQ==
X-CSE-MsgGUID: wRi+luj+Qg60yBGZQZU6nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191308160"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:50 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 6/7] igt: Make igt_simple_main*() look like normal
 function definition
Date: Thu, 20 Nov 2025 21:14:14 +0200
Message-ID: <20251120191415.4236-7-ville.syrjala@linux.intel.com>
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

Coccinelle chokes on igt_simple_main*() because it looks like
a function definition without a type. Make it look like
a normal thing by moving the type out of the macro.

The macro still needs the __real_main forward declaration
so we can't actually expose the type from the main()
definition, but we can add a forward declaration for main()
ahead of the __real_main declaration, and if we leave out
the type there it must be placed into the place where
igt_simple_main*() is used.

The bulk conversion was done with sed:
$ find -type f -name \*.[ch] -exec sed -i 's/^igt_simple_main/int igt_simple_main/g' {} +

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 benchmarks/kms_fb_stress.c               | 2 +-
 lib/igt_core.h                           | 1 +
 lib/tests/igt_can_fail_simple.c          | 2 +-
 lib/tests/igt_edid.c                     | 2 +-
 lib/tests/igt_facts.c                    | 2 +-
 lib/tests/igt_simple_test_subtests.c     | 2 +-
 lib/tests/igt_stats.c                    | 2 +-
 lib/tests/igt_timeout.c                  | 2 +-
 runner/testdata/abort-simple.c           | 2 +-
 runner/testdata/no-subtests.c            | 2 +-
 tests/core_setmaster_vs_auth.c           | 2 +-
 tests/intel/gem_exec_lut_handle.c        | 2 +-
 tests/intel/gem_fd_exhaustion.c          | 2 +-
 tests/intel/gem_gtt_cpu_tlb.c            | 2 +-
 tests/intel/gem_gtt_hog.c                | 2 +-
 tests/intel/gem_gtt_speed.c              | 2 +-
 tests/intel/gem_lut_handle.c             | 2 +-
 tests/intel/gem_media_vme.c              | 2 +-
 tests/intel/gem_pwrite_snooped.c         | 2 +-
 tests/intel/gem_set_tiling_vs_gtt.c      | 2 +-
 tests/intel/gem_set_tiling_vs_pwrite.c   | 2 +-
 tests/intel/gem_stress.c                 | 2 +-
 tests/intel/gem_tiled_pread_basic.c      | 2 +-
 tests/intel/gem_tiled_pread_pwrite.c     | 2 +-
 tests/intel/gem_tiled_wb.c               | 2 +-
 tests/intel/gem_tiled_wc.c               | 2 +-
 tests/intel/gem_tiling_max_stride.c      | 2 +-
 tests/intel/gem_unfence_active_buffers.c | 2 +-
 tests/intel/gem_unref_active_buffers.c   | 2 +-
 tests/intel/gen3_mixed_blits.c           | 2 +-
 tests/intel/gen3_render_linear_blits.c   | 2 +-
 tests/intel/gen3_render_mixed_blits.c    | 2 +-
 tests/intel/gen3_render_tiledx_blits.c   | 2 +-
 tests/intel/gen3_render_tiledy_blits.c   | 2 +-
 tests/intel/i915_pciid.c                 | 2 +-
 tests/intel/kms_fence_pin_leak.c         | 2 +-
 tests/intel/kms_pwrite_crc.c             | 2 +-
 tests/kms_dp_aux_dev.c                   | 2 +-
 tests/kms_sysfs_edid_timing.c            | 2 +-
 tests/prime_udl.c                        | 2 +-
 tests/testdisplay.c                      | 2 +-
 41 files changed, 41 insertions(+), 40 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index dff1467d840a..49ca5c7239d7 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -139,7 +139,7 @@ static struct kms_t default_kms = {
 };
 
 
-igt_simple_main()
+int igt_simple_main()
 {
 	struct data_t data = {0};
 	enum pipe pipe = PIPE_NONE;
diff --git a/lib/igt_core.h b/lib/igt_core.h
index fac27608986c..6845f853c980 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -483,6 +483,7 @@ void igt_simple_init_parse_opts(int *argc, char **argv,
  * #igt_simple_init_parse_opts.
  */
 #define igt_simple_main_args(short_opts, long_opts, help_str, opt_handler, handler_data) \
+	main(int argc, char **argv); \
 	static void igt_unique(__real_main)(void); \
 	int main(int argc, char **argv) { \
 		igt_simple_init_parse_opts(&argc, argv, \
diff --git a/lib/tests/igt_can_fail_simple.c b/lib/tests/igt_can_fail_simple.c
index 0f8d993d3464..98405f5a2537 100644
--- a/lib/tests/igt_can_fail_simple.c
+++ b/lib/tests/igt_can_fail_simple.c
@@ -26,7 +26,7 @@
 
 #include "igt_tests_common.h"
 
-igt_simple_main()
+int igt_simple_main()
 {
 	internal_assert(igt_can_fail());
 }
diff --git a/lib/tests/igt_edid.c b/lib/tests/igt_edid.c
index 00feac3564a1..c358f759af11 100644
--- a/lib/tests/igt_edid.c
+++ b/lib/tests/igt_edid.c
@@ -66,7 +66,7 @@ static bool edid_block_checksum(const unsigned char *raw_edid)
 
 typedef const struct edid *(*get_edid_func)(void);
 
-igt_simple_main()
+int igt_simple_main()
 {
 	const struct {
 		const char *desc;
diff --git a/lib/tests/igt_facts.c b/lib/tests/igt_facts.c
index 3433244c6478..3ee4784643e4 100644
--- a/lib/tests/igt_facts.c
+++ b/lib/tests/igt_facts.c
@@ -10,7 +10,7 @@
 
 /* Tests are not defined here so we can keep most of the functions static */
 
-igt_simple_main()
+int igt_simple_main()
 {
 	igt_info("Running igt_facts_test\n");
 
diff --git a/lib/tests/igt_simple_test_subtests.c b/lib/tests/igt_simple_test_subtests.c
index e153d3883efb..71d5133ec0dd 100644
--- a/lib/tests/igt_simple_test_subtests.c
+++ b/lib/tests/igt_simple_test_subtests.c
@@ -23,7 +23,7 @@
 
 #include "igt_core.h"
 
-igt_simple_main()
+int igt_simple_main()
 {
 	igt_subtest("subtest") {
 		igt_info("Invalid subtest.\n");
diff --git a/lib/tests/igt_stats.c b/lib/tests/igt_stats.c
index d0c0ac6d3530..f4c09e22fa25 100644
--- a/lib/tests/igt_stats.c
+++ b/lib/tests/igt_stats.c
@@ -228,7 +228,7 @@ static void test_reallocation(void)
 	igt_stats_fini(&stats);
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	test_init_zero();
 	test_init();
diff --git a/lib/tests/igt_timeout.c b/lib/tests/igt_timeout.c
index 171bf15b82f6..48a8882ad9ef 100644
--- a/lib/tests/igt_timeout.c
+++ b/lib/tests/igt_timeout.c
@@ -1,7 +1,7 @@
 #include "igt_core.h"
 #include <unistd.h>
 
-igt_simple_main()
+int igt_simple_main()
 {
 	igt_set_timeout(1, "Testcase");
 	sleep(5);
diff --git a/runner/testdata/abort-simple.c b/runner/testdata/abort-simple.c
index 88512ece9388..2d9912b8035f 100644
--- a/runner/testdata/abort-simple.c
+++ b/runner/testdata/abort-simple.c
@@ -23,7 +23,7 @@
 
 #include "igt.h"
 
-igt_simple_main()
+int igt_simple_main()
 {
 	igt_abort_on_f(true, "I'm out!\n");
 }
diff --git a/runner/testdata/no-subtests.c b/runner/testdata/no-subtests.c
index ea517b69e1ef..bfbd80aa5e62 100644
--- a/runner/testdata/no-subtests.c
+++ b/runner/testdata/no-subtests.c
@@ -1,6 +1,6 @@
 #include "igt.h"
 
-igt_simple_main()
+int igt_simple_main()
 {
 
 }
diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
index 6867e46aeca5..5e39bffef379 100644
--- a/tests/core_setmaster_vs_auth.c
+++ b/tests/core_setmaster_vs_auth.c
@@ -57,7 +57,7 @@
 IGT_TEST_DESCRIPTION("Check that drop/setMaster correctly transfer master "
 		     "state");
 
-igt_simple_main()
+int igt_simple_main()
 {
 	int master1, master2, client;
 	drm_magic_t magic;
diff --git a/tests/intel/gem_exec_lut_handle.c b/tests/intel/gem_exec_lut_handle.c
index 8abe1ca4f8fc..fac7f2fbb45f 100644
--- a/tests/intel/gem_exec_lut_handle.c
+++ b/tests/intel/gem_exec_lut_handle.c
@@ -88,7 +88,7 @@ static int has_exec_lut(int fd)
 }
 
 #define ELAPSED(a,b) (1e6*((b)->tv_sec - (a)->tv_sec) + ((b)->tv_usec - (a)->tv_usec))
-igt_simple_main()
+int igt_simple_main()
 {
 	uint32_t batch[2] = {MI_BATCH_BUFFER_END};
 	uint32_t cycle[16];
diff --git a/tests/intel/gem_fd_exhaustion.c b/tests/intel/gem_fd_exhaustion.c
index 1c35614af49b..cb7b907e7b60 100644
--- a/tests/intel/gem_fd_exhaustion.c
+++ b/tests/intel/gem_fd_exhaustion.c
@@ -44,7 +44,7 @@
  * SUBTEST:
  */
 
-igt_simple_main()
+int igt_simple_main()
 {
 	int fd;
 
diff --git a/tests/intel/gem_gtt_cpu_tlb.c b/tests/intel/gem_gtt_cpu_tlb.c
index 1ee0732ad34b..d3657687f58b 100644
--- a/tests/intel/gem_gtt_cpu_tlb.c
+++ b/tests/intel/gem_gtt_cpu_tlb.c
@@ -82,7 +82,7 @@ create_bo(int fd)
 	return handle;
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	int fd;
 	int i;
diff --git a/tests/intel/gem_gtt_hog.c b/tests/intel/gem_gtt_hog.c
index b4226ac232c1..c2853665fbbe 100644
--- a/tests/intel/gem_gtt_hog.c
+++ b/tests/intel/gem_gtt_hog.c
@@ -163,7 +163,7 @@ static void run(data_t *data, int child)
 	igt_assert_eq_u32(x, canary);
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	struct timeval start, end;
 	pid_t children[64];
diff --git a/tests/intel/gem_gtt_speed.c b/tests/intel/gem_gtt_speed.c
index 0f4e174d2e32..eb82fa051c0d 100644
--- a/tests/intel/gem_gtt_speed.c
+++ b/tests/intel/gem_gtt_speed.c
@@ -114,7 +114,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 
 const char *help_str = "  -s\tObject size in bytes\n";
 
-igt_simple_main_args("s:", NULL, help_str, opt_handler, NULL)
+int igt_simple_main_args("s:", NULL, help_str, opt_handler, NULL)
 {
 	struct timeval start, end;
 	uint8_t *buf;
diff --git a/tests/intel/gem_lut_handle.c b/tests/intel/gem_lut_handle.c
index 183da9620d44..dc98722dc916 100644
--- a/tests/intel/gem_lut_handle.c
+++ b/tests/intel/gem_lut_handle.c
@@ -173,7 +173,7 @@ static int many_exec(int fd, uint32_t batch, int num_exec, int num_reloc, unsign
 #define fail(x) igt_assert((x) == -ENOENT)
 #define pass(x) igt_assert((x) == 0)
 
-igt_simple_main()
+int igt_simple_main()
 {
 	uint32_t batch[2] = {MI_BATCH_BUFFER_END};
 	uint32_t handle;
diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
index 0d3d19eef67a..e47f4df21227 100644
--- a/tests/intel/gem_media_vme.c
+++ b/tests/intel/gem_media_vme.c
@@ -102,7 +102,7 @@ static void shut_non_vme_subslices(int drm_fd, uint32_t ctx)
 	gem_context_set_param(drm_fd, &arg);
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	struct buf_ops *bops;
 	struct intel_buf src, dst;
diff --git a/tests/intel/gem_pwrite_snooped.c b/tests/intel/gem_pwrite_snooped.c
index fc89310824fe..809af7c03d1a 100644
--- a/tests/intel/gem_pwrite_snooped.c
+++ b/tests/intel/gem_pwrite_snooped.c
@@ -139,7 +139,7 @@ static void test(int w, int h)
 	intel_buf_destroy(dst);
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	fd = drm_open_driver(DRIVER_INTEL);
 	igt_require_gem(fd);
diff --git a/tests/intel/gem_set_tiling_vs_gtt.c b/tests/intel/gem_set_tiling_vs_gtt.c
index 8c29b69b0388..91e7d8c2e86a 100644
--- a/tests/intel/gem_set_tiling_vs_gtt.c
+++ b/tests/intel/gem_set_tiling_vs_gtt.c
@@ -59,7 +59,7 @@ IGT_TEST_DESCRIPTION("Check set_tiling vs gtt mmap coherency.");
  * Testcase: Check set_tiling vs gtt mmap coherency
  */
 
-igt_simple_main()
+int igt_simple_main()
 {
 	int fd;
 	uint32_t *ptr;
diff --git a/tests/intel/gem_set_tiling_vs_pwrite.c b/tests/intel/gem_set_tiling_vs_pwrite.c
index 7a6ed8cea8cd..d89bceac365d 100644
--- a/tests/intel/gem_set_tiling_vs_pwrite.c
+++ b/tests/intel/gem_set_tiling_vs_pwrite.c
@@ -59,7 +59,7 @@ IGT_TEST_DESCRIPTION("Check set_tiling vs pwrite coherency.");
  * Testcase: Check set_tiling vs pwrite coherency
  */
 
-igt_simple_main()
+int igt_simple_main()
 {
 	uint32_t data[OBJECT_SIZE/4];
 	uint32_t *ptr;
diff --git a/tests/intel/gem_stress.c b/tests/intel/gem_stress.c
index dfdea74ce4b4..1a19b25e3efe 100644
--- a/tests/intel/gem_stress.c
+++ b/tests/intel/gem_stress.c
@@ -878,7 +878,7 @@ static struct option long_options[] = {
 	{NULL, 0, 0, 0},
 };
 
-igt_simple_main_args("ds:g:c:t:rbuxmo:fp:",
+int igt_simple_main_args("ds:g:c:t:rbuxmo:fp:",
 		     long_options, NULL, parse_options, NULL)
 {
 	int i, j;
diff --git a/tests/intel/gem_tiled_pread_basic.c b/tests/intel/gem_tiled_pread_basic.c
index e5f9c2a301ce..9b5d828654e9 100644
--- a/tests/intel/gem_tiled_pread_basic.c
+++ b/tests/intel/gem_tiled_pread_basic.c
@@ -127,7 +127,7 @@ calculate_expected(int offset, struct offset *dbg)
 	return (dbg->base_y + dbg->tile_y) * WIDTH + dbg->base_x + dbg->tile_x;
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	int fd;
 	int i, iter = 100;
diff --git a/tests/intel/gem_tiled_pread_pwrite.c b/tests/intel/gem_tiled_pread_pwrite.c
index 659e521f2c6c..5dcae4b75c97 100644
--- a/tests/intel/gem_tiled_pread_pwrite.c
+++ b/tests/intel/gem_tiled_pread_pwrite.c
@@ -117,7 +117,7 @@ static void copy_wc_page(void *dst, const void *src)
 	igt_memcpy_from_wc(dst, src, PAGE_SIZE);
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	uint32_t tiling, swizzle;
 	int count;
diff --git a/tests/intel/gem_tiled_wb.c b/tests/intel/gem_tiled_wb.c
index 38838b00f782..05712f881b62 100644
--- a/tests/intel/gem_tiled_wb.c
+++ b/tests/intel/gem_tiled_wb.c
@@ -146,7 +146,7 @@ get_tiling(int fd, uint32_t handle, uint32_t *tiling, uint32_t *swizzle)
 	*swizzle = arg.swizzle_mode;
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	int fd;
 	int i, iter = 100;
diff --git a/tests/intel/gem_tiled_wc.c b/tests/intel/gem_tiled_wc.c
index 71517b018a6f..9675217f3cdf 100644
--- a/tests/intel/gem_tiled_wc.c
+++ b/tests/intel/gem_tiled_wc.c
@@ -148,7 +148,7 @@ calculate_expected(int offset)
 	return (base_y + tile_y) * WIDTH + base_x + tile_x;
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	uint32_t tiling, swizzle;
 	uint32_t handle;
diff --git a/tests/intel/gem_tiling_max_stride.c b/tests/intel/gem_tiling_max_stride.c
index 56081b76478f..d01c21bcae6b 100644
--- a/tests/intel/gem_tiling_max_stride.c
+++ b/tests/intel/gem_tiling_max_stride.c
@@ -68,7 +68,7 @@ static void test_invalid_tiling(int fd, uint32_t handle, int stride)
  * Testcase: Check that max fence stride works
  */
 
-igt_simple_main()
+int igt_simple_main()
 {
 	int fd;
 	uint32_t *ptr;
diff --git a/tests/intel/gem_unfence_active_buffers.c b/tests/intel/gem_unfence_active_buffers.c
index 36d2b772d6ba..924afcbc8cd7 100644
--- a/tests/intel/gem_unfence_active_buffers.c
+++ b/tests/intel/gem_unfence_active_buffers.c
@@ -76,7 +76,7 @@ static uint32_t create_tiled(int i915)
 	return handle;
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	int i915, num_fences;
 	igt_spin_t *spin;
diff --git a/tests/intel/gem_unref_active_buffers.c b/tests/intel/gem_unref_active_buffers.c
index cbde235a48e3..a778c68818cb 100644
--- a/tests/intel/gem_unref_active_buffers.c
+++ b/tests/intel/gem_unref_active_buffers.c
@@ -74,7 +74,7 @@ static void alarm_handler(int sig)
 {
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	struct sigaction old_sa, sa = { .sa_handler = alarm_handler };
 	unsigned int last[2]= { -1, -1 }, count;
diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
index 466e95500dd7..7622b71bd935 100644
--- a/tests/intel/gen3_mixed_blits.c
+++ b/tests/intel/gen3_mixed_blits.c
@@ -455,7 +455,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 }
 
 
-igt_simple_main()
+int igt_simple_main()
 {
 	uint32_t *handle, *tiling, *start_val;
 	uint32_t start = 0;
diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
index c5f4cd3d8f3d..aaf95d8d82a6 100644
--- a/tests/intel/gen3_render_linear_blits.c
+++ b/tests/intel/gen3_render_linear_blits.c
@@ -327,7 +327,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 	}
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	uint32_t *handle, *start_val;
 	uint32_t start = 0;
diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
index b3a06d3879f7..c441ae89f377 100644
--- a/tests/intel/gen3_render_mixed_blits.c
+++ b/tests/intel/gen3_render_mixed_blits.c
@@ -348,7 +348,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 	munmap(v, WIDTH*HEIGHT*4);
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	uint32_t *handle, *tiling, *start_val;
 	uint32_t start = 0;
diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
index 4b93d9ee638f..fe926f2325cc 100644
--- a/tests/intel/gen3_render_tiledx_blits.c
+++ b/tests/intel/gen3_render_tiledx_blits.c
@@ -335,7 +335,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 	munmap(v, WIDTH*HEIGHT*4);
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	uint32_t *handle, *start_val;
 	uint32_t start = 0;
diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
index b240c384d3ac..8bec7e425c99 100644
--- a/tests/intel/gen3_render_tiledy_blits.c
+++ b/tests/intel/gen3_render_tiledy_blits.c
@@ -335,7 +335,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 	munmap(v, WIDTH*HEIGHT*4);
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	uint32_t *handle, *start_val;
 	uint32_t start = 0;
diff --git a/tests/intel/i915_pciid.c b/tests/intel/i915_pciid.c
index 4c21c9603c3d..7325880fc0fa 100644
--- a/tests/intel/i915_pciid.c
+++ b/tests/intel/i915_pciid.c
@@ -71,7 +71,7 @@ static bool has_known_intel_chipset(int fd)
 	return true;
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	int intel = drm_open_driver(DRIVER_INTEL);
 
diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
index f6f05d20e5be..2e3165300eb8 100644
--- a/tests/intel/kms_fence_pin_leak.c
+++ b/tests/intel/kms_fence_pin_leak.c
@@ -227,7 +227,7 @@ static void run_test(data_t *data)
 	igt_skip("no valid crtc/connector combinations found\n");
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	data_t data = {};
 
diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
index e35fccb5c1b7..03944c201f61 100644
--- a/tests/intel/kms_pwrite_crc.c
+++ b/tests/intel/kms_pwrite_crc.c
@@ -190,7 +190,7 @@ static void run_test(data_t *data)
 
 static data_t data;
 
-igt_simple_main()
+int igt_simple_main()
 {
 	data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 	kmstest_set_vt_graphics_mode();
diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index 55012ff0ec7b..b09669a34bf5 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -144,7 +144,7 @@ static bool test(int drm_fd, uint32_t connector_id)
 	return false;
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	int valid_connectors = 0;
 	drmModeRes *res;
diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index 2b376015d5af..6dbd762e4b9e 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -57,7 +57,7 @@ IGT_TEST_DESCRIPTION("This test checks the time it takes to reprobe each "
 		     "make sure that the mean time for all connectors is "
 		     "not too long.");
 
-igt_simple_main()
+int igt_simple_main()
 {
 	DIR *dirp;
 	struct dirent *de;
diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index a383298ac9dc..25950a09d9a9 100644
--- a/tests/prime_udl.c
+++ b/tests/prime_udl.c
@@ -121,7 +121,7 @@ static void test2(void)
 	gem_close(intel_fd, intel_handle);
 }
 
-igt_simple_main()
+int igt_simple_main()
 {
 	igt_assert(find_and_open_devices() >= 0);
 
diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index 5131750ce346..be88d8fb8343 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -708,7 +708,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 	return IGT_OPT_HANDLER_SUCCESS;
 }
 
-igt_simple_main_args(optstr, long_opts, help_str, opt_handler, NULL)
+int igt_simple_main_args(optstr, long_opts, help_str, opt_handler, NULL)
 {
 	int ret = 0;
 	GIOChannel *stdinchannel;
-- 
2.49.1

