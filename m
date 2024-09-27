Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F43CDD1CE
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 16:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FC210E21B;
	Fri, 27 Sep 2024 16:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxxYhSL0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8556010E21B
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727454791; x=1758990791;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AnQwlBAgP2Datz6g/bV59iAAYQOLcWGfct4bSLRpikA=;
 b=TxxYhSL0EZ8jl2VoUqBHwGtLbYfWlZWw805pluxZCATOIr5neCryH4FB
 SVgyhWdqzAyK9KsJ80WL+geNv5KFYYMd+oXmI54CvLXrcazg6vcjkEqvS
 a3ZX0/UesxOLukxk+VaUvFtbeeEQJm1kX+58XlyBgCaumF/m8SWqcMGsX
 31RPEMdflNfKYIAInEMSEZu4672x/apcxKEZKFI+nILOk656XpS/Bqh1r
 WqNph8qpMGu9M070o3YMGH3d0kqfZzfYeU4VoojI7Qav6axMjO7ZaMKlI
 ALX5PMSp+YxaHa/+6oovR+e5/nGwMQx1AeOraIdNzDuebZPO9nqxjZWUo g==;
X-CSE-ConnectionGUID: vYjQ22syQ7OY5tj04hBEAQ==
X-CSE-MsgGUID: 1nZgUQEDQd6Xoraa6EqMLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26738117"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="26738117"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 09:33:10 -0700
X-CSE-ConnectionGUID: qpU3S+aUQQexzKRAK68zkg==
X-CSE-MsgGUID: PqOFASldTz6GZnwyhxOurw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="72743810"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 27 Sep 2024 09:33:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 27 Sep 2024 19:33:07 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/3] igt: Fix printf formats on x86-32
Date: Fri, 27 Sep 2024 19:33:05 +0300
Message-ID: <20240927163307.10159-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use the hideous %"PRI.64" printf() stuff to silence
compiler warnings on x86-32.

Thank you whoever chose the wrong type for uint64_t
on x86-64...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_pm.c                           |  4 +--
 lib/igt_sysfs.c                        |  4 +--
 lib/intel_compute.c                    | 46 +++++++++++++-------------
 tests/intel/gem_lmem_swapping.c        |  6 ++--
 tests/intel/perf.c                     |  2 +-
 tests/intel/xe_copy_basic.c            |  4 +--
 tests/intel/xe_create.c                |  2 +-
 tests/intel/xe_drm_fdinfo.c            | 10 +++---
 tests/intel/xe_evict.c                 |  2 +-
 tests/intel/xe_evict_ccs.c             |  6 ++--
 tests/intel/xe_oa.c                    |  4 +--
 tests/intel/xe_pm.c                    |  4 +--
 tests/intel/xe_query.c                 |  4 +--
 tests/intel/xe_sysfs_preempt_timeout.c |  2 +-
 tests/intel/xe_waitfence.c             |  2 +-
 15 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index cfa628324a2e..1a5d9c42b26c 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1400,7 +1400,7 @@ uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 
 	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_suspended_time");
 	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
-		igt_assert(sscanf(time_str, "%ld", &time) > 0);
+		igt_assert(sscanf(time_str, "%"PRId64"", &time) > 0);
 
 		igt_debug("runtime suspended time for PCI '%04x:%02x:%02x.%01x' = %" PRIu64 "\n",
 			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
@@ -1425,7 +1425,7 @@ uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
 
 	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
 	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
-		igt_assert(sscanf(time_str, "%ld", &time) > 0);
+		igt_assert(sscanf(time_str, "%"PRId64"", &time) > 0);
 
 		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %" PRIu64 "\n",
 			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index aec0bb53d7dd..e6904393e8b6 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1152,7 +1152,7 @@ static int rw_attr_sweep(igt_sysfs_rw_attr_t *rw)
 	while (set < UINT64_MAX / 2) {
 		ret = __igt_sysfs_set_u64(rw->dir, rw->attr, set);
 		__igt_sysfs_get_u64(rw->dir, rw->attr, &get);
-		igt_debug("'%s': ret %d set %lu get %lu\n", rw->attr, ret, set, get);
+		igt_debug("'%s': ret %d set %"PRIu64" get %"PRIu64"\n", rw->attr, ret, set, get);
 		if (ret && rw_attr_equal_within_epsilon(get, set, rw->tol)) {
 			igt_debug("'%s': matches\n", rw->attr);
 			num_points++;
@@ -1196,7 +1196,7 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
 	igt_assert(rw->start);	/* cannot be 0 */
 
 	__igt_sysfs_get_u64(rw->dir, rw->attr, &prev);
-	igt_debug("'%s': prev %lu\n", rw->attr, prev);
+	igt_debug("'%s': prev %"PRIu64"\n", rw->attr, prev);
 
 	ret = rw_attr_sweep(rw);
 
diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 6458f539c6c5..1cc39f645c2e 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -774,13 +774,13 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 {
 	int b = 0;
 
-	igt_debug("general   state base: %lx\n", addr_general_state_base);
-	igt_debug("surface   state base: %lx\n", addr_surface_state_base);
-	igt_debug("dynamic   state base: %lx\n", addr_dynamic_state_base);
-	igt_debug("instruct   base addr: %lx\n", addr_instruction_state_base);
-	igt_debug("bindless   base addr: %lx\n", addr_surface_state_base);
-	igt_debug("offset indirect addr: %lx\n", offset_indirect_data_start);
-	igt_debug("kernel start pointer: %lx\n", kernel_start_pointer);
+	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
+	igt_debug("surface   state base: %"PRIx64"\n", addr_surface_state_base);
+	igt_debug("dynamic   state base: %"PRIx64"\n", addr_dynamic_state_base);
+	igt_debug("instruct   base addr: %"PRIx64"\n", addr_instruction_state_base);
+	igt_debug("bindless   base addr: %"PRIx64"\n", addr_surface_state_base);
+	igt_debug("offset indirect addr: %"PRIx64"\n", offset_indirect_data_start);
+	igt_debug("kernel start pointer: %"PRIx64"\n", kernel_start_pointer);
 
 	addr_bo_buffer_batch[b++] = GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
 				    PIPELINE_SELECT_GPGPU;
@@ -991,13 +991,13 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 {
 	int b = 0;
 
-	igt_debug("general   state base: %lx\n", addr_general_state_base);
-	igt_debug("surface   state base: %lx\n", addr_surface_state_base);
-	igt_debug("dynamic   state base: %lx\n", addr_dynamic_state_base);
-	igt_debug("instruct   base addr: %lx\n", addr_instruction_state_base);
-	igt_debug("bindless   base addr: %lx\n", addr_surface_state_base);
-	igt_debug("offset indirect addr: %lx\n", offset_indirect_data_start);
-	igt_debug("kernel start pointer: %lx\n", kernel_start_pointer);
+	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
+	igt_debug("surface   state base: %"PRIx64"\n", addr_surface_state_base);
+	igt_debug("dynamic   state base: %"PRIx64"\n", addr_dynamic_state_base);
+	igt_debug("instruct   base addr: %"PRIx64"\n", addr_instruction_state_base);
+	igt_debug("bindless   base addr: %"PRIx64"\n", addr_surface_state_base);
+	igt_debug("offset indirect addr: %"PRIx64"\n", offset_indirect_data_start);
+	igt_debug("kernel start pointer: %"PRIx64"\n", kernel_start_pointer);
 
 	addr_bo_buffer_batch[b++] = GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
 				    PIPELINE_SELECT_GPGPU;
@@ -1174,15 +1174,15 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 {
 	int b = 0;
 
-	igt_debug("general   state base: %lx\n", addr_general_state_base);
-	igt_debug("surface   state base: %lx\n", addr_surface_state_base);
-	igt_debug("dynamic   state base: %lx\n", addr_dynamic_state_base);
-	igt_debug("instruct   base addr: %lx\n", addr_instruction_state_base);
-	igt_debug("bindless   base addr: %lx\n", addr_surface_state_base);
-	igt_debug("state context data base addr: %lx\n", addr_state_contect_data_base);
-	igt_debug("offset indirect addr: %lx\n", offset_indirect_data_start);
-	igt_debug("kernel start pointer: %lx\n", kernel_start_pointer);
-	igt_debug("sip start pointer: %lx\n", sip_start_pointer);
+	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
+	igt_debug("surface   state base: %"PRIx64"\n", addr_surface_state_base);
+	igt_debug("dynamic   state base: %"PRIx64"\n", addr_dynamic_state_base);
+	igt_debug("instruct   base addr: %"PRIx64"\n", addr_instruction_state_base);
+	igt_debug("bindless   base addr: %"PRIx64"\n", addr_surface_state_base);
+	igt_debug("state context data base addr: %"PRIx64"\n", addr_state_contect_data_base);
+	igt_debug("offset indirect addr: %"PRIx64"\n", offset_indirect_data_start);
+	igt_debug("kernel start pointer: %"PRIx64"\n", kernel_start_pointer);
+	igt_debug("sip start pointer: %"PRIx64"\n", sip_start_pointer);
 
 	addr_bo_buffer_batch[b++] = GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
 				    PIPELINE_SELECT_GPGPU;
diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
index b125261519ff..8e0dac42d80d 100644
--- a/tests/intel/gem_lmem_swapping.c
+++ b/tests/intel/gem_lmem_swapping.c
@@ -244,7 +244,7 @@ verify_object(int i915, const struct object *obj,  unsigned int flags)
 		uint32_t val = obj->seed + x;
 
 		igt_assert_f(buf[x] == val,
-			     "Object mismatch at offset %zu - found %08x, expected %08x; difference:%08x!\n",
+			     "Object mismatch at offset %lu - found %08x, expected %08x; difference:%08x!\n",
 			     x * sizeof(*buf), buf[x], val, buf[x] ^ val);
 	}
 
@@ -442,7 +442,7 @@ static void __do_evict(int i915,
 		}
 	}
 
-	igt_debug("obj size min/max=%lu %s/%lu %s, count=%u, seed: %u\n",
+	igt_debug("obj size min/max=%"PRIu64" %s/%"PRIu64" %s, count=%u, seed: %u\n",
 		  readable_size(params->size.min), readable_unit(params->size.min),
 		  readable_size(params->size.max), readable_unit(params->size.max),
 		  params->count, seed);
@@ -591,7 +591,7 @@ static void fill_params(int i915, struct params *params,
 		(region->probed_size >> 20);
 	igt_info("Memory: system-total %dMiB, lmem-region %lldMiB, usage-limit %dMiB\n",
 		 swap_mb, (region->probed_size >> 20), params->mem_limit);
-	igt_info("Using %u thread(s), %u loop(s), %u objects of %lu %s - %lu %s, seed: %u, oom: %s\n",
+	igt_info("Using %u thread(s), %u loop(s), %u objects of %"PRIu64" %s - %"PRIu64" %s, seed: %u, oom: %s\n",
 		 params->flags & TEST_PARALLEL ? nproc : 1,
 		 params->loops,
 		 params->count,
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index 681d94844e69..a5a81ade7c63 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -3259,7 +3259,7 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 
 		do_ioctl(stream_fd, I915_PERF_IOCTL_DISABLE, 0);
 
-		igt_debug("first ts = %lu, last ts = %lu\n", first_timestamp, last_timestamp);
+		igt_debug("first ts = %"PRIu64", last ts = %"PRIu64"\n", first_timestamp, last_timestamp);
 
 		igt_debug("%f < %zu < %f\n",
 			  report_size * n_full_oa_reports * 0.45,
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index aa771338e0de..a43842e39839 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -173,7 +173,7 @@ igt_main
 	}
 
 	for (int i = 0; i < ARRAY_SIZE(size); i++) {
-		igt_subtest_f("mem-copy-linear-0x%lx", size[i]) {
+		igt_subtest_f("mem-copy-linear-0x%"PRIx64"", size[i]) {
 			igt_require(blt_has_mem_copy(fd));
 			for_each_variation_r(regions, 1, set) {
 				region = igt_collection_get_value(regions, 0);
@@ -183,7 +183,7 @@ igt_main
 	}
 
 	for (int i = 0; i < ARRAY_SIZE(size); i++) {
-		igt_subtest_f("mem-set-linear-0x%lx", size[i]) {
+		igt_subtest_f("mem-set-linear-0x%"PRIx64"", size[i]) {
 			igt_require(blt_has_mem_set(fd));
 			for_each_variation_r(regions, 1, set) {
 				region = igt_collection_get_value(regions, 0);
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 80de077895ae..07e11036d878 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -286,7 +286,7 @@ static void create_big_vram(int fd, int gt)
 	bo_size = params.quantity ? params.quantity * 1024ULL * 1024ULL
 		  : ALIGN_DOWN(visible_avail_size * params.percent / 100, alignment);
 	igt_require(bo_size);
-	igt_info("gt%u bo_size=%lu visible_available_vram_size=%lu\n",
+	igt_info("gt%u bo_size=%"PRIu64" visible_available_vram_size=%"PRIu64"\n",
 		gt, bo_size, visible_avail_size);
 
 	bo_handle = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 747b6155c9dd..5fd7c0416410 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -205,7 +205,7 @@ static void mem_active(int fd, struct drm_xe_engine *engine)
 		 * N_EXEC_QUEUES active memory consumption should be
 		 * > = bo_size
 		 */
-		igt_info("total:%ld active:%ld pre_size:%ld bo_size:%ld\n",
+		igt_info("total:%"PRId64" active:%"PRId64" pre_size:%"PRId64" bo_size:%zd\n",
 			 info.region_mem[memregion->instance + 1].total,
 			 info.region_mem[memregion->instance + 1].active,
 			 pre_size,
@@ -267,7 +267,7 @@ static void mem_shared(int xe)
 		ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
 		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
 
-		igt_info("total:%ld pre_size:%ld shared:%ld\n",
+		igt_info("total:%"PRId64" pre_size:%"PRId64" shared:%"PRId64"\n",
 			 info.region_mem[memregion->instance + 1].total,
 			 pre_size,
 			 info.region_mem[memregion->instance + 1].shared);
@@ -308,7 +308,7 @@ static void mem_total_resident(int xe)
 		/* currently xe KMD maps memory class system region to
 		 * XE_PL_TT thus we need memregion->instance + 1
 		 */
-		igt_info("total:%ld resident:%ld pre_size:%ld bo_size:%d\n",
+		igt_info("total:%"PRId64" resident:%"PRId64" pre_size:%"PRId64" bo_size:%d\n",
 			 info.region_mem[memregion->instance + 1].total,
 			 info.region_mem[memregion->instance + 1].resident,
 			 pre_size, BO_SIZE);
@@ -501,9 +501,9 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 	double percent;
 	u64 den, num;
 
-	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
+	igt_debug("%s: sample 1: cycles %"PRIu64", total_cycles %"PRIu64"\n",
 		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
-	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
+	igt_debug("%s: sample 2: cycles %"PRIu64", total_cycles %"PRIu64"\n",
 		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
 
 	num = s2[class].cycles - s1[class].cycles;
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 400ad58b430a..91533cc54aad 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -491,7 +491,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
 	total_size = ((vram_size - 1) / bo_size + system_size * 4 / 5 / bo_size) /
 		num_threads - 1;
 
-	igt_debug("num_threads: %d bo_size : %lu total_size : %lu\n", num_threads,
+	igt_debug("num_threads: %d bo_size : %"PRIu64" total_size : %"PRIu64"\n", num_threads,
 		  bo_size, total_size);
 
 	if (set_size > total_size)
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 68f408908349..281d270153bc 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -141,7 +141,7 @@ static struct object *create_obj(struct blt_copy_data *blt,
 	w = max_t(int, 1024, roundup_power_of_two(sqrt(size/4)));
 	h = size / w / 4; /* /4 - 32bpp */
 
-	igt_debug("[%8d] Obj size: %ldKiB (%ldMiB) <w: %d, h: %d>\n",
+	igt_debug("[%8d] Obj size: %"PRId64"KiB (%"PRId64"MiB) <w: %d, h: %d>\n",
 		  getpid(), size / SZ_1K, size / SZ_1M, w, h);
 
 	src = blt_create_object(blt,
@@ -196,7 +196,7 @@ static void check_obj(const char *check_mode,
 
 	if (obj->ptr[0] != start_value ||
 	    (obj->ptr[size/4 - 1] != start_value + size/4 - 1)) {
-		igt_info("[%s] Failed object w: %d, h: %d, size: %ldKiB (%ldMiB)\n",
+		igt_info("[%s] Failed object w: %d, h: %d, size: %"PRId64"KiB (%"PRId64"MiB)\n",
 			 check_mode, obj->x2, obj->y2, obj->size / SZ_1K, obj->size / SZ_1M);
 		dump_obj(obj, start_value);
 	}
@@ -209,7 +209,7 @@ static void check_obj(const char *check_mode,
 		idx = rand() % (size/4);
 
 		if (obj->ptr[idx] != start_value + idx) {
-			igt_info("[%s] Failed object w: %d, h: %d, size: %ldKiB (%ldMiB)\n",
+			igt_info("[%s] Failed object w: %d, h: %d, size: %"PRId64"KiB (%"PRId64"MiB)\n",
 				 check_mode, obj->x2, obj->y2,
 				 obj->size / SZ_1K, obj->size / SZ_1M);
 			dump_obj(obj, start_value);
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index aae9be2c40c9..c12234dc1394 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2672,7 +2672,7 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
 
 		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
 
-		igt_debug("first ts = %lu, last ts = %lu\n", first_timestamp, last_timestamp);
+		igt_debug("first ts = %"PRIu64", last ts = %"PRIu64"\n", first_timestamp, last_timestamp);
 
 		igt_debug("%f < %zu < %f\n",
 			  report_size * n_full_oa_reports * 0.45,
@@ -4044,7 +4044,7 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 		if (get_oa_format(test_set->perf_oa_format).report_hdr_64bit) {
 			u64 *start64 = (u64 *)start;
 
-			igt_debug("hdr: %016lx %016lx %016lx %016lx\n",
+			igt_debug("hdr: %016"PRIx64" %016"PRIx64" %016"PRIx64" %016"PRIx64"\n",
 				  start64[0], start64[1], start64[2], start64[3]);
 		} else {
 			igt_debug("hdr: %08x %08x %08x %08x\n",
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index eee89428c7fb..ef829672b795 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -93,7 +93,7 @@ static uint64_t get_vram_d3cold_threshold(int sysfs)
 	sprintf(path, "device/vram_d3cold_threshold");
 	igt_require_f(!faccessat(sysfs, path, R_OK, 0), "vram_d3cold_threshold is not present\n");
 
-	ret = igt_sysfs_scanf(sysfs, path, "%lu", &threshold);
+	ret = igt_sysfs_scanf(sysfs, path, "%"PRIu64"", &threshold);
 	igt_assert_lt(0, ret);
 
 	return threshold;
@@ -107,7 +107,7 @@ static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
 	sprintf(path, "device/vram_d3cold_threshold");
 
 	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
-		ret = igt_sysfs_printf(sysfs, path, "%lu", threshold);
+		ret = igt_sysfs_printf(sysfs, path, "%"PRIu64"", threshold);
 	else
 		igt_warn("vram_d3cold_threshold is not present\n");
 
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 732049fb0116..4c79a02b05d6 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -771,13 +771,13 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 			delta_cs = (((1 << ts2.width) - ts2.engine_cycles) + ts1.engine_cycles) *
 				   NSEC_PER_SEC / eng_ref_clock1;
 
-		igt_debug("delta_cpu[%lu], delta_cs[%lu]\n",
+		igt_debug("delta_cpu[%"PRIu64"], delta_cs[%"PRIu64"]\n",
 			  delta_cpu, delta_cs);
 
 		delta_delta = delta_cpu > delta_cs ?
 			       delta_cpu - delta_cs :
 			       delta_cs - delta_cpu;
-		igt_debug("delta_delta %lu\n", delta_delta);
+		igt_debug("delta_delta %"PRIu64"\n", delta_delta);
 
 		if (delta_delta < 5000)
 			usable++;
diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
index 734795a3524c..7fa0dfcdf721 100644
--- a/tests/intel/xe_sysfs_preempt_timeout.c
+++ b/tests/intel/xe_sysfs_preempt_timeout.c
@@ -155,7 +155,7 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
 
 	for (int i = 0; i < ARRAY_SIZE(delays); i++) {
 		elapsed = __test_timeout(fd, engine, delays[i], gt, class);
-		igt_info("%s:%ld, elapsed=%.3fus\n",
+		igt_info("%s:%"PRId64", elapsed=%.3fus\n",
 			property[0], delays[i], elapsed * 1e-3);
 
 		/*
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index c1cab64f4e5b..0981e196293b 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -111,7 +111,7 @@ waitfence(int fd, enum waittype wt)
 
 	if (wt == RELTIME) {
 		timeout = xe_wait_ufence(fd, &wait_fence, 7, 0, 10 * NSEC_PER_MSEC);
-		igt_debug("wait type: RELTIME - timeout: %ld, timeout left: %ld\n",
+		igt_debug("wait type: RELTIME - timeout: %"PRId64", timeout left: %"PRId64"\n",
 			  (int64_t)10 * NSEC_PER_MSEC, timeout);
 	} else if (wt == ENGINE) {
 		exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
-- 
2.45.2

