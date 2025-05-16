Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4A4C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 11:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D5D10EA7D;
	Fri, 16 May 2025 11:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbrTwpZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C058F10EA7C
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 11:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747396657; x=1778932657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yXGbSiuWm8RpkNYsCNODj/LPj2afAJXI7g3niCEsp3U=;
 b=BbrTwpZ5hfSkmcLmrhasTEwZKGILy/LN8TpsuuAx/u7uSotsdrE0PChf
 +UPLKtRlJ4YS4OMRS/bONc/fxlGgmxvaDIa/+LppHypsjKvw7F+7j0kwa
 aUvA0lSCMUfYmmx3A2HSwgRfSoAyWDVfqn23dU/PQ/VSYrXQYeMF3b5tV
 Sk0xA5Q2jtCXS6Kx0SA6GBHSypcCOUqitEjbceSoQl7MiRntdHe44T73a
 Q1MQGMPmbKgfVTXCOoAOWec6F9OYNbLO+wgKCecm0hnyLpsOkgdOYQbRc
 LPa0FdBPg0TrTBSsDf2OWKYklZKXOB6Swr8HF7ITi0as6YhfNAPIM1WNi Q==;
X-CSE-ConnectionGUID: xid6wVLORfOckXB1ACA6Uw==
X-CSE-MsgGUID: CQ11r4joTaaMwOVbycz1YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="36983608"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="36983608"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 04:57:36 -0700
X-CSE-ConnectionGUID: vsRvx+SmSky4uBg8PlhgRA==
X-CSE-MsgGUID: xavAwe2PRGCrXTlQDIT2Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="139075026"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 04:57:35 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v1 4/4] tests/intel: fixup print/scan formatting for
 intel test files
Date: Fri, 16 May 2025 11:58:11 +0000
Message-Id: <20250516115811.135889-5-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516115811.135889-1-jan.sokolowski@intel.com>
References: <20250516115811.135889-1-jan.sokolowski@intel.com>
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

Compiling on other architectures than x86-64 causes a lot
of print/scan formatting warnings.

Fix formatting by using proper formatters, eg. PRIu64.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_compute_preempt.c         |  5 +++--
 tests/intel/xe_eu_stall.c                |  4 ++--
 tests/intel/xe_exec_capture.c            |  9 +++++----
 tests/intel/xe_exec_system_allocator.c   | 10 +++++-----
 tests/intel/xe_oa.c                      |  6 +++---
 tests/intel/xe_pmu.c                     | 12 ++++++------
 tests/intel/xe_render_copy.c             |  2 +-
 tests/intel/xe_sriov_auto_provisioning.c |  6 +++---
 tests/intel/xe_sriov_flr.c               | 12 ++++++------
 tests/intel/xe_sriov_scheduling.c        |  4 ++--
 10 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 43ffb8dba..f8f08c664 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -13,6 +13,7 @@
  */
 
 #include <string.h>
+#include <inttypes.h>
 
 #include "igt.h"
 #include "intel_compute.h"
@@ -84,7 +85,7 @@ igt_main
 				 */
 				child_count = ram_mb / 2 / CONTEXT_MB / 2;
 
-				igt_debug("RAM: %zd, child count: %d\n",
+				igt_debug("RAM: %" PRIu64 ", child count: %d\n",
 					  ram_mb, child_count);
 
 				test_compute_preempt(xe, hwe, false);
@@ -111,7 +112,7 @@ igt_main
 				 */
 				child_count = ram_mb / CONTEXT_MB / 2;
 
-				igt_debug("RAM: %zd, child count: %d\n",
+				igt_debug("RAM: %" PRIu64 ", child count: %d\n",
 					  ram_mb, child_count);
 
 				test_compute_preempt(xe, hwe, false);
diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index 411c30871..b27f5685e 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -516,7 +516,7 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int ite
 	igt_assert(query_eu_stall_data->num_sampling_rates > 0);
 	if (p_rate == 0)
 		properties[3] = query_eu_stall_data->sampling_rates[0];
-	igt_info("Sampling Rate: %lu\n", properties[3]);
+	igt_info("Sampling Rate: %" PRIu64 "\n", properties[3]);
 
 	stream_fd = xe_eu_stall_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props);
 	igt_require_fd(stream_fd);
@@ -580,7 +580,7 @@ enable:
 		}
 	} while (child_is_running);
 
-	igt_info("Total size read: %lu\n", total_size);
+	igt_info("Total size read: %" PRIu64 "\n", total_size);
 	igt_info("Number of samples: %u\n", num_samples);
 	igt_info("Number of drops reported: %u\n", num_drops);
 
diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
index fe1ae677e..c78f0f73a 100644
--- a/tests/intel/xe_exec_capture.c
+++ b/tests/intel/xe_exec_capture.c
@@ -17,6 +17,7 @@
 #include <regex.h>
 #include <stdio.h>
 #include <string.h>
+#include <inttypes.h>
 
 #include "igt.h"
 #include "igt_device.h"
@@ -393,10 +394,10 @@ check_item_u64(regex_t *regex, char **lines, const char *tag, u64 addr_lo,
 		     "Target not found:%s\n", tag);
 
 	result = compare_hex_value(output);
-	igt_debug("Compare %s %s vs [0x%lX-0x%lX] result %lX\n", tag, output,
+	igt_debug("Compare %s %s vs [0x%" PRIX64 "-0x%" PRIX64 "] result %" PRIX64 "\n", tag, output,
 		  addr_lo, addr_hi, result);
 	igt_assert_f((addr_lo <= result) && (result <= addr_hi),
-		     "value %lX out of range[0x%lX-0x%lX]\n", result, addr_lo, addr_hi);
+		     "value %" PRIX64 " out of range[0x%" PRIX64 "-0x%" PRIX64 "]\n", result, addr_lo, addr_hi);
 }
 
 static void
@@ -524,7 +525,7 @@ igt_main
 			/* Reduce timeout value to speedup test */
 			xe_sysfs_set_job_timeout_ms(xe, hwe, CAPTURE_JOB_TIMEOUT);
 
-			igt_debug("Reduced %s class timeout from %ld to %d\n",
+			igt_debug("Reduced %s class timeout from %" PRIu64 " to %d\n",
 				  xe_engine_class_name(hwe->engine_class),
 				  timeouts[hwe->engine_class], CAPTURE_JOB_TIMEOUT);
 		}
@@ -553,7 +554,7 @@ igt_main
 			store = xe_sysfs_get_job_timeout_ms(xe, hwe);
 			igt_abort_on_f(timeout != store, "job_timeout_ms not restored!\n");
 
-			igt_debug("Restored %s class timeout to %ld\n",
+			igt_debug("Restored %s class timeout to %" PRIu64 "\n",
 				  xe_engine_class_name(hwe->engine_class),
 				  timeouts[hwe->engine_class]);
 
diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 06daac8c2..d2b25b431 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -324,8 +324,8 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
 	ret = __xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queue,
 			       &timeout);
 	if (ret) {
-		igt_info("FAIL EXEC_UFENCE_ADDR: 0x%016llx\n", sync[0].addr);
-		igt_info("FAIL EXEC_UFENCE: EXPECTED=0x%016llx, ACTUAL=0x%016lx\n",
+		igt_info("FAIL EXEC_UFENCE_ADDR: 0x%016" PRIu64 "\n", sync[0].addr);
+		igt_info("FAIL EXEC_UFENCE: EXPECTED=0x%016" PRIu64 ", ACTUAL=0x%016" PRIu64 "\n",
 			 USER_FENCE_VALUE, exec_ufence[0]);
 
 		addr = to_user_pointer(ptr);
@@ -336,9 +336,9 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
 			uint64_t sdi_offset = (char *)&data->data - (char *)data;
 			uint64_t sdi_addr = addr + sdi_offset;
 
-			igt_info("FAIL BATCH_ADDR: 0x%016lx\n", batch_addr);
-			igt_info("FAIL SDI_ADDR: 0x%016lx\n", sdi_addr);
-			igt_info("FAIL SDI_ADDR (in batch): 0x%016lx\n",
+			igt_info("FAIL BATCH_ADDR: 0x%016" PRIu64 "\n", batch_addr);
+			igt_info("FAIL SDI_ADDR: 0x%016" PRIu64 "\n", sdi_addr);
+			igt_info("FAIL SDI_ADDR (in batch): 0x%016" PRIu64 "\n",
 				 (((u64)data->batch[2]) << 32) | data->batch[1]);
 			igt_info("FAIL DATA: EXPECTED=0x%08x, ACTUAL=0x%08x\n",
 				 data->expected_data, data->data);
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 1576479d9..d1d324005 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1015,13 +1015,13 @@ static void pec_sanity_check(const u32 *report0, const u32 *report1,
 		return;
 	}
 
-	igt_debug("tick delta = %#lx\n", tick_delta);
+	igt_debug("tick delta = %#" PRIx64 "\n", tick_delta);
 
 	/* Difference in test_event1_cycles_xecore* values should be close to tick_delta */
 	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
 		int n = xecore_idx[i];
 
-		igt_debug("n %d: pec1[n] - pec0[n] %#lx, tick delta %#lx\n",
+		igt_debug("n %d: pec1[n] - pec0[n] %#" PRIx64 ", tick delta %#" PRIx64 "\n",
 			  n, pec1[n] - pec0[n], tick_delta);
 		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
 		if (pec1[n] && pec0[n])
@@ -1031,7 +1031,7 @@ static void pec_sanity_check(const u32 *report0, const u32 *report1,
 			igt_assert(pec0[n]);
 	}
 
-	igt_debug("pec1[2] - pec0[2] %#lx, tick_delta * num_xecores: %#lx\n",
+	igt_debug("pec1[2] - pec0[2] %#" PRIx64 ", tick_delta * num_xecores: %#" PRIx64 "\n",
 		  pec1[2] - pec0[2], tick_delta * intel_xe_perf->devinfo.n_eu_sub_slices);
 	/* Difference in test_event1_cycles should be close to (tick_delta * num_xecores) */
 	assert_within_epsilon(pec1[2] - pec0[2],
diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index c49cceff5..0a5d8b62a 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -178,9 +178,9 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 	engine_active_ticks = after[0] - before[0];
 	engine_total_ticks = after[1] - before[1];
 
-	igt_debug("Engine active ticks:  after %ld, before %ld delta %ld\n", after[0], before[0],
+	igt_debug("Engine active ticks:  after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", after[0], before[0],
 		  engine_active_ticks);
-	igt_debug("Engine total ticks: after %ld, before %ld delta %ld\n", after[1], before[1],
+	igt_debug("Engine total ticks: after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", after[1], before[1],
 		  engine_total_ticks);
 
 	if (cork)
@@ -248,9 +248,9 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
 		engine_active_ticks = after[idx] - before[idx];
 		engine_total_ticks = after[idx + 1] - before[idx + 1];
 
-		igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", i,
+		igt_debug("[%d] Engine active ticks: after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", i,
 			  after[idx], before[idx], engine_active_ticks);
-		igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", i,
+		igt_debug("[%d] Engine total ticks: after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", i,
 			  after[idx + 1], before[idx + 1], engine_total_ticks);
 
 		if (f->cork)
@@ -310,9 +310,9 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
 	engine_active_ticks = after[0] - before[0];
 	engine_total_ticks = after[1] - before[1];
 
-	igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", function,
+	igt_debug("[%d] Engine active ticks: after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", function,
 		  after[0], before[0], engine_active_ticks);
-	igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", function,
+	igt_debug("[%d] Engine total ticks: after %" PRIu64 ", before %" PRIu64 " delta %" PRIu64 "\n", function,
 		  after[1], before[1], engine_total_ticks);
 
 	busy_percent = (double)engine_active_ticks / engine_total_ticks;
diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index fadfd162c..f44d39aee 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -629,7 +629,7 @@ static void render_stress_copy(int fd, struct igt_collection *set,
 			render_duration_max = duration;
 	}
 	igt_info("%d render() loops in %d seconds\n", render_count, render_timeout);
-	igt_info("Render duration: avg = %ld ns, min = %ld ns, max = %ld ns\n",
+	igt_info("Render duration: avg = %" PRIu64 " ns, min = %" PRIu64 " ns, max = %" PRIu64 " ns\n",
 		 render_duration_total / render_count,
 		 render_duration_min, render_duration_max);
 
diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index 9ef5ed79a..451c3c5ca 100644
--- a/tests/intel/xe_sriov_auto_provisioning.c
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -58,7 +58,7 @@ static int ranges_fair_allocation(enum xe_sriov_shared_res res,
 		uint64_t current_allocation = ranges[i].end - ranges[i].start + 1;
 
 		if (igt_debug_on_f(current_allocation != expected_allocation,
-				   "%s: Allocation mismatch, expected=%lu VF%u=%lu\n",
+				   "%s: Allocation mismatch, expected=%" PRIu64 " VF%u=%" PRIu64 "\n",
 				   xe_sriov_debugfs_provisioned_attr_name(res),
 				   expected_allocation, ranges[i].vf_id,
 				   current_allocation)) {
@@ -183,8 +183,8 @@ static int check_no_overlap(int pf_fd, unsigned int num_vfs, unsigned int gt_id,
 	for (unsigned int i = 0; i < num_vfs - 1; i++)
 		if (ranges[i].end >= ranges[i + 1].start) {
 			igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
-				  "Overlapping ranges: VF%u [%lx-%lx] and VF%u [%lx-%lx]\n" :
-				  "Overlapping ranges: VF%u [%lu-%lu] and VF%u [%lu-%lu]\n",
+				  "Overlapping ranges: VF%u [%" PRIx64 "-%" PRIx64 "] and VF%u [%" PRIx64 "-%" PRIx64 "]\n" :
+				  "Overlapping ranges: VF%u [%" PRIu64 "-%" PRIu64 "] and VF%u [%" PRIu64 "-%" PRIu64 "]\n",
 				  ranges[i].vf_id, ranges[i].start, ranges[i].end,
 				  ranges[i + 1].vf_id, ranges[i + 1].start, ranges[i + 1].end);
 			free(ranges);
diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index a98d6ce70..91d9730fa 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -562,7 +562,7 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 			continue;
 
 		if (vf_id < 1 || vf_id > num_vfs) {
-			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#lx-%#lx], num_vfs=%u\n",
+			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#" PRIx64 "-%#" PRIx64 "], num_vfs=%u\n",
 					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
 			free(ranges);
 			return -1;
@@ -634,7 +634,7 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
 				 (uint8_t)vf_id, &pte)) {
 			set_skip_reason(data,
-					"Prepare VF%u failed, unexpected gpa: Read PTE: %#lx at offset: %#x\n",
+					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
 					vf_id, pte, pte_offset);
 			return;
 		}
@@ -655,7 +655,7 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
 		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
 				   expected, &pte)) {
 			set_fail_reason(data,
-					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#lx at offset: %#x\n",
+					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
 					flr_vf_id, vf_id, pte, pte_offset);
 			return;
 		}
@@ -712,7 +712,7 @@ static void *mmap_vf_lmem(int pf_fd, int vf_num, size_t length, int prot, off_t
 	}
 
 	if (st.st_size < length) {
-		igt_debug("Mapping length (%lu) exceeds BAR2 size (%lu)\n", length, st.st_size);
+		igt_debug("Mapping length (%zu) exceeds BAR2 size (%" PRIo64 ")\n", length, st.st_size);
 		close(fd);
 		return NULL;
 	}
@@ -750,7 +750,7 @@ static bool lmem_write_pattern(struct lmem_info *lmem, char value, size_t start,
 
 	for (; start < lmem->size; start += step) {
 		read = lmem_write_readback(lmem->addr, start, value);
-		if (igt_debug_on_f(read != value, "LMEM[%lu]=%u != %u\n", start, read, value))
+		if (igt_debug_on_f(read != value, "LMEM[%zu]=%u != %u\n", start, read, value))
 			return false;
 	}
 	return true;
@@ -765,7 +765,7 @@ static bool lmem_contains_expected_values_(struct lmem_info *lmem,
 	for (; start < lmem->size; start += step) {
 		read = lmem_read(lmem->addr, start);
 		if (igt_debug_on_f(read != expected,
-				   "LMEM[%lu]=%u != %u\n", start, read, expected))
+				   "LMEM[%zu]=%u != %u\n", start, read, expected))
 			return false;
 	}
 	return true;
diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 2cd18c982..d69315690 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -346,7 +346,7 @@ static void compute_common_time_frame_stats(struct subm_set *set)
 			common_end = stats->end_timestamp;
 	}
 
-	igt_info("common time frame: [%lu;%lu] %.2fms\n",
+	igt_info("common time frame: [%" PRIu64 ";%" PRIu64 "] %.2fms\n",
 		 common_start, common_end, (common_end - common_start) / 1e6);
 
 	if (igt_warn_on_f(common_end <= common_start, "No common time frame for all sets found\n"))
@@ -671,7 +671,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 	int preemptible_end = 1;
 	uint8_t vf_ids[num_vfs + 1 /*PF*/];
 
-	igt_info("eq=%ums pt=%uus duration=%lums num_vfs=%d job_timeout=%ums\n",
+	igt_info("eq=%ums pt=%uus duration=%" PRIu64 "ms num_vfs=%d job_timeout=%ums\n",
 		 vf_sched_params.exec_quantum_ms, vf_sched_params.preempt_timeout_us,
 		 duration_ms, num_vfs, job_timeout_ms);
 
-- 
2.34.1

