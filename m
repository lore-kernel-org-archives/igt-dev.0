Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5106FCCD187
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0310F10E8DD;
	Wed,  8 Oct 2025 21:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2Nq67rO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C0010E8D9
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759957361; x=1791493361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QJTDbUnGhtLgtzAYiAEAG4bmtnPiHmQV4hpuOAq6DiY=;
 b=S2Nq67rOG/SMeXG/VRJNt5Rys/6lm3QSHY60gygC+DgRh7B+TDuVUzlU
 mZcQUrf0zxjQCob7jjyeohHyu2imJnkRxXj9+NiMkwPBL9UwS4Pb6rOuQ
 eA1X1eh8ZyE5wVZUHl++88M3p2o8XnvQBzl+ACX2DKESEgNpqONxJU5Ku
 6NE2Q4hxfH0g2KDEQGcpWZPBxw3Bc6VkX7ACGoviaEVtUvY3CuJjE8D+7
 JYxWreXx1vJBfP27ZclBS7+FPY1Mr1IFOkKczsGG/XHg82lBNC2n/JzEW
 9IMHxLqlG8SS8oGfmc2HkVmHTN+CbHqzcFCtu9AAdoiPdJKHkOgE92ZxN g==;
X-CSE-ConnectionGUID: MCx8ZTksTFijwztV22xMPg==
X-CSE-MsgGUID: LAdvUJPhQDqmzUiEniQ3tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61867752"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="61867752"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:02:40 -0700
X-CSE-ConnectionGUID: PRmqcgnTRSOlXBT3jA+uyA==
X-CSE-MsgGUID: uDWUDpS9SP+hIULSEgiV6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184920017"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.61])
 by fmviesa005.fm.intel.com with ESMTP; 08 Oct 2025 14:02:40 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v3 4/6] tests/intel: Use new APIs for xe device info queries
Date: Wed,  8 Oct 2025 21:02:34 +0000
Message-ID: <20251008210236.396859-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008210236.396859-1-x.wang@intel.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251008210236.396859-1-x.wang@intel.com>
MIME-Version: 1.0
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

Update Intel tests to use new runtime query APIs:
- Replace intel_gen(devid) with intel_query_gen(fd)
- Replace intel_graphics_ver(devid) with intel_query_graphics_ver(fd)
- Replace intel_get_device_info(devid) with intel_query_device_info(fd)

These changes enable runtime device capability queries for xe devices
in test cases, ensuring accurate device feature detection.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/api_intel_allocator.c      |  2 +-
 tests/intel/kms_ccs.c                  | 13 +++------
 tests/intel/kms_draw_crc.c             |  2 +-
 tests/intel/kms_fbcon_fbt.c            |  2 +-
 tests/intel/kms_frontbuffer_tracking.c | 12 ++++----
 tests/intel/kms_pipe_stress.c          |  4 +--
 tests/intel/xe_ccs.c                   | 24 ++++++++--------
 tests/intel/xe_copy_basic.c            |  6 ++--
 tests/intel/xe_debugfs.c               |  3 +-
 tests/intel/xe_eudebug_online.c        |  8 ++----
 tests/intel/xe_exec_store.c            | 17 +++++-------
 tests/intel/xe_fault_injection.c       |  2 +-
 tests/intel/xe_oa.c                    | 38 ++++++++++++++------------
 tests/intel/xe_pat.c                   | 26 ++++++++----------
 14 files changed, 72 insertions(+), 87 deletions(-)

diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index 15ba4828c..2c7205bff 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -624,7 +624,7 @@ static void execbuf_with_allocator(int fd)
 	uint64_t ahnd, sz = 4096, gtt_size;
 	unsigned int flags = EXEC_OBJECT_PINNED;
 	uint32_t *ptr, batch[32], copied;
-	int gen = intel_gen(intel_get_drm_devid(fd));
+	int gen = intel_query_gen(fd);
 	int i;
 	const uint32_t magic = 0x900df00d;
 
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index ab081aa75..dcc0e8b1e 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -565,7 +565,7 @@ static void access_flat_ccs_surface(struct igt_fb *fb, bool verify_compression)
 	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 	uint8_t uc_mocs = intel_get_uc_mocs_index(fb->fd);
 	uint8_t comp_pat_index = intel_get_pat_idx_wt(fb->fd);
-	uint32_t region = (intel_gen(intel_get_drm_devid(fb->fd)) >= 20 &&
+	uint32_t region = (intel_query_gen(fb->fd) >= 20 &&
 			   xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
 
 	struct drm_xe_engine_class_instance inst = {
@@ -645,7 +645,7 @@ static void fill_fb_random(int drm_fd, igt_fb_t *fb)
 	igt_assert_eq(0, gem_munmap(map, fb->size));
 
 	/* randomize also ccs surface on Xe2 */
-	if (intel_gen(intel_get_drm_devid(drm_fd)) >= 20)
+	if (intel_query_gen(drm_fd) >= 20)
 		access_flat_ccs_surface(fb, false);
 }
 
@@ -1125,11 +1125,6 @@ static bool valid_modifier_test(u64 modifier, const enum test_flags flags)
 
 static void test_output(data_t *data, const int testnum)
 {
-	uint16_t dev_id;
-
-	igt_fixture
-		dev_id = intel_get_drm_devid(data->drm_fd);
-
 	data->flags = tests[testnum].flags;
 
 	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
@@ -1143,10 +1138,10 @@ static void test_output(data_t *data, const int testnum)
 		igt_subtest_with_dynamic_f("%s-%s", tests[testnum].testname, ccs_modifiers[i].str) {
 			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
 			    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
-				igt_require_f(intel_gen(dev_id) >= 20,
+				igt_require_f(intel_query_gen(data->drm_fd) >= 20,
 					      "Xe2 platform needed.\n");
 			} else {
-				igt_require_f(intel_gen(dev_id) < 20,
+				igt_require_f(intel_query_gen(data->drm_fd) < 20,
 					      "Older than Xe2 platform needed.\n");
 			}
 
diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index 4877e757c..abfef334f 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -234,7 +234,7 @@ static void fill_fb_subtest(void)
 	struct igt_fb fb;
 	igt_crc_t base_crc, crc;
 	igt_plane_t *primary;
-	bool has_4tile = intel_get_device_info(intel_get_drm_devid(drm_fd))->has_4tile;
+	bool has_4tile = intel_query_device_info(drm_fd)->has_4tile;
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index f3843cdb0..dd9135c97 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -180,7 +180,7 @@ static bool fbc_wait_until_update(struct drm_info *drm)
 	 * For older GENs FBC is still expected to be disabled as it still
 	 * relies on a tiled and fenceable framebuffer to track modifications.
 	 */
-	if (intel_gen(intel_get_drm_devid(drm->fd)) >= 9) {
+	if (intel_query_gen(drm->fd) >= 9) {
 		if (!fbc_wait_until_enabled(drm->debugfs_fd))
 			return false;
 
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index a29da1d43..cb3f81185 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -3012,13 +3012,13 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
 
 	switch (tiling) {
 	case TILING_LINEAR:
-		return intel_gen(drm.devid) >= 9;
+		return intel_query_gen(drm.fd) >= 9;
 	case TILING_X:
-		return (intel_get_device_info(drm.devid)->display_ver > 29) ? false : true;
+		return (intel_query_device_info(drm.fd)->display_ver > 29) ? false : true;
 	case TILING_Y:
 		return true;
 	case TILING_4:
-		return intel_gen(drm.devid) >= 12;
+		return intel_query_gen(drm.fd) >= 12;
 	default:
 		igt_assert(false);
 		return false;
@@ -4416,12 +4416,12 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 					igt_require(igt_draw_supports_method(drm.fd, t.method));
 
 					if (t.tiling == TILING_Y) {
-						igt_require(intel_gen(drm.devid) >= 9);
-						igt_require(!intel_get_device_info(drm.devid)->has_4tile);
+						igt_require(intel_query_gen(drm.fd) >= 9);
+						igt_require(!intel_query_device_info(drm.fd)->has_4tile);
 					}
 
 					if (t.tiling == TILING_4)
-						igt_require(intel_get_device_info(drm.devid)->has_4tile);
+						igt_require(intel_query_device_info(drm.fd)->has_4tile);
 
 					if (tiling_is_valid(t.feature, t.tiling))
 						draw_subtest(&t);
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 193f59d8d..54c453f9a 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -820,7 +820,7 @@ static void prepare_test(struct data *data)
 
 	create_framebuffers(data);
 
-	if (intel_gen(intel_get_drm_devid(data->drm_fd)) > 9)
+	if (intel_query_gen(data->drm_fd) > 9)
 		start_gpu_threads(data);
 }
 
@@ -828,7 +828,7 @@ static void finish_test(struct data *data)
 {
 	int i;
 
-	if (intel_gen(intel_get_drm_devid(data->drm_fd)) > 9)
+	if (intel_query_gen(data->drm_fd) > 9)
 		stop_gpu_threads(data);
 
 	/*
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 61cf97d52..de91cc80b 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -124,11 +124,11 @@ static void surf_copy(int xe,
 	uint32_t sysmem = system_memory(xe);
 	uint8_t comp_pat_index = DEFAULT_PAT_INDEX;
 	uint16_t cpu_caching = __xe_default_cpu_caching(xe, sysmem, 0);
-	uint32_t devid = intel_get_drm_devid(xe);
+	uint32_t gen = intel_query_gen(xe);
 	int result;
 
 	igt_assert(mid->compression);
-	if (intel_gen(devid) >= 20 && mid->compression) {
+	if (gen >= 20 && mid->compression) {
 		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
 		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 	}
@@ -174,10 +174,10 @@ static void surf_copy(int xe,
 
 		munmap(ccsmap2, ccssize);
 		if (blt_platform_has_flat_ccs_enabled(xe)) {
-			if (IS_GEN(devid, 12) && is_intel_dgfx(xe)) {
+			if ((gen == 12) && is_intel_dgfx(xe)) {
 				igt_assert(!strcmp(orig, newsum));
 				igt_assert(!strcmp(orig2, newsum2));
-			} else if (intel_gen(devid) >= 20) {
+			} else if (gen >= 20) {
 				if (is_intel_dgfx(xe)) {
 					/* buffer object would become
 					 * uncompressed in xe2+ dgfx
@@ -227,7 +227,7 @@ static void surf_copy(int xe,
 	 * uncompressed in xe2+ dgfx, and therefore retrieve the
 	 * ccs by copying 0 to ccsmap
 	 */
-	if (suspend_resume && intel_gen(devid) >= 20 && is_intel_dgfx(xe))
+	if (suspend_resume && intel_query_gen(xe) >= 20 && is_intel_dgfx(xe))
 		memset(ccsmap, 0, ccssize);
 	else
 		/* retrieve back ccs */
@@ -353,7 +353,7 @@ static void block_copy(int xe,
 	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = (intel_gen(intel_get_drm_devid(xe)) >= 20 &&
+	uint32_t mid_region = (intel_query_gen(xe) >= 20 &&
 			       !xe_has_vram(xe)) ? region1 : region2;
 	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
@@ -441,7 +441,7 @@ static void block_copy(int xe,
 	if (config->inplace) {
 		uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-		if (intel_gen(intel_get_drm_devid(xe)) >= 20 && config->compression)
+		if (intel_query_gen(xe) >= 20 && config->compression)
 			pat_index = intel_get_pat_idx_uc_comp(xe);
 
 		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
@@ -488,7 +488,7 @@ static void block_multicopy(int xe,
 	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = (intel_gen(intel_get_drm_devid(xe)) >= 20 &&
+	uint32_t mid_region = (intel_query_gen(xe) >= 20 &&
 			       !xe_has_vram(xe)) ? region1 : region2;
 	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
@@ -530,7 +530,7 @@ static void block_multicopy(int xe,
 	if (config->inplace) {
 		uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-		if (intel_gen(intel_get_drm_devid(xe)) >= 20 && config->compression)
+		if (intel_query_gen(xe) >= 20 && config->compression)
 			pat_index = intel_get_pat_idx_uc_comp(xe);
 
 		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
@@ -710,13 +710,13 @@ static void block_copy_test(int xe,
 			    struct igt_collection *set,
 			    enum copy_func copy_function)
 {
-	uint16_t dev_id = intel_get_drm_devid(xe);
+	const struct intel_device_info *devinfo = intel_query_device_info(xe);
 	struct igt_collection *regions;
 	int tiling, width, height;
 
 
-	if (intel_gen(dev_id) >= 20 && config->compression)
-		igt_require(HAS_FLATCCS(dev_id));
+	if (intel_query_gen(xe) >= 20 && config->compression)
+		igt_require(devinfo->has_flatccs);
 
 	if (config->compression && !blt_block_copy_supports_compression(xe))
 		return;
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 09cfa470d..340efaf3b 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -261,7 +261,6 @@ const char *help_str =
 igt_main_args("b", NULL, help_str, opt_handler, NULL)
 {
 	int fd;
-	uint16_t dev_id;
 	struct igt_collection *set, *regions;
 	uint32_t region;
 	struct rect linear[] = { { 0, 0xfd, 1, MODE_BYTE },
@@ -275,7 +274,6 @@ igt_main_args("b", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		dev_id = intel_get_drm_devid(fd);
 		xe_device_get(fd);
 		set = xe_get_memory_region_set(fd,
 					       DRM_XE_MEM_REGION_CLASS_SYSMEM,
@@ -295,7 +293,7 @@ igt_main_args("b", NULL, help_str, opt_handler, NULL)
 	for (int i = 0; i < ARRAY_SIZE(page); i++) {
 		igt_subtest_f("mem-page-copy-%u", page[i].width) {
 			igt_require(blt_has_mem_copy(fd));
-			igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
+			igt_require(intel_query_gen(fd) >= 20);
 			for_each_variation_r(regions, 1, set) {
 				region = igt_collection_get_value(regions, 0);
 				copy_test(fd, &page[i], MEM_COPY, region);
@@ -320,7 +318,7 @@ igt_main_args("b", NULL, help_str, opt_handler, NULL)
 			 * till 0x3FFFF.
 			 */
 			if (linear[i].width > 0x3ffff &&
-			    (intel_get_device_info(dev_id)->graphics_ver < 20))
+			    (intel_query_gen(fd) < 20))
 				igt_skip("Skipping: width exceeds 18-bit limit on gfx_ver < 20\n");
 			igt_require(blt_has_mem_set(fd));
 			for_each_variation_r(regions, 1, set) {
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 100504713..85b2eba46 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -68,7 +68,6 @@ static int xe_validate_entries(igt_dir_t *igt_dir,
 static void
 xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
 {
-	uint16_t devid = intel_get_drm_devid(fd);
 	static const char * const expected_files[] = {
 		"gt0",
 		"gt1",
@@ -98,7 +97,7 @@ xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
 
 	igt_assert(igt_debugfs_search(fd, "info", reference));
 
-	if (intel_gen(devid) < 20) {
+	if (intel_query_gen(fd) < 20) {
 		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
 		case 48:
 			val = 3;
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 4c6c31da3..6eefa0889 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -328,9 +328,7 @@ static uint64_t eu_ctl(int debugfd, uint64_t client,
 
 static bool intel_gen_needs_resume_wa(int fd)
 {
-	const uint32_t id = intel_get_drm_devid(fd);
-
-	return intel_gen(id) == 12 && intel_graphics_ver(id) < IP_VER(12, 55);
+	return intel_query_gen(fd) == 12 && intel_query_graphics_ver(fd) < IP_VER(12, 55);
 }
 
 static uint64_t eu_ctl_resume(int fd, int debugfd, uint64_t client,
@@ -1168,8 +1166,6 @@ static void run_online_client(struct xe_eudebug_client *c)
 
 static bool intel_gen_has_lockstep_eus(int fd)
 {
-	const uint32_t id = intel_get_drm_devid(fd);
-
 	/*
 	 * Lockstep (or in some parlance, fused) EUs are pair of EUs
 	 * that work in sync, supposedly same clock and same control flow.
@@ -1177,7 +1173,7 @@ static bool intel_gen_has_lockstep_eus(int fd)
 	 * excepted into SIP. In this level, the hardware has only one attention
 	 * thread bit for units. PVC is the first one without lockstepping.
 	 */
-	return !(intel_graphics_ver(id) == IP_VER(12, 60) || intel_gen(id) >= 20);
+	return !(intel_query_graphics_ver(fd) == IP_VER(12, 60) || intel_query_gen(fd) >= 20);
 }
 
 static int query_attention_bitmask_size(int fd, int gt)
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index bf22c3475..fa54c2ca1 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -56,7 +56,7 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
 }
 
 static void cond_batch(struct data *data, uint64_t addr, int value,
-		       uint16_t dev_id)
+		       int fd)
 {
 	int b;
 	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
@@ -69,7 +69,7 @@ static void cond_batch(struct data *data, uint64_t addr, int value,
 	data->batch[b++] = sdi_addr;
 	data->batch[b++] = sdi_addr >> 32;
 
-	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0))
+	if (intel_query_graphics_ver(fd) >= IP_VER(20, 0))
 		data->batch[b++] = MI_MEM_FENCE | MI_WRITE_FENCE;
 
 	data->batch[b++] = MI_CONDITIONAL_BATCH_BUFFER_END | MI_DO_COMPARE | 5 << 12 | 2;
@@ -112,8 +112,7 @@ static void persistance_batch(struct data *data, uint64_t addr)
  * SUBTEST: basic-all
  * Description: Test to verify store dword on all available engines.
  */
-static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci,
-		       uint16_t dev_id)
+static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci)
 {
 	struct drm_xe_sync sync[2] = {
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
@@ -156,7 +155,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	else if (inst_type == COND_BATCH) {
 		/* A random value where it stops at the below value. */
 		value = 20 + random() % 10;
-		cond_batch(data, addr, value, dev_id);
+		cond_batch(data, addr, value, fd);
 	}
 	else
 		igt_assert_f(inst_type < 2, "Entered wrong inst_type.\n");
@@ -416,23 +415,21 @@ igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
-	uint16_t dev_id;
 	struct drm_xe_engine *engine;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 		xe_device_get(fd);
-		dev_id = intel_get_drm_devid(fd);
 	}
 
 	igt_subtest("basic-store") {
 		engine = xe_engine(fd, 1);
-		basic_inst(fd, STORE, &engine->instance, dev_id);
+		basic_inst(fd, STORE, &engine->instance);
 	}
 
 	igt_subtest("basic-cond-batch") {
 		engine = xe_engine(fd, 1);
-		basic_inst(fd, COND_BATCH, &engine->instance, dev_id);
+		basic_inst(fd, COND_BATCH, &engine->instance);
 	}
 
 	igt_subtest_with_dynamic("basic-all") {
@@ -441,7 +438,7 @@ igt_main
 				      xe_engine_class_string(hwe->engine_class),
 				      hwe->engine_instance,
 				      hwe->gt_id);
-			basic_inst(fd, STORE, hwe, dev_id);
+			basic_inst(fd, STORE, hwe);
 		}
 	}
 
diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 6cef5578c..363185195 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -492,7 +492,7 @@ oa_add_config_fail(int fd, int sysfs, int devid,
 {
 	char path[512];
 	uint64_t config_id;
-#define SAMPLE_MUX_REG (intel_graphics_ver(devid) >= IP_VER(20, 0) ?	\
+#define SAMPLE_MUX_REG (intel_query_graphics_ver(fd) >= IP_VER(20, 0) ?	\
 			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
 
 	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 4f2aff59a..93e7d9a1a 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -432,11 +432,13 @@ dump_report(const uint32_t *report, uint32_t size, const char *message) {
 static struct oa_format
 get_oa_format(enum intel_xe_oa_format_name format)
 {
-	if (IS_DG2(devid))
+	const struct intel_device_info *devinfo = intel_query_device_info(drm_fd);
+
+	if (devinfo->is_dg2)
 		return dg2_oa_formats[format];
-	else if (IS_METEORLAKE(devid))
+	else if (devinfo->is_meteorlake)
 		return mtl_oa_formats[format];
-	else if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+	else if (intel_query_graphics_ver(drm_fd) >= IP_VER(20, 0))
 		return lnl_oa_formats[format];
 	else
 		return gen12_oa_formats[format];
@@ -730,7 +732,7 @@ oa_timestamp_delta(const uint32_t *report1,
 		   const uint32_t *report0,
 		   enum intel_xe_oa_format_name format)
 {
-	uint32_t width = intel_graphics_ver(devid) >= IP_VER(12, 55) ? 56 : 32;
+	uint32_t width = intel_query_graphics_ver(drm_fd) >= IP_VER(12, 55) ? 56 : 32;
 
 	return elapsed_delta(oa_timestamp(report1, format),
 			     oa_timestamp(report0, format), width);
@@ -1069,7 +1071,7 @@ static void pec_sanity_check(const u32 *report0, const u32 *report1,
 static void pec_sanity_check_reports(const u32 *report0, const u32 *report1,
 				     struct intel_xe_perf_metric_set *set)
 {
-	if (igt_run_in_simulation() || intel_graphics_ver(devid) < IP_VER(20, 0)) {
+	if (igt_run_in_simulation() || intel_query_graphics_ver(drm_fd) < IP_VER(20, 0)) {
 		igt_debug("%s: Skip checking PEC reports in simulation or Xe1\n", __func__);
 		return;
 	}
@@ -3348,7 +3350,7 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	}
 
 	/* FIXME: can we deduce the presence of A26 from get_oa_format(fmt)? */
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+	if (intel_query_graphics_ver(drm_fd) >= IP_VER(20, 0))
 		goto skip_check;
 
 	/* Check that this test passed. The test measures the number of 2x2
@@ -3528,7 +3530,7 @@ static bool has_xe_oa_userspace_config(int fd)
 	return errno != EINVAL;
 }
 
-#define SAMPLE_MUX_REG (intel_graphics_ver(devid) >= IP_VER(20, 0) ?	\
+#define SAMPLE_MUX_REG (intel_query_graphics_ver(drm_fd) >= IP_VER(20, 0) ?	\
 			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
 
 /**
@@ -3783,7 +3785,7 @@ test_whitelisted_registers_userspace_config(void)
 
 	/* NOA_CONFIG */
 	/* Prior to Xe2 */
-	if (intel_graphics_ver(devid) < IP_VER(20, 0)) {
+	if (intel_query_graphics_ver(drm_fd) < IP_VER(20, 0)) {
 		regs[config.n_regs * 2] = 0xD04;
 		regs[config.n_regs * 2 + 1] = 0;
 		config.n_regs++;
@@ -3792,7 +3794,7 @@ test_whitelisted_registers_userspace_config(void)
 		config.n_regs++;
 	}
 	/* Prior to MTLx */
-	if (intel_graphics_ver(devid) < IP_VER(12, 70)) {
+	if (intel_query_graphics_ver(drm_fd) < IP_VER(12, 70)) {
 		/* WAIT_FOR_RC6_EXIT */
 		regs[config.n_regs * 2] = 0x20CC;
 		regs[config.n_regs * 2 + 1] = 0;
@@ -3830,9 +3832,11 @@ struct test_perf {
 	uint32_t num_wl;
 } perf;
 
-#define HAS_OA_MMIO_TRIGGER(__d) \
-	(IS_DG2(__d) || IS_PONTEVECCHIO(__d) || IS_METEORLAKE(__d) || \
-	 intel_graphics_ver(devid) >= IP_VER(20, 0))
+#define HAS_OA_MMIO_TRIGGER(__fd) \
+	(intel_query_device_info(__fd)->is_dg2 || \
+	 intel_query_device_info(__fd)->is_pontevecchio || \
+	 intel_query_device_info(__fd)->is_meteorlake || \
+	 intel_query_graphics_ver(__fd) >= IP_VER(20, 0))
 
 static void perf_init_whitelist(void)
 {
@@ -5035,7 +5039,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		sysfs = igt_sysfs_open(drm_fd);
 
 		/* Currently only run on Xe2+ */
-		igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));
+		igt_require(intel_query_graphics_ver(drm_fd) >= IP_VER(20, 0));
 
 		igt_require(init_sys_info());
 
@@ -5131,8 +5135,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 				test_mi_rpc(hwe);
 
 		igt_subtest_with_dynamic("oa-tlb-invalidate") {
-			igt_require(intel_graphics_ver(devid) <= IP_VER(12, 70) &&
-				    intel_graphics_ver(devid) != IP_VER(12, 60));
+			igt_require(intel_query_graphics_ver(drm_fd) <= IP_VER(12, 70) &&
+				    intel_query_graphics_ver(drm_fd) != IP_VER(12, 60));
 			__for_one_hwe_in_oag(hwe)
 				test_oa_tlb_invalidate(hwe);
 		}
@@ -5223,13 +5227,13 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 				test_oa_regs_whitelist(hwe);
 
 		igt_subtest_with_dynamic("mmio-triggered-reports") {
-			igt_require(HAS_OA_MMIO_TRIGGER(devid));
+			igt_require(HAS_OA_MMIO_TRIGGER(drm_fd));
 			__for_one_hwe_in_oag(hwe)
 				test_mmio_triggered_reports(hwe, false);
 		}
 
 		igt_subtest_with_dynamic("mmio-triggered-reports-read") {
-			igt_require(HAS_OA_MMIO_TRIGGER(devid));
+			igt_require(HAS_OA_MMIO_TRIGGER(drm_fd));
 			__for_one_hwe_in_oag(hwe)
 				test_mmio_triggered_reports(hwe, true);
 		}
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 59dfb6b11..29d2b6cd5 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -84,7 +84,6 @@ static void userptr_coh_none(int fd)
  */
 static void pat_index_all(int fd)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
 	size_t size = xe_get_default_alignment(fd);
 	uint32_t vm, bo;
 	uint8_t pat_index;
@@ -116,7 +115,7 @@ static void pat_index_all(int fd)
 
 	for (pat_index = 0; pat_index <= intel_get_max_pat_index(fd);
 	     pat_index++) {
-		if (intel_get_device_info(dev_id)->graphics_ver >= 20 &&
+		if (intel_query_gen(fd) >= 20 &&
 		    pat_index >= 16 && pat_index <= 19) { /* hw reserved */
 			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
 						   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
@@ -764,7 +763,6 @@ static void display_vs_wb_transient(int fd)
 		3, /* UC (baseline) */
 		6, /* L3:XD (uncompressed) */
 	};
-	uint32_t devid = intel_get_drm_devid(fd);
 	igt_render_copyfunc_t render_copy = NULL;
 	igt_crc_t ref_crc = {}, crc = {};
 	igt_plane_t *primary;
@@ -780,7 +778,7 @@ static void display_vs_wb_transient(int fd)
 	int bpp = 32;
 	int i;
 
-	igt_require(intel_get_device_info(devid)->graphics_ver >= 20);
+	igt_require(intel_query_gen(fd) >= 20);
 
 	render_copy = igt_get_render_copyfunc(fd);
 	igt_require(render_copy);
@@ -879,10 +877,8 @@ static uint8_t get_pat_idx_uc(int fd, bool *compressed)
 
 static uint8_t get_pat_idx_wt(int fd, bool *compressed)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
-
 	if (compressed)
-		*compressed = intel_get_device_info(dev_id)->graphics_ver >= 20;
+		*compressed = intel_query_gen(fd) >= 20;
 
 	return intel_get_pat_idx_wt(fd);
 }
@@ -1157,20 +1153,20 @@ const char *help_str =
 
 igt_main_args("V", NULL, help_str, opt_handler, NULL)
 {
-	uint16_t dev_id;
+	const struct intel_device_info *dev_info;
 	int fd;
 
 	igt_fixture {
 		uint32_t seed;
 
 		fd = drm_open_driver(DRIVER_XE);
-		dev_id = intel_get_drm_devid(fd);
 
 		seed = time(NULL);
 		srand(seed);
 		igt_debug("seed: %d\n", seed);
 
 		xe_device_get(fd);
+		dev_info = intel_query_device_info(fd);
 	}
 
 	igt_subtest("pat-index-all")
@@ -1186,28 +1182,28 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		prime_external_import_coh();
 
 	igt_subtest_with_dynamic("pat-index-xelp") {
-		igt_require(intel_graphics_ver(dev_id) <= IP_VER(12, 55));
+		igt_require(intel_query_graphics_ver(fd) <= IP_VER(12, 55));
 		subtest_pat_index_modes_with_regions(fd, xelp_pat_index_modes,
 						     ARRAY_SIZE(xelp_pat_index_modes));
 	}
 
 	igt_subtest_with_dynamic("pat-index-xehpc") {
-		igt_require(IS_PONTEVECCHIO(dev_id));
+		igt_require(dev_info->is_pontevecchio);
 		subtest_pat_index_modes_with_regions(fd, xehpc_pat_index_modes,
 						     ARRAY_SIZE(xehpc_pat_index_modes));
 	}
 
 	igt_subtest_with_dynamic("pat-index-xelpg") {
-		igt_require(IS_METEORLAKE(dev_id));
+		igt_require(dev_info->is_meteorlake);
 		subtest_pat_index_modes_with_regions(fd, xelpg_pat_index_modes,
 						     ARRAY_SIZE(xelpg_pat_index_modes));
 	}
 
 	igt_subtest_with_dynamic("pat-index-xe2") {
-		igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
-		igt_assert(HAS_FLATCCS(dev_id));
+		igt_require(intel_query_gen(fd) >= 20);
+		igt_assert(dev_info->has_flatccs);
 
-		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
+		if (intel_query_graphics_ver(fd) == IP_VER(20, 1))
 			subtest_pat_index_modes_with_regions(fd, bmg_g21_pat_index_modes,
 							     ARRAY_SIZE(bmg_g21_pat_index_modes));
 		else
-- 
2.43.0

