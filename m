Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F60FD0621
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 06:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EC510E325;
	Wed, 11 Mar 2026 06:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zk2Y1M3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9039110E325
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 06:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773210207; x=1804746207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Floau3p0AOXoeeQeq+rXkfflw9lW0OcJoRUQzTghFis=;
 b=Zk2Y1M3BzRAU715WAlx7SgSzx6Ou/umqQhDy6MbH6I1wloimZw8FdOhe
 mvPGck9bFD0w2fGzmqcXnHKljrR6/wAy2ilGPszA6ixF4yj8u35cUdDUw
 D28XFVycelkqka+OVTRT2WHiNlxvi7p13MnI1QbbrZA+XuRpnCF423k9L
 Fmf4FLrN4IM50/TN7xLsNIMF0alcxH3rPcOvsF0gICDYPBCbGiWWD93M+
 /P4cCjdmYoZv6k0cvGEjFzPYI5YmapD0tfSVWxu+B+sS/o+ayqu0xjVh8
 jQ7ma69f+TZbSLZAl1JfIjDbxwHapgoqGRw3n0+yOPpbpGJSWVz1ZVQof w==;
X-CSE-ConnectionGUID: mQIYtXhVTSmphhkdxtUmlw==
X-CSE-MsgGUID: HR8cOJvrTZCjbKKoSmxrUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77875557"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="77875557"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:23:26 -0700
X-CSE-ConnectionGUID: s56p9AJATTy44lSrBxYZBw==
X-CSE-MsgGUID: 1djWsG6+TlqxkZBstgFW9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220309070"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa009.jf.intel.com with ESMTP; 10 Mar 2026 23:23:15 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v5 1/4] lib/intel: rename intel_gen() and intel_graphics_ver()
 to *_from_pciid() variants
Date: Tue, 10 Mar 2026 23:23:06 -0700
Message-ID: <20260311062311.1623823-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311062311.1623823-1-x.wang@intel.com>
References: <20260311062311.1623823-1-x.wang@intel.com>
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

Both functions take a PCI device ID and perform a table lookup to
return the GPU generation or graphics IP version. Rename them to
intel_gen_from_pciid() and intel_graphics_ver_from_pciid() to make the
input semantics explicit, and to free up the original names for new
fd-based variants that will be introduced in the next patch.

Mark the renamed functions as deprecated in their kdoc, as callers
should prefer the fd-based variants wherever a DRM device fd is
available. The _from_pciid() variants should only be used in contexts
where no fd is accessible, e.g. when the DRM driver is not loaded or
in cross-environment tooling.

The bulk of the renaming was done with the following Coccinelle semantic
patch (rename_to_from_pciid.cocci):

  @@
  expression E;
  @@
  - intel_gen(E)
  + intel_gen_from_pciid(E)

  @@
  expression E;
  @@
  - intel_graphics_ver(E)
  + intel_graphics_ver_from_pciid(E)

Applied with:

  spatch --sp-file rename_to_from_pciid.cocci \
         -I lib -I include --include-headers \
         --in-place --dir .

Call sites inside macro definitions that Coccinelle could not reach
due to missing preprocessor context were handled with a follow-up sed
pass:

  find . \( -name "*.c" -o -name "*.h" \) | xargs sed -i \
    -e "s/\bintel_gen(\b/intel_gen_from_pciid(/g" \
    -e "s/\bintel_graphics_ver(\b/intel_graphics_ver_from_pciid(/g"

The function declaration in lib/intel_chipset.h and the definition and
kdoc in lib/intel_device_info.c were updated manually.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 benchmarks/gem_blt.c                     |  2 +-
 benchmarks/gem_busy.c                    |  2 +-
 benchmarks/gem_latency.c                 |  2 +-
 benchmarks/gem_wsim.c                    |  8 ++--
 benchmarks/intel_upload_blit_large.c     |  2 +-
 benchmarks/intel_upload_blit_large_gtt.c |  2 +-
 benchmarks/intel_upload_blit_large_map.c |  2 +-
 benchmarks/intel_upload_blit_small.c     |  2 +-
 lib/gpu_cmds.c                           | 20 ++++-----
 lib/i915/gem_engine_topology.c           |  6 +--
 lib/i915/gem_mman.c                      |  2 +-
 lib/i915/gem_submission.c                |  8 ++--
 lib/i915/i915_crc.c                      |  4 +-
 lib/i915/intel_decode.c                  |  4 +-
 lib/igt_dummyload.c                      |  2 +-
 lib/igt_gt.c                             |  4 +-
 lib/igt_store.c                          |  2 +-
 lib/instdone.c                           |  2 +-
 lib/intel_batchbuffer.c                  | 16 ++++----
 lib/intel_blt.c                          | 18 ++++----
 lib/intel_blt.h                          |  2 +-
 lib/intel_bufops.c                       | 10 ++---
 lib/intel_chipset.h                      | 12 +++---
 lib/intel_common.c                       |  2 +-
 lib/intel_compute.c                      |  6 +--
 lib/intel_device_info.c                  | 23 +++++++++--
 lib/intel_mmio.c                         |  8 ++--
 lib/intel_mocs.c                         |  4 +-
 lib/intel_pat.c                          |  4 +-
 lib/intel_reg_map.c                      |  2 +-
 lib/ioctl_wrappers.c                     |  2 +-
 lib/rendercopy_gen9.c                    | 24 +++++------
 lib/xe/xe_legacy.c                       |  2 +-
 lib/xe/xe_oa.c                           |  4 +-
 lib/xe/xe_spin.c                         |  2 +-
 lib/xe/xe_sriov_provisioning.c           |  2 +-
 tests/intel/api_intel_allocator.c        |  2 +-
 tests/intel/api_intel_bb.c               | 10 ++---
 tests/intel/gem_bad_reloc.c              |  4 +-
 tests/intel/gem_blits.c                  |  2 +-
 tests/intel/gem_close_race.c             |  2 +-
 tests/intel/gem_concurrent_all.c         |  2 +-
 tests/intel/gem_ctx_create.c             |  4 +-
 tests/intel/gem_ctx_engines.c            |  6 +--
 tests/intel/gem_ctx_isolation.c          | 14 +++----
 tests/intel/gem_ctx_shared.c             |  8 ++--
 tests/intel/gem_ctx_sseu.c               |  2 +-
 tests/intel/gem_eio.c                    |  6 +--
 tests/intel/gem_evict_alignment.c        |  6 +--
 tests/intel/gem_evict_everything.c       |  8 ++--
 tests/intel/gem_exec_async.c             |  2 +-
 tests/intel/gem_exec_await.c             |  2 +-
 tests/intel/gem_exec_balancer.c          |  4 +-
 tests/intel/gem_exec_big.c               |  2 +-
 tests/intel/gem_exec_capture.c           |  6 +--
 tests/intel/gem_exec_fair.c              | 20 ++++-----
 tests/intel/gem_exec_fence.c             | 18 ++++----
 tests/intel/gem_exec_flush.c             |  4 +-
 tests/intel/gem_exec_gttfill.c           |  2 +-
 tests/intel/gem_exec_latency.c           |  6 +--
 tests/intel/gem_exec_nop.c               |  4 +-
 tests/intel/gem_exec_parallel.c          |  2 +-
 tests/intel/gem_exec_params.c            |  8 ++--
 tests/intel/gem_exec_reloc.c             | 10 ++---
 tests/intel/gem_exec_schedule.c          | 20 ++++-----
 tests/intel/gem_exec_store.c             |  6 +--
 tests/intel/gem_exec_suspend.c           |  2 +-
 tests/intel/gem_exec_whisper.c           |  6 +--
 tests/intel/gem_fenced_exec_thrash.c     |  2 +-
 tests/intel/gem_gtt_hog.c                |  2 +-
 tests/intel/gem_linear_blits.c           |  8 ++--
 tests/intel/gem_media_vme.c              |  2 +-
 tests/intel/gem_mmap_gtt.c               | 12 +++---
 tests/intel/gem_read_read_speed.c        |  2 +-
 tests/intel/gem_render_copy.c            |  8 ++--
 tests/intel/gem_ringfill.c               |  4 +-
 tests/intel/gem_set_tiling_vs_blt.c      |  2 +-
 tests/intel/gem_softpin.c                |  6 +--
 tests/intel/gem_streaming_writes.c       |  4 +-
 tests/intel/gem_sync.c                   |  8 ++--
 tests/intel/gem_tiled_fence_blits.c      |  4 +-
 tests/intel/gem_tiling_max_stride.c      |  8 ++--
 tests/intel/gem_userptr_blits.c          | 20 ++++-----
 tests/intel/gem_vm_create.c              |  2 +-
 tests/intel/gem_watchdog.c               |  4 +-
 tests/intel/gem_workarounds.c            |  2 +-
 tests/intel/gen7_exec_parse.c            |  2 +-
 tests/intel/gen9_exec_parse.c            |  2 +-
 tests/intel/i915_getparams_basic.c       |  7 ++--
 tests/intel/i915_module_load.c           |  2 +-
 tests/intel/i915_pm_rc6_residency.c      |  6 +--
 tests/intel/i915_pm_rpm.c                |  2 +-
 tests/intel/i915_pm_sseu.c               |  2 +-
 tests/intel/kms_ccs.c                    |  8 ++--
 tests/intel/kms_fbcon_fbt.c              |  2 +-
 tests/intel/kms_frontbuffer_tracking.c   |  6 +--
 tests/intel/kms_pipe_stress.c            |  4 +-
 tests/intel/perf.c                       | 52 ++++++++++++------------
 tests/intel/perf_pmu.c                   |  8 ++--
 tests/intel/sysfs_preempt_timeout.c      |  2 +-
 tests/intel/sysfs_timeslice_duration.c   |  2 +-
 tests/intel/xe_ccs.c                     | 16 ++++----
 tests/intel/xe_compute.c                 |  8 ++--
 tests/intel/xe_debugfs.c                 |  2 +-
 tests/intel/xe_eudebug_online.c          |  4 +-
 tests/intel/xe_evict.c                   |  6 +--
 tests/intel/xe_exec_fault_mode.c         |  2 +-
 tests/intel/xe_exec_multi_queue.c        |  2 +-
 tests/intel/xe_exec_store.c              |  2 +-
 tests/intel/xe_exec_threads.c            |  2 +-
 tests/intel/xe_fault_injection.c         |  2 +-
 tests/intel/xe_intel_bb.c                |  6 +--
 tests/intel/xe_multigpu_svm.c            |  2 +-
 tests/intel/xe_oa.c                      | 22 +++++-----
 tests/intel/xe_pat.c                     | 12 +++---
 tests/intel/xe_prefetch_fault.c          |  3 +-
 tests/intel/xe_query.c                   |  2 +-
 tests/intel/xe_render_copy.c             |  2 +-
 tests/intel/xe_svm_usrptr_madvise.c      |  2 +-
 tests/prime_vgem.c                       |  2 +-
 tools/intel_dp_compliance.c              |  2 +-
 tools/intel_error_decode.c               | 12 +++---
 tools/intel_gtt.c                        | 12 +++---
 tools/intel_l3_parity.c                  |  2 +-
 tools/intel_reg.c                        |  6 +--
 tools/intel_reg_decode.c                 |  4 +-
 tools/intel_tiling_detect.c              |  2 +-
 tools/intel_vbt_decode.c                 |  2 +-
 128 files changed, 393 insertions(+), 374 deletions(-)

diff --git a/benchmarks/gem_blt.c b/benchmarks/gem_blt.c
index bd8264b4e..62987ad81 100644
--- a/benchmarks/gem_blt.c
+++ b/benchmarks/gem_blt.c
@@ -190,7 +190,7 @@ static int run(int object, int batch, int time, int reps, int ncpus, unsigned fl
 	handle = gem_create(fd, size);
 	buf = gem_mmap__cpu(fd, handle, 0, size, PROT_WRITE);
 
-	gen = intel_gen(intel_get_drm_devid(fd));
+	gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	has_64bit_reloc = gen >= 8;
 
 	src = gem_create(fd, ALIGN(object, 4096));
diff --git a/benchmarks/gem_busy.c b/benchmarks/gem_busy.c
index 95d0fb971..d8cb90de9 100644
--- a/benchmarks/gem_busy.c
+++ b/benchmarks/gem_busy.c
@@ -155,7 +155,7 @@ static int loop(unsigned ring, int reps, int ncpus, unsigned flags)
 	shared = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 
 	fd = drm_open_driver(DRIVER_INTEL);
-	gen = intel_gen(intel_get_drm_devid(fd));
+	gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = gem_create(fd, 4096);
diff --git a/benchmarks/gem_latency.c b/benchmarks/gem_latency.c
index b4e2afbf5..c8f616bc2 100644
--- a/benchmarks/gem_latency.c
+++ b/benchmarks/gem_latency.c
@@ -452,7 +452,7 @@ static int run(int seconds,
 #endif
 
 	fd = drm_open_driver(DRIVER_INTEL);
-	gen = intel_gen(intel_get_drm_devid(fd));
+	gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	if (gen < 6)
 		return IGT_EXIT_SKIP; /* Needs BCS timestamp */
 
diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index bebb59f28..2514935b6 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -358,7 +358,7 @@ static uint64_t ns_to_ctx_ticks(uint64_t ns)
 
 	if (!f) {
 		f = read_timestamp_frequency(fd);
-		if (intel_gen(intel_get_drm_devid(fd)) == 11)
+		if (intel_gen_from_pciid(intel_get_drm_devid(fd)) == 11)
 			f = 12500000; /* icl!!! are you feeling alright? */
 	}
 
@@ -936,7 +936,7 @@ parse_duration(unsigned int nr_steps, struct duration *dur, double scale_dur, ch
 	long tmpl;
 
 	if (field[0] == '*') {
-		if (intel_gen(intel_get_drm_devid(fd)) < 8) {
+		if (intel_gen_from_pciid(intel_get_drm_devid(fd)) < 8) {
 			wsim_err("Infinite batch at step %u needs Gen8+!\n", nr_steps);
 			return -1;
 		}
@@ -1536,7 +1536,7 @@ static uint32_t mmio_base(int i915, const intel_engine_t *engine, int gen)
 
 static unsigned int create_bb(struct w_step *w, int self)
 {
-	const int gen = intel_gen(intel_get_drm_devid(fd));
+	const int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const uint32_t base = mmio_base(fd, &w->engine, gen);
 #define CS_GPR(x) (base + 0x600 + 8 * (x))
 #define TIMESTAMP (base + 0x3a8)
@@ -2138,7 +2138,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 					wsim_err("Load balancing needs an engine map!\n");
 					return 1;
 				}
-				if (intel_gen(intel_get_drm_devid(fd)) < 11) {
+				if (intel_gen_from_pciid(intel_get_drm_devid(fd)) < 11) {
 					wsim_err("Load balancing needs relative mmio support, gen11+!\n");
 					return 1;
 				}
diff --git a/benchmarks/intel_upload_blit_large.c b/benchmarks/intel_upload_blit_large.c
index af52d7a4e..4ba98b315 100644
--- a/benchmarks/intel_upload_blit_large.c
+++ b/benchmarks/intel_upload_blit_large.c
@@ -82,7 +82,7 @@ do_render(int i915, uint32_t dst_handle)
 	uint32_t data[OBJECT_WIDTH * OBJECT_HEIGHT];
 	uint64_t size = OBJECT_WIDTH * OBJECT_HEIGHT * 4, bb_size = 4096;
 	uint32_t src_handle, bb_handle, *bb;
-	uint32_t gen = intel_gen(intel_get_drm_devid(i915));
+	uint32_t gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	const bool has_64b_reloc = gen >= 8;
 	int i;
 
diff --git a/benchmarks/intel_upload_blit_large_gtt.c b/benchmarks/intel_upload_blit_large_gtt.c
index 1e991a6b2..f949d6b8e 100644
--- a/benchmarks/intel_upload_blit_large_gtt.c
+++ b/benchmarks/intel_upload_blit_large_gtt.c
@@ -78,7 +78,7 @@ do_render(int i915, uint32_t dst_handle)
 	static uint32_t seed = 1;
 	uint64_t size = OBJECT_WIDTH * OBJECT_HEIGHT * 4, bb_size = 4096;
 	uint32_t *data, src_handle, bb_handle, *bb;
-	uint32_t gen = intel_gen(intel_get_drm_devid(i915));
+	uint32_t gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	const bool has_64b_reloc = gen >= 8;
 	int i;
 
diff --git a/benchmarks/intel_upload_blit_large_map.c b/benchmarks/intel_upload_blit_large_map.c
index 6d3cd748c..cfec5b1b3 100644
--- a/benchmarks/intel_upload_blit_large_map.c
+++ b/benchmarks/intel_upload_blit_large_map.c
@@ -81,7 +81,7 @@ do_render(int i915, uint32_t dst_handle)
 	static uint32_t seed = 1;
 	uint64_t size = OBJECT_WIDTH * OBJECT_HEIGHT * 4, bb_size = 4096;
 	uint32_t *data, src_handle, bb_handle, *bb;
-	uint32_t gen = intel_gen(intel_get_drm_devid(i915));
+	uint32_t gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	const bool has_64b_reloc = gen >= 8;
 	int i;
 
diff --git a/benchmarks/intel_upload_blit_small.c b/benchmarks/intel_upload_blit_small.c
index 525d68e36..96d155d11 100644
--- a/benchmarks/intel_upload_blit_small.c
+++ b/benchmarks/intel_upload_blit_small.c
@@ -76,7 +76,7 @@ do_render(int i915, uint32_t dst_handle)
 	uint32_t data[OBJECT_WIDTH * OBJECT_HEIGHT];
 	uint64_t size = OBJECT_WIDTH * OBJECT_HEIGHT * 4, bb_size = 4096;
 	uint32_t src_handle, bb_handle, *bb;
-	uint32_t gen = intel_gen(intel_get_drm_devid(i915));
+	uint32_t gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	const bool has_64b_reloc = gen >= 8;
 	int i;
 
diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index cd912eb2a..139d3d3ac 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -321,7 +321,7 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
 	binding_table = intel_bb_ptr(ibb);
 	intel_bb_ptr_add(ibb, 64);
 
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
+	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0)) {
 		/*
 		 * Up until now, SURFACEFORMAT_R8_UNROM was used regardless of the 'bpp' value.
 		 * For bpp 32 this results in a surface that is 4x narrower than expected. However
@@ -343,13 +343,13 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
 			igt_assert_f(false,
 				     "Surface state for bpp = %u not implemented",
 				     buf->bpp);
-	} else if (intel_graphics_ver(devid) >= IP_VER(12, 50)) {
+	} else if (intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 50)) {
 		binding_table[0] = xehp_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
-	} else if (intel_graphics_ver(devid) >= IP_VER(9, 0)) {
+	} else if (intel_graphics_ver_from_pciid(devid) >= IP_VER(9, 0)) {
 		binding_table[0] = gen9_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
-	} else if (intel_graphics_ver(devid) >= IP_VER(8, 0)) {
+	} else if (intel_graphics_ver_from_pciid(devid) >= IP_VER(8, 0)) {
 		binding_table[0] = gen8_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
 	} else {
@@ -868,7 +868,7 @@ gen_emit_media_object(struct intel_bb *ibb,
 	/* inline data (xoffset, yoffset) */
 	intel_bb_out(ibb, xoffset);
 	intel_bb_out(ibb, yoffset);
-	if (intel_gen(ibb->devid) >= 8 && !IS_CHERRYVIEW(ibb->devid))
+	if (intel_gen_from_pciid(ibb->devid) >= 8 && !IS_CHERRYVIEW(ibb->devid))
 		gen8_emit_media_state_flush(ibb);
 }
 
@@ -1042,7 +1042,7 @@ void
 xehp_emit_state_compute_mode(struct intel_bb *ibb, bool vrt)
 {
 
-	uint32_t dword_length = intel_graphics_ver(ibb->devid) >= IP_VER(20, 0);
+	uint32_t dword_length = intel_graphics_ver_from_pciid(ibb->devid) >= IP_VER(20, 0);
 
 	intel_bb_out(ibb, XEHP_STATE_COMPUTE_MODE | dword_length);
 	intel_bb_out(ibb, vrt ? (0x10001) << 10 : 0); /* Enable variable number of threads */
@@ -1073,7 +1073,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
 	intel_bb_out(ibb, 0);
 
 	/* stateless data port */
-	tmp = intel_graphics_ver(ibb->devid) >= IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
+	tmp = intel_graphics_ver_from_pciid(ibb->devid) >= IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
 	intel_bb_out(ibb, 0 | tmp);                  //dw3
 
 	/* surface */
@@ -1099,7 +1099,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
 	/* dynamic state buffer size */
 	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);           //dw13
 	/* indirect object buffer size */
-	if (intel_graphics_ver(ibb->devid) >= IP_VER(20, 0))	    //dw14
+	if (intel_graphics_ver_from_pciid(ibb->devid) >= IP_VER(20, 0))	    //dw14
 		intel_bb_out(ibb, 0);
 	else
 		intel_bb_out(ibb, 0xfffff000 | 1);
@@ -1206,7 +1206,7 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
 	else
 		mask = (1 << mask) - 1;
 
-	dword_length = intel_graphics_ver(ibb->devid) >= IP_VER(20, 0) ? 0x26 : 0x25;
+	dword_length = intel_graphics_ver_from_pciid(ibb->devid) >= IP_VER(20, 0) ? 0x26 : 0x25;
 	intel_bb_out(ibb, XEHP_COMPUTE_WALKER | dword_length);
 
 	intel_bb_out(ibb, 0); /* debug object */		//dw1
@@ -1246,7 +1246,7 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
 	intel_bb_out(ibb, 0);					//dw16
 	intel_bb_out(ibb, 0);					//dw17
 
-	if (intel_graphics_ver(ibb->devid) >= IP_VER(20, 0))	//Xe2:dw18
+	if (intel_graphics_ver_from_pciid(ibb->devid) >= IP_VER(20, 0))	//Xe2:dw18
 		intel_bb_out(ibb, 0);
 	/* Interface descriptor data */
 	for (int i = 0; i < 8; i++) {			       //dw18-25 (Xe2:dw19-26)
diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index c25106034..65c808b82 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -375,7 +375,7 @@ static int gem_engine_to_gt_map(int i915, const struct i915_engine_class_instanc
 	uint32_t devid = intel_get_drm_devid(i915);
 
 	/* Only MTL multi-gt supported at present */
-	igt_require(intel_graphics_ver(devid) <= IP_VER(12, 70));
+	igt_require(intel_graphics_ver_from_pciid(devid) <= IP_VER(12, 70));
 
 	return IS_METEORLAKE(devid) ? mtl_engine_to_gt_map(engine) : 0;
 }
@@ -644,7 +644,7 @@ bool gem_engine_can_block_copy(int i915, const struct intel_execution_engine2 *e
 		return false;
 
 	if (!gem_engine_has_known_capability(i915, engine->name, "block_copy"))
-		return intel_gen(intel_get_drm_devid(i915)) >= 12;
+		return intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 12;
 
 	return gem_engine_has_capability(i915, engine->name, "block_copy");
 }
@@ -655,7 +655,7 @@ uint32_t gem_engine_mmio_base(int i915, const char *engine)
 
 	if (gem_engine_property_scanf(i915, engine, "mmio_base",
 				      "%x", &mmio) < 0) {
-		int gen = intel_gen(intel_get_drm_devid(i915));
+		int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 
 		/* The layout of xcs1+ is unreliable -- hence the property! */
 		if (!strcmp(engine, "rcs0")) {
diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index cd0c65e21..134cbb1c8 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -738,7 +738,7 @@ uint64_t gem_mappable_aperture_size(int fd)
 	struct pci_device *pci_dev = igt_device_get_pci_device(fd);
 	int bar;
 
-	if (intel_gen(pci_dev->device_id) < 3)
+	if (intel_gen_from_pciid(pci_dev->device_id) < 3)
 		bar = 0;
 	else
 		bar = 2;
diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index 7d1c3970f..e4a57e9fe 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -62,7 +62,7 @@
  */
 unsigned gem_submission_method(int fd)
 {
-	const int gen = intel_gen(intel_get_drm_devid(fd));
+	const int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	unsigned method = GEM_SUBMISSION_RINGBUF;
 	int dir;
 	uint32_t value = 0;
@@ -210,7 +210,7 @@ int gem_cmdparser_version(int i915)
 bool gem_engine_has_cmdparser(int i915, const intel_ctx_cfg_t *cfg,
 			      unsigned int engine)
 {
-	const int gen = intel_gen(intel_get_drm_devid(i915));
+	const int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	const int parser_version = gem_cmdparser_version(i915);
 	const int class = intel_ctx_cfg_engine_class(cfg, engine);
 
@@ -232,7 +232,7 @@ bool gem_has_blitter(int i915)
 	unsigned int blt;
 
 	blt = 0;
-	if (intel_gen(intel_get_drm_devid(i915)) >= 6)
+	if (intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 6)
 		blt = I915_EXEC_BLT;
 
 	return gem_has_ring(i915, blt);
@@ -245,7 +245,7 @@ void gem_require_blitter(int i915)
 
 static bool gem_engine_has_immutable_submission(int i915, int class)
 {
-	const int gen = intel_gen(intel_get_drm_devid(i915));
+	const int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
         int parser_version;
 
 	parser_version = gem_cmdparser_version(i915);
diff --git a/lib/i915/i915_crc.c b/lib/i915/i915_crc.c
index 9564b7327..1d2516d59 100644
--- a/lib/i915/i915_crc.c
+++ b/lib/i915/i915_crc.c
@@ -135,7 +135,7 @@ static void fill_batch(int i915, uint32_t bb_handle, uint64_t bb_offset,
 		       uint64_t table_offset, uint64_t data_offset, uint32_t data_size)
 {
 	uint32_t *bb, *batch, *jmp;
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	const int use_64b = gen >= 8;
 	uint64_t offset;
 	uint64_t crc = USERDATA(table_offset, 0);
@@ -294,5 +294,5 @@ bool supports_i915_crc32(int i915)
 {
 	uint16_t devid = intel_get_drm_devid(i915);
 
-	return intel_graphics_ver(devid) > IP_VER(12, 50);
+	return intel_graphics_ver_from_pciid(devid) > IP_VER(12, 50);
 }
diff --git a/lib/i915/intel_decode.c b/lib/i915/intel_decode.c
index b78993c47..d6a1f5c84 100644
--- a/lib/i915/intel_decode.c
+++ b/lib/i915/intel_decode.c
@@ -3825,7 +3825,7 @@ intel_decode_context_alloc(uint32_t devid)
 	struct intel_decode *ctx;
 	int gen = 0;
 
-	gen = intel_gen(devid);
+	gen = intel_gen_from_pciid(devid);
 
 	ctx = calloc(1, sizeof(struct intel_decode));
 	if (!ctx)
@@ -3944,7 +3944,7 @@ intel_decode(struct intel_decode *ctx)
 			index += decode_2d(ctx);
 			break;
 		case 0x3:
-			if (intel_gen(devid) >= 4) {
+			if (intel_gen_from_pciid(devid) >= 4) {
 				index +=
 				    decode_3d_965(ctx);
 			} else if (IS_GEN3(devid)) {
diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index cc0b4ac3b..1d85980ea 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -95,7 +95,7 @@ emit_recursive_batch(igt_spin_t *spin,
 #define SCRATCH 0
 #define BATCH IGT_SPIN_BATCH
 	const unsigned int devid = intel_get_drm_devid(fd);
-	const unsigned int gen = intel_gen(devid);
+	const unsigned int gen = intel_gen_from_pciid(devid);
 	struct drm_i915_gem_relocation_entry relocs[3], *r;
 	struct drm_i915_gem_execbuffer2 *execbuf;
 	struct drm_i915_gem_exec_object2 *obj;
diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index d8cccb800..048da04dc 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -68,7 +68,7 @@ static bool has_gpu_reset(int fd)
 		/* Very old kernels did not support the query */
 		if (reset_query_once == -1)
 			reset_query_once =
-			      (intel_gen(intel_get_drm_devid(fd)) >= 5) ? 1 : 0;
+			      (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 5) ? 1 : 0;
 	}
 
 	return reset_query_once > 0;
@@ -468,7 +468,7 @@ void igt_fork_hang_helper(void)
 
 	fd = drm_open_driver(DRIVER_INTEL);
 
-	gen = intel_gen(intel_get_drm_devid(fd));
+	gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	igt_skip_on(gen < 5);
 
 	igt_fork_helper(&hang_helper)
diff --git a/lib/igt_store.c b/lib/igt_store.c
index 42ffdc5cd..a11565ad1 100644
--- a/lib/igt_store.c
+++ b/lib/igt_store.c
@@ -31,7 +31,7 @@ void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 {
 	const int SCRATCH = 0;
 	const int BATCH = 1;
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
diff --git a/lib/instdone.c b/lib/instdone.c
index 0cdddca8e..89fcd0182 100644
--- a/lib/instdone.c
+++ b/lib/instdone.c
@@ -489,7 +489,7 @@ init_gen12_instdone(uint32_t devid)
 bool
 init_instdone_definitions(uint32_t devid)
 {
-	if (intel_graphics_ver(devid) >= IP_VER(12, 50)) {
+	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 50)) {
 		init_xehp_instdone();
 	} else if (IS_GEN12(devid)) {
 		init_gen12_instdone(devid);
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index b09506574..5cc1679ca 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -333,7 +333,7 @@ void igt_blitter_copy(int fd,
 
 	devid = intel_get_drm_devid(fd);
 
-	if (intel_graphics_ver(devid) >= IP_VER(12, 60))
+	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 60))
 		igt_blitter_fast_copy__raw(fd, ahnd, ctx, NULL,
 					   src_handle, src_delta,
 					   src_stride, src_tiling,
@@ -410,7 +410,7 @@ void igt_blitter_src_copy(int fd,
 	uint32_t batch_handle;
 	uint32_t src_pitch, dst_pitch;
 	uint32_t dst_reloc_offset, src_reloc_offset;
-	uint32_t gen = intel_gen(intel_get_drm_devid(fd));
+	uint32_t gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	uint64_t batch_offset, src_offset, dst_offset;
 	const bool has_64b_reloc = gen >= 8;
 	int i = 0;
@@ -669,9 +669,9 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int fd)
 		copy = mtl_render_copyfunc;
 	else if (IS_DG2(devid))
 		copy = gen12p71_render_copyfunc;
-	else if (intel_gen(devid) >= 35)
+	else if (intel_gen_from_pciid(devid) >= 35)
 		copy = xe3p_render_copyfunc;
-	else if (intel_gen(devid) >= 20)
+	else if (intel_gen_from_pciid(devid) >= 20)
 		copy = xe2_render_copyfunc;
 	else if (IS_GEN12(devid))
 		copy = gen12_render_copyfunc;
@@ -731,7 +731,7 @@ igt_fillfunc_t igt_get_media_fillfunc(int devid)
 {
 	igt_fillfunc_t fill = NULL;
 
-	if (intel_graphics_ver(devid) >= IP_VER(12, 50)) {
+	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 50)) {
 		/* current implementation defeatured PIPELINE_MEDIA */
 	} else if (IS_GEN12(devid))
 		fill = gen12_media_fillfunc;
@@ -769,7 +769,7 @@ igt_fillfunc_t igt_get_gpgpu_fillfunc(int devid)
 {
 	igt_fillfunc_t fill = NULL;
 
-	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
+	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 50))
 		fill = xehp_gpgpu_fillfunc;
 	else if (IS_GEN12(devid))
 		fill = gen12_gpgpu_fillfunc;
@@ -913,7 +913,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 	igt_assert(ibb);
 
 	ibb->devid = intel_get_drm_devid(fd);
-	ibb->gen = intel_gen(ibb->devid);
+	ibb->gen = intel_gen_from_pciid(ibb->devid);
 	ibb->ctx = ctx;
 
 	ibb->fd = fd;
@@ -1091,7 +1091,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
 
 static bool aux_needs_softpin(int fd)
 {
-	return intel_gen(intel_get_drm_devid(fd)) >= 12;
+	return intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 12;
 }
 
 static bool has_ctx_cfg(struct intel_bb *ibb)
diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 2b59cc7e9..9f1052d95 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -997,7 +997,7 @@ uint64_t emit_blt_block_copy(int fd,
 			     uint64_t bb_pos,
 			     bool emit_bbe)
 {
-	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
 	struct gen12_block_copy_data data = {};
 	struct gen12_block_copy_data_ext dext = {};
 	uint64_t dst_offset, src_offset, bb_offset;
@@ -1285,7 +1285,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 				 uint64_t bb_pos,
 				 bool emit_bbe)
 {
-	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
 	union ctrl_surf_copy_data data = { };
 	size_t data_sz;
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
@@ -1705,7 +1705,7 @@ uint64_t emit_blt_fast_copy(int fd,
 			    uint64_t bb_pos,
 			    bool emit_bbe)
 {
-	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
 	struct gen12_fast_copy_data data = {};
 	uint64_t dst_offset, src_offset, bb_offset;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -1976,7 +1976,7 @@ static void dump_bb_mem_copy_cmd(int fd, struct xe_mem_copy_data *data)
 
 	igt_info("BB details:\n");
 
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
+	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0)) {
 		igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
 			 "[copy type: %d, mode: %d]\n",
 			 cmd[0], data->dw00.xe2.client, data->dw00.xe2.opcode,
@@ -2006,7 +2006,7 @@ static void dump_bb_mem_copy_cmd(int fd, struct xe_mem_copy_data *data)
 		 cmd[7], data->dw07.dst_address_lo);
 	igt_info(" dw08: [%08x] dst offset hi (0x%x)\n",
 		 cmd[8], data->dw08.dst_address_hi);
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
+	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0)) {
 		igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
 			 cmd[9], data->dw09.xe2.dst_mocs,
 			 data->dw09.xe2.src_mocs);
@@ -2049,7 +2049,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 	width = mem->src.width;
 	height = mem->dst.height;
 
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
+	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0)) {
 		data.dw00.xe2.client = 0x2;
 		data.dw00.xe2.opcode = 0x5a;
 		data.dw00.xe2.length = 8;
@@ -2246,7 +2246,7 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd,
 	batch[b++] = mem->dst.pitch - 1;
 	batch[b++] = dst_offset;
 	batch[b++] = dst_offset << 32;
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0))
 		batch[b++] = value | (mem->dst.mocs_index << 3);
 	else
 		batch[b++] = value | mem->dst.mocs_index;
@@ -2364,7 +2364,7 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 		if (create_mapping && region != system_memory(blt->fd))
 			flags |= DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 
-		if (intel_gen(intel_get_drm_devid(blt->fd)) >= 20 && compression) {
+		if (intel_gen_from_pciid(intel_get_drm_devid(blt->fd)) >= 20 && compression) {
 			pat_index = intel_get_pat_idx_uc_comp(blt->fd);
 			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 		}
@@ -2590,7 +2590,7 @@ void blt_surface_get_flatccs_data(int fd,
 		cpu_caching = __xe_default_cpu_caching(fd, sysmem, 0);
 		ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(fd));
 
-		if (intel_gen(intel_get_drm_devid(fd)) >= 20 && obj->compression) {
+		if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 20 && obj->compression) {
 			comp_pat_index  = intel_get_pat_idx_uc_comp(fd);
 			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 		}
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 78037fd35..d716cc773 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -52,7 +52,7 @@
 #include "igt.h"
 #include "intel_cmds_info.h"
 
-#define CCS_RATIO(fd) (intel_gen(intel_get_drm_devid(fd)) >= 20 ? 512 : 256)
+#define CCS_RATIO(fd) (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 20 ? 512 : 256)
 #define GEN12_MEM_COPY_MOCS_SHIFT		25
 #define XE2_MEM_COPY_SRC_MOCS_SHIFT		28
 #define XE2_MEM_COPY_DST_MOCS_SHIFT		3
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 1196069a5..cdb6b14a1 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1063,7 +1063,7 @@ static void __intel_buf_init(struct buf_ops *bops,
 		} else {
 			uint16_t cpu_caching = __xe_default_cpu_caching(bops->fd, region, 0);
 
-			if (intel_gen(bops->devid) >= 20 && compression)
+			if (intel_gen_from_pciid(bops->devid) >= 20 && compression)
 				cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 
 			bo_size = ALIGN(bo_size, xe_get_default_alignment(bops->fd));
@@ -1106,7 +1106,7 @@ void intel_buf_init(struct buf_ops *bops,
 	uint64_t region;
 	uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-	if (compression && intel_gen(bops->devid) >= 20)
+	if (compression && intel_gen_from_pciid(bops->devid) >= 20)
 		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
 
 	region = bops->driver == INTEL_DRIVER_I915 ? I915_SYSTEM_MEMORY :
@@ -1132,7 +1132,7 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 {
 	uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-	if (compression && intel_gen(bops->devid) >= 20)
+	if (compression && intel_gen_from_pciid(bops->devid) >= 20)
 		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
 
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
@@ -1203,7 +1203,7 @@ void intel_buf_init_using_handle_and_size(struct buf_ops *bops,
 	igt_assert(handle);
 	igt_assert(size);
 
-	if (compression && intel_gen(bops->devid) >= 20)
+	if (compression && intel_gen_from_pciid(bops->devid) >= 20)
 		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
 
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
@@ -1758,7 +1758,7 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 	igt_assert(bops);
 
 	devid = intel_get_drm_devid(fd);
-	generation = intel_gen(devid);
+	generation = intel_gen_from_pciid(devid);
 
 	/* Predefined settings: see intel_device_info? */
 	for (int i = 0; i < ARRAY_SIZE(buf_ops_arr); i++) {
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index cc2225110..4a9b7bef1 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -103,8 +103,8 @@ struct intel_device_info {
 const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
 
 const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__((pure));
-unsigned intel_gen(uint16_t devid) __attribute__((pure));
-unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
+unsigned intel_gen_from_pciid(uint16_t devid) __attribute__((pure));
+unsigned intel_graphics_ver_from_pciid(uint16_t devid) __attribute__((pure));
 unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
 
 extern enum pch_type intel_pch;
@@ -230,12 +230,12 @@ void intel_check_pch(void);
 #define IS_GEN12(devid)		IS_GEN(devid, 12)
 
 #define IS_MOBILE(devid)	(intel_get_device_info(devid)->is_mobile)
-#define IS_965(devid)		(intel_gen(devid) >= 4)
+#define IS_965(devid)		(intel_gen_from_pciid(devid) >= 4)
 
-#define HAS_BSD_RING(devid)	(intel_gen(devid) >= 5)
-#define HAS_BLT_RING(devid)	(intel_gen(devid) >= 6)
+#define HAS_BSD_RING(devid)	(intel_gen_from_pciid(devid) >= 5)
+#define HAS_BLT_RING(devid)	(intel_gen_from_pciid(devid) >= 6)
 
-#define HAS_PCH_SPLIT(devid)	(intel_gen(devid) >= 5 && \
+#define HAS_PCH_SPLIT(devid)	(intel_gen_from_pciid(devid) >= 5 && \
 				 !(IS_VALLEYVIEW(devid) || \
 				   IS_CHERRYVIEW(devid) || \
 				   IS_BROXTON(devid)))
diff --git a/lib/intel_common.c b/lib/intel_common.c
index 8b8f4652a..d722c81cd 100644
--- a/lib/intel_common.c
+++ b/lib/intel_common.c
@@ -91,7 +91,7 @@ bool is_intel_region_compressible(int fd, uint64_t region)
 		return true;
 
 	/* Integrated Xe2+ supports compression on system memory */
-	if (intel_gen(devid) >= 20 && !is_dgfx && is_intel_system_region(fd, region))
+	if (intel_gen_from_pciid(devid) >= 20 && !is_dgfx && is_intel_system_region(fd, region))
 		return true;
 
 	/* Discrete supports compression on vram */
diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 0d1e0290f..d63cbe2e3 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2381,7 +2381,7 @@ static bool __run_intel_compute_kernel(int fd,
 				       struct user_execenv *user,
 				       enum execenv_alloc_prefs alloc_prefs)
 {
-	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
 	int batch;
 	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
 	enum intel_driver driver = get_intel_driver(fd);
@@ -2856,7 +2856,7 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 		bool threadgroup_preemption,
 		enum execenv_alloc_prefs alloc_prefs)
 {
-	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
 	int batch;
 	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
 	enum intel_driver driver = get_intel_driver(fd);
@@ -2910,7 +2910,7 @@ static bool __run_intel_compute_kernel_preempt(int fd,
  */
 bool xe_kernel_preempt_check(int fd, enum xe_compute_preempt_type required_preempt)
 {
-	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
 	int batch = find_preempt_batch(ip_ver);
 
 	if (batch < 0) {
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 89fa6788f..ba16975f5 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -739,20 +739,37 @@ const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid)
 }
 
 /**
- * intel_gen:
+ * intel_gen_from_pciid:
  * @devid: pci device id
  *
  * Computes the Intel GFX generation for the given device id.
  *
+ * Deprecated: Prefer the fd-based intel_gen() where a DRM device fd is
+ * available. Use this function only in contexts where no fd is accessible,
+ * e.g. when the DRM driver is not loaded or in cross-environment tools.
+ *
  * Returns:
  * The GFX generation on successful lookup, -1u on failure.
  */
-unsigned intel_gen(uint16_t devid)
+unsigned intel_gen_from_pciid(uint16_t devid)
 {
 	return intel_get_device_info(devid)->graphics_ver ?: -1u;
 }
 
-unsigned intel_graphics_ver(uint16_t devid)
+/**
+ * intel_graphics_ver_from_pciid:
+ * @devid: pci device id
+ *
+ * Computes the Intel graphics IP version for the given device id.
+ *
+ * Deprecated: Prefer the fd-based intel_graphics_ver() where a DRM device fd
+ * is available. Use this function only in contexts where no fd is accessible,
+ * e.g. when the DRM driver is not loaded or in cross-environment tools.
+ *
+ * Returns:
+ * The graphics IP version on successful lookup.
+ */
+unsigned intel_graphics_ver_from_pciid(uint16_t devid)
 {
 	const struct intel_device_info *info = intel_get_device_info(devid);
 
diff --git a/lib/intel_mmio.c b/lib/intel_mmio.c
index 267d07b39..8caeb8479 100644
--- a/lib/intel_mmio.c
+++ b/lib/intel_mmio.c
@@ -152,7 +152,7 @@ intel_mmio_use_pci_bar(struct intel_mmio_data *mmio_data, struct pci_device *pci
 	else
 		mmio_bar = 0;
 
-	gen = intel_gen(devid);
+	gen = intel_gen_from_pciid(devid);
 	if (gen >= 12)
 		mmio_size = pci_dev->regions[mmio_bar].size;
 	else if (gen >= 5)
@@ -228,7 +228,7 @@ intel_register_access_init(struct intel_mmio_data *mmio_data, struct pci_device
 	igt_assert(mmio_data->igt_mmio != NULL);
 
 	mmio_data->safe = (safe != 0 &&
-			intel_gen(pci_dev->device_id) >= 4) ? true : false;
+			intel_gen_from_pciid(pci_dev->device_id) >= 4) ? true : false;
 	mmio_data->pci_device_id = pci_dev->device_id;
 	if (mmio_data->safe)
 		mmio_data->map = intel_get_register_map(mmio_data->pci_device_id);
@@ -304,7 +304,7 @@ intel_register_read(struct intel_mmio_data *mmio_data, uint32_t reg)
 	struct intel_register_range *range;
 	uint32_t ret;
 
-	if (intel_gen(mmio_data->pci_device_id) >= 6)
+	if (intel_gen_from_pciid(mmio_data->pci_device_id) >= 6)
 		igt_assert(mmio_data->key != -1);
 
 	if (!mmio_data->safe)
@@ -343,7 +343,7 @@ intel_register_write(struct intel_mmio_data *mmio_data, uint32_t reg, uint32_t v
 {
 	struct intel_register_range *range;
 
-	if (intel_gen(mmio_data->pci_device_id) >= 6)
+	if (intel_gen_from_pciid(mmio_data->pci_device_id) >= 6)
 		igt_assert(mmio_data->key != -1);
 
 	if (!mmio_data->safe)
diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index 778fd848e..7e934ff24 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -28,7 +28,7 @@ struct drm_intel_mocs_index {
 static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
 {
 	uint16_t devid = intel_get_drm_devid(fd);
-	unsigned int ip_ver = intel_graphics_ver(devid);
+	unsigned int ip_ver = intel_graphics_ver_from_pciid(devid);
 
 	/*
 	 * Gen >= 12 onwards don't have a setting for PTE,
@@ -126,7 +126,7 @@ uint8_t intel_get_defer_to_pat_mocs_index(int fd)
 	struct drm_intel_mocs_index mocs;
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	igt_assert(intel_gen(dev_id) >= 20);
+	igt_assert(intel_gen_from_pciid(dev_id) >= 20);
 
 	get_mocs_index(fd, &mocs);
 
diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 9feeeb39d..92722963f 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -127,7 +127,7 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 		pat->wt = 2;
 		pat->wb = 3;
 		pat->max_index = 7;
-	} else if (intel_graphics_ver(dev_id) <= IP_VER(12, 60)) {
+	} else if (intel_graphics_ver_from_pciid(dev_id) <= IP_VER(12, 60)) {
 		pat->uc = 3;
 		pat->wt = 2;
 		pat->wb = 0;
@@ -158,7 +158,7 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
 	struct intel_pat_cache pat = {};
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	igt_assert(intel_gen(dev_id) >= 20);
+	igt_assert(intel_gen_from_pciid(dev_id) >= 20);
 
 	intel_get_pat_idx(fd, &pat);
 	return pat.uc_comp;
diff --git a/lib/intel_reg_map.c b/lib/intel_reg_map.c
index 0e2ee06c8..80922ea6f 100644
--- a/lib/intel_reg_map.c
+++ b/lib/intel_reg_map.c
@@ -131,7 +131,7 @@ struct intel_register_map
 intel_get_register_map(uint32_t devid)
 {
 	struct intel_register_map map;
-	const int gen = intel_gen(devid);
+	const int gen = intel_gen_from_pciid(devid);
 
 	if (gen >= 6) {
 		map.map = gen6_gt_register_map;
diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index ef7221470..efc052acf 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1072,7 +1072,7 @@ void gem_require_ring(int fd, unsigned ring)
  */
 bool gem_has_mocs_registers(int fd)
 {
-	return intel_gen(intel_get_drm_devid(fd)) >= 9;
+	return intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 9;
 }
 
 /**
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index d44988010..56bea28c3 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -265,12 +265,12 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 	if (buf->compression == I915_COMPRESSION_MEDIA)
 		ss->ss7.tgl.media_compression = 1;
 	else if (buf->compression == I915_COMPRESSION_RENDER) {
-		if (intel_gen(ibb->devid) >= 20)
+		if (intel_gen_from_pciid(ibb->devid) >= 20)
 			ss->ss6.aux_mode = 0x0; /* AUX_NONE, unified compression */
 		else
 			ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
 
-		if (intel_gen(ibb->devid) < 12 && buf->ccs[0].stride) {
+		if (intel_gen_from_pciid(ibb->devid) < 12 && buf->ccs[0].stride) {
 			ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
 
 			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
@@ -312,7 +312,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
 			ss->ss7.dg2.disable_support_for_multi_gpu_atomics = 1;
 
-			if (intel_gen(ibb->devid) >= 20)
+			if (intel_gen_from_pciid(ibb->devid) >= 20)
 				ss->ss12.lnl.compression_format = lnl_compression_format(buf);
 			else
 				ss->ss12.dg2.compression_format = dg2_compression_format(buf);
@@ -690,7 +690,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
 	/* WaBindlessSurfaceStateModifyEnable:skl,bxt */
 	/* The length has to be one less if we dont modify
 	   bindless state */
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20)
 		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | 20);
 	else
 		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | (19 - 1 - 2));
@@ -735,7 +735,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
 
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
+	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20) {
 		/* Bindless sampler */
 		intel_bb_out(ibb, 0);
 		intel_bb_out(ibb, 0);
@@ -746,7 +746,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
 static void
 gen7_emit_urb(struct intel_bb *ibb) {
 	/* XXX: Min valid values from mesa */
-	const int vs_entries = intel_gen(ibb->devid) >= 35 ? 128 : 64;
+	const int vs_entries = intel_gen_from_pciid(ibb->devid) >= 35 ? 128 : 64;
 	const int vs_size = 2;
 	const int vs_start = 4;
 
@@ -908,7 +908,7 @@ gen9_emit_ds(struct intel_bb *ibb) {
 
 static void
 gen8_emit_wm_hz_op(struct intel_bb *ibb) {
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
+	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20) {
 		intel_bb_out(ibb, GEN8_3DSTATE_WM_HZ_OP | (6-2));
 		intel_bb_out(ibb, 0);
 	} else {
@@ -998,7 +998,7 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	intel_bb_out(ibb, 0);
 
 	intel_bb_out(ibb, GEN7_3DSTATE_PS | (12-2));
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20)
 		intel_bb_out(ibb, kernel | 1);
 	else
 		intel_bb_out(ibb, kernel);
@@ -1015,7 +1015,7 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	intel_bb_out(ibb, (max_threads - 1) << GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
 	             GEN6_3DSTATE_WM_16_DISPATCH_ENABLE |
 	             (fast_clear ? GEN8_3DSTATE_FAST_CLEAR_ENABLE : 0));
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20)
 		intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT |
 			     GENXE_KERNEL0_POLY_PACK16_FIXED << GENXE_KERNEL0_PACKING_POLICY);
 	else
@@ -1070,7 +1070,7 @@ gen9_emit_depth(struct intel_bb *ibb)
 
 static void
 gen7_emit_clear(struct intel_bb *ibb) {
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20)
 		return;
 
 	intel_bb_out(ibb, GEN7_3DSTATE_CLEAR_PARAMS | (3-2));
@@ -1081,7 +1081,7 @@ gen7_emit_clear(struct intel_bb *ibb) {
 static void
 gen6_emit_drawing_rectangle(struct intel_bb *ibb, const struct intel_buf *dst)
 {
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20)
 		intel_bb_out(ibb, GENXE2_3DSTATE_DRAWING_RECTANGLE_FAST | (4 - 2));
 	else
 		intel_bb_out(ibb, GEN4_3DSTATE_DRAWING_RECTANGLE | (4 - 2));
@@ -1275,7 +1275,7 @@ void _gen9_render_op(struct intel_bb *ibb,
 
 	gen9_emit_state_base_address(ibb);
 
-	if (HAS_4TILE(ibb->devid) || intel_gen(ibb->devid) > 12) {
+	if (HAS_4TILE(ibb->devid) || intel_gen_from_pciid(ibb->devid) > 12) {
 		intel_bb_out(ibb, GEN4_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2);
 		intel_bb_emit_reloc(ibb, ibb->handle,
 				    I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0,
diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 084445305..2bdd7a3a9 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -75,7 +75,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
 
 	if (flags & COMPRESSION)
-		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
+		igt_require(intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 20);
 
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 229deafa7..57b89fbf7 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -303,7 +303,7 @@ intel_xe_perf_for_devinfo(uint32_t device_id,
 		intel_xe_perf_load_metrics_bmg(perf);
 	} else if (devinfo->is_pantherlake) {
 		intel_xe_perf_load_metrics_ptl(perf);
-	} else if (intel_graphics_ver(device_id) >= IP_VER(20, 0)) {
+	} else if (intel_graphics_ver_from_pciid(device_id) >= IP_VER(20, 0)) {
 		intel_xe_perf_load_metrics_lnl(perf);
 	} else {
 		return unsupported_xe_oa_platform(perf);
@@ -455,7 +455,7 @@ xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
 	u8 *ptr;
 
 	/* Only ADL-P, DG2 and newer ip support hwconfig, use hardcoded values for previous */
-	if (intel_graphics_ver(device_id) >= IP_VER(12, 55) || devinfo->is_alderlake_p) {
+	if (intel_graphics_ver_from_pciid(device_id) >= IP_VER(12, 55) || devinfo->is_alderlake_p) {
 		query_hwconfig(drm_fd, &topinfo);
 	} else {
 		topinfo.max_slices = 1;
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 4dc110c22..9148c7a13 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -167,7 +167,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 		spin->batch[b++] = opts->mem_copy->dst_offset << 32;
 
 		devid = intel_get_drm_devid(opts->mem_copy->fd);
-		if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+		if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0))
 			spin->batch[b++] = opts->mem_copy->src->mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT |
 					   opts->mem_copy->dst->mocs_index << XE2_MEM_COPY_DST_MOCS_SHIFT;
 		else
diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index f8dda09fb..338265116 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -55,7 +55,7 @@ static uint64_t get_vfid_mask(int fd)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	return (intel_graphics_ver(dev_id) >= IP_VER(12, 50)) ?
+	return (intel_graphics_ver_from_pciid(dev_id) >= IP_VER(12, 50)) ?
 		GGTT_PTE_VFID_MASK : PRE_1250_IP_VER_GGTT_PTE_VFID_MASK;
 }
 
diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index 464576d1b..19a476ea5 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -625,7 +625,7 @@ static void execbuf_with_allocator(int fd)
 	uint64_t ahnd, sz = 4096, gtt_size;
 	unsigned int flags = EXEC_OBJECT_PINNED;
 	uint32_t *ptr, batch[32], copied;
-	int gen = intel_gen(intel_get_drm_devid(fd));
+	int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	int i;
 	const uint32_t magic = 0x900df00d;
 
diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 67e923cef..ed8955a87 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -1052,7 +1052,7 @@ static void do_intel_bb_blit(struct buf_ops *bops, int loops, uint32_t tiling)
 	gem_require_blitter(i915);
 
 	/* We'll fix it for gen2/3 later. */
-	igt_require(intel_gen(intel_get_drm_devid(i915)) > 3);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) > 3);
 
 	for (i = 0; i < loops; i++) {
 		fails += __do_intel_bb_blit(bops, tiling);
@@ -1316,10 +1316,10 @@ static int render(struct buf_ops *bops, uint32_t tiling, bool do_reloc,
 	uint32_t devid = intel_get_drm_devid(i915);
 	igt_render_copyfunc_t render_copy = NULL;
 
-	igt_debug("%s() gen: %d\n", __func__, intel_gen(devid));
+	igt_debug("%s() gen: %d\n", __func__, intel_gen_from_pciid(devid));
 
 	/* Don't use relocations on gen12+ */
-	igt_require((do_reloc && intel_gen(devid) < 12) ||
+	igt_require((do_reloc && intel_gen_from_pciid(devid) < 12) ||
 		    !do_reloc);
 
 	if (do_reloc)
@@ -1597,7 +1597,7 @@ int igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
 	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		bops = buf_ops_create(i915);
-		gen = intel_gen(intel_get_drm_devid(i915));
+		gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	}
 
 	igt_describe("Ensure reset is possible on fresh bb");
@@ -1659,7 +1659,7 @@ int igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
 		do_intel_bb_blit(bops, 10, I915_TILING_X);
 
 	igt_subtest("intel-bb-blit-y") {
-		igt_require(intel_gen(intel_get_drm_devid(i915)) >= 6);
+		igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 6);
 		do_intel_bb_blit(bops, 10, I915_TILING_Y);
 	}
 
diff --git a/tests/intel/gem_bad_reloc.c b/tests/intel/gem_bad_reloc.c
index 8a5f4eae4..769395c6c 100644
--- a/tests/intel/gem_bad_reloc.c
+++ b/tests/intel/gem_bad_reloc.c
@@ -84,7 +84,7 @@ static void negative_reloc(int fd, unsigned flags)
 	uint64_t *offsets;
 	int i;
 
-	igt_require(intel_gen(intel_get_drm_devid(fd)) >= 7);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 7);
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = gem_create(fd, 8192);
@@ -135,7 +135,7 @@ static void negative_reloc(int fd, unsigned flags)
 
 static void negative_reloc_blt(int fd)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[1024][2];
 	struct drm_i915_gem_relocation_entry reloc;
diff --git a/tests/intel/gem_blits.c b/tests/intel/gem_blits.c
index 3f7fb1564..d0e118374 100644
--- a/tests/intel/gem_blits.c
+++ b/tests/intel/gem_blits.c
@@ -830,7 +830,7 @@ int igt_main()
 		gem_require_blitter(device.fd);
 
 		device.pciid = intel_get_drm_devid(device.fd);
-		device.gen = intel_gen(device.pciid);
+		device.gen = intel_gen_from_pciid(device.pciid);
 		device.llc = gem_has_llc(device.fd);
 		device.ahnd = get_reloc_ahnd(device.fd, 0);
 	}
diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
index b2688774d..285732acf 100644
--- a/tests/intel/gem_close_race.c
+++ b/tests/intel/gem_close_race.c
@@ -347,7 +347,7 @@ int igt_main()
 		igt_require_gem(fd);
 
 		devid = intel_get_drm_devid(fd);
-		has_64bit_relocations = intel_gen(devid) >= 8;
+		has_64bit_relocations = intel_gen_from_pciid(devid) >= 8;
 		has_softpin = !gem_has_relocations(fd);
 		exec_addr = gem_detect_safe_start_offset(fd);
 		data_addr = gem_detect_safe_alignment(fd);
diff --git a/tests/intel/gem_concurrent_all.c b/tests/intel/gem_concurrent_all.c
index 641888331..8825a1fa0 100644
--- a/tests/intel/gem_concurrent_all.c
+++ b/tests/intel/gem_concurrent_all.c
@@ -1904,7 +1904,7 @@ int igt_main()
 		igt_require_gem(fd);
 		intel_detect_and_clear_missed_interrupts(fd);
 		devid = intel_get_drm_devid(fd);
-		gen = intel_gen(devid);
+		gen = intel_gen_from_pciid(devid);
 		rendercopy = igt_get_render_copyfunc(fd);
 
 		vgem_drv = __drm_open_driver(DRIVER_VGEM);
diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
index be7d46571..6bfbc0dfb 100644
--- a/tests/intel/gem_ctx_create.c
+++ b/tests/intel/gem_ctx_create.c
@@ -309,7 +309,7 @@ static void xchg_ptr(void *array, unsigned i, unsigned j)
 
 static unsigned __context_size(int fd)
 {
-	switch (intel_gen(intel_get_drm_devid(fd))) {
+	switch (intel_gen_from_pciid(intel_get_drm_devid(fd))) {
 	case 0:
 	case 1:
 	case 2:
@@ -478,7 +478,7 @@ static void basic_ext_param(int i915)
 static void check_single_timeline(int i915, uint32_t ctx, int num_engines)
 {
 #define RCS_TIMESTAMP (0x2000 + 0x358)
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	const int has_64bit_reloc = gen >= 8;
 	struct drm_i915_gem_exec_object2 results = { .handle = gem_create(i915, 4096) };
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
index de1935ec5..7f05578c8 100644
--- a/tests/intel/gem_ctx_engines.c
+++ b/tests/intel/gem_ctx_engines.c
@@ -474,7 +474,7 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
 			const struct intel_execution_engine2 *e)
 {
 #define RCS_TIMESTAMP (mmio_base + 0x358)
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	unsigned int mmio_base = gem_engine_mmio_base(i915, e->name);
 	const int has_64bit_reloc = gen >= 8;
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, I915_EXEC_RING_MASK + 1);
@@ -571,7 +571,7 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
 
 static void independent_all(int i915, const intel_ctx_t *ctx)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *e;
 	igt_spin_t *spin = NULL;
 	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
@@ -643,7 +643,7 @@ int igt_main()
 		const intel_ctx_t *ctx;
 
 		igt_require(gem_scheduler_enabled(i915));
-		igt_require(intel_gen(intel_get_drm_devid(i915)) >= 6);
+		igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 6);
 
 		ctx = intel_ctx_create_all_physical(i915);
 		for_each_ctx_engine(i915, ctx, e) {
diff --git a/tests/intel/gem_ctx_isolation.c b/tests/intel/gem_ctx_isolation.c
index e1585cbc6..c2cbe70ea 100644
--- a/tests/intel/gem_ctx_isolation.c
+++ b/tests/intel/gem_ctx_isolation.c
@@ -273,7 +273,7 @@ static void tmpl_regs(int fd,
 		      uint32_t handle,
 		      uint32_t value)
 {
-	const unsigned int gen_bit = 1 << intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen_bit = 1 << intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const unsigned int engine_bit = ENGINE(e->class, e->instance);
 	const uint32_t mmio_base = gem_engine_mmio_base(fd, e->name);
 	unsigned int regs_size;
@@ -318,7 +318,7 @@ static uint32_t read_regs(int fd,
 			  const struct intel_execution_engine2 *e,
 			  unsigned int flags)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const unsigned int gen_bit = 1 << gen;
 	const unsigned int engine_bit = ENGINE(e->class, e->instance);
 	const uint32_t mmio_base = gem_engine_mmio_base(fd, e->name);
@@ -408,7 +408,7 @@ static void write_regs(int fd, uint64_t ahnd,
 		       unsigned int flags,
 		       uint32_t value)
 {
-	const unsigned int gen_bit = 1 << intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen_bit = 1 << intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const unsigned int engine_bit = ENGINE(e->class, e->instance);
 	const uint32_t mmio_base = gem_engine_mmio_base(fd, e->name);
 	struct drm_i915_gem_exec_object2 obj;
@@ -475,7 +475,7 @@ static void restore_regs(int fd,
 			 unsigned int flags,
 			 uint32_t regs)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const unsigned int gen_bit = 1 << gen;
 	const unsigned int engine_bit = ENGINE(e->class, e->instance);
 	const uint32_t mmio_base = gem_engine_mmio_base(fd, e->name);
@@ -561,7 +561,7 @@ static void dump_regs(int fd,
 		      const struct intel_execution_engine2 *e,
 		      unsigned int regs)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const unsigned int gen_bit = 1 << gen;
 	const unsigned int engine_bit = ENGINE(e->class, e->instance);
 	const uint32_t mmio_base = gem_engine_mmio_base(fd, e->name);
@@ -674,7 +674,7 @@ static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
 	unsigned int num_values = ARRAY_SIZE(values);
 
 	/* Sigh -- hsw: we need cmdparser access to our own registers! */
-	igt_skip_on(intel_gen(intel_get_drm_devid(fd)) < 8);
+	igt_skip_on(intel_gen_from_pciid(intel_get_drm_devid(fd)) < 8);
 
 	gem_quiescent_gpu(fd);
 
@@ -1022,7 +1022,7 @@ int igt_main()
 		has_context_isolation = __has_context_isolation(i915);
 		igt_require(has_context_isolation);
 
-		gen = intel_gen(intel_get_drm_devid(i915));
+		gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 
 		igt_warn_on_f(gen > LAST_KNOWN_GEN,
 			      "GEN not recognized! Test needs to be updated to run.\n");
diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
index fc15ecd1f..3a9ad53b7 100644
--- a/tests/intel/gem_ctx_shared.c
+++ b/tests/intel/gem_ctx_shared.c
@@ -292,7 +292,7 @@ static void exhaust_shared_gtt(int i915, unsigned int flags)
 static void exec_shared_gtt(int i915, const intel_ctx_cfg_t *cfg,
 			    unsigned int ring)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj = {};
 	struct drm_i915_gem_execbuffer2 execbuf = {
@@ -556,7 +556,7 @@ static void store_dword(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
 			uint32_t cork, uint64_t cork_size,
 			unsigned write_domain)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -683,7 +683,7 @@ static uint32_t store_timestamp(int i915,
 				int fence,
 				int offset)
 {
-	const bool r64b = intel_gen(intel_get_drm_devid(i915)) >= 8;
+	const bool r64b = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
 	uint32_t handle = gem_create(i915, 4096);
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = handle,
@@ -714,7 +714,7 @@ static uint32_t store_timestamp(int i915,
 		MI_BATCH_BUFFER_END
 	};
 
-	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 7);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 7);
 
 	gem_write(i915, handle, 0, batch, sizeof(batch));
 	obj.relocs_ptr = to_user_pointer(&reloc);
diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
index 20ab14784..aa6420a94 100644
--- a/tests/intel/gem_ctx_sseu.c
+++ b/tests/intel/gem_ctx_sseu.c
@@ -523,7 +523,7 @@ int igt_main()
 		igt_require_gem(fd);
 
 		__intel_devid__ = intel_get_drm_devid(fd);
-		__intel_gen__ = intel_gen(__intel_devid__);
+		__intel_gen__ = intel_gen_from_pciid(__intel_devid__);
 
 		igt_require(kernel_has_per_context_sseu_support(fd));
 	}
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index 729aaf7cc..ac1965565 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -300,10 +300,10 @@ static igt_spin_t *__spin_poll(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 	};
 
 	if (!gem_engine_has_cmdparser(fd, &ctx->cfg, opts.engine) &&
-	    intel_gen(intel_get_drm_devid(fd)) != 6)
+	    intel_gen_from_pciid(intel_get_drm_devid(fd)) != 6)
 		opts.flags |= IGT_SPIN_INVALID_CS;
 
-	if (intel_gen(intel_get_drm_devid(fd)) > 7)
+	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) > 7)
 		opts.flags |= IGT_SPIN_FAST;
 
 	if (gem_can_store_dword(fd, opts.engine))
@@ -420,7 +420,7 @@ static void check_wait_elapsed(const char *prefix, int fd, igt_stats_t *st)
 	 * modeset back on) around resets, so may take a lot longer.
 	 */
 	limit = 250e6;
-	if (intel_gen(intel_get_drm_devid(fd)) < 5 || intel_gen(intel_get_drm_devid(fd)) > 11)
+	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) < 5 || intel_gen_from_pciid(intel_get_drm_devid(fd)) > 11)
 		limit += 300e6; /* guestimate for 2x worstcase modeset */
 
 	med = igt_stats_get_median(st);
diff --git a/tests/intel/gem_evict_alignment.c b/tests/intel/gem_evict_alignment.c
index 0c1f4ac52..7bb3b64fb 100644
--- a/tests/intel/gem_evict_alignment.c
+++ b/tests/intel/gem_evict_alignment.c
@@ -88,7 +88,7 @@ copy(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo,
 	batch[i++] = (XY_SRC_COPY_BLT_CMD |
 		    XY_SRC_COPY_BLT_WRITE_ALPHA |
 		    XY_SRC_COPY_BLT_WRITE_RGB | 6);
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
 		batch[i - 1] += 2;
 	batch[i++] = (3 << 24) | /* 32 bits */
 		  (0xcc << 16) | /* copy ROP */
@@ -96,12 +96,12 @@ copy(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo,
 	batch[i++] = 0; /* dst x1,y1 */
 	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
 	batch[i++] = 0; /* dst reloc */
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
 		batch[i++] = 0; /* FIXME */
 	batch[i++] = 0; /* src x1,y1 */
 	batch[i++] = WIDTH*4;
 	batch[i++] = 0; /* src reloc */
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
 		batch[i++] = 0; /* FIXME */
 	batch[i++] = MI_BATCH_BUFFER_END;
 	batch[i++] = MI_NOOP;
diff --git a/tests/intel/gem_evict_everything.c b/tests/intel/gem_evict_everything.c
index 28ac67513..c1be9771d 100644
--- a/tests/intel/gem_evict_everything.c
+++ b/tests/intel/gem_evict_everything.c
@@ -132,7 +132,7 @@ copy(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	batch[i++] = (XY_SRC_COPY_BLT_CMD |
 		    XY_SRC_COPY_BLT_WRITE_ALPHA |
 		    XY_SRC_COPY_BLT_WRITE_RGB | 6);
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
 		batch[i - 1] += 2;
 	batch[i++] = (3 << 24) | /* 32 bits */
 		  (0xcc << 16) | /* copy ROP */
@@ -140,12 +140,12 @@ copy(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	batch[i++] = 0; /* dst x1,y1 */
 	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
 	batch[i++] = 0; /* dst reloc */
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
 		batch[i++] = 0; /* FIXME */
 	batch[i++] = 0; /* src x1,y1 */
 	batch[i++] = WIDTH*4;
 	batch[i++] = 0; /* src reloc */
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
 		batch[i++] = 0; /* FIXME */
 	batch[i++] = MI_BATCH_BUFFER_END;
 	batch[i++] = MI_NOOP;
@@ -163,7 +163,7 @@ copy(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	reloc[1].target_handle = src;
 	reloc[1].delta = 0;
 	reloc[1].offset = 7 * sizeof(batch[0]);
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
 		reloc[1].offset += sizeof(batch[0]);
 	reloc[1].presumed_offset = 0;
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
index 9af06bb41..9c8071884 100644
--- a/tests/intel/gem_exec_async.c
+++ b/tests/intel/gem_exec_async.c
@@ -45,7 +45,7 @@ static void store_dword(int fd, int id, const intel_ctx_t *ctx,
 			 unsigned ring, uint32_t target, uint64_t target_offset,
 			 uint32_t offset, uint32_t value)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
index 6a71893d1..9af1ee14b 100644
--- a/tests/intel/gem_exec_await.c
+++ b/tests/intel/gem_exec_await.c
@@ -83,7 +83,7 @@ static void wide(int fd, intel_ctx_cfg_t *cfg, int ring_size,
 {
 	const struct intel_execution_engine2 *engine;
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct {
 		struct drm_i915_gem_exec_object2 *obj;
 		struct drm_i915_gem_exec_object2 exec[2];
diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index 19c612bb3..8c22669a7 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -2631,7 +2631,7 @@ static int read_ctx_timestamp_frequency(int i915)
 		.value = &value,
 		.param = I915_PARAM_CS_TIMESTAMP_FREQUENCY,
 	};
-	if (intel_gen(intel_get_drm_devid(i915)) != 11)
+	if (intel_gen_from_pciid(intel_get_drm_devid(i915)) != 11)
 		ioctl(i915, DRM_IOCTL_I915_GETPARAM, &gp);
 	return value;
 }
@@ -2719,7 +2719,7 @@ static void __fairslice(int i915,
 static void fairslice(int i915)
 {
 	/* Relative CS mmio */
-	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 11);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 11);
 
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
diff --git a/tests/intel/gem_exec_big.c b/tests/intel/gem_exec_big.c
index 5430af47e..126c795d4 100644
--- a/tests/intel/gem_exec_big.c
+++ b/tests/intel/gem_exec_big.c
@@ -326,7 +326,7 @@ int igt_main()
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 
-		use_64bit_relocs = intel_gen(intel_get_drm_devid(i915)) >= 8;
+		use_64bit_relocs = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
 		has_relocs = gem_has_relocations(i915);
 	}
 
diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index 15058e28d..d23d3a572 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -302,7 +302,7 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 		       const struct intel_execution_engine2 *e,
 		       uint32_t target, uint64_t target_size, uint32_t region)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[4];
 #define SCRATCH 0
 #define CAPTURE 1
@@ -470,7 +470,7 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 #define INCREMENTAL 0x1
 #define ASYNC 0x2
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 *obj;
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -658,7 +658,7 @@ static bool needs_recoverable_ctx(int fd)
 		return false;
 
 	devid = intel_get_drm_devid(fd);
-	return gem_has_lmem(fd) ||  intel_graphics_ver(devid) > IP_VER(12, 0);
+	return gem_has_lmem(fd) ||  intel_graphics_ver_from_pciid(devid) > IP_VER(12, 0);
 }
 
 #define find_first_available_engine(fd, ctx, e, saved) \
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
index ac23714b7..b9425bca8 100644
--- a/tests/intel/gem_exec_fair.c
+++ b/tests/intel/gem_exec_fair.c
@@ -143,7 +143,7 @@ static bool has_mi_math(int i915, const struct intel_execution_engine2 *e)
 {
 	uint32_t devid = intel_get_drm_devid(i915);
 
-	if (intel_gen(devid) >= 8)
+	if (intel_gen_from_pciid(devid) >= 8)
 		return true;
 
 	if (!IS_HASWELL(devid))
@@ -195,7 +195,7 @@ static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
 static uint64_t ns_to_ctx_ticks(int i915, uint64_t ns)
 {
 	int f = read_timestamp_frequency(i915);
-	if (intel_gen(intel_get_drm_devid(i915)) == 11)
+	if (intel_gen_from_pciid(intel_get_drm_devid(i915)) == 11)
 		f = 12500000; /* gen11!!! are you feeling alright? CTX vs CS */
 	return div64_u64_round_up(ns * f, NSEC64);
 }
@@ -212,7 +212,7 @@ static void delay(int i915,
 		  uint64_t addr,
 		  uint64_t ns)
 {
-	const int use_64b = intel_gen(intel_get_drm_devid(i915)) >= 8;
+	const int use_64b = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
 	const uint32_t base = gem_engine_mmio_base(i915, e->name);
 	const uint32_t runtime = base + (use_64b ? 0x3a8 : 0x358);
 #define CS_GPR(x) (base + 0x600 + 8 * (x))
@@ -317,7 +317,7 @@ static void tslog(int i915,
 		  uint32_t handle,
 		  uint64_t addr)
 {
-	const int use_64b = intel_gen(intel_get_drm_devid(i915)) >= 8;
+	const int use_64b = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
 	const uint32_t base = gem_engine_mmio_base(i915, e->name);
 #define CS_GPR(x) (base + 0x600 + 8 * (x))
 #define CS_TIMESTAMP (base + 0x358)
@@ -441,7 +441,7 @@ read_ctx_timestamp(int i915, const intel_ctx_t *ctx,
 		.rsvd1 = ctx->id,
 		.flags = e->flags,
 	};
-	const int use_64b = intel_gen(intel_get_drm_devid(i915)) >= 8;
+	const int use_64b = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
 	const uint32_t base = gem_engine_mmio_base(i915, e->name);
 	const uint32_t runtime = base + (use_64b ? 0x3a8 : 0x358);
 	uint32_t *map, *cs;
@@ -489,7 +489,7 @@ read_ctx_timestamp(int i915, const intel_ctx_t *ctx,
 static bool has_ctx_timestamp(int i915, const intel_ctx_cfg_t *cfg,
 			      const struct intel_execution_engine2 *e)
 {
-	const int gen = intel_gen(intel_get_drm_devid(i915));
+	const int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	const intel_ctx_t *tmp_ctx;
 	uint32_t timestamp;
 
@@ -587,7 +587,7 @@ static void fair_child(int i915, const intel_ctx_t *ctx,
 	igt_assert_eq(p_fence, -1);
 
 	aux_flags = 0;
-	if (intel_gen(intel_get_drm_devid(i915)) < 8)
+	if (intel_gen_from_pciid(intel_get_drm_devid(i915)) < 8)
 		aux_flags = I915_EXEC_SECURE;
 	ping.flags |= aux_flags;
 	aux_flags |= e->flags;
@@ -734,7 +734,7 @@ static void fairness(int i915, const intel_ctx_cfg_t *cfg,
 	igt_require(has_ctx_timestamp(i915, cfg, e));
 	igt_require(gem_class_has_mutable_submission(i915, e->class));
 	if (flags & (F_ISOLATE | F_PING))
-		igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+		igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
 
 	igt_assert(pipe(lnk.child) == 0);
 	igt_assert(pipe(lnk.parent) == 0);
@@ -1018,7 +1018,7 @@ static void deadline_child(int i915,
 	unsigned int seq = 1;
 	int prev = -1, next = -1;
 
-	if (intel_gen(intel_get_drm_devid(i915)) < 8)
+	if (intel_gen_from_pciid(intel_get_drm_devid(i915)) < 8)
 		execbuf.flags |= I915_EXEC_SECURE;
 
 	gem_execbuf_wr(i915, &execbuf);
@@ -1154,7 +1154,7 @@ static void deadline(int i915, const intel_ctx_cfg_t *cfg,
 	obj[0] = delay_create(i915, delay_ctx, &pe, parent_ns);
 	if (flags & DL_PRIO)
 		gem_context_set_priority(i915, delay_ctx->id, 1023);
-	if (intel_gen(intel_get_drm_devid(i915)) < 8)
+	if (intel_gen_from_pciid(intel_get_drm_devid(i915)) < 8)
 		execbuf.flags |= I915_EXEC_SECURE;
 	for (int n = 1; n <= 5; n++) {
 		int timeline = sw_sync_timeline_create();
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index bc2755031..19a18361a 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -293,7 +293,7 @@ static void test_fence_busy(int fd, const intel_ctx_t *ctx,
 static void test_fence_busy_all(int fd, const intel_ctx_t *ctx, unsigned flags)
 {
 	const struct intel_execution_engine2 *e;
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj;
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -674,7 +674,7 @@ static void test_submitN(int i915, const intel_ctx_t *ctx,
 
 	igt_require(gem_scheduler_has_semaphores(i915));
 	igt_require(gem_scheduler_has_preemption(i915));
-	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
 
 	for (int i = 0; i < count; i++) {
 		const intel_ctx_t *tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
@@ -721,7 +721,7 @@ static void test_parallel(int i915, const intel_ctx_t *ctx,
 			  const struct intel_execution_engine2 *e)
 {
 	const struct intel_execution_engine2 *e2;
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	uint32_t scratch = gem_create(i915, 4096);
 	uint32_t *out = gem_mmap__device_coherent(i915, scratch, 0, 4096, PROT_READ);
 	uint32_t handle[I915_EXEC_RING_MASK];
@@ -844,7 +844,7 @@ static void test_parallel(int i915, const intel_ctx_t *ctx,
 static void test_concurrent(int i915, const intel_ctx_t *ctx,
 			    const struct intel_execution_engine2 *e)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 	struct drm_i915_gem_relocation_entry reloc = {
 		.target_handle =  gem_create(i915, 4096),
@@ -2607,7 +2607,7 @@ static bool use_set_predicate_result(int i915)
 {
 	uint16_t devid = intel_get_drm_devid(i915);
 
-	return intel_graphics_ver(devid) >= IP_VER(12, 50);
+	return intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 50);
 }
 
 static struct drm_i915_gem_exec_object2
@@ -3289,7 +3289,7 @@ int igt_main()
 			igt_subtest_with_dynamic("submit") {
 				igt_require(gem_scheduler_has_semaphores(i915));
 				igt_require(gem_scheduler_has_preemption(i915));
-				igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+				igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
 
 				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
@@ -3302,7 +3302,7 @@ int igt_main()
 			igt_subtest_with_dynamic("submit3") {
 				igt_require(gem_scheduler_has_semaphores(i915));
 				igt_require(gem_scheduler_has_preemption(i915));
-				igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+				igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
 
 				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
@@ -3315,7 +3315,7 @@ int igt_main()
 			igt_subtest_with_dynamic("submit67") {
 				igt_require(gem_scheduler_has_semaphores(i915));
 				igt_require(gem_scheduler_has_preemption(i915));
-				igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+				igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
 
 				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
@@ -3512,7 +3512,7 @@ int igt_main()
 				 * engines which seems to be there
 				 * only on Gen8+
 				 */
-				igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+				igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
 			}
 
 			igt_describe(test_syncobj_timeline_chain_engines_desc);
diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
index cd8d32810..cc1db3a42 100644
--- a/tests/intel/gem_exec_flush.c
+++ b/tests/intel/gem_exec_flush.c
@@ -1579,7 +1579,7 @@ static uint32_t movnt(uint32_t *map, int i)
 static void run(int fd, unsigned ring, int nchild, int timeout,
 		unsigned flags)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 
 	/* The crux of this testing is whether writes by the GPU are coherent
 	 * from the CPU.
@@ -1870,7 +1870,7 @@ enum batch_mode {
 static void batch(int fd, unsigned ring, int nchild, int timeout,
 		  enum batch_mode mode, unsigned flags)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 
 	if (mode == BATCH_GTT)
 		gem_require_mappable_ggtt(fd);
diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index 4275d2bea..68758d0ec 100644
--- a/tests/intel/gem_exec_gttfill.c
+++ b/tests/intel/gem_exec_gttfill.c
@@ -141,7 +141,7 @@ static void submit(int fd, uint64_t ahnd, unsigned int gen,
 
 static void fillgtt(int fd, const intel_ctx_t *ctx, unsigned ring, int timeout)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_relocation_entry reloc[2];
 	unsigned engines[I915_EXEC_RING_MASK + 1];
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
index 36ad5d23a..ffb45d4f0 100644
--- a/tests/intel/gem_exec_latency.c
+++ b/tests/intel/gem_exec_latency.c
@@ -140,7 +140,7 @@ static void latency_on_ring(int fd, const intel_ctx_t *ctx,
 			    const struct intel_execution_engine2 *e,
 			    unsigned flags)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const int has_64bit_reloc = gen >= 8;
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_relocation_entry reloc;
@@ -290,7 +290,7 @@ static void latency_from_ring(int fd, const intel_ctx_t *base_ctx,
 			      const struct intel_execution_engine2 *e,
 			      unsigned flags)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const int has_64bit_reloc = gen >= 8;
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_relocation_entry reloc;
@@ -958,7 +958,7 @@ int igt_main()
 
 	igt_subtest_group() {
 		igt_fixture()
-			igt_require(intel_gen(intel_get_drm_devid(device)) >= 7);
+			igt_require(intel_gen_from_pciid(intel_get_drm_devid(device)) >= 7);
 
 		test_each_engine("rthog-submit", device, ctx, e)
 			rthog_latency_on_ring(device, ctx, e);
diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
index 975ec35d0..0c0381498 100644
--- a/tests/intel/gem_exec_nop.c
+++ b/tests/intel/gem_exec_nop.c
@@ -154,7 +154,7 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
 		      const struct intel_execution_engine2 *e,
 		      int timeout)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
 	struct drm_i915_gem_relocation_entry reloc[4], *r;
@@ -265,7 +265,7 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
 static void poll_sequential(int fd, const intel_ctx_t *ctx,
 			    const char *name, int timeout)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
diff --git a/tests/intel/gem_exec_parallel.c b/tests/intel/gem_exec_parallel.c
index 3cdae1156..3c73c007e 100644
--- a/tests/intel/gem_exec_parallel.c
+++ b/tests/intel/gem_exec_parallel.c
@@ -255,7 +255,7 @@ static void handle_close(int fd, unsigned int flags, uint32_t handle, void *data
 static void all(int fd, const intel_ctx_t *ctx,
 		struct intel_execution_engine2 *engine, unsigned flags)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	unsigned engines[I915_EXEC_RING_MASK + 1], nengine;
 	uint32_t scratch[NUMOBJ], handle[NUMOBJ];
 	struct thread *threads;
diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
index 3ba4c530b..faf7a7c6e 100644
--- a/tests/intel/gem_exec_params.c
+++ b/tests/intel/gem_exec_params.c
@@ -148,7 +148,7 @@ static bool has_resource_streamer(int fd)
 
 static void test_batch_first(int fd)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_relocation_entry reloc[2];
@@ -566,7 +566,7 @@ int igt_main()
 	}
 
 	igt_subtest("rel-constants-invalid-rel-gen5") {
-		igt_require(intel_gen(devid) > 5);
+		igt_require(intel_gen_from_pciid(devid) > 5);
 		execbuf.flags = I915_EXEC_RENDER | I915_EXEC_CONSTANTS_REL_SURFACE;
 		RUN_FAIL(EINVAL);
 	}
@@ -583,7 +583,7 @@ int igt_main()
 	}
 
 	igt_subtest("sol-reset-not-gen7") {
-		igt_require(intel_gen(devid) != 7);
+		igt_require(intel_gen_from_pciid(devid) != 7);
 		execbuf.flags = I915_EXEC_RENDER | I915_EXEC_GEN7_SOL_RESET;
 		RUN_FAIL(EINVAL);
 	}
@@ -632,7 +632,7 @@ int igt_main()
 	/* rsvd1 aka context id is already exercised  by gem_ctx_bad_exec */
 
 	igt_subtest("cliprects-invalid") {
-		igt_require(intel_gen(devid) >= 5);
+		igt_require(intel_gen_from_pciid(devid) >= 5);
 		execbuf.flags = 0;
 		execbuf.num_cliprects = 1;
 		RUN_FAIL(EINVAL);
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index ed4e77ec9..3d8ea320c 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -663,7 +663,7 @@ static void write_dword(int fd,
 			uint64_t target_offset,
 			uint32_t value)
 {
-	unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
@@ -865,7 +865,7 @@ static void check_bo(int fd, uint32_t handle)
 
 static void active(int fd, const intel_ctx_t *ctx, unsigned engine)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -944,7 +944,7 @@ static void active(int fd, const intel_ctx_t *ctx, unsigned engine)
 
 static bool has_64b_reloc(int fd)
 {
-	return intel_gen(intel_get_drm_devid(fd)) >= 8;
+	return intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8;
 }
 
 #define NORELOC 1
@@ -1268,7 +1268,7 @@ static void basic_softpin(int fd)
 static uint64_t concurrent_relocs(int i915, int idx, int count)
 {
 	struct drm_i915_gem_relocation_entry *reloc;
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	unsigned long sz;
 	int offset;
 
@@ -1371,7 +1371,7 @@ static void concurrent_child(int i915, const intel_ctx_t *ctx,
 
 static uint32_t create_concurrent_batch(int i915, unsigned int count)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	size_t sz = ALIGN(4 * (1 + 4 * count), 4096);
 	uint32_t handle = gem_create(i915, sz);
 	uint32_t *map, *cs;
diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index da88e81a6..3a0f6808c 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -176,7 +176,7 @@ static uint32_t __store_dword(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 			      uint32_t cork, uint64_t cork_offset,
 			      int fence, unsigned write_domain)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -659,7 +659,7 @@ static void timeslice(int i915, const intel_ctx_cfg_t *cfg,
 	 */
 
 	igt_require(gem_scheduler_has_timeslicing(i915));
-	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
 
 	ctx[0] = intel_ctx_create(i915, cfg);
 	obj.handle = timeslicing_batches(i915, &offset);
@@ -761,7 +761,7 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
 	 */
 
 	igt_require(gem_scheduler_has_timeslicing(i915));
-	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
 
 	/* No coupling between requests; free to timeslice */
 
@@ -796,7 +796,7 @@ static void lateslice(int i915, const intel_ctx_cfg_t *cfg,
 	uint64_t ahnd[3];
 
 	igt_require(gem_scheduler_has_timeslicing(i915));
-	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
 
 	ctx = intel_ctx_create(i915, cfg);
 	ahnd[0] = get_reloc_ahnd(i915, ctx->id);
@@ -909,7 +909,7 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 	 */
 
 	igt_require(gem_scheduler_has_timeslicing(i915));
-	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
 	igt_require(gem_has_vm(i915));
 
 	engine_cfg.vm = gem_vm_create(i915);
@@ -1277,7 +1277,7 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
 static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
 			     unsigned long flags)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *outer, *inner;
 	const intel_ctx_t *ctx0, *ctx1;
 	uint64_t ahnd;
@@ -1371,7 +1371,7 @@ noreorder(int i915, const intel_ctx_cfg_t *cfg,
 	  unsigned int engine, int prio, unsigned int flags)
 #define CORKED 0x1
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = gem_create(i915, 4096),
@@ -2305,7 +2305,7 @@ static void wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 {
 	const unsigned int ring_size = gem_submission_measure(fd, cfg, ring);
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const int priorities[] = { MIN_PRIO, MAX_PRIO };
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_exec_object2 obj[2];
@@ -3066,7 +3066,7 @@ static int cmp_u32(const void *A, const void *B)
 static uint32_t read_ctx_timestamp(int i915, const intel_ctx_t *ctx,
 				   const struct intel_execution_engine2 *e)
 {
-	const int use_64b = intel_gen(intel_get_drm_devid(i915)) >= 8;
+	const int use_64b = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
 	const uint32_t base = gem_engine_mmio_base(i915, e->name);
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_exec_object2 obj = {
@@ -3269,7 +3269,7 @@ int igt_main()
 		igt_subtest_group() {
 			igt_fixture() {
 				igt_require(gem_scheduler_has_timeslicing(fd));
-				igt_require(intel_gen(intel_get_drm_devid(fd)) >= 8);
+				igt_require(intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8);
 			}
 
 			test_each_engine("fairslice", fd, ctx, e)
diff --git a/tests/intel/gem_exec_store.c b/tests/intel/gem_exec_store.c
index 01569ddd6..05ae63495 100644
--- a/tests/intel/gem_exec_store.c
+++ b/tests/intel/gem_exec_store.c
@@ -71,7 +71,7 @@ IGT_TEST_DESCRIPTION("Exercise store dword functionality using execbuf-ioctl");
 static void store_dword(int fd, const intel_ctx_t *ctx,
 			const struct intel_execution_engine2 *e)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -152,7 +152,7 @@ static void store_cachelines(int fd, const intel_ctx_t *ctx,
 			     const struct intel_execution_engine2 *e,
 			     unsigned int flags)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 *obj;
 	struct drm_i915_gem_relocation_entry *reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -248,7 +248,7 @@ static void store_cachelines(int fd, const intel_ctx_t *ctx,
 
 static void store_all(int fd, const intel_ctx_t *ctx)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct intel_execution_engine2 *engine;
 	struct drm_i915_gem_relocation_entry *reloc;
diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/gem_exec_suspend.c
index de81e1ef1..8f13019ef 100644
--- a/tests/intel/gem_exec_suspend.c
+++ b/tests/intel/gem_exec_suspend.c
@@ -143,7 +143,7 @@ static void test_all(int fd, const intel_ctx_t *ctx, unsigned flags, uint32_t re
 static void run_test(int fd, const intel_ctx_t *ctx,
 		     unsigned engine, unsigned flags, uint32_t region)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
index 1d01577b4..c11e272c1 100644
--- a/tests/intel/gem_exec_whisper.c
+++ b/tests/intel/gem_exec_whisper.c
@@ -164,7 +164,7 @@ static void verify_reloc(int fd, uint32_t handle,
 {
 	if (VERIFY) {
 		uint64_t target = 0;
-		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+		if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
 			gem_read(fd, handle, reloc->offset, &target, 8);
 		else
 			gem_read(fd, handle, reloc->offset, &target, 4);
@@ -203,7 +203,7 @@ static void init_hang(struct hang *h, int fd, const intel_ctx_cfg_t *cfg)
 	h->fd = drm_reopen_driver(fd);
 	igt_allow_hang(h->fd, 0, 0);
 
-	gen = intel_gen(intel_get_drm_devid(h->fd));
+	gen = intel_gen_from_pciid(intel_get_drm_devid(h->fd));
 
 	if (gem_has_contexts(fd)) {
 		h->ctx = intel_ctx_create(h->fd, cfg);
@@ -293,7 +293,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 		    unsigned engine, unsigned flags)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const unsigned int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	struct drm_i915_gem_exec_object2 batches[QLEN];
 	struct drm_i915_gem_relocation_entry inter[QLEN];
diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
index 59aa32bbd..b6df4b22b 100644
--- a/tests/intel/gem_fenced_exec_thrash.c
+++ b/tests/intel/gem_fenced_exec_thrash.c
@@ -217,7 +217,7 @@ int igt_main()
 			run_test(fd, num_fences, 0, flags);
 	}
 	igt_subtest("too-many-fences")
-		run_test(fd, num_fences + 1, intel_gen(devid) >= 4 ? 0 : ENOBUFS, 0);
+		run_test(fd, num_fences + 1, intel_gen_from_pciid(devid) >= 4 ? 0 : ENOBUFS, 0);
 
 	igt_fixture()
 		drm_close_driver(fd);
diff --git a/tests/intel/gem_gtt_hog.c b/tests/intel/gem_gtt_hog.c
index c2853665f..b92f6c29b 100644
--- a/tests/intel/gem_gtt_hog.c
+++ b/tests/intel/gem_gtt_hog.c
@@ -177,7 +177,7 @@ int igt_simple_main()
 
 	data.fd = drm_open_driver(DRIVER_INTEL);
 	data.devid = intel_get_drm_devid(data.fd);
-	data.intel_gen = intel_gen(data.devid);
+	data.intel_gen = intel_gen_from_pciid(data.devid);
 
 	gettimeofday(&start, NULL);
 	igt_fork(child, ARRAY_SIZE(children))
diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
index c1733138b..84f5dc4c0 100644
--- a/tests/intel/gem_linear_blits.c
+++ b/tests/intel/gem_linear_blits.c
@@ -110,7 +110,7 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 		batch[i++] = XY_SRC_COPY_BLT_CMD |
 			     XY_SRC_COPY_BLT_WRITE_ALPHA |
 			     XY_SRC_COPY_BLT_WRITE_RGB;
-		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+		if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
 			batch[i - 1] |= 8;
 		else
 			batch[i - 1] |= 6;
@@ -121,12 +121,12 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 		batch[i++] = 0; /* dst x1,y1 */
 		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
 		batch[i++] = obj[0].offset;
-		if (intel_gen(devid) >= 8)
+		if (intel_gen_from_pciid(devid) >= 8)
 			batch[i++] = obj[0].offset >> 32;
 		batch[i++] = 0; /* src x1,y1 */
 		batch[i++] = WIDTH * 4;
 		batch[i++] = obj[1].offset;
-		if (intel_gen(devid) >= 8)
+		if (intel_gen_from_pciid(devid) >= 8)
 			batch[i++] = obj[1].offset >> 32;
 		batch[i++] = MI_BATCH_BUFFER_END;
 		batch[i++] = MI_NOOP;
@@ -160,7 +160,7 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 	reloc[1].target_handle = src;
 	reloc[1].delta = 0;
 	reloc[1].offset = 7 * sizeof(batch[0]);
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
 		reloc[1].offset += sizeof(batch[0]);
 	reloc[1].presumed_offset = obj[1].offset;
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
index e47f4df21..89e2c836e 100644
--- a/tests/intel/gem_media_vme.c
+++ b/tests/intel/gem_media_vme.c
@@ -133,7 +133,7 @@ int igt_simple_main()
 	igt_assert(ctx);
 
 	/* ICL hangs if non-VME enabled slices are enabled with a VME kernel. */
-	if (intel_gen(devid) == 11)
+	if (intel_gen_from_pciid(devid) == 11)
 		shut_non_vme_subslices(drm_fd, ctx);
 
 	igt_fork_hang_detector(drm_fd);
diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c
index 51f2a5fee..8211fec85 100644
--- a/tests/intel/gem_mmap_gtt.c
+++ b/tests/intel/gem_mmap_gtt.c
@@ -1192,14 +1192,14 @@ test_hang_user(int i915)
 static int min_tile_width(uint32_t devid, int tiling)
 {
 	if (tiling < 0) {
-		if (intel_gen(devid) >= 4)
+		if (intel_gen_from_pciid(devid) >= 4)
 			return 4096 - min_tile_width(devid, -tiling);
 		else
 			return 1024;
 
 	}
 
-	if (intel_gen(devid) == 2)
+	if (intel_gen_from_pciid(devid) == 2)
 		return 128;
 	else if (tiling == I915_TILING_X)
 		return 512;
@@ -1212,15 +1212,15 @@ static int min_tile_width(uint32_t devid, int tiling)
 static int max_tile_width(uint32_t devid, int tiling)
 {
 	if (tiling < 0) {
-		if (intel_gen(devid) >= 4)
+		if (intel_gen_from_pciid(devid) >= 4)
 			return 4096 + min_tile_width(devid, -tiling);
 		else
 			return 2048;
 	}
 
-	if (intel_gen(devid) >= 7)
+	if (intel_gen_from_pciid(devid) >= 7)
 		return 256 << 10;
-	else if (intel_gen(devid) >= 4)
+	else if (intel_gen_from_pciid(devid) >= 4)
 		return 128 << 10;
 	else
 		return 8 << 10;
@@ -1268,7 +1268,7 @@ test_huge_bo(int fd, int huge, int tiling)
 		 * a quarter size one instead.
 		 */
 		if (tiling &&
-		    intel_gen(intel_get_drm_devid(fd)) < 4 &&
+		    intel_gen_from_pciid(intel_get_drm_devid(fd)) < 4 &&
 		    size >= gem_global_aperture_size(fd) / 2)
 			size /= 2;
 		break;
diff --git a/tests/intel/gem_read_read_speed.c b/tests/intel/gem_read_read_speed.c
index 965781ddb..4b24c03af 100644
--- a/tests/intel/gem_read_read_speed.c
+++ b/tests/intel/gem_read_read_speed.c
@@ -255,7 +255,7 @@ int igt_main()
 		igt_require_gem(fd);
 
 		devid = intel_get_drm_devid(fd);
-		igt_require(intel_gen(devid) >= 6);
+		igt_require(intel_gen_from_pciid(devid) >= 6);
 
 		rendercopy = igt_get_render_copyfunc(fd);
 		igt_require(rendercopy);
diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
index 5e7941d5a..4815d43c1 100644
--- a/tests/intel/gem_render_copy.c
+++ b/tests/intel/gem_render_copy.c
@@ -223,7 +223,7 @@ copy_from_linear_buf(data_t *data, struct intel_buf *src, struct intel_buf *dst)
 static void *linear_copy_ccs(data_t *data, struct intel_buf *buf)
 {
 	void *ccs_data, *linear;
-	unsigned int gen = intel_gen(data->devid);
+	unsigned int gen = intel_gen_from_pciid(data->devid);
 	int ccs_size = intel_buf_ccs_width(gen, buf) *
 		intel_buf_ccs_height(gen, buf);
 	int buf_size = intel_buf_size(buf);
@@ -362,7 +362,7 @@ scratch_buf_check_all(data_t *data,
 static void scratch_buf_ccs_check(data_t *data,
 				  struct intel_buf *buf)
 {
-	unsigned int gen = intel_gen(data->devid);
+	unsigned int gen = intel_gen_from_pciid(data->devid);
 	int ccs_size = intel_buf_ccs_width(gen, buf) *
 		intel_buf_ccs_height(gen, buf);
 	uint8_t *linear;
@@ -460,12 +460,12 @@ static void test(data_t *data, uint32_t src_tiling, uint32_t dst_tiling,
 		   dst_compression == I915_COMPRESSION_NONE);
 
 	/* no Yf before gen9 */
-	if (intel_gen(data->devid) < 9)
+	if (intel_gen_from_pciid(data->devid) < 9)
 		num_src--;
 
 	if (src_tiling == I915_TILING_Yf || dst_tiling == I915_TILING_Yf ||
 	    src_compressed || dst_compressed)
-		igt_require(intel_gen(data->devid) >= 9);
+		igt_require(intel_gen_from_pciid(data->devid) >= 9);
 
 	ibb = intel_bb_create(data->drm_fd, 4096);
 
diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
index 7d0be81de..f99951732 100644
--- a/tests/intel/gem_ringfill.c
+++ b/tests/intel/gem_ringfill.c
@@ -207,7 +207,7 @@ static void setup_execbuf(int fd, const intel_ctx_t *ctx,
 			  struct drm_i915_gem_relocation_entry *reloc,
 			  unsigned int ring)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *batch, *b;
 	int i;
@@ -428,7 +428,7 @@ int igt_main()
 		igt_require_gem(fd);
 		igt_require(has_lut_handle(fd));
 
-		gen = intel_gen(intel_get_drm_devid(fd));
+		gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 		if (gen > 3 && gen < 6) { /* ctg and ilk need secure batches */
 			igt_device_set_master(fd);
 			master = true;
diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
index ec08e1c13..a9aa86ecd 100644
--- a/tests/intel/gem_set_tiling_vs_blt.c
+++ b/tests/intel/gem_set_tiling_vs_blt.c
@@ -164,7 +164,7 @@ static void do_test(struct buf_ops *bops, uint32_t tiling, unsigned stride,
 
 	blt_stride = stride;
 	blt_bits = 0;
-	if (intel_gen(ibb->devid) >= 4 && tiling != I915_TILING_NONE) {
+	if (intel_gen_from_pciid(ibb->devid) >= 4 && tiling != I915_TILING_NONE) {
 		blt_stride /= 4;
 		blt_bits = XY_SRC_COPY_BLT_SRC_TILED;
 	}
diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
index 7b3fc26de..c736ba389 100644
--- a/tests/intel/gem_softpin.c
+++ b/tests/intel/gem_softpin.c
@@ -504,7 +504,7 @@ static void test_reverse(int i915)
 
 static uint64_t busy_batch(int fd)
 {
-	unsigned const int gen = intel_gen(intel_get_drm_devid(fd));
+	unsigned const int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const int has_64bit_reloc = gen >= 8;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 object[2];
@@ -692,7 +692,7 @@ static void xchg_offset(void *array, unsigned i, unsigned j)
 enum sleep { NOSLEEP, SUSPEND, HIBERNATE };
 static void test_noreloc(int fd, enum sleep sleep, unsigned flags)
 {
-	unsigned const int gen = intel_gen(intel_get_drm_devid(fd));
+	unsigned const int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const uint32_t size = 4096;
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -1021,7 +1021,7 @@ static void submit(int fd, unsigned int gen,
 static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
 				 unsigned ring, int timeout)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_execbuffer2 execbuf;
 	unsigned engines[I915_EXEC_RING_MASK + 1];
 	volatile uint64_t *shared;
diff --git a/tests/intel/gem_streaming_writes.c b/tests/intel/gem_streaming_writes.c
index b231bcfef..b52dd53e6 100644
--- a/tests/intel/gem_streaming_writes.c
+++ b/tests/intel/gem_streaming_writes.c
@@ -94,7 +94,7 @@ IGT_TEST_DESCRIPTION("Test of streaming writes into active GPU sources");
 
 static void test_streaming(int fd, int mode, int sync)
 {
-	const bool has_64bit_addr = intel_gen(intel_get_drm_devid(fd)) >= 8;
+	const bool has_64bit_addr = intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8;
 	const bool do_relocs = gem_has_relocations(fd);
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 exec[3];
@@ -274,7 +274,7 @@ static void test_streaming(int fd, int mode, int sync)
 
 static void test_batch(int fd, int mode, int reverse)
 {
-	const bool has_64bit_addr = intel_gen(intel_get_drm_devid(fd)) >= 8;
+	const bool has_64bit_addr = intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8;
 	const bool do_relocs = gem_has_relocations(fd);
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 exec[3];
diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index c6063e8f7..e41fcae6b 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -697,7 +697,7 @@ static void
 store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 	   int num_children, int timeout)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct intel_engine_data ied;
 	bool has_relocs = gem_has_relocations(fd);
 
@@ -797,7 +797,7 @@ static void
 switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 	    int num_children, int timeout)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct intel_engine_data ied;
 	bool has_relocs = gem_has_relocations(fd);
 
@@ -981,7 +981,7 @@ static void
 __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
 	     int timeout, unsigned long *cycles)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 object[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -1191,7 +1191,7 @@ sync_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
 static void
 store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct intel_engine_data ied;
 	bool has_relocs = gem_has_relocations(fd);
 
diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
index 4eb1194c1..bc2064ece 100644
--- a/tests/intel/gem_tiled_fence_blits.c
+++ b/tests/intel/gem_tiled_fence_blits.c
@@ -112,7 +112,7 @@ update_batch(int fd, uint32_t bb_handle,
 	     struct drm_i915_gem_relocation_entry *reloc,
 	     uint64_t dst_offset, uint64_t src_offset)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	const bool has_64b_reloc = gen >= 8;
 	uint32_t *batch;
 	uint32_t pitch;
@@ -202,7 +202,7 @@ static void run_test(int fd, int count, uint64_t end)
 	memset(&eb, 0, sizeof(eb));
 	eb.buffers_ptr = to_user_pointer(obj);
 	eb.buffer_count = ARRAY_SIZE(obj);
-	if (intel_gen(intel_get_drm_devid(fd)) >= 6)
+	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 6)
 		eb.flags = I915_EXEC_BLT;
 
 	bo = calloc(count,
diff --git a/tests/intel/gem_tiling_max_stride.c b/tests/intel/gem_tiling_max_stride.c
index d01c21bca..37b919c62 100644
--- a/tests/intel/gem_tiling_max_stride.c
+++ b/tests/intel/gem_tiling_max_stride.c
@@ -86,13 +86,13 @@ int igt_simple_main()
 	devid = intel_get_drm_devid(fd);
 	gem_require_mappable_ggtt(fd);
 
-	if (intel_gen(devid) >= 7) {
+	if (intel_gen_from_pciid(devid) >= 7) {
 		stride = 256 * 1024;
-	} else if (intel_gen(devid) >= 4) {
+	} else if (intel_gen_from_pciid(devid) >= 4) {
 		stride = 128 * 1024;
-	} else if (intel_gen(devid) >= 3) {
+	} else if (intel_gen_from_pciid(devid) >= 3) {
 		stride = 8 * 1024;
-	} else if (intel_gen(devid) >= 2) {
+	} else if (intel_gen_from_pciid(devid) >= 2) {
 		tile_width = 128;
 		tile_height = 16;
 		stride = 8 * 1024;
diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
index d8d227100..da5332b07 100644
--- a/tests/intel/gem_userptr_blits.c
+++ b/tests/intel/gem_userptr_blits.c
@@ -236,7 +236,7 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 			     XY_SRC_COPY_BLT_WRITE_ALPHA |
 			     XY_SRC_COPY_BLT_WRITE_RGB;
 
-		if (intel_gen(devid) >= 8)
+		if (intel_gen_from_pciid(devid) >= 8)
 			batch[i - 1] |= 8;
 		else
 			batch[i - 1] |= 6;
@@ -247,12 +247,12 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 		batch[i++] = 0; /* dst x1,y1 */
 		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
 		batch[i++] = lower_32_bits(dst_offset); /* dst reloc*/
-		if (intel_gen(devid) >= 8)
+		if (intel_gen_from_pciid(devid) >= 8)
 			batch[i++] = upper_32_bits(CANONICAL(dst_offset));
 		batch[i++] = 0; /* src x1,y1 */
 		batch[i++] = WIDTH * 4;
 		batch[i++] = lower_32_bits(src_offset); /* src reloc */
-		if (intel_gen(devid) >= 8)
+		if (intel_gen_from_pciid(devid) >= 8)
 			batch[i++] = upper_32_bits(CANONICAL(src_offset));
 		batch[i++] = MI_BATCH_BUFFER_END;
 		batch[i++] = MI_NOOP;
@@ -286,7 +286,7 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 	reloc[1].target_handle = src;
 	reloc[1].delta = 0;
 	reloc[1].offset = 7 * sizeof(batch[0]);
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
 		reloc[1].offset += sizeof(batch[0]);
 	reloc[1].presumed_offset = 0;
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
@@ -389,7 +389,7 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	reloc[1].target_handle = src;
 	reloc[1].delta = 0;
 	reloc[1].offset = 7 * sizeof(batch[0]);
-	if (intel_gen(devid) >= 8)
+	if (intel_gen_from_pciid(devid) >= 8)
 		reloc[1].offset += sizeof(batch[0]);
 	reloc[1].presumed_offset = src_offset;
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
@@ -399,7 +399,7 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 		batch[i++] = XY_SRC_COPY_BLT_CMD |
 			     XY_SRC_COPY_BLT_WRITE_ALPHA |
 			     XY_SRC_COPY_BLT_WRITE_RGB;
-		if (intel_gen(devid) >= 8)
+		if (intel_gen_from_pciid(devid) >= 8)
 			batch[i - 1] |= 8;
 		else
 			batch[i - 1] |= 6;
@@ -409,12 +409,12 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 		batch[i++] = 0; /* dst x1,y1 */
 		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
 		batch[i++] = lower_32_bits(dst_offset);
-		if (intel_gen(devid) >= 8)
+		if (intel_gen_from_pciid(devid) >= 8)
 			batch[i++] = upper_32_bits(CANONICAL(dst_offset));
 		batch[i++] = 0; /* src x1,y1 */
 		batch[i++] = WIDTH * 4;
 		batch[i++] = lower_32_bits(src_offset);
-		if (intel_gen(devid) >= 8)
+		if (intel_gen_from_pciid(devid) >= 8)
 			batch[i++] = upper_32_bits(CANONICAL(src_offset));
 		batch[i++] = MI_BATCH_BUFFER_END;
 		batch[i++] = MI_NOOP;
@@ -452,7 +452,7 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 static void store_dword(int fd, uint32_t target,
 			uint32_t offset, uint32_t value)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -1420,7 +1420,7 @@ static void store_dword_rand(int i915, const intel_ctx_t *ctx,
 			     uint32_t target, uint64_t sz,
 			     int count)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	struct drm_i915_gem_relocation_entry *reloc;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_execbuffer2 exec;
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index c30be7fca..893c4a415 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -279,7 +279,7 @@ static void execbuf(int i915)
 static void
 write_to_address(int fd, uint32_t ctx, uint64_t addr, uint32_t value)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 batch = {
 		.handle = gem_create(fd, 4096)
 	};
diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
index efa9ebebe..601d44881 100644
--- a/tests/intel/gem_watchdog.c
+++ b/tests/intel/gem_watchdog.c
@@ -333,7 +333,7 @@ static void delay(int i915,
 		  uint64_t addr,
 		  uint64_t ns)
 {
-	const int use_64b = intel_gen(intel_get_drm_devid(i915)) >= 8;
+	const int use_64b = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
 	const uint32_t base = gem_engine_mmio_base(i915, e->name);
 #define CS_GPR(x) (base + 0x600 + 8 * (x))
 #define RUNTIME (base + 0x3a8)
@@ -467,7 +467,7 @@ far_delay(int i915, unsigned long delay, unsigned int target,
 	uint32_t handle = gem_create(i915, 4096);
 	unsigned long count, submit;
 
-	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
 	igt_require(gem_class_can_store_dword(i915, e->class));
 
 	fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) | O_NONBLOCK);
diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index 07f0a7da6..34a4d6fc1 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -312,7 +312,7 @@ int igt_main()
 
 		intel_mmio_use_pci_bar(&mmio_data, igt_device_get_pci_device(device));
 
-		gen = intel_gen(intel_get_drm_devid(device));
+		gen = intel_gen_from_pciid(intel_get_drm_devid(device));
 
 		fd = igt_debugfs_open(device, "i915_wa_registers", O_RDONLY);
 		file = fdopen(fd, "r");
diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
index b9f5de234..f7df9dab5 100644
--- a/tests/intel/gen7_exec_parse.c
+++ b/tests/intel/gen7_exec_parse.c
@@ -499,7 +499,7 @@ int igt_main()
 		handle = gem_create(fd, 4096);
 
 		/* ATM cmd parser only exists on gen7. */
-		igt_require(intel_gen(intel_get_drm_devid(fd)) == 7);
+		igt_require(intel_gen_from_pciid(intel_get_drm_devid(fd)) == 7);
 		igt_fork_hang_detector(fd);
 	}
 
diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
index 961bf5e46..2a5e1bae7 100644
--- a/tests/intel/gen9_exec_parse.c
+++ b/tests/intel/gen9_exec_parse.c
@@ -1217,7 +1217,7 @@ int igt_main()
 		gem_require_blitter(i915);
 
 		igt_require(gem_cmdparser_version(i915) >= 10);
-		igt_require(intel_gen(intel_get_drm_devid(i915)) == 9);
+		igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) == 9);
 
 		handle = gem_create(i915, HANDLE_SIZE);
 
diff --git a/tests/intel/i915_getparams_basic.c b/tests/intel/i915_getparams_basic.c
index abd5dd57a..742dfd71c 100644
--- a/tests/intel/i915_getparams_basic.c
+++ b/tests/intel/i915_getparams_basic.c
@@ -89,14 +89,15 @@ subslice_total(void)
 	int ret;
 
 	ret = getparam(I915_PARAM_SUBSLICE_TOTAL, (int*)&subslice_total);
-	igt_skip_on_f(ret == -EINVAL && intel_gen(devid), "Interface not supported by kernel\n");
+	igt_skip_on_f(ret == -EINVAL && intel_gen_from_pciid(devid),
+		      "Interface not supported by kernel\n");
 
 	if (ret) {
 		/*
 		 * These devices are not required to implement the
 		 * interface. If they do not, -ENODEV must be returned.
 		*/
-		if ((intel_gen(devid) < 8) ||
+		if ((intel_gen_from_pciid(devid) < 8) ||
 		    IS_BROADWELL(devid) ||
 		    igt_run_in_simulation()) {
 			igt_assert_eq(ret, -ENODEV);
@@ -133,7 +134,7 @@ eu_total(void)
 		 * These devices are not required to implement the
 		 * interface. If they do not, -ENODEV must be returned.
 		*/
-		if ((intel_gen(devid) < 8) ||
+		if ((intel_gen_from_pciid(devid) < 8) ||
 		    IS_BROADWELL(devid) ||
 		    igt_run_in_simulation()) {
 			igt_assert_eq(ret, -ENODEV);
diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index 26e30a100..f9b9e24cc 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -77,7 +77,7 @@ IGT_TEST_DESCRIPTION("Tests the i915 module loading.");
 
 static void store_all(int i915)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	uint32_t engines[I915_EXEC_RING_MASK + 1];
 	uint32_t batch[16];
 	uint64_t ahnd, offset, bb_offset;
diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index 346796fb2..3563c4615 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -311,7 +311,7 @@ static void restore_freq(int sig)
 static void bg_load(int i915, const intel_ctx_t *ctx, uint64_t engine_flags,
 		    unsigned int flags, unsigned long *ctl, unsigned int gt)
 {
-	const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) >= 8;
+	const bool has_execlists = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
 	struct sigaction act = {
 		.sa_handler = sighandler
 	};
@@ -392,7 +392,7 @@ static void rc6_idle(int i915, const intel_ctx_t *ctx, uint64_t flags, unsigned
 {
 	const int64_t duration_ns = 2 * SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
 	const int tolerance = 20; /* Some RC6 is better than none! */
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	struct {
 		const char *name;
 		unsigned int flags;
@@ -500,7 +500,7 @@ static void rc6_fence(int i915, unsigned int gt)
 {
 	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
 	const int tolerance = 20; /* Some RC6 is better than none! */
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
 	struct power_sample sample[2];
diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index b4da27b21..ef4cc7041 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -736,7 +736,7 @@ static void debugfs_forcewake_user_subtest(void)
 {
 	int fd, rc;
 
-	igt_require(intel_gen(ms_data.devid) >= 6);
+	igt_require(intel_gen_from_pciid(ms_data.devid) >= 6);
 
 	disable_all_screens_and_wait(&ms_data);
 
diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
index 5dd571a45..4f12ed11f 100644
--- a/tests/intel/i915_pm_sseu.c
+++ b/tests/intel/i915_pm_sseu.c
@@ -300,7 +300,7 @@ gem_init(void)
 	gem.init = 1;
 
 	gem.devid = intel_get_drm_devid(gem.drm_fd);
-	gem.gen = intel_gen(gem.devid);
+	gem.gen = intel_gen_from_pciid(gem.devid);
 	igt_require_f(gem.gen >= 8,
 		      "SSEU power gating only relevant for Gen8+");
 
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 4d0bda6a7..bed7a5b2b 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -565,7 +565,7 @@ static void access_flat_ccs_surface(struct igt_fb *fb, bool verify_compression)
 	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 	uint8_t uc_mocs = intel_get_uc_mocs_index(fb->fd);
 	uint8_t comp_pat_index = intel_get_pat_idx_wt(fb->fd);
-	uint32_t region = (intel_gen(intel_get_drm_devid(fb->fd)) >= 20 &&
+	uint32_t region = (intel_gen_from_pciid(intel_get_drm_devid(fb->fd)) >= 20 &&
 			   xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
 
 	struct drm_xe_engine_class_instance inst = {
@@ -645,7 +645,7 @@ static void fill_fb_random(int drm_fd, igt_fb_t *fb)
 	igt_assert_eq(0, gem_munmap(map, fb->size));
 
 	/* randomize also ccs surface on Xe2 */
-	if (intel_gen(intel_get_drm_devid(drm_fd)) >= 20)
+	if (intel_gen_from_pciid(intel_get_drm_devid(drm_fd)) >= 20)
 		access_flat_ccs_surface(fb, false);
 }
 
@@ -1145,10 +1145,10 @@ static void test_output(data_t *data, const int testnum)
 		igt_subtest_with_dynamic_f("%s-%s", tests[testnum].testname, ccs_modifiers[i].str) {
 			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
 			    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
-				igt_require_f(intel_gen(dev_id) >= 20,
+				igt_require_f(intel_gen_from_pciid(dev_id) >= 20,
 					      "Xe2 platform needed.\n");
 			} else {
-				igt_require_f(intel_gen(dev_id) < 20,
+				igt_require_f(intel_gen_from_pciid(dev_id) < 20,
 					      "Older than Xe2 platform needed.\n");
 			}
 
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 36de84f98..ecabb2e8f 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -179,7 +179,7 @@ static bool fbc_wait_until_update(struct drm_info *drm)
 	 * For older GENs FBC is still expected to be disabled as it still
 	 * relies on a tiled and fenceable framebuffer to track modifications.
 	 */
-	if (intel_gen(intel_get_drm_devid(drm->fd)) >= 9) {
+	if (intel_gen_from_pciid(intel_get_drm_devid(drm->fd)) >= 9) {
 		if (!fbc_wait_until_enabled(drm->debugfs_fd))
 			return false;
 		/*
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 08e08c594..bd3bc84e5 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -3057,13 +3057,13 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
 
 	switch (tiling) {
 	case TILING_LINEAR:
-		return intel_gen(drm.devid) >= 9;
+		return intel_gen_from_pciid(drm.devid) >= 9;
 	case TILING_X:
 		return (intel_get_device_info(drm.devid)->display_ver > 29) ? false : true;
 	case TILING_Y:
 		return true;
 	case TILING_4:
-		return intel_gen(drm.devid) >= 12;
+		return intel_gen_from_pciid(drm.devid) >= 12;
 	default:
 		igt_assert(false);
 		return false;
@@ -4469,7 +4469,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 					igt_require(igt_draw_supports_method(drm.fd, t.method));
 
 					if (t.tiling == TILING_Y) {
-						igt_require(intel_gen(drm.devid) >= 9);
+						igt_require(intel_gen_from_pciid(drm.devid) >= 9);
 						igt_require(!intel_get_device_info(drm.devid)->has_4tile);
 					}
 
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 85ab2ec50..8ab8f609e 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -818,7 +818,7 @@ static void prepare_test(struct data *data)
 
 	create_framebuffers(data);
 
-	if (intel_gen(intel_get_drm_devid(data->drm_fd)) > 9)
+	if (intel_gen_from_pciid(intel_get_drm_devid(data->drm_fd)) > 9)
 		start_gpu_threads(data);
 }
 
@@ -826,7 +826,7 @@ static void finish_test(struct data *data)
 {
 	int i;
 
-	if (intel_gen(intel_get_drm_devid(data->drm_fd)) > 9)
+	if (intel_gen_from_pciid(intel_get_drm_devid(data->drm_fd)) > 9)
 		stop_gpu_threads(data);
 
 	/*
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index b6b2cce50..c1e1978ce 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -720,7 +720,7 @@ oa_timestamp_delta(const uint32_t *report1,
 		   const uint32_t *report0,
 		   enum drm_i915_oa_format format)
 {
-	uint32_t width = intel_graphics_ver(devid) >= IP_VER(12, 55) ? 56 : 32;
+	uint32_t width = intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 55) ? 56 : 32;
 
 	return elapsed_delta(oa_timestamp(report1, format),
 			     oa_timestamp(report0, format), width);
@@ -801,7 +801,7 @@ oa_report_ctx_is_valid(uint32_t *report)
 		return false; /* TODO */
 	} else if (IS_GEN8(devid)) {
 		return report[0] & (1ul << 25);
-	} else if (intel_gen(devid) >= 9) {
+	} else if (intel_gen_from_pciid(devid) >= 9) {
 		return report[0] & (1ul << 16);
 	}
 
@@ -1045,7 +1045,7 @@ accumulate_reports(struct accumulator *accumulator,
 	uint64_t *deltas = accumulator->deltas;
 	int idx = 0;
 
-	if (intel_gen(devid) >= 8) {
+	if (intel_gen_from_pciid(devid) >= 8) {
 		/* timestamp */
 		deltas[idx] += oa_timestamp_delta(end, start, accumulator->format);
 		idx++;
@@ -1092,7 +1092,7 @@ accumulator_print(struct accumulator *accumulator, const char *title)
 	int idx = 0;
 
 	igt_debug("%s:\n", title);
-	if (intel_gen(devid) >= 8) {
+	if (intel_gen_from_pciid(devid) >= 8) {
 		igt_debug("\ttime delta = %"PRIu64"\n", deltas[idx++]);
 		igt_debug("\tclock cycle delta = %"PRIu64"\n", deltas[idx++]);
 
@@ -1731,7 +1731,7 @@ print_reports(uint32_t *oa_report0, uint32_t *oa_report1, int fmt)
 			  clock0, clock1, clock1 - clock0);
 	}
 
-	if (intel_gen(devid) >= 8) {
+	if (intel_gen_from_pciid(devid) >= 8) {
 		uint32_t slice_freq0, slice_freq1, unslice_freq0, unslice_freq1;
 		const char *reason0 = gen8_read_report_reason(oa_report0);
 		const char *reason1 = gen8_read_report_reason(oa_report1);
@@ -1834,7 +1834,7 @@ print_report(uint32_t *report, int fmt)
 		igt_debug("CLOCK: %"PRIu64"\n", clock);
 	}
 
-	if (intel_gen(devid) >= 8) {
+	if (intel_gen_from_pciid(devid) >= 8) {
 		uint32_t slice_freq, unslice_freq;
 		const char *reason = gen8_read_report_reason(report);
 
@@ -2019,7 +2019,7 @@ static void load_helper_init(void)
 	/* MI_STORE_DATA can only use GTT address on gen4+/g33 and needs
 	 * snoopable mem on pre-gen6. Hence load-helper only works on gen6+, but
 	 * that's also all we care about for the rps testcase*/
-	igt_assert(intel_gen(lh.devid) >= 6);
+	igt_assert(intel_gen_from_pciid(lh.devid) >= 6);
 
 	lh.bops = buf_ops_create(drm_fd);
 
@@ -2487,7 +2487,7 @@ test_blocking(uint64_t requested_oa_period,
 		 * periodic sampling and we don't want these extra reads to
 		 * cause the test to fail...
 		 */
-		if (intel_gen(devid) >= 8) {
+		if (intel_gen_from_pciid(devid) >= 8) {
 			for (int offset = 0; offset < ret; offset += header->size) {
 				header = (void *)(buf + offset);
 
@@ -2672,7 +2672,7 @@ test_polling(uint64_t requested_oa_period,
 		 * periodic sampling and we don't want these extra reads to
 		 * cause the test to fail...
 		 */
-		if (intel_gen(devid) >= 8) {
+		if (intel_gen_from_pciid(devid) >= 8) {
 			for (int offset = 0; offset < ret; offset += header->size) {
 				header = (void *)(buf + offset);
 
@@ -3659,7 +3659,7 @@ emit_stall_timestamp_and_rpc(struct intel_bb *ibb,
 
 	intel_bb_add_intel_buf(ibb, dst, true);
 
-	if (intel_gen(devid) >= 8)
+	if (intel_gen_from_pciid(devid) >= 8)
 		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(6));
 	else
 		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(5));
@@ -4809,7 +4809,7 @@ make_valid_reduced_sseu_config(struct drm_i915_gem_context_param_sseu default_ss
 {
 	struct drm_i915_gem_context_param_sseu sseu = default_sseu;
 
-	if (intel_gen(devid) == 11) {
+	if (intel_gen_from_pciid(devid) == 11) {
 		/*
 		 * On Gen11 there are restrictions on what subslices
 		 * can be disabled, notably we're not able to enable
@@ -5173,7 +5173,7 @@ test_create_destroy_userspace_config(void)
 	config.mux_regs_ptr = to_user_pointer(mux_regs);
 
 	/* Flex EU counters are only available on gen8+ */
-	if (intel_gen(devid) >= 8) {
+	if (intel_gen_from_pciid(devid) >= 8) {
 		for (i = 0; i < ARRAY_SIZE(flex_regs) / 2; i++) {
 			flex_regs[i * 2] = 0xe458; /* EU_PERF_CNTL0 */
 			flex_regs[i * 2 + 1] = 0x0;
@@ -5252,7 +5252,7 @@ test_whitelisted_registers_userspace_config(void)
 	memset(&config, 0, sizeof(config));
 	memcpy(config.uuid, uuid, sizeof(config.uuid));
 
-	if (intel_gen(devid) >= 12) {
+	if (intel_gen_from_pciid(devid) >= 12) {
 		oa_start_trig1 = 0xd900;
 		oa_start_trig8 = 0xd91c;
 		oa_report_trig1 = 0xd920;
@@ -5278,7 +5278,7 @@ test_whitelisted_registers_userspace_config(void)
 	}
 	config.boolean_regs_ptr = (uintptr_t) b_counters_regs;
 
-	if (intel_gen(devid) >= 8) {
+	if (intel_gen_from_pciid(devid) >= 8) {
 		/* Flex EU registers, only from Gen8+. */
 		for (i = 0; i < ARRAY_SIZE(flex); i++) {
 			flex_regs[config.n_flex_regs * 2] = flex[i];
@@ -5306,7 +5306,7 @@ test_whitelisted_registers_userspace_config(void)
 		mux_regs[i++] = 0;
 	}
 
-	if (intel_gen(devid) >= 8 && !IS_CHERRYVIEW(devid)) {
+	if (intel_gen_from_pciid(devid) >= 8 && !IS_CHERRYVIEW(devid)) {
 		/* NOA_CONFIG */
 		mux_regs[i++] = 0xD04;
 		mux_regs[i++] = 0;
@@ -5327,7 +5327,7 @@ test_whitelisted_registers_userspace_config(void)
 		mux_regs[i++] = 0;
 	}
 
-	if (intel_gen(devid) <= 11) {
+	if (intel_gen_from_pciid(devid) <= 11) {
 		/* HALF_SLICE_CHICKEN2 (shared with kernel workaround) */
 		mux_regs[i++] = 0xE180;
 		mux_regs[i++] = 0;
@@ -5951,7 +5951,7 @@ int igt_main()
 	igt_describe("Test that reason field in OA reports is never 0 on Gen8+");
 	igt_subtest_with_dynamic("non-zero-reason") {
 		/* Reason field is only available on Gen8+ */
-		igt_require(intel_gen(devid) >= 8);
+		igt_require(intel_gen_from_pciid(devid) >= 8);
 		__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 			test_non_zero_reason(e);
 	}
@@ -6029,7 +6029,7 @@ int igt_main()
 		test_short_reads();
 
 	igt_subtest("mi-rpc") {
-		igt_require(intel_gen(devid) < 12);
+		igt_require(intel_gen_from_pciid(devid) < 12);
 		test_mi_rpc();
 	}
 
@@ -6048,7 +6048,7 @@ int igt_main()
 		 *
 		 * For gen12 implement a separate test that uses only OAR
 		 */
-		igt_require(intel_gen(devid) >= 8 && intel_gen(devid) < 12);
+		igt_require(intel_gen_from_pciid(devid) >= 8 && intel_gen_from_pciid(devid) < 12);
 		igt_require_f(render_copy, "no render-copy function\n");
 		gen8_test_single_ctx_render_target_writes_a_counter();
 	}
@@ -6056,7 +6056,7 @@ int igt_main()
 	igt_subtest_group() {
 		igt_describe("Test MI REPORT PERF COUNT for Gen 12");
 		igt_subtest_with_dynamic("gen12-mi-rpc") {
-			igt_require(intel_gen(devid) >= 12);
+			igt_require(intel_gen_from_pciid(devid) >= 12);
 			igt_require(has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0));
 			__for_each_render_engine(drm_fd, e)
 				gen12_test_mi_rpc(e);
@@ -6064,14 +6064,14 @@ int igt_main()
 
 		igt_describe("Test OA TLB invalidate");
 		igt_subtest_with_dynamic("gen12-oa-tlb-invalidate") {
-			igt_require(intel_gen(devid) >= 12);
+			igt_require(intel_gen_from_pciid(devid) >= 12);
 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				gen12_test_oa_tlb_invalidate(e);
 		}
 
 		igt_describe("Measure performance for a specific context using OAR in Gen 12");
 		igt_subtest_with_dynamic("gen12-unprivileged-single-ctx-counters") {
-			igt_require(intel_gen(devid) >= 12);
+			igt_require(intel_gen_from_pciid(devid) >= 12);
 			igt_require(has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0));
 			igt_require_f(render_copy, "no render-copy function\n");
 			__for_each_render_engine(drm_fd, e)
@@ -6092,13 +6092,13 @@ int igt_main()
 		 */
 		igt_describe("Verify exclusivity of perf streams with sample oa option");
 		igt_subtest("gen12-group-exclusive-stream-sample-oa") {
-			igt_require(intel_gen(devid) >= 12);
+			igt_require(intel_gen_from_pciid(devid) >= 12);
 			test_group_exclusive_stream(ctx, true);
 		}
 
 		igt_describe("Verify exclusivity of perf streams with ctx handle");
 		igt_subtest("gen12-group-exclusive-stream-ctx-handle") {
-			igt_require(intel_gen(devid) >= 12);
+			igt_require(intel_gen_from_pciid(devid) >= 12);
 			test_group_exclusive_stream(ctx, false);
 		}
 
@@ -6121,7 +6121,7 @@ int igt_main()
 		igt_describe("Verify invalid SSEU opening parameters");
 		igt_subtest_with_dynamic("global-sseu-config-invalid") {
 			igt_require(i915_perf_revision(drm_fd) >= 4);
-			igt_require(intel_graphics_ver(devid) < IP_VER(12, 50));
+			igt_require(intel_graphics_ver_from_pciid(devid) < IP_VER(12, 50));
 
 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				test_global_sseu_config_invalid(ctx, e);
@@ -6130,7 +6130,7 @@ int igt_main()
 		igt_describe("Verify specifying SSEU opening parameters");
 		igt_subtest_with_dynamic("global-sseu-config") {
 			igt_require(i915_perf_revision(drm_fd) >= 4);
-			igt_require(intel_graphics_ver(devid) < IP_VER(12, 50));
+			igt_require(intel_graphics_ver_from_pciid(devid) < IP_VER(12, 50));
 
 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				test_global_sseu_config(ctx, e);
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 661ead32d..fed8a73b4 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -237,7 +237,7 @@ init(int gem_fd, const intel_ctx_t *ctx,
 		err = errno;
 
 	exists = gem_context_has_engine(gem_fd, ctx->id, e->flags);
-	if (intel_gen(intel_get_drm_devid(gem_fd)) < 6 &&
+	if (intel_gen_from_pciid(intel_get_drm_devid(gem_fd)) < 6 &&
 	    sample == I915_SAMPLE_SEMA)
 		exists = false;
 
@@ -742,7 +742,7 @@ sema_wait(int gem_fd, const intel_ctx_t *ctx,
 	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 	uint64_t obj_offset, bb_offset;
 
-	igt_require(intel_gen(intel_get_drm_devid(gem_fd)) >= 8);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(gem_fd)) >= 8);
 
 	/**
 	 * Setup up a batchbuffer with a polling semaphore wait command which
@@ -977,7 +977,7 @@ sema_busy(int gem_fd, const intel_ctx_t *ctx,
 	int fd[2];
 	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
-	igt_require(intel_gen(intel_get_drm_devid(gem_fd)) >= 8);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(gem_fd)) >= 8);
 
 	fd[0] = open_group(gem_fd, I915_PMU_ENGINE_SEMA(e->class, e->instance),
 			   -1);
@@ -1124,7 +1124,7 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
 	int fd;
 
 	devid = intel_get_drm_devid(gem_fd);
-	igt_require(intel_gen(devid) >= 7);
+	igt_require(intel_gen_from_pciid(devid) >= 7);
 	igt_require(has_secure_batches(gem_fd));
 	igt_skip_on(IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid));
 
diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
index 1971b85c2..bb63ed772 100644
--- a/tests/intel/sysfs_preempt_timeout.c
+++ b/tests/intel/sysfs_preempt_timeout.c
@@ -286,7 +286,7 @@ static void test_off(int i915, int engine)
 	 * GuC submission, but we are not really losing coverage as this test
 	 * isn't not a UMD use case.
 	 */
-	igt_require(intel_gen(intel_get_drm_devid(i915)) < 12);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) < 12);
 
 	igt_assert(igt_sysfs_scanf(engine, "class", "%u", &class) == 1);
 	igt_assert(igt_sysfs_scanf(engine, "instance", "%u", &inst) == 1);
diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
index f10a86777..056db32e1 100644
--- a/tests/intel/sysfs_timeslice_duration.c
+++ b/tests/intel/sysfs_timeslice_duration.c
@@ -208,7 +208,7 @@ static uint64_t __test_duration(int i915, int engine, unsigned int timeout)
 		.buffer_count = ARRAY_SIZE(obj),
 		.buffers_ptr = to_user_pointer(obj),
 	};
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	double duration = clockrate(i915);
 	unsigned int class, inst, mmio;
 	uint32_t *cs, *map;
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index a21922ee5..d3e27e910 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -128,7 +128,7 @@ static void surf_copy(int xe,
 	int result;
 
 	igt_assert(mid->compression);
-	if (intel_gen(devid) >= 20 && mid->compression) {
+	if (intel_gen_from_pciid(devid) >= 20 && mid->compression) {
 		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
 		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 	}
@@ -177,7 +177,7 @@ static void surf_copy(int xe,
 			if (IS_GEN(devid, 12) && is_intel_dgfx(xe)) {
 				igt_assert(!strcmp(orig, newsum));
 				igt_assert(!strcmp(orig2, newsum2));
-			} else if (intel_gen(devid) >= 20) {
+			} else if (intel_gen_from_pciid(devid) >= 20) {
 				if (is_intel_dgfx(xe)) {
 					/* buffer object would become
 					 * uncompressed in xe2+ dgfx
@@ -227,7 +227,7 @@ static void surf_copy(int xe,
 	 * uncompressed in xe2+ dgfx, and therefore retrieve the
 	 * ccs by copying 0 to ccsmap
 	 */
-	if (suspend_resume && intel_gen(devid) >= 20 && is_intel_dgfx(xe))
+	if (suspend_resume && intel_gen_from_pciid(devid) >= 20 && is_intel_dgfx(xe))
 		memset(ccsmap, 0, ccssize);
 	else
 		/* retrieve back ccs */
@@ -353,7 +353,7 @@ static void block_copy(int xe,
 	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = (intel_gen(intel_get_drm_devid(xe)) >= 20 &&
+	uint32_t mid_region = (intel_gen_from_pciid(intel_get_drm_devid(xe)) >= 20 &&
 			       !xe_has_vram(xe)) ? region1 : region2;
 	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
@@ -441,7 +441,7 @@ static void block_copy(int xe,
 	if (config->inplace) {
 		uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-		if (intel_gen(intel_get_drm_devid(xe)) >= 20 && config->compression)
+		if (intel_gen_from_pciid(intel_get_drm_devid(xe)) >= 20 && config->compression)
 			pat_index = intel_get_pat_idx_uc_comp(xe);
 
 		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
@@ -488,7 +488,7 @@ static void block_multicopy(int xe,
 	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = (intel_gen(intel_get_drm_devid(xe)) >= 20 &&
+	uint32_t mid_region = (intel_gen_from_pciid(intel_get_drm_devid(xe)) >= 20 &&
 			       !xe_has_vram(xe)) ? region1 : region2;
 	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
@@ -530,7 +530,7 @@ static void block_multicopy(int xe,
 	if (config->inplace) {
 		uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-		if (intel_gen(intel_get_drm_devid(xe)) >= 20 && config->compression)
+		if (intel_gen_from_pciid(intel_get_drm_devid(xe)) >= 20 && config->compression)
 			pat_index = intel_get_pat_idx_uc_comp(xe);
 
 		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
@@ -715,7 +715,7 @@ static void block_copy_test(int xe,
 	int tiling, width, height;
 
 
-	if (intel_gen(dev_id) >= 20 && config->compression)
+	if (intel_gen_from_pciid(dev_id) >= 20 && config->compression)
 		igt_require(HAS_FLATCCS(dev_id));
 
 	if (config->compression && !blt_block_copy_supports_compression(xe))
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 762e66fcd..1468a4120 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -232,7 +232,7 @@ test_compute_kernel_loop(uint64_t loop_duration)
 	double elapse_time, lower_bound, upper_bound;
 
 	fd = drm_open_driver(DRIVER_XE);
-	ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
 	kernels = intel_compute_square_kernels;
 
 	while (kernels->kernel) {
@@ -335,7 +335,7 @@ igt_check_supported_pipeline(void)
 	const struct intel_compute_kernels *kernels;
 
 	fd = drm_open_driver(DRIVER_XE);
-	ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
 	kernels = intel_compute_square_kernels;
 	drm_close_driver(fd);
 
@@ -432,7 +432,7 @@ test_eu_busy(uint64_t duration_sec)
 
 	fd = drm_open_driver(DRIVER_XE);
 
-	ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
 	kernels = intel_compute_square_kernels;
 	while (kernels->kernel) {
 		if (ip_ver == kernels->ip_ver)
@@ -658,7 +658,7 @@ int igt_main()
 	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
 		sriov_enabled = is_sriov_mode(xe);
-		ip_ver = intel_graphics_ver(intel_get_drm_devid(xe));
+		ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(xe));
 		igt_store_ccs_mode(ccs_mode, ARRAY_SIZE(ccs_mode));
 	}
 
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 7fc4a3cbe..a53de8fd8 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -329,7 +329,7 @@ static void test_info_read(struct xe_device *xe_dev)
 		failed = true;
 	}
 
-	if (intel_gen(devid) < 20) {
+	if (intel_gen_from_pciid(devid) < 20) {
 		val = -1;
 
 		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 059f918a6..0bdbe687d 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -403,7 +403,7 @@ static bool intel_gen_needs_resume_wa(int fd)
 {
 	const uint32_t id = intel_get_drm_devid(fd);
 
-	return intel_gen(id) == 12 && intel_graphics_ver(id) < IP_VER(12, 55);
+	return intel_gen_from_pciid(id) == 12 && intel_graphics_ver_from_pciid(id) < IP_VER(12, 55);
 }
 
 static uint64_t eu_ctl_resume(int fd, int debugfd, uint64_t client,
@@ -1264,7 +1264,7 @@ static bool intel_gen_has_lockstep_eus(int fd)
 	 * excepted into SIP. In this level, the hardware has only one attention
 	 * thread bit for units. PVC is the first one without lockstepping.
 	 */
-	return !(intel_graphics_ver(id) == IP_VER(12, 60) || intel_gen(id) >= 20);
+	return !(intel_graphics_ver_from_pciid(id) == IP_VER(12, 60) || intel_gen_from_pciid(id) >= 20);
 }
 
 static int query_attention_bitmask_size(int fd, int gt)
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 82a6cde0a..e0d049780 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -902,7 +902,7 @@ int igt_main()
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
 			if (s->flags & MULTI_QUEUE) {
-				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+				igt_require(intel_graphics_ver_from_pciid(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
 				igt_require(multi_queue_hwe != NULL);
 				igt_assert_f(!(s->flags & MULTI_VM),
 					     "MULTI_QUEUE and MULTI_VM cannot be used together.\n");
@@ -922,7 +922,7 @@ int igt_main()
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
 			if (s->flags & MULTI_QUEUE) {
-				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+				igt_require(intel_graphics_ver_from_pciid(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
 				igt_require(multi_queue_hwe != NULL);
 				igt_assert_f(!(s->flags & MULTI_VM),
 					     "MULTI_QUEUE and MULTI_VM cannot be used together.\n");
@@ -941,7 +941,7 @@ int igt_main()
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
 			if (s->flags & MULTI_QUEUE) {
-				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+				igt_require(intel_graphics_ver_from_pciid(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
 				igt_require(multi_queue_hwe != NULL);
 				igt_assert_f(!(s->flags & MULTI_VM),
 					     "MULTI_QUEUE and MULTI_VM cannot be used together.\n");
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 3e92dfbd9..c9c6b4987 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -444,7 +444,7 @@ test_exec_main(int fd, int n_exec_queues, int n_execs, unsigned int flags)
 	struct drm_xe_engine_class_instance *hwe;
 
 	if (flags & MULTI_QUEUE) {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(intel_graphics_ver_from_pciid(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
 	} else {
diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 4a0e88402..991dcf932 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -1047,7 +1047,7 @@ int igt_main()
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(intel_graphics_ver_from_pciid(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
 	}
 
 	igt_subtest_f("sanity")
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index faf2c7fa8..9967a7829 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -70,7 +70,7 @@ static void cond_batch(struct data *data, uint64_t addr, int value,
 	data->batch[b++] = sdi_addr;
 	data->batch[b++] = sdi_addr >> 32;
 
-	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0))
+	if (intel_graphics_ver_from_pciid(dev_id) >= IP_VER(20, 0))
 		data->batch[b++] = MI_MEM_FENCE | MI_WRITE_FENCE;
 
 	data->batch[b++] = MI_CONDITIONAL_BATCH_BUFFER_END | MI_DO_COMPARE | 5 << 12 | 2;
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index f082a0eda..f61392d65 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1519,7 +1519,7 @@ int igt_main()
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("threads-%s", s->name) {
 			if (s->flags & MULTI_QUEUE) {
-				igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0)),
+				igt_skip_on_f(!(intel_graphics_ver_from_pciid(intel_get_drm_devid(fd)) >= IP_VER(35, 0)),
 						"multi_queue is supported on graphics version 35 and above");
 				/* Balancer can't be set with multi-queue at the same time */
 				igt_assert(!(s->flags & BALANCER));
diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 4f4a7922c..f314f750f 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -492,7 +492,7 @@ oa_add_config_fail(int fd, int sysfs, int devid,
 {
 	char path[512];
 	uint64_t config_id;
-#define SAMPLE_MUX_REG (intel_graphics_ver(devid) >= IP_VER(20, 0) ?	\
+#define SAMPLE_MUX_REG (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0) ?	\
 			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
 
 	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 02de63a3a..e9194b6b7 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -710,7 +710,7 @@ static void do_intel_bb_blit(struct buf_ops *bops, int loops, uint32_t tiling)
 	int i, fails = 0, xe = buf_ops_get_fd(bops);
 
 	/* We'll fix it for gen2/3 later. */
-	igt_require(intel_gen(intel_get_drm_devid(xe)) > 3);
+	igt_require(intel_gen_from_pciid(intel_get_drm_devid(xe)) > 3);
 
 	for (i = 0; i < loops; i++)
 		fails += __do_intel_bb_blit(bops, tiling);
@@ -881,7 +881,7 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	uint32_t devid = intel_get_drm_devid(xe);
 	igt_render_copyfunc_t render_copy = NULL;
 
-	igt_debug("%s() gen: %d\n", __func__, intel_gen(devid));
+	igt_debug("%s() gen: %d\n", __func__, intel_gen_from_pciid(devid));
 
 	ibb = intel_bb_create(xe, PAGE_SIZE);
 
@@ -1041,7 +1041,7 @@ int igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 		do_intel_bb_blit(bops, 3, I915_TILING_X);
 
 	igt_subtest("intel-bb-blit-y") {
-		igt_require(intel_gen(intel_get_drm_devid(xe)) >= 6);
+		igt_require(intel_gen_from_pciid(intel_get_drm_devid(xe)) >= 6);
 		do_intel_bb_blit(bops, 3, I915_TILING_Y);
 	}
 
diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index 2ae0b950f..212b1b9cd 100644
--- a/tests/intel/xe_multigpu_svm.c
+++ b/tests/intel/xe_multigpu_svm.c
@@ -412,7 +412,7 @@ static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
 	cmd[i++] = upper_32_bits(src_addr);
 	cmd[i++] = lower_32_bits(dst_addr);
 	cmd[i++] = upper_32_bits(dst_addr);
-	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
+	if (intel_graphics_ver_from_pciid(dev_id) >= IP_VER(20, 0)) {
 		cmd[i++] = mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT | mocs_index;
 	} else {
 		cmd[i++] = mocs_index << GEN12_MEM_COPY_MOCS_SHIFT | mocs_index;
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 927f3f4f2..2a478993e 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -476,7 +476,7 @@ get_oa_format(enum intel_xe_oa_format_name format)
 		return dg2_oa_formats[format];
 	else if (IS_METEORLAKE(devid))
 		return mtl_oa_formats[format];
-	else if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+	else if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0))
 		return lnl_oa_formats[format];
 	else
 		return gen12_oa_formats[format];
@@ -797,7 +797,7 @@ oa_timestamp_delta(const uint32_t *report1,
 		   const uint32_t *report0,
 		   enum intel_xe_oa_format_name format)
 {
-	uint32_t width = intel_graphics_ver(devid) >= IP_VER(12, 55) ? 56 : 32;
+	uint32_t width = intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 55) ? 56 : 32;
 
 	return elapsed_delta(oa_timestamp(report1, format),
 			     oa_timestamp(report0, format), width);
@@ -1136,7 +1136,7 @@ static void pec_sanity_check(const u32 *report0, const u32 *report1,
 static void pec_sanity_check_reports(const u32 *report0, const u32 *report1,
 				     struct intel_xe_perf_metric_set *set)
 {
-	if (igt_run_in_simulation() || intel_graphics_ver(devid) < IP_VER(20, 0)) {
+	if (igt_run_in_simulation() || intel_graphics_ver_from_pciid(devid) < IP_VER(20, 0)) {
 		igt_debug("%s: Skip checking PEC reports in simulation or Xe1\n", __func__);
 		return;
 	}
@@ -3407,7 +3407,7 @@ static void single_ctx_helper(const struct drm_xe_oa_unit *oau)
 	}
 
 	/* FIXME: can we deduce the presence of A26 from get_oa_format(fmt)? */
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0))
 		goto skip_check;
 
 	/* Check that this test passed. The test measures the number of 2x2
@@ -3586,7 +3586,7 @@ static bool has_xe_oa_userspace_config(int fd)
 	return errno != EINVAL;
 }
 
-#define SAMPLE_MUX_REG (intel_graphics_ver(devid) >= IP_VER(20, 0) ?	\
+#define SAMPLE_MUX_REG (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0) ?	\
 			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
 
 /**
@@ -3841,7 +3841,7 @@ test_whitelisted_registers_userspace_config(void)
 
 	/* NOA_CONFIG */
 	/* Prior to Xe2 */
-	if (intel_graphics_ver(devid) < IP_VER(20, 0)) {
+	if (intel_graphics_ver_from_pciid(devid) < IP_VER(20, 0)) {
 		regs[config.n_regs * 2] = 0xD04;
 		regs[config.n_regs * 2 + 1] = 0;
 		config.n_regs++;
@@ -3850,7 +3850,7 @@ test_whitelisted_registers_userspace_config(void)
 		config.n_regs++;
 	}
 	/* Prior to MTLx */
-	if (intel_graphics_ver(devid) < IP_VER(12, 70)) {
+	if (intel_graphics_ver_from_pciid(devid) < IP_VER(12, 70)) {
 		/* WAIT_FOR_RC6_EXIT */
 		regs[config.n_regs * 2] = 0x20CC;
 		regs[config.n_regs * 2 + 1] = 0;
@@ -3890,7 +3890,7 @@ struct test_perf {
 
 #define HAS_OA_MMIO_TRIGGER(__d) \
 	(IS_DG2(__d) || IS_PONTEVECCHIO(__d) || IS_METEORLAKE(__d) || \
-	 intel_graphics_ver(devid) >= IP_VER(20, 0))
+	 intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0))
 
 static void perf_init_whitelist(void)
 {
@@ -5087,7 +5087,7 @@ int igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		sysfs = igt_sysfs_open(drm_fd);
 
 		/* Currently only run on Xe2+ */
-		igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));
+		igt_require(intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0));
 
 		igt_require(init_sys_info());
 
@@ -5193,8 +5193,8 @@ int igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 				test_mi_rpc(oau);
 
 		igt_subtest_with_dynamic("oa-tlb-invalidate") {
-			igt_require(intel_graphics_ver(devid) <= IP_VER(12, 70) &&
-				    intel_graphics_ver(devid) != IP_VER(12, 60));
+			igt_require(intel_graphics_ver_from_pciid(devid) <= IP_VER(12, 70) &&
+				    intel_graphics_ver_from_pciid(devid) != IP_VER(12, 60));
 			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
 				test_oa_tlb_invalidate(oau);
 		}
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index b92512164..2be9bfb73 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -178,7 +178,7 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
 static void pat_sanity(int fd)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
-	unsigned int gfx_ver = intel_graphics_ver(dev_id);
+	unsigned int gfx_ver = intel_graphics_ver_from_pciid(dev_id);
 	struct intel_pat_cache pat_sw_config = {};
 	int32_t parsed;
 	bool has_uc_comp = false, has_wt = false;
@@ -1560,10 +1560,10 @@ static void false_sharing(int fd)
 	const struct fs_pat_entry *fs_entries;
 	int num_entries;
 
-	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
+	if (intel_graphics_ver_from_pciid(dev_id) == IP_VER(35, 11)) {
 		num_entries = ARRAY_SIZE(fs_xe3p_xpc);
 		fs_entries = fs_xe3p_xpc;
-	} else if (intel_graphics_ver(dev_id) == IP_VER(35, 10)) {
+	} else if (intel_graphics_ver_from_pciid(dev_id) == IP_VER(35, 10)) {
 		num_entries = ARRAY_SIZE(fs_xe3p_lpg);
 		fs_entries = fs_xe3p_lpg;
 	} else if (graphics_ver == 20) {
@@ -1689,7 +1689,7 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		bo_comp_disable_bind(fd);
 
 	igt_subtest_with_dynamic("pat-index-xelp") {
-		igt_require(intel_graphics_ver(dev_id) <= IP_VER(12, 55));
+		igt_require(intel_graphics_ver_from_pciid(dev_id) <= IP_VER(12, 55));
 		subtest_pat_index_modes_with_regions(fd, xelp_pat_index_modes,
 						     ARRAY_SIZE(xelp_pat_index_modes));
 	}
@@ -1710,7 +1710,7 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
 		igt_assert(HAS_FLATCCS(dev_id));
 
-		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
+		if (intel_graphics_ver_from_pciid(dev_id) == IP_VER(20, 1))
 			subtest_pat_index_modes_with_regions(fd, bmg_g21_pat_index_modes,
 							     ARRAY_SIZE(bmg_g21_pat_index_modes));
 		else
@@ -1731,7 +1731,7 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		int configfs_fd, configfs_device_fd;
 
 		igt_fixture() {
-			igt_require(intel_graphics_ver(dev_id) == IP_VER(35, 10));
+			igt_require(intel_graphics_ver_from_pciid(dev_id) == IP_VER(35, 10));
 
 			pci_dev = igt_device_get_pci_device(fd);
 			snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
index 4a143374a..31fd97e97 100644
--- a/tests/intel/xe_prefetch_fault.c
+++ b/tests/intel/xe_prefetch_fault.c
@@ -12,6 +12,7 @@
  * Test category: functionality test
  */
 #include "gpgpu_shader.h"
+#include "intel_chipset.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_gt.h"
@@ -192,7 +193,7 @@ int igt_main()
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(intel_graphics_ver_from_pciid(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
 	}
 
 	igt_subtest_with_dynamic("prefetch-fault") {
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index b6db50b20..cac24a9ad 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -380,7 +380,7 @@ test_query_gt_topology(int fd)
 	}
 
 	/* sanity check EU type */
-	if (IS_PONTEVECCHIO(dev_id) || intel_gen(dev_id) >= 20) {
+	if (IS_PONTEVECCHIO(dev_id) || intel_gen_from_pciid(dev_id) >= 20) {
 		igt_assert(topo_types & (1 << DRM_XE_TOPO_SIMD16_EU_PER_DSS));
 		igt_assert_eq(topo_types & (1 << DRM_XE_TOPO_EU_PER_DSS), 0);
 	} else {
diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index e2e752e28..29ccfc241 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -136,7 +136,7 @@ static int compare_bufs(struct intel_buf *buf1, struct intel_buf *buf2,
 static bool buf_is_aux_compressed(struct buf_ops *bops, struct intel_buf *buf)
 {
 	int xe = buf_ops_get_fd(bops);
-	unsigned int gen = intel_gen(buf_ops_get_devid(bops));
+	unsigned int gen = intel_gen_from_pciid(buf_ops_get_devid(bops));
 	uint32_t ccs_size;
 	uint8_t *ptr;
 	bool is_compressed = false;
diff --git a/tests/intel/xe_svm_usrptr_madvise.c b/tests/intel/xe_svm_usrptr_madvise.c
index bfa5864e4..f142e576e 100644
--- a/tests/intel/xe_svm_usrptr_madvise.c
+++ b/tests/intel/xe_svm_usrptr_madvise.c
@@ -119,7 +119,7 @@ gpu_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 	cmd[i++] = upper_32_bits(src_addr);
 	cmd[i++] = lower_32_bits(dst_addr);
 	cmd[i++] = upper_32_bits(dst_addr);
-	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0))
+	if (intel_graphics_ver_from_pciid(dev_id) >= IP_VER(20, 0))
 		cmd[i++] = mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT | mocs_index;
 	else
 		cmd[i++] = mocs_index << GEN12_MEM_COPY_MOCS_SHIFT | mocs_index;
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 6abd2ac53..929be3f2a 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -609,7 +609,7 @@ static void work(int i915, uint64_t ahnd, uint64_t scratch_offset, int dmabuf,
 {
 	const int SCRATCH = 0;
 	const int BATCH = 1;
-	const int gen = intel_gen(intel_get_drm_devid(i915));
+	const int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry store[1024+1];
 	struct drm_i915_gem_execbuffer2 execbuf;
diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 31572f6c3..3695fcec9 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -844,7 +844,7 @@ int main(int argc, char **argv)
 	set_termio_mode();
 
 	drm_fd = drm_open_driver(DRIVER_ANY);
-	gen = intel_gen(intel_get_drm_devid(drm_fd));
+	gen = intel_gen_from_pciid(intel_get_drm_devid(drm_fd));
 
 	kmstest_set_vt_graphics_mode();
 	setup_debugfs_files();
diff --git a/tools/intel_error_decode.c b/tools/intel_error_decode.c
index 451608826..513296742 100644
--- a/tools/intel_error_decode.c
+++ b/tools/intel_error_decode.c
@@ -311,7 +311,7 @@ static void print_bdw_error(unsigned int reg, unsigned int devid)
 static void
 print_error(unsigned int reg, unsigned int devid)
 {
-	switch (intel_gen(devid)) {
+	switch (intel_gen_from_pciid(devid)) {
 	case 8: return print_bdw_error(reg, devid);
 	case 7: return print_ivb_error(reg, devid);
 	case 6: return print_snb_error(reg);
@@ -398,7 +398,7 @@ print_fault_reg(unsigned devid, uint32_t reg)
 	const char *engine[] = { "GFX", "MFX0", "MFX1", "VEBX",
 				 "BLT", "Unknown", "Unknown", "Unknown" };
 
-	if (intel_gen(devid) < 7)
+	if (intel_gen_from_pciid(devid) < 7)
 		return;
 
 	if (reg & (1 << 0))
@@ -406,13 +406,13 @@ print_fault_reg(unsigned devid, uint32_t reg)
 	else
 		return;
 
-	if (intel_gen(devid) < 8)
+	if (intel_gen_from_pciid(devid) < 8)
 		printf("    %s Fault (%s)\n", gen7_types[reg >> 1 & 0x3],
 		       reg & (1 << 11) ? "GGTT" : "PPGTT");
 	else
 		printf("    Invalid %s Fault\n", gen8_types[reg >> 1 & 0x3]);
 
-	if (intel_gen(devid) < 8)
+	if (intel_gen_from_pciid(devid) < 8)
 		printf("    Address 0x%08x\n", reg & ~((1 << 12)-1));
 	else
 		printf("    Engine %s\n", engine[reg >> 12 & 0x7]);
@@ -425,7 +425,7 @@ print_fault_data(unsigned devid, uint32_t data1, uint32_t data0)
 {
 	uint64_t address;
 
-	if (intel_gen(devid) < 8)
+	if (intel_gen_from_pciid(devid) < 8)
 		return;
 
 	address = ((uint64_t)(data0) << 12) | ((uint64_t)data1 & 0xf) << 44;
@@ -691,7 +691,7 @@ read_data_file(FILE *file)
 			if (matched == 1) {
 				devid = reg;
 				printf("Detected GEN%i chipset\n",
-						intel_gen(devid));
+						intel_gen_from_pciid(devid));
 
 				decode_ctx = intel_decode_context_alloc(devid);
 			}
diff --git a/tools/intel_gtt.c b/tools/intel_gtt.c
index 658336d99..45fe5b698 100644
--- a/tools/intel_gtt.c
+++ b/tools/intel_gtt.c
@@ -57,7 +57,7 @@ static gen8_gtt_pte_t gen8_gtt_pte(const unsigned i)
 
 static uint64_t ingtt(const unsigned offset)
 {
-	if (intel_gen(devid) < 8)
+	if (intel_gen_from_pciid(devid) < 8)
 		return gen6_gtt_pte(offset/KB(4));
 
 	return gen8_gtt_pte(offset/KB(4));
@@ -68,10 +68,10 @@ static uint64_t get_phys(uint32_t pt_offset)
 	uint64_t pae = 0;
 	uint64_t phys = ingtt(pt_offset);
 
-	if (intel_gen(devid) < 4 && !IS_G33(devid))
+	if (intel_gen_from_pciid(devid) < 4 && !IS_G33(devid))
 		return phys & ~0xfff;
 
-	switch (intel_gen(devid)) {
+	switch (intel_gen_from_pciid(devid)) {
 		case 3:
 		case 4:
 		case 5:
@@ -90,7 +90,7 @@ static uint64_t get_phys(uint32_t pt_offset)
 		case 11:
 		case 12:
 		case 20:
-			if (intel_graphics_ver(devid) >= IP_VER(12, 70))
+			if (intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 70))
 				phys = phys & 0x3ffffffff000;
 			else
 				phys = phys & 0x7ffffff000;
@@ -105,7 +105,7 @@ static uint64_t get_phys(uint32_t pt_offset)
 
 static int get_pte_size(void)
 {
-	return intel_gen(devid) < 8 ? 4 : 8;
+	return intel_gen_from_pciid(devid) < 8 ? 4 : 8;
 }
 
 static void pte_dump(int size, uint32_t offset) {
@@ -125,7 +125,7 @@ static void pte_dump(int size, uint32_t offset) {
 	printf("----------------------------------------------------------\n");
 
 	for (i = 0; i < entries; i += 4) {
-		if (intel_gen(devid) < 8) {
+		if (intel_gen_from_pciid(devid) < 8) {
 			printf("  0x%08x | 0x%08x 0x%08x 0x%08x 0x%08x\n",
 			       KB(4 * i),
 			       gen6_gtt_pte(i + 0),
diff --git a/tools/intel_l3_parity.c b/tools/intel_l3_parity.c
index 947117d38..8d9d841a8 100644
--- a/tools/intel_l3_parity.c
+++ b/tools/intel_l3_parity.c
@@ -190,7 +190,7 @@ int main(int argc, char *argv[])
 
 	device = drm_open_driver(DRIVER_INTEL);
 	devid = intel_get_drm_devid(device);
-	if (intel_gen(devid) < 7 || IS_VALLEYVIEW(devid))
+	if (intel_gen_from_pciid(devid) < 7 || IS_VALLEYVIEW(devid))
 		exit(77);
 
 	assert(intel_register_access_init(&mmio_data,
diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 49afe91c0..6af68d59e 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -293,7 +293,7 @@ static const struct intel_execution_engine2 *find_engine(const char *name)
 static int register_srm(struct config *config, struct reg *reg,
 			uint32_t *val_in)
 {
-	const int gen = intel_gen(config->devid);
+	const int gen = intel_gen_from_pciid(config->devid);
 	const bool r64b = gen >= 8;
 	const uint32_t ctx = 0;
 	struct drm_i915_gem_exec_object2 obj[2];
@@ -386,7 +386,7 @@ static int register_srm(struct config *config, struct reg *reg,
 
 static uint32_t mcbar_offset(uint32_t devid)
 {
-	return intel_gen(devid) >= 6 ? 0x140000 : 0x10000;
+	return intel_gen_from_pciid(devid) >= 6 ? 0x140000 : 0x10000;
 }
 
 static uint8_t vga_read(uint16_t reg, bool mmio)
@@ -1114,7 +1114,7 @@ static int get_reg_spec_file(char *buf, size_t buflen, const char *dir,
 	 * Third, try file named after gen, e.g. "gen7" for Haswell (which is
 	 * technically 7.5 but this is how it works).
 	 */
-	snprintf(buf, buflen, "%s/gen%d", dir, intel_gen(devid));
+	snprintf(buf, buflen, "%s/gen%d", dir, intel_gen_from_pciid(devid));
 	if (!access(buf, F_OK))
 		return 0;
 
diff --git a/tools/intel_reg_decode.c b/tools/intel_reg_decode.c
index 5a632e09d..85ad13415 100644
--- a/tools/intel_reg_decode.c
+++ b/tools/intel_reg_decode.c
@@ -2627,12 +2627,12 @@ static const struct reg_debug gen6_rp_debug_regs[] = {
 
 static bool is_hsw_plus(uint32_t devid, uint32_t pch)
 {
-	return IS_HASWELL(devid) || intel_gen(devid) >= 8;
+	return IS_HASWELL(devid) || intel_gen_from_pciid(devid) >= 8;
 }
 
 static bool is_gen6_plus(uint32_t devid, uint32_t pch)
 {
-	return intel_gen(devid) >= 6;
+	return intel_gen_from_pciid(devid) >= 6;
 }
 
 static bool is_gen56ivb(uint32_t devid, uint32_t pch)
diff --git a/tools/intel_tiling_detect.c b/tools/intel_tiling_detect.c
index 951e2eecd..d9efe57fc 100644
--- a/tools/intel_tiling_detect.c
+++ b/tools/intel_tiling_detect.c
@@ -222,7 +222,7 @@ static void render(int fd, uint32_t width, uint32_t height, uint32_t tiling)
 
 	bops = buf_ops_create(fd);
 
-	igt_debug("%s() gen: %d\n", __func__, intel_gen(devid));
+	igt_debug("%s() gen: %d\n", __func__, intel_gen_from_pciid(devid));
 
 	ibb = intel_bb_create(fd, SZ_4K);
 
diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index d4aada743..2dd6818fa 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -644,7 +644,7 @@ static const char *_to_str(const char * const strings[],
 
 static int decode_ssc_freq(struct context *context, bool alternate)
 {
-	switch (intel_gen(context->devid)) {
+	switch (intel_gen_from_pciid(context->devid)) {
 	case 2:
 		return alternate ? 66 : 48;
 	case 3:
-- 
2.43.0

