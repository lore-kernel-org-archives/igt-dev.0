Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735ECFCC9BE
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 04:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219EE10E648;
	Tue, 10 Mar 2026 04:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kepyc2ko";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A7110E646
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 04:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773117981; x=1804653981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BprjZRLACWlnOmOhNnRvQ/L1RDYim8LsV3QTFbyfIKU=;
 b=Kepyc2kojmcjYnTrMzml7CuiLW6GwDtXEWRSRKXe7QWwvUtQE1HH7VNu
 Eqfkd0Hl3W+U4Z9pyQVxbrLUZli+RP0L/DmQ3BeiTdT6PdDW7bykDfPaA
 vNR7GsRXakB8MKbrLxycvVn04BENwThdSDftXjlyEp0Ji+dKLcVDiAOnl
 kO62TlcVA+etMfrYKbOHTOBqvsmicZVnSeq5LkkcGYpgJH2BzrtdhSrXZ
 is+WilGzSodJb6EmWd3mJdfTasZybi51NiPz4lWjH3ahJAp+6O3jOXy2U
 8sWRBe0IFMCn3ELU6zEqkt85WkOZHk6Q898aIVfO66HCUL8Q9fF246tdE g==;
X-CSE-ConnectionGUID: UKS8CiVRStCx2xTubVZkog==
X-CSE-MsgGUID: T7eSV0gQTmWNkOBRrqtutw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85509937"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="85509937"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 21:46:21 -0700
X-CSE-ConnectionGUID: yQsJ8Nw4S929z3XIhY3+Cg==
X-CSE-MsgGUID: 8phRtrHwRi2afMtse+1OeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="219199394"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa010.jf.intel.com with ESMTP; 09 Mar 2026 21:46:19 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
Subject: [PATCH v3 3/4] intel/{lib,
 tests}: switch fd-backed version checks to intel_gfx_ver*
Date: Mon,  9 Mar 2026 21:46:15 -0700
Message-ID: <20260310044616.1466628-4-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310044616.1466628-1-x.wang@intel.com>
References: <20260310044616.1466628-1-x.wang@intel.com>
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

Convert the remaining lib/test call sites that already operate on a live
DRM fd to use intel_gfx_ver_major() and intel_gfx_ver() directly.
Most of these places were still deriving a devid from the fd and then
querying intel_gen_from_pciid() or intel_graphics_ver_from_pciid(), even
though the same information is now available through the fd-based helpers.
Switching them over makes the call sites match the actual data flow and
reduces unnecessary dependence on PCI-ID based queries.
Keep the legacy *_from_pciid() helpers in benchmark/tool code and a few
other raw-devid based paths where a suitable DRM fd is not naturally
available through the call chain. Those remaining users are left
intentional and explicit.
This also helps avoid silently continuing the old calling pattern in fd-
backed code. Since both devid and fd are integer types, relying on the
PCI-ID based helpers in places that already have an fd can otherwise make
it too easy to keep using the old style without any compiler warning.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/gpgpu_shader.c                     |  6 +--
 lib/gpu_cmds.c                         | 21 +++++-----
 lib/i915/gem_engine_topology.c         | 10 ++---
 lib/i915/gem_mman.c                    |  2 +-
 lib/i915/gem_submission.c              |  8 ++--
 lib/i915/i915_crc.c                    |  6 +--
 lib/igt_dummyload.c                    |  3 +-
 lib/igt_fb.c                           |  2 +-
 lib/igt_gt.c                           |  4 +-
 lib/igt_store.c                        |  2 +-
 lib/intel_batchbuffer.c                | 56 +++++++++++++-------------
 lib/intel_batchbuffer.h                |  4 +-
 lib/intel_blt.c                        | 22 +++++-----
 lib/intel_blt.h                        |  2 +-
 lib/intel_bufops.c                     | 10 ++---
 lib/intel_common.c                     |  2 +-
 lib/intel_compute.c                    |  6 +--
 lib/intel_mocs.c                       | 13 +++---
 lib/intel_pat.c                        | 14 +++----
 lib/ioctl_wrappers.c                   |  2 +-
 lib/rendercopy_gen9.c                  | 24 +++++------
 lib/xe/xe_legacy.c                     |  2 +-
 lib/xe/xe_oa.c                         |  2 +-
 lib/xe/xe_spin.c                       |  4 +-
 lib/xe/xe_sriov_provisioning.c         |  4 +-
 tests/intel/api_intel_allocator.c      |  2 +-
 tests/intel/api_intel_bb.c             | 11 +++--
 tests/intel/gem_bad_reloc.c            |  4 +-
 tests/intel/gem_blits.c                |  2 +-
 tests/intel/gem_close_race.c           |  2 +-
 tests/intel/gem_concurrent_all.c       |  2 +-
 tests/intel/gem_ctx_create.c           |  4 +-
 tests/intel/gem_ctx_engines.c          |  6 +--
 tests/intel/gem_ctx_isolation.c        | 14 +++----
 tests/intel/gem_ctx_shared.c           |  8 ++--
 tests/intel/gem_ctx_sseu.c             |  2 +-
 tests/intel/gem_eio.c                  |  6 +--
 tests/intel/gem_evict_alignment.c      |  6 +--
 tests/intel/gem_evict_everything.c     |  8 ++--
 tests/intel/gem_exec_async.c           |  2 +-
 tests/intel/gem_exec_await.c           |  2 +-
 tests/intel/gem_exec_balancer.c        |  4 +-
 tests/intel/gem_exec_big.c             |  2 +-
 tests/intel/gem_exec_capture.c         |  9 ++---
 tests/intel/gem_exec_fair.c            | 20 ++++-----
 tests/intel/gem_exec_fence.c           | 20 +++++----
 tests/intel/gem_exec_flush.c           |  4 +-
 tests/intel/gem_exec_gttfill.c         |  2 +-
 tests/intel/gem_exec_latency.c         |  6 +--
 tests/intel/gem_exec_nop.c             |  4 +-
 tests/intel/gem_exec_parallel.c        |  2 +-
 tests/intel/gem_exec_params.c          |  8 ++--
 tests/intel/gem_exec_reloc.c           | 10 ++---
 tests/intel/gem_exec_schedule.c        | 20 ++++-----
 tests/intel/gem_exec_store.c           |  6 +--
 tests/intel/gem_exec_suspend.c         |  2 +-
 tests/intel/gem_exec_whisper.c         |  6 +--
 tests/intel/gem_fenced_exec_thrash.c   |  5 +--
 tests/intel/gem_gpgpu_fill.c           |  2 +-
 tests/intel/gem_gtt_hog.c              |  2 +-
 tests/intel/gem_linear_blits.c         | 11 ++---
 tests/intel/gem_media_fill.c           |  2 +-
 tests/intel/gem_media_vme.c            |  2 +-
 tests/intel/gem_mmap_gtt.c             |  2 +-
 tests/intel/gem_read_read_speed.c      |  4 +-
 tests/intel/gem_render_copy.c          | 10 ++---
 tests/intel/gem_ringfill.c             |  4 +-
 tests/intel/gem_set_tiling_vs_blt.c    |  2 +-
 tests/intel/gem_softpin.c              |  6 +--
 tests/intel/gem_streaming_writes.c     |  4 +-
 tests/intel/gem_sync.c                 |  8 ++--
 tests/intel/gem_tiled_fence_blits.c    |  4 +-
 tests/intel/gem_tiling_max_stride.c    |  8 ++--
 tests/intel/gem_userptr_blits.c        | 25 +++++-------
 tests/intel/gem_vm_create.c            |  2 +-
 tests/intel/gem_watchdog.c             |  4 +-
 tests/intel/gem_workarounds.c          |  2 +-
 tests/intel/gen7_exec_parse.c          |  2 +-
 tests/intel/gen9_exec_parse.c          |  2 +-
 tests/intel/i915_getparams_basic.c     |  6 +--
 tests/intel/i915_module_load.c         |  2 +-
 tests/intel/i915_pm_rc6_residency.c    |  6 +--
 tests/intel/i915_pm_rpm.c              |  2 +-
 tests/intel/i915_pm_sseu.c             |  2 +-
 tests/intel/kms_ccs.c                  | 13 ++----
 tests/intel/kms_fbcon_fbt.c            |  2 +-
 tests/intel/kms_frontbuffer_tracking.c | 11 +++--
 tests/intel/kms_pipe_stress.c          |  6 +--
 tests/intel/perf.c                     | 55 +++++++++++++------------
 tests/intel/perf_pmu.c                 |  8 ++--
 tests/intel/sysfs_preempt_timeout.c    |  2 +-
 tests/intel/sysfs_timeslice_duration.c |  2 +-
 tests/intel/xe_ccs.c                   | 16 ++++----
 tests/intel/xe_compute.c               |  8 ++--
 tests/intel/xe_copy_basic.c            |  6 +--
 tests/intel/xe_debugfs.c               |  3 +-
 tests/intel/xe_eu_stall.c              |  4 +-
 tests/intel/xe_eudebug_online.c        |  9 ++---
 tests/intel/xe_evict.c                 |  6 +--
 tests/intel/xe_exec_fault_mode.c       |  2 +-
 tests/intel/xe_exec_multi_queue.c      |  2 +-
 tests/intel/xe_exec_store.c            |  6 +--
 tests/intel/xe_exec_threads.c          |  4 +-
 tests/intel/xe_fault_injection.c       |  2 +-
 tests/intel/xe_gpgpu_fill.c            |  2 +-
 tests/intel/xe_intel_bb.c              |  7 ++--
 tests/intel/xe_media_fill.c            |  2 +-
 tests/intel/xe_multigpu_svm.c          |  3 +-
 tests/intel/xe_oa.c                    | 23 ++++++-----
 tests/intel/xe_pat.c                   | 38 +++++++----------
 tests/intel/xe_query.c                 |  4 +-
 tests/intel/xe_render_copy.c           |  3 +-
 tests/intel/xe_svm_usrptr_madvise.c    |  3 +-
 tests/prime_vgem.c                     |  2 +-
 114 files changed, 387 insertions(+), 435 deletions(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index abccb4808..ff1159160 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -276,11 +276,11 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
 struct gpgpu_shader *gpgpu_shader_create(int fd)
 {
 	struct gpgpu_shader *shdr = calloc(1, sizeof(struct gpgpu_shader));
-	const struct intel_device_info *info;
+	unsigned int ver;
 
 	igt_assert(shdr);
-	info = intel_get_device_info(intel_get_drm_devid(fd));
-	shdr->gen_ver = 100 * info->graphics_ver + info->graphics_rel;
+	ver = intel_gfx_ver(fd);
+	shdr->gen_ver = 100 * (ver >> 8) + (ver & 0xff);
 	shdr->max_size = 16 * 4;
 	shdr->code = malloc(4 * shdr->max_size);
 	shdr->labels = igt_map_create(igt_map_hash_32, igt_map_equal_32);
diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 5f35b9fd9..35644998f 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -313,14 +313,13 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
 {
 	uint32_t binding_table_offset;
 	uint32_t *binding_table;
-	uint32_t devid = intel_get_drm_devid(ibb->fd);
 
 	intel_bb_ptr_align(ibb, 64);
 	binding_table_offset = intel_bb_offset(ibb);
 	binding_table = intel_bb_ptr(ibb);
 	intel_bb_ptr_add(ibb, 64);
 
-	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0)) {
+	if (intel_gfx_ver(ibb->fd) >= IP_VER(20, 0)) {
 		/*
 		 * Up until now, SURFACEFORMAT_R8_UNROM was used regardless of the 'bpp' value.
 		 * For bpp 32 this results in a surface that is 4x narrower than expected. However
@@ -342,13 +341,13 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
 			igt_assert_f(false,
 				     "Surface state for bpp = %u not implemented",
 				     buf->bpp);
-	} else if (intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 50)) {
+	} else if (intel_gfx_ver(ibb->fd) >= IP_VER(12, 50)) {
 		binding_table[0] = xehp_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
-	} else if (intel_graphics_ver_from_pciid(devid) >= IP_VER(9, 0)) {
+	} else if (intel_gfx_ver(ibb->fd) >= IP_VER(9, 0)) {
 		binding_table[0] = gen9_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
-	} else if (intel_graphics_ver_from_pciid(devid) >= IP_VER(8, 0)) {
+	} else if (intel_gfx_ver(ibb->fd) >= IP_VER(8, 0)) {
 		binding_table[0] = gen8_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
 	} else {
@@ -867,7 +866,7 @@ gen_emit_media_object(struct intel_bb *ibb,
 	/* inline data (xoffset, yoffset) */
 	intel_bb_out(ibb, xoffset);
 	intel_bb_out(ibb, yoffset);
-	if (intel_gen_from_pciid(ibb->devid) >= 8 && !IS_CHERRYVIEW(ibb->devid))
+	if (intel_gfx_ver_major(ibb->fd) >= 8 && !IS_CHERRYVIEW(ibb->devid))
 		gen8_emit_media_state_flush(ibb);
 }
 
@@ -1011,7 +1010,7 @@ void
 xehp_emit_state_compute_mode(struct intel_bb *ibb, bool vrt)
 {
 
-	uint32_t dword_length = intel_graphics_ver_from_pciid(ibb->devid) >= IP_VER(20, 0);
+	uint32_t dword_length = intel_gfx_ver(ibb->fd) >= IP_VER(20, 0);
 
 	intel_bb_out(ibb, XEHP_STATE_COMPUTE_MODE | dword_length);
 	intel_bb_out(ibb, vrt ? (0x10001) << 10 : 0); /* Enable variable number of threads */
@@ -1042,7 +1041,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
 	intel_bb_out(ibb, 0);
 
 	/* stateless data port */
-	tmp = intel_graphics_ver_from_pciid(ibb->devid) >= IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
+	tmp = intel_gfx_ver(ibb->fd) >= IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
 	intel_bb_out(ibb, 0 | tmp);                  //dw3
 
 	/* surface */
@@ -1068,7 +1067,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
 	/* dynamic state buffer size */
 	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);           //dw13
 	/* indirect object buffer size */
-	if (intel_graphics_ver_from_pciid(ibb->devid) >= IP_VER(20, 0))	    //dw14
+	if (intel_gfx_ver(ibb->fd) >= IP_VER(20, 0))	    //dw14
 		intel_bb_out(ibb, 0);
 	else
 		intel_bb_out(ibb, 0xfffff000 | 1);
@@ -1115,7 +1114,7 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
 	else
 		mask = (1 << mask) - 1;
 
-	dword_length = intel_graphics_ver_from_pciid(ibb->devid) >= IP_VER(20, 0) ? 0x26 : 0x25;
+	dword_length = intel_gfx_ver(ibb->fd) >= IP_VER(20, 0) ? 0x26 : 0x25;
 	intel_bb_out(ibb, XEHP_COMPUTE_WALKER | dword_length);
 
 	intel_bb_out(ibb, 0); /* debug object */		//dw1
@@ -1155,7 +1154,7 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
 	intel_bb_out(ibb, 0);					//dw16
 	intel_bb_out(ibb, 0);					//dw17
 
-	if (intel_graphics_ver_from_pciid(ibb->devid) >= IP_VER(20, 0))	//Xe2:dw18
+	if (intel_gfx_ver(ibb->fd) >= IP_VER(20, 0))		//Xe2:dw18
 		intel_bb_out(ibb, 0);
 	/* Interface descriptor data */
 	for (int i = 0; i < 8; i++) {			       //dw18-25 (Xe2:dw19-26)
diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 65c808b82..f44bd7b71 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -372,12 +372,12 @@ mtl_engine_to_gt_map(const struct i915_engine_class_instance *e)
 
 static int gem_engine_to_gt_map(int i915, const struct i915_engine_class_instance *engine)
 {
-	uint32_t devid = intel_get_drm_devid(i915);
+	uint16_t ip_ver = intel_gfx_ver(i915);
 
 	/* Only MTL multi-gt supported at present */
-	igt_require(intel_graphics_ver_from_pciid(devid) <= IP_VER(12, 70));
+	igt_require(ip_ver <= IP_VER(12, 70));
 
-	return IS_METEORLAKE(devid) ? mtl_engine_to_gt_map(engine) : 0;
+	return ip_ver == IP_VER(12, 70) ? mtl_engine_to_gt_map(engine) : 0;
 }
 
 /**
@@ -644,7 +644,7 @@ bool gem_engine_can_block_copy(int i915, const struct intel_execution_engine2 *e
 		return false;
 
 	if (!gem_engine_has_known_capability(i915, engine->name, "block_copy"))
-		return intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 12;
+		return intel_gfx_ver_major(i915) >= 12;
 
 	return gem_engine_has_capability(i915, engine->name, "block_copy");
 }
@@ -655,7 +655,7 @@ uint32_t gem_engine_mmio_base(int i915, const char *engine)
 
 	if (gem_engine_property_scanf(i915, engine, "mmio_base",
 				      "%x", &mmio) < 0) {
-		int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+		int gen = intel_gfx_ver_major(i915);
 
 		/* The layout of xcs1+ is unreliable -- hence the property! */
 		if (!strcmp(engine, "rcs0")) {
diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index 134cbb1c8..ec24bdb25 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -738,7 +738,7 @@ uint64_t gem_mappable_aperture_size(int fd)
 	struct pci_device *pci_dev = igt_device_get_pci_device(fd);
 	int bar;
 
-	if (intel_gen_from_pciid(pci_dev->device_id) < 3)
+	if (intel_gfx_ver_major(fd) < 3)
 		bar = 0;
 	else
 		bar = 2;
diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index e4a57e9fe..5ae7edb10 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -62,7 +62,7 @@
  */
 unsigned gem_submission_method(int fd)
 {
-	const int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const int gen = intel_gfx_ver_major(fd);
 	unsigned method = GEM_SUBMISSION_RINGBUF;
 	int dir;
 	uint32_t value = 0;
@@ -210,7 +210,7 @@ int gem_cmdparser_version(int i915)
 bool gem_engine_has_cmdparser(int i915, const intel_ctx_cfg_t *cfg,
 			      unsigned int engine)
 {
-	const int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const int gen = intel_gfx_ver_major(i915);
 	const int parser_version = gem_cmdparser_version(i915);
 	const int class = intel_ctx_cfg_engine_class(cfg, engine);
 
@@ -232,7 +232,7 @@ bool gem_has_blitter(int i915)
 	unsigned int blt;
 
 	blt = 0;
-	if (intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 6)
+	if (intel_gfx_ver_major(i915) >= 6)
 		blt = I915_EXEC_BLT;
 
 	return gem_has_ring(i915, blt);
@@ -245,7 +245,7 @@ void gem_require_blitter(int i915)
 
 static bool gem_engine_has_immutable_submission(int i915, int class)
 {
-	const int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const int gen = intel_gfx_ver_major(i915);
         int parser_version;
 
 	parser_version = gem_cmdparser_version(i915);
diff --git a/lib/i915/i915_crc.c b/lib/i915/i915_crc.c
index 1d2516d59..f0836bded 100644
--- a/lib/i915/i915_crc.c
+++ b/lib/i915/i915_crc.c
@@ -135,7 +135,7 @@ static void fill_batch(int i915, uint32_t bb_handle, uint64_t bb_offset,
 		       uint64_t table_offset, uint64_t data_offset, uint32_t data_size)
 {
 	uint32_t *bb, *batch, *jmp;
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	const int use_64b = gen >= 8;
 	uint64_t offset;
 	uint64_t crc = USERDATA(table_offset, 0);
@@ -292,7 +292,5 @@ uint32_t i915_crc32(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
  **/
 bool supports_i915_crc32(int i915)
 {
-	uint16_t devid = intel_get_drm_devid(i915);
-
-	return intel_graphics_ver_from_pciid(devid) > IP_VER(12, 50);
+	return intel_gfx_ver(i915) > IP_VER(12, 50);
 }
diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 1d85980ea..f6c66ea40 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -94,8 +94,7 @@ emit_recursive_batch(igt_spin_t *spin,
 {
 #define SCRATCH 0
 #define BATCH IGT_SPIN_BATCH
-	const unsigned int devid = intel_get_drm_devid(fd);
-	const unsigned int gen = intel_gen_from_pciid(devid);
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_relocation_entry relocs[3], *r;
 	struct drm_i915_gem_execbuffer2 *execbuf;
 	struct drm_i915_gem_exec_object2 *obj;
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d59fe133b..82493ca3b 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2905,7 +2905,7 @@ static void copy_with_engine(struct fb_blit_upload *blit,
 	igt_vebox_copyfunc_t vebox_copy = NULL;
 
 	if (use_vebox_copy(src_fb, dst_fb))
-		vebox_copy = igt_get_vebox_copyfunc(intel_get_drm_devid(blit->fd));
+		vebox_copy = igt_get_vebox_copyfunc(blit->fd);
 	else
 		render_copy = igt_get_render_copyfunc(blit->fd);
 
diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index 048da04dc..fc875f98b 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -68,7 +68,7 @@ static bool has_gpu_reset(int fd)
 		/* Very old kernels did not support the query */
 		if (reset_query_once == -1)
 			reset_query_once =
-			      (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 5) ? 1 : 0;
+			      (intel_gfx_ver_major(fd) >= 5) ? 1 : 0;
 	}
 
 	return reset_query_once > 0;
@@ -468,7 +468,7 @@ void igt_fork_hang_helper(void)
 
 	fd = drm_open_driver(DRIVER_INTEL);
 
-	gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	gen = intel_gfx_ver_major(fd);
 	igt_skip_on(gen < 5);
 
 	igt_fork_helper(&hang_helper)
diff --git a/lib/igt_store.c b/lib/igt_store.c
index a11565ad1..7cedb6fd5 100644
--- a/lib/igt_store.c
+++ b/lib/igt_store.c
@@ -31,7 +31,7 @@ void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 {
 	const int SCRATCH = 0;
 	const int BATCH = 1;
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 5cc1679ca..cad6ba138 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -329,11 +329,7 @@ void igt_blitter_copy(int fd,
 		      uint32_t dst_x, uint32_t dst_y,
 		      uint64_t dst_size)
 {
-	uint32_t devid;
-
-	devid = intel_get_drm_devid(fd);
-
-	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 60))
+	if (intel_gfx_ver(fd) >= IP_VER(12, 60))
 		igt_blitter_fast_copy__raw(fd, ahnd, ctx, NULL,
 					   src_handle, src_delta,
 					   src_stride, src_tiling,
@@ -410,7 +406,7 @@ void igt_blitter_src_copy(int fd,
 	uint32_t batch_handle;
 	uint32_t src_pitch, dst_pitch;
 	uint32_t dst_reloc_offset, src_reloc_offset;
-	uint32_t gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	uint32_t gen = intel_gfx_ver_major(fd);
 	uint64_t batch_offset, src_offset, dst_offset;
 	const bool has_64b_reloc = gen >= 8;
 	int i = 0;
@@ -669,9 +665,9 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int fd)
 		copy = mtl_render_copyfunc;
 	else if (IS_DG2(devid))
 		copy = gen12p71_render_copyfunc;
-	else if (intel_gen_from_pciid(devid) >= 35)
+	else if (intel_gfx_ver_major(fd) >= 35)
 		copy = xe3p_render_copyfunc;
-	else if (intel_gen_from_pciid(devid) >= 20)
+	else if (intel_gfx_ver_major(fd) >= 20)
 		copy = xe2_render_copyfunc;
 	else if (IS_GEN12(devid))
 		copy = gen12_render_copyfunc;
@@ -695,11 +691,11 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int fd)
 	return copy;
 }
 
-igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
+igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int fd)
 {
 	igt_vebox_copyfunc_t copy = NULL;
 
-	if (IS_GEN12(devid))
+	if (intel_gfx_ver_major(fd) == 12)
 		copy = gen12_vebox_copyfunc;
 
 	return copy;
@@ -720,26 +716,27 @@ igt_render_clearfunc_t igt_get_render_clearfunc(int devid)
 
 /**
  * igt_get_media_fillfunc:
- * @devid: pci device id
+ * @fd: drm fd
  *
  * Returns:
  *
  * The platform-specific media fill function pointer for the device specified
- * with @devid. Will return NULL when no media fill function is implemented.
+ * with @fd. Will return NULL when no media fill function is implemented.
  */
-igt_fillfunc_t igt_get_media_fillfunc(int devid)
+igt_fillfunc_t igt_get_media_fillfunc(int fd)
 {
 	igt_fillfunc_t fill = NULL;
+	int gfx_ver_major = intel_gfx_ver_major(fd);
 
-	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 50)) {
+	if (intel_gfx_ver(fd) >= IP_VER(12, 50)) {
 		/* current implementation defeatured PIPELINE_MEDIA */
-	} else if (IS_GEN12(devid))
+	} else if (gfx_ver_major == 12)
 		fill = gen12_media_fillfunc;
-	else if (IS_GEN9(devid) || IS_GEN10(devid) || IS_GEN11(devid))
+	else if (gfx_ver_major == 11 || gfx_ver_major == 10 || gfx_ver_major == 9)
 		fill = gen9_media_fillfunc;
-	else if (IS_GEN8(devid))
+	else if (gfx_ver_major == 8)
 		fill = gen8_media_fillfunc;
-	else if (IS_GEN7(devid))
+	else if (gfx_ver_major == 7)
 		fill = gen7_media_fillfunc;
 
 	return fill;
@@ -758,28 +755,29 @@ igt_vme_func_t igt_get_media_vme_func(int devid)
 
 /**
  * igt_get_gpgpu_fillfunc:
- * @devid: pci device id
+ * @fd: drm fd
  *
  * Returns:
  *
  * The platform-specific gpgpu fill function pointer for the device specified
- * with @devid. Will return NULL when no gpgpu fill function is implemented.
+ * with @fd. Will return NULL when no gpgpu fill function is implemented.
  */
-igt_fillfunc_t igt_get_gpgpu_fillfunc(int devid)
+igt_fillfunc_t igt_get_gpgpu_fillfunc(int fd)
 {
 	igt_fillfunc_t fill = NULL;
+	int gfx_ver_major = intel_gfx_ver_major(fd);
 
-	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 50))
+	if (intel_gfx_ver(fd) >= IP_VER(12, 50))
 		fill = xehp_gpgpu_fillfunc;
-	else if (IS_GEN12(devid))
+	else if (gfx_ver_major == 12)
 		fill = gen12_gpgpu_fillfunc;
-	else if (IS_GEN11(devid))
+	else if (gfx_ver_major == 11)
 		fill = gen11_gpgpu_fillfunc;
-	else if (IS_GEN9(devid) || IS_GEN10(devid))
+	else if (gfx_ver_major == 10 || gfx_ver_major == 9)
 		fill = gen9_gpgpu_fillfunc;
-	else if (IS_GEN8(devid))
+	else if (gfx_ver_major == 8)
 		fill = gen8_gpgpu_fillfunc;
-	else if (IS_GEN7(devid))
+	else if (gfx_ver_major == 7)
 		fill = gen7_gpgpu_fillfunc;
 
 	return fill;
@@ -913,7 +911,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 	igt_assert(ibb);
 
 	ibb->devid = intel_get_drm_devid(fd);
-	ibb->gen = intel_gen_from_pciid(ibb->devid);
+	ibb->gen = intel_gfx_ver_major(fd);
 	ibb->ctx = ctx;
 
 	ibb->fd = fd;
@@ -1091,7 +1089,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
 
 static bool aux_needs_softpin(int fd)
 {
-	return intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 12;
+	return intel_gfx_ver_major(fd) >= 12;
 }
 
 static bool has_ctx_cfg(struct intel_bb *ibb)
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index d0a7c8dc7..2abb2e9fa 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -166,7 +166,7 @@ typedef void (*igt_vebox_copyfunc_t)(struct intel_bb *ibb,
 				     unsigned int width, unsigned int height,
 				     struct intel_buf *dst);
 
-igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid);
+igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int fd);
 
 typedef void (*igt_render_clearfunc_t)(struct intel_bb *ibb,
 				       struct intel_buf *dst, unsigned int dst_x, unsigned int dst_y,
@@ -198,7 +198,7 @@ typedef void (*igt_fillfunc_t)(int i915,
 			       uint8_t color);
 
 igt_fillfunc_t igt_get_gpgpu_fillfunc(int devid);
-igt_fillfunc_t igt_get_media_fillfunc(int devid);
+igt_fillfunc_t igt_get_media_fillfunc(int fd);
 
 typedef void (*igt_vme_func_t)(int i915,
 			       uint32_t ctx,
diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 9f1052d95..3641ae7a9 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -997,7 +997,7 @@ uint64_t emit_blt_block_copy(int fd,
 			     uint64_t bb_pos,
 			     bool emit_bbe)
 {
-	unsigned int ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_gfx_ver(fd);
 	struct gen12_block_copy_data data = {};
 	struct gen12_block_copy_data_ext dext = {};
 	uint64_t dst_offset, src_offset, bb_offset;
@@ -1285,7 +1285,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 				 uint64_t bb_pos,
 				 bool emit_bbe)
 {
-	unsigned int ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_gfx_ver(fd);
 	union ctrl_surf_copy_data data = { };
 	size_t data_sz;
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
@@ -1705,7 +1705,7 @@ uint64_t emit_blt_fast_copy(int fd,
 			    uint64_t bb_pos,
 			    bool emit_bbe)
 {
-	unsigned int ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_gfx_ver(fd);
 	struct gen12_fast_copy_data data = {};
 	uint64_t dst_offset, src_offset, bb_offset;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -1972,11 +1972,9 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
 static void dump_bb_mem_copy_cmd(int fd, struct xe_mem_copy_data *data)
 {
 	uint32_t *cmd = (uint32_t *) data;
-	uint32_t devid = intel_get_drm_devid(fd);
-
 	igt_info("BB details:\n");
 
-	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0)) {
+	if (intel_gfx_ver(fd) >= IP_VER(20, 0)) {
 		igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
 			 "[copy type: %d, mode: %d]\n",
 			 cmd[0], data->dw00.xe2.client, data->dw00.xe2.opcode,
@@ -2006,7 +2004,7 @@ static void dump_bb_mem_copy_cmd(int fd, struct xe_mem_copy_data *data)
 		 cmd[7], data->dw07.dst_address_lo);
 	igt_info(" dw08: [%08x] dst offset hi (0x%x)\n",
 		 cmd[8], data->dw08.dst_address_hi);
-	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0)) {
+	if (intel_gfx_ver(fd) >= IP_VER(20, 0)) {
 		igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
 			 cmd[9], data->dw09.xe2.dst_mocs,
 			 data->dw09.xe2.src_mocs);
@@ -2025,7 +2023,6 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 	uint64_t dst_offset, src_offset, shift;
 	uint32_t width, height, width_max, height_max, remain;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
-	uint32_t devid = intel_get_drm_devid(fd);
 	uint8_t *bb;
 
 	if (mem->mode == MODE_BYTE) {
@@ -2049,7 +2046,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 	width = mem->src.width;
 	height = mem->dst.height;
 
-	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0)) {
+	if (intel_gfx_ver(fd) >= IP_VER(20, 0)) {
 		data.dw00.xe2.client = 0x2;
 		data.dw00.xe2.opcode = 0x5a;
 		data.dw00.xe2.length = 8;
@@ -2231,7 +2228,6 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd,
 	int b;
 	uint32_t *batch;
 	uint32_t value;
-	uint32_t devid = intel_get_drm_devid(fd);
 
 	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
 					  0, mem->dst.pat_index);
@@ -2246,7 +2242,7 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd,
 	batch[b++] = mem->dst.pitch - 1;
 	batch[b++] = dst_offset;
 	batch[b++] = dst_offset << 32;
-	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0))
+	if (intel_gfx_ver(fd) >= IP_VER(20, 0))
 		batch[b++] = value | (mem->dst.mocs_index << 3);
 	else
 		batch[b++] = value | mem->dst.mocs_index;
@@ -2364,7 +2360,7 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 		if (create_mapping && region != system_memory(blt->fd))
 			flags |= DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 
-		if (intel_gen_from_pciid(intel_get_drm_devid(blt->fd)) >= 20 && compression) {
+		if (intel_gfx_ver_major(blt->fd) >= 20 && compression) {
 			pat_index = intel_get_pat_idx_uc_comp(blt->fd);
 			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 		}
@@ -2590,7 +2586,7 @@ void blt_surface_get_flatccs_data(int fd,
 		cpu_caching = __xe_default_cpu_caching(fd, sysmem, 0);
 		ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(fd));
 
-		if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 20 && obj->compression) {
+		if (intel_gfx_ver_major(fd) >= 20 && obj->compression) {
 			comp_pat_index  = intel_get_pat_idx_uc_comp(fd);
 			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 		}
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index d716cc773..ae62d44e4 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -52,7 +52,7 @@
 #include "igt.h"
 #include "intel_cmds_info.h"
 
-#define CCS_RATIO(fd) (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 20 ? 512 : 256)
+#define CCS_RATIO(fd) (intel_gfx_ver_major(fd) >= 20 ? 512 : 256)
 #define GEN12_MEM_COPY_MOCS_SHIFT		25
 #define XE2_MEM_COPY_SRC_MOCS_SHIFT		28
 #define XE2_MEM_COPY_DST_MOCS_SHIFT		3
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index cdb6b14a1..baf52d4f8 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1063,7 +1063,7 @@ static void __intel_buf_init(struct buf_ops *bops,
 		} else {
 			uint16_t cpu_caching = __xe_default_cpu_caching(bops->fd, region, 0);
 
-			if (intel_gen_from_pciid(bops->devid) >= 20 && compression)
+			if (intel_gfx_ver_major(bops->fd) >= 20 && compression)
 				cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 
 			bo_size = ALIGN(bo_size, xe_get_default_alignment(bops->fd));
@@ -1106,7 +1106,7 @@ void intel_buf_init(struct buf_ops *bops,
 	uint64_t region;
 	uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-	if (compression && intel_gen_from_pciid(bops->devid) >= 20)
+	if (compression && intel_gfx_ver_major(bops->fd) >= 20)
 		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
 
 	region = bops->driver == INTEL_DRIVER_I915 ? I915_SYSTEM_MEMORY :
@@ -1132,7 +1132,7 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 {
 	uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-	if (compression && intel_gen_from_pciid(bops->devid) >= 20)
+	if (compression && intel_gfx_ver_major(bops->fd) >= 20)
 		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
 
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
@@ -1203,7 +1203,7 @@ void intel_buf_init_using_handle_and_size(struct buf_ops *bops,
 	igt_assert(handle);
 	igt_assert(size);
 
-	if (compression && intel_gen_from_pciid(bops->devid) >= 20)
+	if (compression && intel_gfx_ver_major(bops->fd) >= 20)
 		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
 
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
@@ -1758,7 +1758,7 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 	igt_assert(bops);
 
 	devid = intel_get_drm_devid(fd);
-	generation = intel_gen_from_pciid(devid);
+	generation = intel_gfx_ver_major(fd);
 
 	/* Predefined settings: see intel_device_info? */
 	for (int i = 0; i < ARRAY_SIZE(buf_ops_arr); i++) {
diff --git a/lib/intel_common.c b/lib/intel_common.c
index d722c81cd..27d2543a2 100644
--- a/lib/intel_common.c
+++ b/lib/intel_common.c
@@ -91,7 +91,7 @@ bool is_intel_region_compressible(int fd, uint64_t region)
 		return true;
 
 	/* Integrated Xe2+ supports compression on system memory */
-	if (intel_gen_from_pciid(devid) >= 20 && !is_dgfx && is_intel_system_region(fd, region))
+	if (intel_gfx_ver_major(fd) >= 20 && !is_dgfx && is_intel_system_region(fd, region))
 		return true;
 
 	/* Discrete supports compression on vram */
diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 6a83022ba..558dacec6 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2303,7 +2303,7 @@ static bool __run_intel_compute_kernel(int fd,
 				       struct user_execenv *user,
 				       enum execenv_alloc_prefs alloc_prefs)
 {
-	unsigned int ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_gfx_ver(fd);
 	int batch;
 	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
 	enum intel_driver driver = get_intel_driver(fd);
@@ -2774,7 +2774,7 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 		bool threadgroup_preemption,
 		enum execenv_alloc_prefs alloc_prefs)
 {
-	unsigned int ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_gfx_ver(fd);
 	int batch;
 	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
 	enum intel_driver driver = get_intel_driver(fd);
@@ -2828,7 +2828,7 @@ static bool __run_intel_compute_kernel_preempt(int fd,
  */
 bool xe_kernel_preempt_check(int fd, enum xe_compute_preempt_type required_preempt)
 {
-	unsigned int ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_gfx_ver(fd);
 	int batch = find_preempt_batch(ip_ver);
 
 	if (batch < 0) {
diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index 7e934ff24..c74100665 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -4,6 +4,7 @@
  */
 
 #include "igt.h"
+#include "intel_chipset.h"
 #include "intel_mocs.h"
 
 struct drm_intel_mocs_index {
@@ -27,8 +28,7 @@ struct drm_intel_mocs_index {
 
 static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
 {
-	uint16_t devid = intel_get_drm_devid(fd);
-	unsigned int ip_ver = intel_graphics_ver_from_pciid(devid);
+	unsigned int ip_ver = intel_gfx_ver(fd);
 
 	/*
 	 * Gen >= 12 onwards don't have a setting for PTE,
@@ -42,15 +42,15 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
 		mocs->wb_index = 4;
 		mocs->displayable_index = 1;
 		mocs->defer_to_pat_index = 0;
-	} else if (IS_METEORLAKE(devid)) {
+	} else if (ip_ver == IP_VER(12, 70)) {	//IS_METEORLAKE
 		mocs->uc_index = 5;
 		mocs->wb_index = 1;
 		mocs->displayable_index = 14;
-	} else if (IS_DG2(devid)) {
+	} else if (ip_ver == IP_VER(12, 55)) {	//IS_DG2
 		mocs->uc_index = 1;
 		mocs->wb_index = 3;
 		mocs->displayable_index = 3;
-	} else if (IS_DG1(devid)) {
+	} else if (ip_ver == IP_VER(12, 10)) {	//IS_DG1
 		mocs->uc_index = 1;
 		mocs->wb_index = 5;
 		mocs->displayable_index = 5;
@@ -124,9 +124,8 @@ uint8_t intel_get_displayable_mocs_index(int fd)
 uint8_t intel_get_defer_to_pat_mocs_index(int fd)
 {
 	struct drm_intel_mocs_index mocs;
-	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	igt_assert(intel_gen_from_pciid(dev_id) >= 20);
+	igt_assert(intel_gfx_ver_major(fd) >= 20);
 
 	get_mocs_index(fd, &mocs);
 
diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 92722963f..03ce7505a 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -6,6 +6,7 @@
 #include <fcntl.h>
 #include "igt.h"
 #include "intel_pat.h"
+#include "intel_chipset.h"
 #include "xe/xe_query.h"
 
 /**
@@ -97,7 +98,7 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
 
 static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
-	uint16_t dev_id;
+	uint16_t ip_ver;
 
 	/*
 	 * For Xe, use the PAT cache stored in struct xe_device.
@@ -115,19 +116,19 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 	}
 
 	/* i915 fallback: hardcoded PAT indices */
-	dev_id = intel_get_drm_devid(fd);
+	ip_ver = intel_gfx_ver(fd);
 
-	if (IS_METEORLAKE(dev_id)) {
+	if (ip_ver == IP_VER(12,70)) {	//IS_METEORLAKE
 		pat->uc = 2;
 		pat->wt = 1;
 		pat->wb = 3;
 		pat->max_index = 3;
-	} else if (IS_PONTEVECCHIO(dev_id)) {
+	} else if (ip_ver == IP_VER(12, 60)) {	//IS_PONTEVECCHIO
 		pat->uc = 0;
 		pat->wt = 2;
 		pat->wb = 3;
 		pat->max_index = 7;
-	} else if (intel_graphics_ver_from_pciid(dev_id) <= IP_VER(12, 60)) {
+	} else if (ip_ver <= IP_VER(12, 60)) {
 		pat->uc = 3;
 		pat->wt = 2;
 		pat->wb = 0;
@@ -156,9 +157,8 @@ uint8_t intel_get_pat_idx_uc(int fd)
 uint8_t intel_get_pat_idx_uc_comp(int fd)
 {
 	struct intel_pat_cache pat = {};
-	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	igt_assert(intel_gen_from_pciid(dev_id) >= 20);
+	igt_assert(intel_gfx_ver_major(fd) >= 20);
 
 	intel_get_pat_idx(fd, &pat);
 	return pat.uc_comp;
diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index efc052acf..bc3ee4e94 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1072,7 +1072,7 @@ void gem_require_ring(int fd, unsigned ring)
  */
 bool gem_has_mocs_registers(int fd)
 {
-	return intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 9;
+	return intel_gfx_ver_major(fd) >= 9;
 }
 
 /**
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 56bea28c3..9fc9295e3 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -265,12 +265,12 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 	if (buf->compression == I915_COMPRESSION_MEDIA)
 		ss->ss7.tgl.media_compression = 1;
 	else if (buf->compression == I915_COMPRESSION_RENDER) {
-		if (intel_gen_from_pciid(ibb->devid) >= 20)
+		if (intel_gfx_ver_major(ibb->fd) >= 20)
 			ss->ss6.aux_mode = 0x0; /* AUX_NONE, unified compression */
 		else
 			ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
 
-		if (intel_gen_from_pciid(ibb->devid) < 12 && buf->ccs[0].stride) {
+		if (intel_gfx_ver_major(ibb->fd) < 12 && buf->ccs[0].stride) {
 			ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
 
 			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
@@ -312,7 +312,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
 			ss->ss7.dg2.disable_support_for_multi_gpu_atomics = 1;
 
-			if (intel_gen_from_pciid(ibb->devid) >= 20)
+			if (intel_gfx_ver_major(ibb->fd) >= 20)
 				ss->ss12.lnl.compression_format = lnl_compression_format(buf);
 			else
 				ss->ss12.dg2.compression_format = dg2_compression_format(buf);
@@ -690,7 +690,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
 	/* WaBindlessSurfaceStateModifyEnable:skl,bxt */
 	/* The length has to be one less if we dont modify
 	   bindless state */
-	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_gfx_ver_major(ibb->fd) >= 20)
 		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | 20);
 	else
 		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | (19 - 1 - 2));
@@ -735,7 +735,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
 
-	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20) {
+	if (intel_gfx_ver_major(ibb->fd) >= 20) {
 		/* Bindless sampler */
 		intel_bb_out(ibb, 0);
 		intel_bb_out(ibb, 0);
@@ -746,7 +746,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
 static void
 gen7_emit_urb(struct intel_bb *ibb) {
 	/* XXX: Min valid values from mesa */
-	const int vs_entries = intel_gen_from_pciid(ibb->devid) >= 35 ? 128 : 64;
+	const int vs_entries = intel_gfx_ver_major(ibb->fd) >= 35 ? 128 : 64;
 	const int vs_size = 2;
 	const int vs_start = 4;
 
@@ -908,7 +908,7 @@ gen9_emit_ds(struct intel_bb *ibb) {
 
 static void
 gen8_emit_wm_hz_op(struct intel_bb *ibb) {
-	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20) {
+	if (intel_gfx_ver_major(ibb->fd) >= 20) {
 		intel_bb_out(ibb, GEN8_3DSTATE_WM_HZ_OP | (6-2));
 		intel_bb_out(ibb, 0);
 	} else {
@@ -998,7 +998,7 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	intel_bb_out(ibb, 0);
 
 	intel_bb_out(ibb, GEN7_3DSTATE_PS | (12-2));
-	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_gfx_ver_major(ibb->fd) >= 20)
 		intel_bb_out(ibb, kernel | 1);
 	else
 		intel_bb_out(ibb, kernel);
@@ -1015,7 +1015,7 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	intel_bb_out(ibb, (max_threads - 1) << GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
 	             GEN6_3DSTATE_WM_16_DISPATCH_ENABLE |
 	             (fast_clear ? GEN8_3DSTATE_FAST_CLEAR_ENABLE : 0));
-	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_gfx_ver_major(ibb->fd) >= 20)
 		intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT |
 			     GENXE_KERNEL0_POLY_PACK16_FIXED << GENXE_KERNEL0_PACKING_POLICY);
 	else
@@ -1070,7 +1070,7 @@ gen9_emit_depth(struct intel_bb *ibb)
 
 static void
 gen7_emit_clear(struct intel_bb *ibb) {
-	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_gfx_ver_major(ibb->fd) >= 20)
 		return;
 
 	intel_bb_out(ibb, GEN7_3DSTATE_CLEAR_PARAMS | (3-2));
@@ -1081,7 +1081,7 @@ gen7_emit_clear(struct intel_bb *ibb) {
 static void
 gen6_emit_drawing_rectangle(struct intel_bb *ibb, const struct intel_buf *dst)
 {
-	if (intel_gen_from_pciid(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_gfx_ver_major(ibb->fd) >= 20)
 		intel_bb_out(ibb, GENXE2_3DSTATE_DRAWING_RECTANGLE_FAST | (4 - 2));
 	else
 		intel_bb_out(ibb, GEN4_3DSTATE_DRAWING_RECTANGLE | (4 - 2));
@@ -1275,7 +1275,7 @@ void _gen9_render_op(struct intel_bb *ibb,
 
 	gen9_emit_state_base_address(ibb);
 
-	if (HAS_4TILE(ibb->devid) || intel_gen_from_pciid(ibb->devid) > 12) {
+	if (HAS_4TILE(ibb->devid) || intel_gfx_ver_major(ibb->fd) > 12) {
 		intel_bb_out(ibb, GEN4_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2);
 		intel_bb_emit_reloc(ibb, ibb->handle,
 				    I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0,
diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 2bdd7a3a9..7e58837df 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -75,7 +75,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
 
 	if (flags & COMPRESSION)
-		igt_require(intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 20);
+		igt_require(intel_gfx_ver_major(fd) >= 20);
 
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 57b89fbf7..5007d08ac 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -455,7 +455,7 @@ xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
 	u8 *ptr;
 
 	/* Only ADL-P, DG2 and newer ip support hwconfig, use hardcoded values for previous */
-	if (intel_graphics_ver_from_pciid(device_id) >= IP_VER(12, 55) || devinfo->is_alderlake_p) {
+	if (intel_gfx_ver(drm_fd) >= IP_VER(12, 55) || devinfo->is_alderlake_p) {
 		query_hwconfig(drm_fd, &topinfo);
 	} else {
 		topinfo.max_slices = 1;
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 9148c7a13..514c642ff 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -54,7 +54,6 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
 	uint64_t timestamp_addr = opts->addr + offsetof(struct xe_spin, timestamp);
 	int b = 0;
-	uint32_t devid;
 
 	spin->start = 0;
 	spin->end = 0xffffffff;
@@ -166,8 +165,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 		spin->batch[b++] = opts->mem_copy->dst_offset;
 		spin->batch[b++] = opts->mem_copy->dst_offset << 32;
 
-		devid = intel_get_drm_devid(opts->mem_copy->fd);
-		if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0))
+		if (intel_gfx_ver(opts->mem_copy->fd) >= IP_VER(20, 0))
 			spin->batch[b++] = opts->mem_copy->src->mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT |
 					   opts->mem_copy->dst->mocs_index << XE2_MEM_COPY_DST_MOCS_SHIFT;
 		else
diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 338265116..384aa1c07 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -53,9 +53,7 @@ const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res)
 
 static uint64_t get_vfid_mask(int fd)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
-
-	return (intel_graphics_ver_from_pciid(dev_id) >= IP_VER(12, 50)) ?
+	return (intel_gfx_ver(fd) >= IP_VER(12, 50)) ?
 		GGTT_PTE_VFID_MASK : PRE_1250_IP_VER_GGTT_PTE_VFID_MASK;
 }
 
diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index 19a476ea5..d78ee070e 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -625,7 +625,7 @@ static void execbuf_with_allocator(int fd)
 	uint64_t ahnd, sz = 4096, gtt_size;
 	unsigned int flags = EXEC_OBJECT_PINNED;
 	uint32_t *ptr, batch[32], copied;
-	int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	int gen = intel_gfx_ver_major(fd);
 	int i;
 	const uint32_t magic = 0x900df00d;
 
diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index ed8955a87..395beb622 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -1052,7 +1052,7 @@ static void do_intel_bb_blit(struct buf_ops *bops, int loops, uint32_t tiling)
 	gem_require_blitter(i915);
 
 	/* We'll fix it for gen2/3 later. */
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) > 3);
+	igt_require(intel_gfx_ver_major(i915) > 3);
 
 	for (i = 0; i < loops; i++) {
 		fails += __do_intel_bb_blit(bops, tiling);
@@ -1313,13 +1313,12 @@ static int render(struct buf_ops *bops, uint32_t tiling, bool do_reloc,
 	int i915 = buf_ops_get_fd(bops);
 	uint32_t fails = 0;
 	char name[128];
-	uint32_t devid = intel_get_drm_devid(i915);
 	igt_render_copyfunc_t render_copy = NULL;
 
-	igt_debug("%s() gen: %d\n", __func__, intel_gen_from_pciid(devid));
+	igt_debug("%s() gen: %d\n", __func__, intel_gfx_ver_major(i915));
 
 	/* Don't use relocations on gen12+ */
-	igt_require((do_reloc && intel_gen_from_pciid(devid) < 12) ||
+	igt_require((do_reloc && intel_gfx_ver_major(i915) < 12) ||
 		    !do_reloc);
 
 	if (do_reloc)
@@ -1597,7 +1596,7 @@ int igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
 	igt_fixture() {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		bops = buf_ops_create(i915);
-		gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+		gen = intel_gfx_ver_major(i915);
 	}
 
 	igt_describe("Ensure reset is possible on fresh bb");
@@ -1659,7 +1658,7 @@ int igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
 		do_intel_bb_blit(bops, 10, I915_TILING_X);
 
 	igt_subtest("intel-bb-blit-y") {
-		igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 6);
+		igt_require(intel_gfx_ver_major(i915) >= 6);
 		do_intel_bb_blit(bops, 10, I915_TILING_Y);
 	}
 
diff --git a/tests/intel/gem_bad_reloc.c b/tests/intel/gem_bad_reloc.c
index 769395c6c..8dde2ad07 100644
--- a/tests/intel/gem_bad_reloc.c
+++ b/tests/intel/gem_bad_reloc.c
@@ -84,7 +84,7 @@ static void negative_reloc(int fd, unsigned flags)
 	uint64_t *offsets;
 	int i;
 
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 7);
+	igt_require(intel_gfx_ver_major(fd) >= 7);
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = gem_create(fd, 8192);
@@ -135,7 +135,7 @@ static void negative_reloc(int fd, unsigned flags)
 
 static void negative_reloc_blt(int fd)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[1024][2];
 	struct drm_i915_gem_relocation_entry reloc;
diff --git a/tests/intel/gem_blits.c b/tests/intel/gem_blits.c
index d0e118374..bc4956328 100644
--- a/tests/intel/gem_blits.c
+++ b/tests/intel/gem_blits.c
@@ -830,7 +830,7 @@ int igt_main()
 		gem_require_blitter(device.fd);
 
 		device.pciid = intel_get_drm_devid(device.fd);
-		device.gen = intel_gen_from_pciid(device.pciid);
+		device.gen = intel_gfx_ver_major(device.fd);
 		device.llc = gem_has_llc(device.fd);
 		device.ahnd = get_reloc_ahnd(device.fd, 0);
 	}
diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
index 285732acf..f9216b9ab 100644
--- a/tests/intel/gem_close_race.c
+++ b/tests/intel/gem_close_race.c
@@ -347,7 +347,7 @@ int igt_main()
 		igt_require_gem(fd);
 
 		devid = intel_get_drm_devid(fd);
-		has_64bit_relocations = intel_gen_from_pciid(devid) >= 8;
+		has_64bit_relocations = intel_gfx_ver_major(fd) >= 8;
 		has_softpin = !gem_has_relocations(fd);
 		exec_addr = gem_detect_safe_start_offset(fd);
 		data_addr = gem_detect_safe_alignment(fd);
diff --git a/tests/intel/gem_concurrent_all.c b/tests/intel/gem_concurrent_all.c
index 8825a1fa0..9b41f6c5a 100644
--- a/tests/intel/gem_concurrent_all.c
+++ b/tests/intel/gem_concurrent_all.c
@@ -1904,7 +1904,7 @@ int igt_main()
 		igt_require_gem(fd);
 		intel_detect_and_clear_missed_interrupts(fd);
 		devid = intel_get_drm_devid(fd);
-		gen = intel_gen_from_pciid(devid);
+		gen = intel_gfx_ver_major(fd);
 		rendercopy = igt_get_render_copyfunc(fd);
 
 		vgem_drv = __drm_open_driver(DRIVER_VGEM);
diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
index 6bfbc0dfb..54f3a099d 100644
--- a/tests/intel/gem_ctx_create.c
+++ b/tests/intel/gem_ctx_create.c
@@ -309,7 +309,7 @@ static void xchg_ptr(void *array, unsigned i, unsigned j)
 
 static unsigned __context_size(int fd)
 {
-	switch (intel_gen_from_pciid(intel_get_drm_devid(fd))) {
+	switch (intel_gfx_ver_major(fd)) {
 	case 0:
 	case 1:
 	case 2:
@@ -478,7 +478,7 @@ static void basic_ext_param(int i915)
 static void check_single_timeline(int i915, uint32_t ctx, int num_engines)
 {
 #define RCS_TIMESTAMP (0x2000 + 0x358)
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	const int has_64bit_reloc = gen >= 8;
 	struct drm_i915_gem_exec_object2 results = { .handle = gem_create(i915, 4096) };
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
index 7f05578c8..a4a54fad1 100644
--- a/tests/intel/gem_ctx_engines.c
+++ b/tests/intel/gem_ctx_engines.c
@@ -474,7 +474,7 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
 			const struct intel_execution_engine2 *e)
 {
 #define RCS_TIMESTAMP (mmio_base + 0x358)
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	unsigned int mmio_base = gem_engine_mmio_base(i915, e->name);
 	const int has_64bit_reloc = gen >= 8;
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, I915_EXEC_RING_MASK + 1);
@@ -571,7 +571,7 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
 
 static void independent_all(int i915, const intel_ctx_t *ctx)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	const struct intel_execution_engine2 *e;
 	igt_spin_t *spin = NULL;
 	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
@@ -643,7 +643,7 @@ int igt_main()
 		const intel_ctx_t *ctx;
 
 		igt_require(gem_scheduler_enabled(i915));
-		igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 6);
+		igt_require(intel_gfx_ver_major(i915) >= 6);
 
 		ctx = intel_ctx_create_all_physical(i915);
 		for_each_ctx_engine(i915, ctx, e) {
diff --git a/tests/intel/gem_ctx_isolation.c b/tests/intel/gem_ctx_isolation.c
index c2cbe70ea..00e1d976a 100644
--- a/tests/intel/gem_ctx_isolation.c
+++ b/tests/intel/gem_ctx_isolation.c
@@ -273,7 +273,7 @@ static void tmpl_regs(int fd,
 		      uint32_t handle,
 		      uint32_t value)
 {
-	const unsigned int gen_bit = 1 << intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen_bit = 1 << intel_gfx_ver_major(fd);
 	const unsigned int engine_bit = ENGINE(e->class, e->instance);
 	const uint32_t mmio_base = gem_engine_mmio_base(fd, e->name);
 	unsigned int regs_size;
@@ -318,7 +318,7 @@ static uint32_t read_regs(int fd,
 			  const struct intel_execution_engine2 *e,
 			  unsigned int flags)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	const unsigned int gen_bit = 1 << gen;
 	const unsigned int engine_bit = ENGINE(e->class, e->instance);
 	const uint32_t mmio_base = gem_engine_mmio_base(fd, e->name);
@@ -408,7 +408,7 @@ static void write_regs(int fd, uint64_t ahnd,
 		       unsigned int flags,
 		       uint32_t value)
 {
-	const unsigned int gen_bit = 1 << intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen_bit = 1 << intel_gfx_ver_major(fd);
 	const unsigned int engine_bit = ENGINE(e->class, e->instance);
 	const uint32_t mmio_base = gem_engine_mmio_base(fd, e->name);
 	struct drm_i915_gem_exec_object2 obj;
@@ -475,7 +475,7 @@ static void restore_regs(int fd,
 			 unsigned int flags,
 			 uint32_t regs)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	const unsigned int gen_bit = 1 << gen;
 	const unsigned int engine_bit = ENGINE(e->class, e->instance);
 	const uint32_t mmio_base = gem_engine_mmio_base(fd, e->name);
@@ -561,7 +561,7 @@ static void dump_regs(int fd,
 		      const struct intel_execution_engine2 *e,
 		      unsigned int regs)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	const unsigned int gen_bit = 1 << gen;
 	const unsigned int engine_bit = ENGINE(e->class, e->instance);
 	const uint32_t mmio_base = gem_engine_mmio_base(fd, e->name);
@@ -674,7 +674,7 @@ static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
 	unsigned int num_values = ARRAY_SIZE(values);
 
 	/* Sigh -- hsw: we need cmdparser access to our own registers! */
-	igt_skip_on(intel_gen_from_pciid(intel_get_drm_devid(fd)) < 8);
+	igt_skip_on(intel_gfx_ver_major(fd) < 8);
 
 	gem_quiescent_gpu(fd);
 
@@ -1022,7 +1022,7 @@ int igt_main()
 		has_context_isolation = __has_context_isolation(i915);
 		igt_require(has_context_isolation);
 
-		gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+		gen = intel_gfx_ver_major(i915);
 
 		igt_warn_on_f(gen > LAST_KNOWN_GEN,
 			      "GEN not recognized! Test needs to be updated to run.\n");
diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
index 3a9ad53b7..a129bdb1e 100644
--- a/tests/intel/gem_ctx_shared.c
+++ b/tests/intel/gem_ctx_shared.c
@@ -292,7 +292,7 @@ static void exhaust_shared_gtt(int i915, unsigned int flags)
 static void exec_shared_gtt(int i915, const intel_ctx_cfg_t *cfg,
 			    unsigned int ring)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj = {};
 	struct drm_i915_gem_execbuffer2 execbuf = {
@@ -556,7 +556,7 @@ static void store_dword(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
 			uint32_t cork, uint64_t cork_size,
 			unsigned write_domain)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -683,7 +683,7 @@ static uint32_t store_timestamp(int i915,
 				int fence,
 				int offset)
 {
-	const bool r64b = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
+	const bool r64b = intel_gfx_ver_major(i915) >= 8;
 	uint32_t handle = gem_create(i915, 4096);
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = handle,
@@ -714,7 +714,7 @@ static uint32_t store_timestamp(int i915,
 		MI_BATCH_BUFFER_END
 	};
 
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 7);
+	igt_require(intel_gfx_ver_major(i915) >= 7);
 
 	gem_write(i915, handle, 0, batch, sizeof(batch));
 	obj.relocs_ptr = to_user_pointer(&reloc);
diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
index aa6420a94..9047ea51d 100644
--- a/tests/intel/gem_ctx_sseu.c
+++ b/tests/intel/gem_ctx_sseu.c
@@ -523,7 +523,7 @@ int igt_main()
 		igt_require_gem(fd);
 
 		__intel_devid__ = intel_get_drm_devid(fd);
-		__intel_gen__ = intel_gen_from_pciid(__intel_devid__);
+		__intel_gen__ = intel_gfx_ver_major(fd);
 
 		igt_require(kernel_has_per_context_sseu_support(fd));
 	}
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index ac1965565..ce3d38727 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -300,10 +300,10 @@ static igt_spin_t *__spin_poll(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 	};
 
 	if (!gem_engine_has_cmdparser(fd, &ctx->cfg, opts.engine) &&
-	    intel_gen_from_pciid(intel_get_drm_devid(fd)) != 6)
+	    intel_gfx_ver_major(fd) != 6)
 		opts.flags |= IGT_SPIN_INVALID_CS;
 
-	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) > 7)
+	if (intel_gfx_ver_major(fd) > 7)
 		opts.flags |= IGT_SPIN_FAST;
 
 	if (gem_can_store_dword(fd, opts.engine))
@@ -420,7 +420,7 @@ static void check_wait_elapsed(const char *prefix, int fd, igt_stats_t *st)
 	 * modeset back on) around resets, so may take a lot longer.
 	 */
 	limit = 250e6;
-	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) < 5 || intel_gen_from_pciid(intel_get_drm_devid(fd)) > 11)
+	if (intel_gfx_ver_major(fd) < 5 || intel_gfx_ver_major(fd) > 11)
 		limit += 300e6; /* guestimate for 2x worstcase modeset */
 
 	med = igt_stats_get_median(st);
diff --git a/tests/intel/gem_evict_alignment.c b/tests/intel/gem_evict_alignment.c
index 7bb3b64fb..0b1ce5f3d 100644
--- a/tests/intel/gem_evict_alignment.c
+++ b/tests/intel/gem_evict_alignment.c
@@ -88,7 +88,7 @@ copy(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo,
 	batch[i++] = (XY_SRC_COPY_BLT_CMD |
 		    XY_SRC_COPY_BLT_WRITE_ALPHA |
 		    XY_SRC_COPY_BLT_WRITE_RGB | 6);
-	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gfx_ver_major(fd) >= 8)
 		batch[i - 1] += 2;
 	batch[i++] = (3 << 24) | /* 32 bits */
 		  (0xcc << 16) | /* copy ROP */
@@ -96,12 +96,12 @@ copy(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo,
 	batch[i++] = 0; /* dst x1,y1 */
 	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
 	batch[i++] = 0; /* dst reloc */
-	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gfx_ver_major(fd) >= 8)
 		batch[i++] = 0; /* FIXME */
 	batch[i++] = 0; /* src x1,y1 */
 	batch[i++] = WIDTH*4;
 	batch[i++] = 0; /* src reloc */
-	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gfx_ver_major(fd) >= 8)
 		batch[i++] = 0; /* FIXME */
 	batch[i++] = MI_BATCH_BUFFER_END;
 	batch[i++] = MI_NOOP;
diff --git a/tests/intel/gem_evict_everything.c b/tests/intel/gem_evict_everything.c
index c1be9771d..b8078972b 100644
--- a/tests/intel/gem_evict_everything.c
+++ b/tests/intel/gem_evict_everything.c
@@ -132,7 +132,7 @@ copy(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	batch[i++] = (XY_SRC_COPY_BLT_CMD |
 		    XY_SRC_COPY_BLT_WRITE_ALPHA |
 		    XY_SRC_COPY_BLT_WRITE_RGB | 6);
-	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gfx_ver_major(fd) >= 8)
 		batch[i - 1] += 2;
 	batch[i++] = (3 << 24) | /* 32 bits */
 		  (0xcc << 16) | /* copy ROP */
@@ -140,12 +140,12 @@ copy(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	batch[i++] = 0; /* dst x1,y1 */
 	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
 	batch[i++] = 0; /* dst reloc */
-	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gfx_ver_major(fd) >= 8)
 		batch[i++] = 0; /* FIXME */
 	batch[i++] = 0; /* src x1,y1 */
 	batch[i++] = WIDTH*4;
 	batch[i++] = 0; /* src reloc */
-	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gfx_ver_major(fd) >= 8)
 		batch[i++] = 0; /* FIXME */
 	batch[i++] = MI_BATCH_BUFFER_END;
 	batch[i++] = MI_NOOP;
@@ -163,7 +163,7 @@ copy(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	reloc[1].target_handle = src;
 	reloc[1].delta = 0;
 	reloc[1].offset = 7 * sizeof(batch[0]);
-	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gfx_ver_major(fd) >= 8)
 		reloc[1].offset += sizeof(batch[0]);
 	reloc[1].presumed_offset = 0;
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
index 9c8071884..9a3b63768 100644
--- a/tests/intel/gem_exec_async.c
+++ b/tests/intel/gem_exec_async.c
@@ -45,7 +45,7 @@ static void store_dword(int fd, int id, const intel_ctx_t *ctx,
 			 unsigned ring, uint32_t target, uint64_t target_offset,
 			 uint32_t offset, uint32_t value)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
index 9af1ee14b..cbbefa0aa 100644
--- a/tests/intel/gem_exec_await.c
+++ b/tests/intel/gem_exec_await.c
@@ -83,7 +83,7 @@ static void wide(int fd, intel_ctx_cfg_t *cfg, int ring_size,
 {
 	const struct intel_execution_engine2 *engine;
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct {
 		struct drm_i915_gem_exec_object2 *obj;
 		struct drm_i915_gem_exec_object2 exec[2];
diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index 8c22669a7..8c9943721 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -2631,7 +2631,7 @@ static int read_ctx_timestamp_frequency(int i915)
 		.value = &value,
 		.param = I915_PARAM_CS_TIMESTAMP_FREQUENCY,
 	};
-	if (intel_gen_from_pciid(intel_get_drm_devid(i915)) != 11)
+	if (intel_gfx_ver_major(i915) != 11)
 		ioctl(i915, DRM_IOCTL_I915_GETPARAM, &gp);
 	return value;
 }
@@ -2719,7 +2719,7 @@ static void __fairslice(int i915,
 static void fairslice(int i915)
 {
 	/* Relative CS mmio */
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 11);
+	igt_require(intel_gfx_ver_major(i915) >= 11);
 
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
diff --git a/tests/intel/gem_exec_big.c b/tests/intel/gem_exec_big.c
index 126c795d4..3eb63cf2d 100644
--- a/tests/intel/gem_exec_big.c
+++ b/tests/intel/gem_exec_big.c
@@ -326,7 +326,7 @@ int igt_main()
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 
-		use_64bit_relocs = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
+		use_64bit_relocs = intel_gfx_ver_major(i915) >= 8;
 		has_relocs = gem_has_relocations(i915);
 	}
 
diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index d23d3a572..f9ed2ab63 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -302,7 +302,7 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 		       const struct intel_execution_engine2 *e,
 		       uint32_t target, uint64_t target_size, uint32_t region)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_exec_object2 obj[4];
 #define SCRATCH 0
 #define CAPTURE 1
@@ -470,7 +470,7 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 #define INCREMENTAL 0x1
 #define ASYNC 0x2
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_exec_object2 *obj;
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -652,13 +652,10 @@ static bool kernel_supports_probed_size(int fd)
 
 static bool needs_recoverable_ctx(int fd)
 {
-	uint16_t devid;
-
 	if (!kernel_supports_probed_size(fd))
 		return false;
 
-	devid = intel_get_drm_devid(fd);
-	return gem_has_lmem(fd) ||  intel_graphics_ver_from_pciid(devid) > IP_VER(12, 0);
+	return gem_has_lmem(fd) ||  intel_gfx_ver(fd) > IP_VER(12, 0);
 }
 
 #define find_first_available_engine(fd, ctx, e, saved) \
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
index b9425bca8..7b695aa0e 100644
--- a/tests/intel/gem_exec_fair.c
+++ b/tests/intel/gem_exec_fair.c
@@ -143,7 +143,7 @@ static bool has_mi_math(int i915, const struct intel_execution_engine2 *e)
 {
 	uint32_t devid = intel_get_drm_devid(i915);
 
-	if (intel_gen_from_pciid(devid) >= 8)
+	if (intel_gfx_ver_major(i915) >= 8)
 		return true;
 
 	if (!IS_HASWELL(devid))
@@ -195,7 +195,7 @@ static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
 static uint64_t ns_to_ctx_ticks(int i915, uint64_t ns)
 {
 	int f = read_timestamp_frequency(i915);
-	if (intel_gen_from_pciid(intel_get_drm_devid(i915)) == 11)
+	if (intel_gfx_ver_major(i915) == 11)
 		f = 12500000; /* gen11!!! are you feeling alright? CTX vs CS */
 	return div64_u64_round_up(ns * f, NSEC64);
 }
@@ -212,7 +212,7 @@ static void delay(int i915,
 		  uint64_t addr,
 		  uint64_t ns)
 {
-	const int use_64b = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
+	const int use_64b = intel_gfx_ver_major(i915) >= 8;
 	const uint32_t base = gem_engine_mmio_base(i915, e->name);
 	const uint32_t runtime = base + (use_64b ? 0x3a8 : 0x358);
 #define CS_GPR(x) (base + 0x600 + 8 * (x))
@@ -317,7 +317,7 @@ static void tslog(int i915,
 		  uint32_t handle,
 		  uint64_t addr)
 {
-	const int use_64b = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
+	const int use_64b = intel_gfx_ver_major(i915) >= 8;
 	const uint32_t base = gem_engine_mmio_base(i915, e->name);
 #define CS_GPR(x) (base + 0x600 + 8 * (x))
 #define CS_TIMESTAMP (base + 0x358)
@@ -441,7 +441,7 @@ read_ctx_timestamp(int i915, const intel_ctx_t *ctx,
 		.rsvd1 = ctx->id,
 		.flags = e->flags,
 	};
-	const int use_64b = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
+	const int use_64b = intel_gfx_ver_major(i915) >= 8;
 	const uint32_t base = gem_engine_mmio_base(i915, e->name);
 	const uint32_t runtime = base + (use_64b ? 0x3a8 : 0x358);
 	uint32_t *map, *cs;
@@ -489,7 +489,7 @@ read_ctx_timestamp(int i915, const intel_ctx_t *ctx,
 static bool has_ctx_timestamp(int i915, const intel_ctx_cfg_t *cfg,
 			      const struct intel_execution_engine2 *e)
 {
-	const int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const int gen = intel_gfx_ver_major(i915);
 	const intel_ctx_t *tmp_ctx;
 	uint32_t timestamp;
 
@@ -587,7 +587,7 @@ static void fair_child(int i915, const intel_ctx_t *ctx,
 	igt_assert_eq(p_fence, -1);
 
 	aux_flags = 0;
-	if (intel_gen_from_pciid(intel_get_drm_devid(i915)) < 8)
+	if (intel_gfx_ver_major(i915) < 8)
 		aux_flags = I915_EXEC_SECURE;
 	ping.flags |= aux_flags;
 	aux_flags |= e->flags;
@@ -734,7 +734,7 @@ static void fairness(int i915, const intel_ctx_cfg_t *cfg,
 	igt_require(has_ctx_timestamp(i915, cfg, e));
 	igt_require(gem_class_has_mutable_submission(i915, e->class));
 	if (flags & (F_ISOLATE | F_PING))
-		igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
+		igt_require(intel_gfx_ver_major(i915) >= 8);
 
 	igt_assert(pipe(lnk.child) == 0);
 	igt_assert(pipe(lnk.parent) == 0);
@@ -1018,7 +1018,7 @@ static void deadline_child(int i915,
 	unsigned int seq = 1;
 	int prev = -1, next = -1;
 
-	if (intel_gen_from_pciid(intel_get_drm_devid(i915)) < 8)
+	if (intel_gfx_ver_major(i915) < 8)
 		execbuf.flags |= I915_EXEC_SECURE;
 
 	gem_execbuf_wr(i915, &execbuf);
@@ -1154,7 +1154,7 @@ static void deadline(int i915, const intel_ctx_cfg_t *cfg,
 	obj[0] = delay_create(i915, delay_ctx, &pe, parent_ns);
 	if (flags & DL_PRIO)
 		gem_context_set_priority(i915, delay_ctx->id, 1023);
-	if (intel_gen_from_pciid(intel_get_drm_devid(i915)) < 8)
+	if (intel_gfx_ver_major(i915) < 8)
 		execbuf.flags |= I915_EXEC_SECURE;
 	for (int n = 1; n <= 5; n++) {
 		int timeline = sw_sync_timeline_create();
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index 19a18361a..8c4518014 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -293,7 +293,7 @@ static void test_fence_busy(int fd, const intel_ctx_t *ctx,
 static void test_fence_busy_all(int fd, const intel_ctx_t *ctx, unsigned flags)
 {
 	const struct intel_execution_engine2 *e;
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_exec_object2 obj;
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -674,7 +674,7 @@ static void test_submitN(int i915, const intel_ctx_t *ctx,
 
 	igt_require(gem_scheduler_has_semaphores(i915));
 	igt_require(gem_scheduler_has_preemption(i915));
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
+	igt_require(intel_gfx_ver_major(i915) >= 8);
 
 	for (int i = 0; i < count; i++) {
 		const intel_ctx_t *tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
@@ -721,7 +721,7 @@ static void test_parallel(int i915, const intel_ctx_t *ctx,
 			  const struct intel_execution_engine2 *e)
 {
 	const struct intel_execution_engine2 *e2;
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	uint32_t scratch = gem_create(i915, 4096);
 	uint32_t *out = gem_mmap__device_coherent(i915, scratch, 0, 4096, PROT_READ);
 	uint32_t handle[I915_EXEC_RING_MASK];
@@ -844,7 +844,7 @@ static void test_parallel(int i915, const intel_ctx_t *ctx,
 static void test_concurrent(int i915, const intel_ctx_t *ctx,
 			    const struct intel_execution_engine2 *e)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 	struct drm_i915_gem_relocation_entry reloc = {
 		.target_handle =  gem_create(i915, 4096),
@@ -2605,9 +2605,7 @@ get_cs_timestamp_frequency(int fd)
 
 static bool use_set_predicate_result(int i915)
 {
-	uint16_t devid = intel_get_drm_devid(i915);
-
-	return intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 50);
+	return intel_gfx_ver(i915) >= IP_VER(12, 50);
 }
 
 static struct drm_i915_gem_exec_object2
@@ -3289,7 +3287,7 @@ int igt_main()
 			igt_subtest_with_dynamic("submit") {
 				igt_require(gem_scheduler_has_semaphores(i915));
 				igt_require(gem_scheduler_has_preemption(i915));
-				igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
+				igt_require(intel_gfx_ver_major(i915) >= 8);
 
 				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
@@ -3302,7 +3300,7 @@ int igt_main()
 			igt_subtest_with_dynamic("submit3") {
 				igt_require(gem_scheduler_has_semaphores(i915));
 				igt_require(gem_scheduler_has_preemption(i915));
-				igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
+				igt_require(intel_gfx_ver_major(i915) >= 8);
 
 				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
@@ -3315,7 +3313,7 @@ int igt_main()
 			igt_subtest_with_dynamic("submit67") {
 				igt_require(gem_scheduler_has_semaphores(i915));
 				igt_require(gem_scheduler_has_preemption(i915));
-				igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
+				igt_require(intel_gfx_ver_major(i915) >= 8);
 
 				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
@@ -3512,7 +3510,7 @@ int igt_main()
 				 * engines which seems to be there
 				 * only on Gen8+
 				 */
-				igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
+				igt_require(intel_gfx_ver_major(i915) >= 8);
 			}
 
 			igt_describe(test_syncobj_timeline_chain_engines_desc);
diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
index cc1db3a42..87e21fc76 100644
--- a/tests/intel/gem_exec_flush.c
+++ b/tests/intel/gem_exec_flush.c
@@ -1579,7 +1579,7 @@ static uint32_t movnt(uint32_t *map, int i)
 static void run(int fd, unsigned ring, int nchild, int timeout,
 		unsigned flags)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 
 	/* The crux of this testing is whether writes by the GPU are coherent
 	 * from the CPU.
@@ -1870,7 +1870,7 @@ enum batch_mode {
 static void batch(int fd, unsigned ring, int nchild, int timeout,
 		  enum batch_mode mode, unsigned flags)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 
 	if (mode == BATCH_GTT)
 		gem_require_mappable_ggtt(fd);
diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index 68758d0ec..65ab7b646 100644
--- a/tests/intel/gem_exec_gttfill.c
+++ b/tests/intel/gem_exec_gttfill.c
@@ -141,7 +141,7 @@ static void submit(int fd, uint64_t ahnd, unsigned int gen,
 
 static void fillgtt(int fd, const intel_ctx_t *ctx, unsigned ring, int timeout)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_relocation_entry reloc[2];
 	unsigned engines[I915_EXEC_RING_MASK + 1];
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
index ffb45d4f0..a312809d2 100644
--- a/tests/intel/gem_exec_latency.c
+++ b/tests/intel/gem_exec_latency.c
@@ -140,7 +140,7 @@ static void latency_on_ring(int fd, const intel_ctx_t *ctx,
 			    const struct intel_execution_engine2 *e,
 			    unsigned flags)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	const int has_64bit_reloc = gen >= 8;
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_relocation_entry reloc;
@@ -290,7 +290,7 @@ static void latency_from_ring(int fd, const intel_ctx_t *base_ctx,
 			      const struct intel_execution_engine2 *e,
 			      unsigned flags)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	const int has_64bit_reloc = gen >= 8;
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_relocation_entry reloc;
@@ -958,7 +958,7 @@ int igt_main()
 
 	igt_subtest_group() {
 		igt_fixture()
-			igt_require(intel_gen_from_pciid(intel_get_drm_devid(device)) >= 7);
+			igt_require(intel_gfx_ver_major(device) >= 7);
 
 		test_each_engine("rthog-submit", device, ctx, e)
 			rthog_latency_on_ring(device, ctx, e);
diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
index 0c0381498..6e9aeb309 100644
--- a/tests/intel/gem_exec_nop.c
+++ b/tests/intel/gem_exec_nop.c
@@ -154,7 +154,7 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
 		      const struct intel_execution_engine2 *e,
 		      int timeout)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
 	struct drm_i915_gem_relocation_entry reloc[4], *r;
@@ -265,7 +265,7 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
 static void poll_sequential(int fd, const intel_ctx_t *ctx,
 			    const char *name, int timeout)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
diff --git a/tests/intel/gem_exec_parallel.c b/tests/intel/gem_exec_parallel.c
index 3c73c007e..752eccf73 100644
--- a/tests/intel/gem_exec_parallel.c
+++ b/tests/intel/gem_exec_parallel.c
@@ -255,7 +255,7 @@ static void handle_close(int fd, unsigned int flags, uint32_t handle, void *data
 static void all(int fd, const intel_ctx_t *ctx,
 		struct intel_execution_engine2 *engine, unsigned flags)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	unsigned engines[I915_EXEC_RING_MASK + 1], nengine;
 	uint32_t scratch[NUMOBJ], handle[NUMOBJ];
 	struct thread *threads;
diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
index faf7a7c6e..ae9abf87c 100644
--- a/tests/intel/gem_exec_params.c
+++ b/tests/intel/gem_exec_params.c
@@ -148,7 +148,7 @@ static bool has_resource_streamer(int fd)
 
 static void test_batch_first(int fd)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_relocation_entry reloc[2];
@@ -566,7 +566,7 @@ int igt_main()
 	}
 
 	igt_subtest("rel-constants-invalid-rel-gen5") {
-		igt_require(intel_gen_from_pciid(devid) > 5);
+		igt_require(intel_gfx_ver_major(fd) > 5);
 		execbuf.flags = I915_EXEC_RENDER | I915_EXEC_CONSTANTS_REL_SURFACE;
 		RUN_FAIL(EINVAL);
 	}
@@ -583,7 +583,7 @@ int igt_main()
 	}
 
 	igt_subtest("sol-reset-not-gen7") {
-		igt_require(intel_gen_from_pciid(devid) != 7);
+		igt_require(intel_gfx_ver_major(fd) != 7);
 		execbuf.flags = I915_EXEC_RENDER | I915_EXEC_GEN7_SOL_RESET;
 		RUN_FAIL(EINVAL);
 	}
@@ -632,7 +632,7 @@ int igt_main()
 	/* rsvd1 aka context id is already exercised  by gem_ctx_bad_exec */
 
 	igt_subtest("cliprects-invalid") {
-		igt_require(intel_gen_from_pciid(devid) >= 5);
+		igt_require(intel_gfx_ver_major(fd) >= 5);
 		execbuf.flags = 0;
 		execbuf.num_cliprects = 1;
 		RUN_FAIL(EINVAL);
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index 3d8ea320c..aef85a7e8 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -663,7 +663,7 @@ static void write_dword(int fd,
 			uint64_t target_offset,
 			uint32_t value)
 {
-	unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
@@ -865,7 +865,7 @@ static void check_bo(int fd, uint32_t handle)
 
 static void active(int fd, const intel_ctx_t *ctx, unsigned engine)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -944,7 +944,7 @@ static void active(int fd, const intel_ctx_t *ctx, unsigned engine)
 
 static bool has_64b_reloc(int fd)
 {
-	return intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8;
+	return intel_gfx_ver_major(fd) >= 8;
 }
 
 #define NORELOC 1
@@ -1268,7 +1268,7 @@ static void basic_softpin(int fd)
 static uint64_t concurrent_relocs(int i915, int idx, int count)
 {
 	struct drm_i915_gem_relocation_entry *reloc;
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	unsigned long sz;
 	int offset;
 
@@ -1371,7 +1371,7 @@ static void concurrent_child(int i915, const intel_ctx_t *ctx,
 
 static uint32_t create_concurrent_batch(int i915, unsigned int count)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	size_t sz = ALIGN(4 * (1 + 4 * count), 4096);
 	uint32_t handle = gem_create(i915, sz);
 	uint32_t *map, *cs;
diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index 3a0f6808c..c56b566e4 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -176,7 +176,7 @@ static uint32_t __store_dword(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 			      uint32_t cork, uint64_t cork_offset,
 			      int fence, unsigned write_domain)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -659,7 +659,7 @@ static void timeslice(int i915, const intel_ctx_cfg_t *cfg,
 	 */
 
 	igt_require(gem_scheduler_has_timeslicing(i915));
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
+	igt_require(intel_gfx_ver_major(i915) >= 8);
 
 	ctx[0] = intel_ctx_create(i915, cfg);
 	obj.handle = timeslicing_batches(i915, &offset);
@@ -761,7 +761,7 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
 	 */
 
 	igt_require(gem_scheduler_has_timeslicing(i915));
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
+	igt_require(intel_gfx_ver_major(i915) >= 8);
 
 	/* No coupling between requests; free to timeslice */
 
@@ -796,7 +796,7 @@ static void lateslice(int i915, const intel_ctx_cfg_t *cfg,
 	uint64_t ahnd[3];
 
 	igt_require(gem_scheduler_has_timeslicing(i915));
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
+	igt_require(intel_gfx_ver_major(i915) >= 8);
 
 	ctx = intel_ctx_create(i915, cfg);
 	ahnd[0] = get_reloc_ahnd(i915, ctx->id);
@@ -909,7 +909,7 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 	 */
 
 	igt_require(gem_scheduler_has_timeslicing(i915));
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
+	igt_require(intel_gfx_ver_major(i915) >= 8);
 	igt_require(gem_has_vm(i915));
 
 	engine_cfg.vm = gem_vm_create(i915);
@@ -1277,7 +1277,7 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
 static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
 			     unsigned long flags)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	const struct intel_execution_engine2 *outer, *inner;
 	const intel_ctx_t *ctx0, *ctx1;
 	uint64_t ahnd;
@@ -1371,7 +1371,7 @@ noreorder(int i915, const intel_ctx_cfg_t *cfg,
 	  unsigned int engine, int prio, unsigned int flags)
 #define CORKED 0x1
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = gem_create(i915, 4096),
@@ -2305,7 +2305,7 @@ static void wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 {
 	const unsigned int ring_size = gem_submission_measure(fd, cfg, ring);
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	const int priorities[] = { MIN_PRIO, MAX_PRIO };
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_exec_object2 obj[2];
@@ -3066,7 +3066,7 @@ static int cmp_u32(const void *A, const void *B)
 static uint32_t read_ctx_timestamp(int i915, const intel_ctx_t *ctx,
 				   const struct intel_execution_engine2 *e)
 {
-	const int use_64b = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
+	const int use_64b = intel_gfx_ver_major(i915) >= 8;
 	const uint32_t base = gem_engine_mmio_base(i915, e->name);
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_exec_object2 obj = {
@@ -3269,7 +3269,7 @@ int igt_main()
 		igt_subtest_group() {
 			igt_fixture() {
 				igt_require(gem_scheduler_has_timeslicing(fd));
-				igt_require(intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8);
+				igt_require(intel_gfx_ver_major(fd) >= 8);
 			}
 
 			test_each_engine("fairslice", fd, ctx, e)
diff --git a/tests/intel/gem_exec_store.c b/tests/intel/gem_exec_store.c
index 05ae63495..932d46323 100644
--- a/tests/intel/gem_exec_store.c
+++ b/tests/intel/gem_exec_store.c
@@ -71,7 +71,7 @@ IGT_TEST_DESCRIPTION("Exercise store dword functionality using execbuf-ioctl");
 static void store_dword(int fd, const intel_ctx_t *ctx,
 			const struct intel_execution_engine2 *e)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -152,7 +152,7 @@ static void store_cachelines(int fd, const intel_ctx_t *ctx,
 			     const struct intel_execution_engine2 *e,
 			     unsigned int flags)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_exec_object2 *obj;
 	struct drm_i915_gem_relocation_entry *reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -248,7 +248,7 @@ static void store_cachelines(int fd, const intel_ctx_t *ctx,
 
 static void store_all(int fd, const intel_ctx_t *ctx)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct intel_execution_engine2 *engine;
 	struct drm_i915_gem_relocation_entry *reloc;
diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/gem_exec_suspend.c
index 8f13019ef..d480eaead 100644
--- a/tests/intel/gem_exec_suspend.c
+++ b/tests/intel/gem_exec_suspend.c
@@ -143,7 +143,7 @@ static void test_all(int fd, const intel_ctx_t *ctx, unsigned flags, uint32_t re
 static void run_test(int fd, const intel_ctx_t *ctx,
 		     unsigned engine, unsigned flags, uint32_t region)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
index c11e272c1..84f80ff37 100644
--- a/tests/intel/gem_exec_whisper.c
+++ b/tests/intel/gem_exec_whisper.c
@@ -164,7 +164,7 @@ static void verify_reloc(int fd, uint32_t handle,
 {
 	if (VERIFY) {
 		uint64_t target = 0;
-		if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
+		if (intel_gfx_ver_major(fd) >= 8)
 			gem_read(fd, handle, reloc->offset, &target, 8);
 		else
 			gem_read(fd, handle, reloc->offset, &target, 4);
@@ -203,7 +203,7 @@ static void init_hang(struct hang *h, int fd, const intel_ctx_cfg_t *cfg)
 	h->fd = drm_reopen_driver(fd);
 	igt_allow_hang(h->fd, 0, 0);
 
-	gen = intel_gen_from_pciid(intel_get_drm_devid(h->fd));
+	gen = intel_gfx_ver_major(h->fd);
 
 	if (gem_has_contexts(fd)) {
 		h->ctx = intel_ctx_create(h->fd, cfg);
@@ -293,7 +293,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 		    unsigned engine, unsigned flags)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	const unsigned int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	struct drm_i915_gem_exec_object2 batches[QLEN];
 	struct drm_i915_gem_relocation_entry inter[QLEN];
diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
index b6df4b22b..c2c948f16 100644
--- a/tests/intel/gem_fenced_exec_thrash.c
+++ b/tests/intel/gem_fenced_exec_thrash.c
@@ -193,7 +193,6 @@ static void run_test(int fd, int num_fences, int expected_errno,
 
 int igt_main()
 {
-	uint32_t devid = 0;
 	unsigned int num_fences = 0;
 	int fd = -1;
 
@@ -204,8 +203,6 @@ int igt_main()
 		num_fences = gem_available_fences(fd);
 		igt_require(num_fences > 4);
 		igt_assert(num_fences <= MAX_FENCES);
-
-		devid = intel_get_drm_devid(fd);
 	}
 
 	igt_subtest("2-spare-fences")
@@ -217,7 +214,7 @@ int igt_main()
 			run_test(fd, num_fences, 0, flags);
 	}
 	igt_subtest("too-many-fences")
-		run_test(fd, num_fences + 1, intel_gen_from_pciid(devid) >= 4 ? 0 : ENOBUFS, 0);
+		run_test(fd, num_fences + 1, intel_gfx_ver_major(fd) >= 4 ? 0 : ENOBUFS, 0);
 
 	igt_fixture()
 		drm_close_driver(fd);
diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index bdd96eccd..88e27af49 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -211,7 +211,7 @@ int igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 		igt_require_gem(data.drm_fd);
 		data.bops = buf_ops_create(data.drm_fd);
 
-		fill_fn = igt_get_gpgpu_fillfunc(data.devid);
+		fill_fn = igt_get_gpgpu_fillfunc(data.drm_fd);
 
 		igt_require_f(fill_fn, "no gpgpu-fill function\n");
 
diff --git a/tests/intel/gem_gtt_hog.c b/tests/intel/gem_gtt_hog.c
index b92f6c29b..60a2944fb 100644
--- a/tests/intel/gem_gtt_hog.c
+++ b/tests/intel/gem_gtt_hog.c
@@ -177,7 +177,7 @@ int igt_simple_main()
 
 	data.fd = drm_open_driver(DRIVER_INTEL);
 	data.devid = intel_get_drm_devid(data.fd);
-	data.intel_gen = intel_gen_from_pciid(data.devid);
+	data.intel_gen = intel_gfx_ver_major(data.fd);
 
 	gettimeofday(&start, NULL);
 	igt_fork(child, ARRAY_SIZE(children))
diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
index 84f5dc4c0..03c3cf33a 100644
--- a/tests/intel/gem_linear_blits.c
+++ b/tests/intel/gem_linear_blits.c
@@ -87,7 +87,6 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_execbuffer2 exec;
-	static uint32_t devid;
 	int i = 0;
 
 	memset(obj, 0, sizeof(obj));
@@ -104,13 +103,11 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 	obj[2].offset = CANONICAL(obj[2].offset);
 	obj[2].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 
-	devid = intel_get_drm_devid(fd);
-
 	if (blt_has_xy_src_copy(fd)) {
 		batch[i++] = XY_SRC_COPY_BLT_CMD |
 			     XY_SRC_COPY_BLT_WRITE_ALPHA |
 			     XY_SRC_COPY_BLT_WRITE_RGB;
-		if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
+		if (intel_gfx_ver_major(fd) >= 8)
 			batch[i - 1] |= 8;
 		else
 			batch[i - 1] |= 6;
@@ -121,12 +118,12 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 		batch[i++] = 0; /* dst x1,y1 */
 		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
 		batch[i++] = obj[0].offset;
-		if (intel_gen_from_pciid(devid) >= 8)
+		if (intel_gfx_ver_major(fd) >= 8)
 			batch[i++] = obj[0].offset >> 32;
 		batch[i++] = 0; /* src x1,y1 */
 		batch[i++] = WIDTH * 4;
 		batch[i++] = obj[1].offset;
-		if (intel_gen_from_pciid(devid) >= 8)
+		if (intel_gfx_ver_major(fd) >= 8)
 			batch[i++] = obj[1].offset >> 32;
 		batch[i++] = MI_BATCH_BUFFER_END;
 		batch[i++] = MI_NOOP;
@@ -160,7 +157,7 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 	reloc[1].target_handle = src;
 	reloc[1].delta = 0;
 	reloc[1].offset = 7 * sizeof(batch[0]);
-	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gfx_ver_major(fd) >= 8)
 		reloc[1].offset += sizeof(batch[0]);
 	reloc[1].presumed_offset = obj[1].offset;
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
index 5694cf537..8df9dcb99 100644
--- a/tests/intel/gem_media_fill.c
+++ b/tests/intel/gem_media_fill.c
@@ -154,7 +154,7 @@ int igt_main()
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		data.bops = buf_ops_create(data.drm_fd);
 
-		fill_fn = igt_get_media_fillfunc(data.devid);
+		fill_fn = igt_get_media_fillfunc(data.drm_fd);
 
 		igt_require_f(fill_fn, "no media-fill function\n");
 
diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
index 89e2c836e..13829e304 100644
--- a/tests/intel/gem_media_vme.c
+++ b/tests/intel/gem_media_vme.c
@@ -133,7 +133,7 @@ int igt_simple_main()
 	igt_assert(ctx);
 
 	/* ICL hangs if non-VME enabled slices are enabled with a VME kernel. */
-	if (intel_gen_from_pciid(devid) == 11)
+	if (intel_gfx_ver_major(drm_fd) == 11)
 		shut_non_vme_subslices(drm_fd, ctx);
 
 	igt_fork_hang_detector(drm_fd);
diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c
index 8211fec85..50902c900 100644
--- a/tests/intel/gem_mmap_gtt.c
+++ b/tests/intel/gem_mmap_gtt.c
@@ -1268,7 +1268,7 @@ test_huge_bo(int fd, int huge, int tiling)
 		 * a quarter size one instead.
 		 */
 		if (tiling &&
-		    intel_gen_from_pciid(intel_get_drm_devid(fd)) < 4 &&
+		    intel_gfx_ver_major(fd) < 4 &&
 		    size >= gem_global_aperture_size(fd) / 2)
 			size /= 2;
 		break;
diff --git a/tests/intel/gem_read_read_speed.c b/tests/intel/gem_read_read_speed.c
index 4b24c03af..2568fbb78 100644
--- a/tests/intel/gem_read_read_speed.c
+++ b/tests/intel/gem_read_read_speed.c
@@ -249,13 +249,11 @@ int igt_main()
 	int fd, i;
 
 	igt_fixture() {
-		int devid;
 
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 
-		devid = intel_get_drm_devid(fd);
-		igt_require(intel_gen_from_pciid(devid) >= 6);
+		igt_require(intel_gfx_ver_major(fd) >= 6);
 
 		rendercopy = igt_get_render_copyfunc(fd);
 		igt_require(rendercopy);
diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
index 4815d43c1..33d50903c 100644
--- a/tests/intel/gem_render_copy.c
+++ b/tests/intel/gem_render_copy.c
@@ -223,7 +223,7 @@ copy_from_linear_buf(data_t *data, struct intel_buf *src, struct intel_buf *dst)
 static void *linear_copy_ccs(data_t *data, struct intel_buf *buf)
 {
 	void *ccs_data, *linear;
-	unsigned int gen = intel_gen_from_pciid(data->devid);
+	unsigned int gen = intel_gfx_ver_major(data->drm_fd);
 	int ccs_size = intel_buf_ccs_width(gen, buf) *
 		intel_buf_ccs_height(gen, buf);
 	int buf_size = intel_buf_size(buf);
@@ -362,7 +362,7 @@ scratch_buf_check_all(data_t *data,
 static void scratch_buf_ccs_check(data_t *data,
 				  struct intel_buf *buf)
 {
-	unsigned int gen = intel_gen_from_pciid(data->devid);
+	unsigned int gen = intel_gfx_ver_major(data->drm_fd);
 	int ccs_size = intel_buf_ccs_width(gen, buf) *
 		intel_buf_ccs_height(gen, buf);
 	uint8_t *linear;
@@ -460,12 +460,12 @@ static void test(data_t *data, uint32_t src_tiling, uint32_t dst_tiling,
 		   dst_compression == I915_COMPRESSION_NONE);
 
 	/* no Yf before gen9 */
-	if (intel_gen_from_pciid(data->devid) < 9)
+	if (intel_gfx_ver_major(data->drm_fd) < 9)
 		num_src--;
 
 	if (src_tiling == I915_TILING_Yf || dst_tiling == I915_TILING_Yf ||
 	    src_compressed || dst_compressed)
-		igt_require(intel_gen_from_pciid(data->devid) >= 9);
+		igt_require(intel_gfx_ver_major(data->drm_fd) >= 9);
 
 	ibb = intel_bb_create(data->drm_fd, 4096);
 
@@ -866,7 +866,7 @@ int igt_main_args("dac", NULL, help_str, opt_handler, NULL)
 		igt_require_f(data.render_copy,
 			      "no render-copy function\n");
 
-		data.vebox_copy = igt_get_vebox_copyfunc(data.devid);
+		data.vebox_copy = igt_get_vebox_copyfunc(data.drm_fd);
 
 		data.bops = buf_ops_create(data.drm_fd);
 
diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
index f99951732..81bb0fbf4 100644
--- a/tests/intel/gem_ringfill.c
+++ b/tests/intel/gem_ringfill.c
@@ -207,7 +207,7 @@ static void setup_execbuf(int fd, const intel_ctx_t *ctx,
 			  struct drm_i915_gem_relocation_entry *reloc,
 			  unsigned int ring)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *batch, *b;
 	int i;
@@ -428,7 +428,7 @@ int igt_main()
 		igt_require_gem(fd);
 		igt_require(has_lut_handle(fd));
 
-		gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+		gen = intel_gfx_ver_major(fd);
 		if (gen > 3 && gen < 6) { /* ctg and ilk need secure batches */
 			igt_device_set_master(fd);
 			master = true;
diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
index a9aa86ecd..4b00b2bfb 100644
--- a/tests/intel/gem_set_tiling_vs_blt.c
+++ b/tests/intel/gem_set_tiling_vs_blt.c
@@ -164,7 +164,7 @@ static void do_test(struct buf_ops *bops, uint32_t tiling, unsigned stride,
 
 	blt_stride = stride;
 	blt_bits = 0;
-	if (intel_gen_from_pciid(ibb->devid) >= 4 && tiling != I915_TILING_NONE) {
+	if (intel_gfx_ver_major(fd) >= 4 && tiling != I915_TILING_NONE) {
 		blt_stride /= 4;
 		blt_bits = XY_SRC_COPY_BLT_SRC_TILED;
 	}
diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
index c736ba389..b19539aa1 100644
--- a/tests/intel/gem_softpin.c
+++ b/tests/intel/gem_softpin.c
@@ -504,7 +504,7 @@ static void test_reverse(int i915)
 
 static uint64_t busy_batch(int fd)
 {
-	unsigned const int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	unsigned const int gen = intel_gfx_ver_major(fd);
 	const int has_64bit_reloc = gen >= 8;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 object[2];
@@ -692,7 +692,7 @@ static void xchg_offset(void *array, unsigned i, unsigned j)
 enum sleep { NOSLEEP, SUSPEND, HIBERNATE };
 static void test_noreloc(int fd, enum sleep sleep, unsigned flags)
 {
-	unsigned const int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	unsigned const int gen = intel_gfx_ver_major(fd);
 	const uint32_t size = 4096;
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -1021,7 +1021,7 @@ static void submit(int fd, unsigned int gen,
 static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
 				 unsigned ring, int timeout)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_execbuffer2 execbuf;
 	unsigned engines[I915_EXEC_RING_MASK + 1];
 	volatile uint64_t *shared;
diff --git a/tests/intel/gem_streaming_writes.c b/tests/intel/gem_streaming_writes.c
index b52dd53e6..598773a84 100644
--- a/tests/intel/gem_streaming_writes.c
+++ b/tests/intel/gem_streaming_writes.c
@@ -94,7 +94,7 @@ IGT_TEST_DESCRIPTION("Test of streaming writes into active GPU sources");
 
 static void test_streaming(int fd, int mode, int sync)
 {
-	const bool has_64bit_addr = intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8;
+	const bool has_64bit_addr = intel_gfx_ver_major(fd) >= 8;
 	const bool do_relocs = gem_has_relocations(fd);
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 exec[3];
@@ -274,7 +274,7 @@ static void test_streaming(int fd, int mode, int sync)
 
 static void test_batch(int fd, int mode, int reverse)
 {
-	const bool has_64bit_addr = intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8;
+	const bool has_64bit_addr = intel_gfx_ver_major(fd) >= 8;
 	const bool do_relocs = gem_has_relocations(fd);
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 exec[3];
diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index e41fcae6b..0767198de 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -697,7 +697,7 @@ static void
 store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 	   int num_children, int timeout)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct intel_engine_data ied;
 	bool has_relocs = gem_has_relocations(fd);
 
@@ -797,7 +797,7 @@ static void
 switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 	    int num_children, int timeout)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct intel_engine_data ied;
 	bool has_relocs = gem_has_relocations(fd);
 
@@ -981,7 +981,7 @@ static void
 __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
 	     int timeout, unsigned long *cycles)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 object[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -1191,7 +1191,7 @@ sync_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
 static void
 store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct intel_engine_data ied;
 	bool has_relocs = gem_has_relocations(fd);
 
diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
index bc2064ece..dc926bbd4 100644
--- a/tests/intel/gem_tiled_fence_blits.c
+++ b/tests/intel/gem_tiled_fence_blits.c
@@ -112,7 +112,7 @@ update_batch(int fd, uint32_t bb_handle,
 	     struct drm_i915_gem_relocation_entry *reloc,
 	     uint64_t dst_offset, uint64_t src_offset)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	const bool has_64b_reloc = gen >= 8;
 	uint32_t *batch;
 	uint32_t pitch;
@@ -202,7 +202,7 @@ static void run_test(int fd, int count, uint64_t end)
 	memset(&eb, 0, sizeof(eb));
 	eb.buffers_ptr = to_user_pointer(obj);
 	eb.buffer_count = ARRAY_SIZE(obj);
-	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 6)
+	if (intel_gfx_ver_major(fd) >= 6)
 		eb.flags = I915_EXEC_BLT;
 
 	bo = calloc(count,
diff --git a/tests/intel/gem_tiling_max_stride.c b/tests/intel/gem_tiling_max_stride.c
index 37b919c62..ed4dfb804 100644
--- a/tests/intel/gem_tiling_max_stride.c
+++ b/tests/intel/gem_tiling_max_stride.c
@@ -86,13 +86,13 @@ int igt_simple_main()
 	devid = intel_get_drm_devid(fd);
 	gem_require_mappable_ggtt(fd);
 
-	if (intel_gen_from_pciid(devid) >= 7) {
+	if (intel_gfx_ver_major(fd) >= 7) {
 		stride = 256 * 1024;
-	} else if (intel_gen_from_pciid(devid) >= 4) {
+	} else if (intel_gfx_ver_major(fd) >= 4) {
 		stride = 128 * 1024;
-	} else if (intel_gen_from_pciid(devid) >= 3) {
+	} else if (intel_gfx_ver_major(fd) >= 3) {
 		stride = 8 * 1024;
-	} else if (intel_gen_from_pciid(devid) >= 2) {
+	} else if (intel_gfx_ver_major(fd) >= 2) {
 		tile_width = 128;
 		tile_height = 16;
 		stride = 8 * 1024;
diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
index da5332b07..19416b10c 100644
--- a/tests/intel/gem_userptr_blits.c
+++ b/tests/intel/gem_userptr_blits.c
@@ -219,7 +219,6 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_execbuffer2 exec;
-	static uint32_t devid;
 	uint32_t handle;
 	int ret, i=0;
 	uint64_t dst_offset, src_offset, bb_offset;
@@ -229,14 +228,12 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 	dst_offset = bb_offset + 4096;
 	src_offset = dst_offset + WIDTH * HEIGHT * sizeof(uint32_t) * (src != dst);
 
-	devid = intel_get_drm_devid(fd);
-
 	if (blt_has_xy_src_copy(fd)) {
 		batch[i++] = XY_SRC_COPY_BLT_CMD |
 			     XY_SRC_COPY_BLT_WRITE_ALPHA |
 			     XY_SRC_COPY_BLT_WRITE_RGB;
 
-		if (intel_gen_from_pciid(devid) >= 8)
+		if (intel_gfx_ver_major(fd) >= 8)
 			batch[i - 1] |= 8;
 		else
 			batch[i - 1] |= 6;
@@ -247,12 +244,12 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 		batch[i++] = 0; /* dst x1,y1 */
 		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
 		batch[i++] = lower_32_bits(dst_offset); /* dst reloc*/
-		if (intel_gen_from_pciid(devid) >= 8)
+		if (intel_gfx_ver_major(fd) >= 8)
 			batch[i++] = upper_32_bits(CANONICAL(dst_offset));
 		batch[i++] = 0; /* src x1,y1 */
 		batch[i++] = WIDTH * 4;
 		batch[i++] = lower_32_bits(src_offset); /* src reloc */
-		if (intel_gen_from_pciid(devid) >= 8)
+		if (intel_gfx_ver_major(fd) >= 8)
 			batch[i++] = upper_32_bits(CANONICAL(src_offset));
 		batch[i++] = MI_BATCH_BUFFER_END;
 		batch[i++] = MI_NOOP;
@@ -286,7 +283,7 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 	reloc[1].target_handle = src;
 	reloc[1].delta = 0;
 	reloc[1].offset = 7 * sizeof(batch[0]);
-	if (intel_gen_from_pciid(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gfx_ver_major(fd) >= 8)
 		reloc[1].offset += sizeof(batch[0]);
 	reloc[1].presumed_offset = 0;
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
@@ -345,7 +342,6 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 *obj;
 	struct drm_i915_gem_execbuffer2 exec;
-	uint32_t devid;
 	uint32_t handle;
 	int n, ret, i=0;
 	uint64_t src_offset, dst_offset;
@@ -355,7 +351,6 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	src_offset = src * size;
 	dst_offset = dst * size;
 
-	devid = intel_get_drm_devid(fd);
 	handle = gem_create(fd, 4096);
 	memset(&exec, 0, sizeof(exec));
 	obj = calloc(n_bo + 1, sizeof(*obj));
@@ -389,7 +384,7 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	reloc[1].target_handle = src;
 	reloc[1].delta = 0;
 	reloc[1].offset = 7 * sizeof(batch[0]);
-	if (intel_gen_from_pciid(devid) >= 8)
+	if (intel_gfx_ver_major(fd) >= 8)
 		reloc[1].offset += sizeof(batch[0]);
 	reloc[1].presumed_offset = src_offset;
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
@@ -399,7 +394,7 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 		batch[i++] = XY_SRC_COPY_BLT_CMD |
 			     XY_SRC_COPY_BLT_WRITE_ALPHA |
 			     XY_SRC_COPY_BLT_WRITE_RGB;
-		if (intel_gen_from_pciid(devid) >= 8)
+		if (intel_gfx_ver_major(fd) >= 8)
 			batch[i - 1] |= 8;
 		else
 			batch[i - 1] |= 6;
@@ -409,12 +404,12 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 		batch[i++] = 0; /* dst x1,y1 */
 		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
 		batch[i++] = lower_32_bits(dst_offset);
-		if (intel_gen_from_pciid(devid) >= 8)
+		if (intel_gfx_ver_major(fd) >= 8)
 			batch[i++] = upper_32_bits(CANONICAL(dst_offset));
 		batch[i++] = 0; /* src x1,y1 */
 		batch[i++] = WIDTH * 4;
 		batch[i++] = lower_32_bits(src_offset);
-		if (intel_gen_from_pciid(devid) >= 8)
+		if (intel_gfx_ver_major(fd) >= 8)
 			batch[i++] = upper_32_bits(CANONICAL(src_offset));
 		batch[i++] = MI_BATCH_BUFFER_END;
 		batch[i++] = MI_NOOP;
@@ -452,7 +447,7 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 static void store_dword(int fd, uint32_t target,
 			uint32_t offset, uint32_t value)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -1420,7 +1415,7 @@ static void store_dword_rand(int i915, const intel_ctx_t *ctx,
 			     uint32_t target, uint64_t sz,
 			     int count)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	struct drm_i915_gem_relocation_entry *reloc;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_execbuffer2 exec;
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index 893c4a415..7db80de18 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -279,7 +279,7 @@ static void execbuf(int i915)
 static void
 write_to_address(int fd, uint32_t ctx, uint64_t addr, uint32_t value)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_gfx_ver_major(fd);
 	struct drm_i915_gem_exec_object2 batch = {
 		.handle = gem_create(fd, 4096)
 	};
diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
index 601d44881..e2d58ff24 100644
--- a/tests/intel/gem_watchdog.c
+++ b/tests/intel/gem_watchdog.c
@@ -333,7 +333,7 @@ static void delay(int i915,
 		  uint64_t addr,
 		  uint64_t ns)
 {
-	const int use_64b = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
+	const int use_64b = intel_gfx_ver_major(i915) >= 8;
 	const uint32_t base = gem_engine_mmio_base(i915, e->name);
 #define CS_GPR(x) (base + 0x600 + 8 * (x))
 #define RUNTIME (base + 0x3a8)
@@ -467,7 +467,7 @@ far_delay(int i915, unsigned long delay, unsigned int target,
 	uint32_t handle = gem_create(i915, 4096);
 	unsigned long count, submit;
 
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8);
+	igt_require(intel_gfx_ver_major(i915) >= 8);
 	igt_require(gem_class_can_store_dword(i915, e->class));
 
 	fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) | O_NONBLOCK);
diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index 34a4d6fc1..3efc5edb1 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -312,7 +312,7 @@ int igt_main()
 
 		intel_mmio_use_pci_bar(&mmio_data, igt_device_get_pci_device(device));
 
-		gen = intel_gen_from_pciid(intel_get_drm_devid(device));
+		gen = intel_gfx_ver_major(device);
 
 		fd = igt_debugfs_open(device, "i915_wa_registers", O_RDONLY);
 		file = fdopen(fd, "r");
diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
index f7df9dab5..595deeafd 100644
--- a/tests/intel/gen7_exec_parse.c
+++ b/tests/intel/gen7_exec_parse.c
@@ -499,7 +499,7 @@ int igt_main()
 		handle = gem_create(fd, 4096);
 
 		/* ATM cmd parser only exists on gen7. */
-		igt_require(intel_gen_from_pciid(intel_get_drm_devid(fd)) == 7);
+		igt_require(intel_gfx_ver_major(fd) == 7);
 		igt_fork_hang_detector(fd);
 	}
 
diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
index 2a5e1bae7..7d47a9f09 100644
--- a/tests/intel/gen9_exec_parse.c
+++ b/tests/intel/gen9_exec_parse.c
@@ -1217,7 +1217,7 @@ int igt_main()
 		gem_require_blitter(i915);
 
 		igt_require(gem_cmdparser_version(i915) >= 10);
-		igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) == 9);
+		igt_require(intel_gfx_ver_major(i915) == 9);
 
 		handle = gem_create(i915, HANDLE_SIZE);
 
diff --git a/tests/intel/i915_getparams_basic.c b/tests/intel/i915_getparams_basic.c
index 742dfd71c..2f1186bfc 100644
--- a/tests/intel/i915_getparams_basic.c
+++ b/tests/intel/i915_getparams_basic.c
@@ -89,7 +89,7 @@ subslice_total(void)
 	int ret;
 
 	ret = getparam(I915_PARAM_SUBSLICE_TOTAL, (int*)&subslice_total);
-	igt_skip_on_f(ret == -EINVAL && intel_gen_from_pciid(devid),
+	igt_skip_on_f(ret == -EINVAL && intel_gfx_ver_major(drm_fd),
 		      "Interface not supported by kernel\n");
 
 	if (ret) {
@@ -97,7 +97,7 @@ subslice_total(void)
 		 * These devices are not required to implement the
 		 * interface. If they do not, -ENODEV must be returned.
 		*/
-		if ((intel_gen_from_pciid(devid) < 8) ||
+		if ((intel_gfx_ver_major(drm_fd) < 8) ||
 		    IS_BROADWELL(devid) ||
 		    igt_run_in_simulation()) {
 			igt_assert_eq(ret, -ENODEV);
@@ -134,7 +134,7 @@ eu_total(void)
 		 * These devices are not required to implement the
 		 * interface. If they do not, -ENODEV must be returned.
 		*/
-		if ((intel_gen_from_pciid(devid) < 8) ||
+		if ((intel_gfx_ver_major(drm_fd) < 8) ||
 		    IS_BROADWELL(devid) ||
 		    igt_run_in_simulation()) {
 			igt_assert_eq(ret, -ENODEV);
diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index f9b9e24cc..03c6a704d 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -77,7 +77,7 @@ IGT_TEST_DESCRIPTION("Tests the i915 module loading.");
 
 static void store_all(int i915)
 {
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	uint32_t engines[I915_EXEC_RING_MASK + 1];
 	uint32_t batch[16];
 	uint64_t ahnd, offset, bb_offset;
diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index 3563c4615..846045116 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -311,7 +311,7 @@ static void restore_freq(int sig)
 static void bg_load(int i915, const intel_ctx_t *ctx, uint64_t engine_flags,
 		    unsigned int flags, unsigned long *ctl, unsigned int gt)
 {
-	const bool has_execlists = intel_gen_from_pciid(intel_get_drm_devid(i915)) >= 8;
+	const bool has_execlists = intel_gfx_ver_major(i915) >= 8;
 	struct sigaction act = {
 		.sa_handler = sighandler
 	};
@@ -392,7 +392,7 @@ static void rc6_idle(int i915, const intel_ctx_t *ctx, uint64_t flags, unsigned
 {
 	const int64_t duration_ns = 2 * SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
 	const int tolerance = 20; /* Some RC6 is better than none! */
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	struct {
 		const char *name;
 		unsigned int flags;
@@ -500,7 +500,7 @@ static void rc6_fence(int i915, unsigned int gt)
 {
 	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
 	const int tolerance = 20; /* Some RC6 is better than none! */
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
 	struct power_sample sample[2];
diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index ef4cc7041..3af6a0c21 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -736,7 +736,7 @@ static void debugfs_forcewake_user_subtest(void)
 {
 	int fd, rc;
 
-	igt_require(intel_gen_from_pciid(ms_data.devid) >= 6);
+	igt_require(intel_gfx_ver_major(drm_fd) >= 6);
 
 	disable_all_screens_and_wait(&ms_data);
 
diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
index 4f12ed11f..32cc8f8f8 100644
--- a/tests/intel/i915_pm_sseu.c
+++ b/tests/intel/i915_pm_sseu.c
@@ -300,7 +300,7 @@ gem_init(void)
 	gem.init = 1;
 
 	gem.devid = intel_get_drm_devid(gem.drm_fd);
-	gem.gen = intel_gen_from_pciid(gem.devid);
+	gem.gen = intel_gfx_ver_major(gem.drm_fd);
 	igt_require_f(gem.gen >= 8,
 		      "SSEU power gating only relevant for Gen8+");
 
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index bed7a5b2b..19b593d4d 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -565,7 +565,7 @@ static void access_flat_ccs_surface(struct igt_fb *fb, bool verify_compression)
 	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 	uint8_t uc_mocs = intel_get_uc_mocs_index(fb->fd);
 	uint8_t comp_pat_index = intel_get_pat_idx_wt(fb->fd);
-	uint32_t region = (intel_gen_from_pciid(intel_get_drm_devid(fb->fd)) >= 20 &&
+	uint32_t region = (intel_gfx_ver_major(fb->fd) >= 20 &&
 			   xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
 
 	struct drm_xe_engine_class_instance inst = {
@@ -645,7 +645,7 @@ static void fill_fb_random(int drm_fd, igt_fb_t *fb)
 	igt_assert_eq(0, gem_munmap(map, fb->size));
 
 	/* randomize also ccs surface on Xe2 */
-	if (intel_gen_from_pciid(intel_get_drm_devid(drm_fd)) >= 20)
+	if (intel_gfx_ver_major(drm_fd) >= 20)
 		access_flat_ccs_surface(fb, false);
 }
 
@@ -1127,11 +1127,6 @@ static bool valid_modifier_test(u64 modifier, const enum test_flags flags)
 static void test_output(data_t *data, const int testnum)
 {
 	igt_crtc_t *crtc;
-	uint16_t dev_id;
-
-	igt_fixture()
-		dev_id = intel_get_drm_devid(data->drm_fd);
-
 	data->flags = tests[testnum].flags;
 
 	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
@@ -1145,10 +1140,10 @@ static void test_output(data_t *data, const int testnum)
 		igt_subtest_with_dynamic_f("%s-%s", tests[testnum].testname, ccs_modifiers[i].str) {
 			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
 			    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
-				igt_require_f(intel_gen_from_pciid(dev_id) >= 20,
+				igt_require_f(intel_gfx_ver_major(data->drm_fd) >= 20,
 					      "Xe2 platform needed.\n");
 			} else {
-				igt_require_f(intel_gen_from_pciid(dev_id) < 20,
+				igt_require_f(intel_gfx_ver_major(data->drm_fd) < 20,
 					      "Older than Xe2 platform needed.\n");
 			}
 
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index ecabb2e8f..4192f0cc1 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -179,7 +179,7 @@ static bool fbc_wait_until_update(struct drm_info *drm)
 	 * For older GENs FBC is still expected to be disabled as it still
 	 * relies on a tiled and fenceable framebuffer to track modifications.
 	 */
-	if (intel_gen_from_pciid(intel_get_drm_devid(drm->fd)) >= 9) {
+	if (intel_gfx_ver_major(drm->fd) >= 9) {
 		if (!fbc_wait_until_enabled(drm->debugfs_fd))
 			return false;
 		/*
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index bd3bc84e5..77395b5ab 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -32,6 +32,7 @@
  * Mega feature: General Display Features
  */
 
+#include <stdint.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
@@ -3052,18 +3053,20 @@ static void format_draw_subtest(const struct test_mode *t)
 
 static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
 {
+	uint16_t ip_ver_major;
 	if (!(feature_flags & FEATURE_FBC))
 		return true;
 
+	ip_ver_major = intel_gfx_ver_major(drm.fd);
 	switch (tiling) {
 	case TILING_LINEAR:
-		return intel_gen_from_pciid(drm.devid) >= 9;
+		return ip_ver_major >= 9;
 	case TILING_X:
-		return (intel_get_device_info(drm.devid)->display_ver > 29) ? false : true;
+		return (intel_get_device_info(drm.devid)->display_ver) ? false : true;
 	case TILING_Y:
 		return true;
 	case TILING_4:
-		return intel_gen_from_pciid(drm.devid) >= 12;
+		return ip_ver_major >= 12;
 	default:
 		igt_assert(false);
 		return false;
@@ -4469,7 +4472,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 					igt_require(igt_draw_supports_method(drm.fd, t.method));
 
 					if (t.tiling == TILING_Y) {
-						igt_require(intel_gen_from_pciid(drm.devid) >= 9);
+						igt_require(intel_gfx_ver_major(drm.fd) >= 9);
 						igt_require(!intel_get_device_info(drm.devid)->has_4tile);
 					}
 
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 8ab8f609e..cb026b201 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -230,7 +230,7 @@ static void fill_gpu(struct gpu_context *context,
 
 	pthread_mutex_lock(&data->gpu_fill_lock);
 
-	fill_fn = igt_get_gpgpu_fillfunc(data->devid);
+	fill_fn = igt_get_gpgpu_fillfunc(data->drm_fd);
 
 	igt_assert(fill_fn);
 	igt_assert(context->buf);
@@ -818,7 +818,7 @@ static void prepare_test(struct data *data)
 
 	create_framebuffers(data);
 
-	if (intel_gen_from_pciid(intel_get_drm_devid(data->drm_fd)) > 9)
+	if (intel_gfx_ver_major(data->drm_fd) > 9)
 		start_gpu_threads(data);
 }
 
@@ -826,7 +826,7 @@ static void finish_test(struct data *data)
 {
 	int i;
 
-	if (intel_gen_from_pciid(intel_get_drm_devid(data->drm_fd)) > 9)
+	if (intel_gfx_ver_major(data->drm_fd) > 9)
 		stop_gpu_threads(data);
 
 	/*
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index c1e1978ce..a96f8aec3 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -45,6 +45,7 @@
 #include "igt_perf.h"
 #include "igt_sysfs.h"
 #include "drm.h"
+#include "intel_chipset.h"
 /**
  * TEST: perf
  * Description: Test the i915 perf metrics streaming interface
@@ -400,6 +401,7 @@ static int sysfs = -1;
 static int pm_fd = -1;
 static int stream_fd = -1;
 static uint32_t devid;
+static uint16_t gfx_ver_major;
 static struct intel_execution_engine2 default_e2;
 static struct perf_engine_group *perf_oa_groups;
 static uint32_t num_perf_oa_groups;
@@ -720,7 +722,7 @@ oa_timestamp_delta(const uint32_t *report1,
 		   const uint32_t *report0,
 		   enum drm_i915_oa_format format)
 {
-	uint32_t width = intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 55) ? 56 : 32;
+	uint32_t width = intel_gfx_ver(drm_fd) >= IP_VER(12, 55) ? 56 : 32;
 
 	return elapsed_delta(oa_timestamp(report1, format),
 			     oa_timestamp(report0, format), width);
@@ -801,7 +803,7 @@ oa_report_ctx_is_valid(uint32_t *report)
 		return false; /* TODO */
 	} else if (IS_GEN8(devid)) {
 		return report[0] & (1ul << 25);
-	} else if (intel_gen_from_pciid(devid) >= 9) {
+	} else if (gfx_ver_major >= 9) {
 		return report[0] & (1ul << 16);
 	}
 
@@ -1045,7 +1047,7 @@ accumulate_reports(struct accumulator *accumulator,
 	uint64_t *deltas = accumulator->deltas;
 	int idx = 0;
 
-	if (intel_gen_from_pciid(devid) >= 8) {
+	if (gfx_ver_major >= 8) {
 		/* timestamp */
 		deltas[idx] += oa_timestamp_delta(end, start, accumulator->format);
 		idx++;
@@ -1092,7 +1094,7 @@ accumulator_print(struct accumulator *accumulator, const char *title)
 	int idx = 0;
 
 	igt_debug("%s:\n", title);
-	if (intel_gen_from_pciid(devid) >= 8) {
+	if (gfx_ver_major >= 8) {
 		igt_debug("\ttime delta = %"PRIu64"\n", deltas[idx++]);
 		igt_debug("\tclock cycle delta = %"PRIu64"\n", deltas[idx++]);
 
@@ -1731,7 +1733,7 @@ print_reports(uint32_t *oa_report0, uint32_t *oa_report1, int fmt)
 			  clock0, clock1, clock1 - clock0);
 	}
 
-	if (intel_gen_from_pciid(devid) >= 8) {
+	if (gfx_ver_major >= 8) {
 		uint32_t slice_freq0, slice_freq1, unslice_freq0, unslice_freq1;
 		const char *reason0 = gen8_read_report_reason(oa_report0);
 		const char *reason1 = gen8_read_report_reason(oa_report1);
@@ -1834,7 +1836,7 @@ print_report(uint32_t *report, int fmt)
 		igt_debug("CLOCK: %"PRIu64"\n", clock);
 	}
 
-	if (intel_gen_from_pciid(devid) >= 8) {
+	if (gfx_ver_major >= 8) {
 		uint32_t slice_freq, unslice_freq;
 		const char *reason = gen8_read_report_reason(report);
 
@@ -2019,7 +2021,7 @@ static void load_helper_init(void)
 	/* MI_STORE_DATA can only use GTT address on gen4+/g33 and needs
 	 * snoopable mem on pre-gen6. Hence load-helper only works on gen6+, but
 	 * that's also all we care about for the rps testcase*/
-	igt_assert(intel_gen_from_pciid(lh.devid) >= 6);
+	igt_assert(intel_gfx_ver_major(drm_fd) >= 6);
 
 	lh.bops = buf_ops_create(drm_fd);
 
@@ -2487,7 +2489,7 @@ test_blocking(uint64_t requested_oa_period,
 		 * periodic sampling and we don't want these extra reads to
 		 * cause the test to fail...
 		 */
-		if (intel_gen_from_pciid(devid) >= 8) {
+		if (gfx_ver_major >= 8) {
 			for (int offset = 0; offset < ret; offset += header->size) {
 				header = (void *)(buf + offset);
 
@@ -2672,7 +2674,7 @@ test_polling(uint64_t requested_oa_period,
 		 * periodic sampling and we don't want these extra reads to
 		 * cause the test to fail...
 		 */
-		if (intel_gen_from_pciid(devid) >= 8) {
+		if (gfx_ver_major >= 8) {
 			for (int offset = 0; offset < ret; offset += header->size) {
 				header = (void *)(buf + offset);
 
@@ -3659,7 +3661,7 @@ emit_stall_timestamp_and_rpc(struct intel_bb *ibb,
 
 	intel_bb_add_intel_buf(ibb, dst, true);
 
-	if (intel_gen_from_pciid(devid) >= 8)
+	if (gfx_ver_major >= 8)
 		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(6));
 	else
 		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(5));
@@ -4809,7 +4811,7 @@ make_valid_reduced_sseu_config(struct drm_i915_gem_context_param_sseu default_ss
 {
 	struct drm_i915_gem_context_param_sseu sseu = default_sseu;
 
-	if (intel_gen_from_pciid(devid) == 11) {
+	if (gfx_ver_major == 11) {
 		/*
 		 * On Gen11 there are restrictions on what subslices
 		 * can be disabled, notably we're not able to enable
@@ -5173,7 +5175,7 @@ test_create_destroy_userspace_config(void)
 	config.mux_regs_ptr = to_user_pointer(mux_regs);
 
 	/* Flex EU counters are only available on gen8+ */
-	if (intel_gen_from_pciid(devid) >= 8) {
+	if (gfx_ver_major >= 8) {
 		for (i = 0; i < ARRAY_SIZE(flex_regs) / 2; i++) {
 			flex_regs[i * 2] = 0xe458; /* EU_PERF_CNTL0 */
 			flex_regs[i * 2 + 1] = 0x0;
@@ -5252,7 +5254,7 @@ test_whitelisted_registers_userspace_config(void)
 	memset(&config, 0, sizeof(config));
 	memcpy(config.uuid, uuid, sizeof(config.uuid));
 
-	if (intel_gen_from_pciid(devid) >= 12) {
+	if (gfx_ver_major >= 12) {
 		oa_start_trig1 = 0xd900;
 		oa_start_trig8 = 0xd91c;
 		oa_report_trig1 = 0xd920;
@@ -5278,7 +5280,7 @@ test_whitelisted_registers_userspace_config(void)
 	}
 	config.boolean_regs_ptr = (uintptr_t) b_counters_regs;
 
-	if (intel_gen_from_pciid(devid) >= 8) {
+	if (gfx_ver_major >= 8) {
 		/* Flex EU registers, only from Gen8+. */
 		for (i = 0; i < ARRAY_SIZE(flex); i++) {
 			flex_regs[config.n_flex_regs * 2] = flex[i];
@@ -5306,7 +5308,7 @@ test_whitelisted_registers_userspace_config(void)
 		mux_regs[i++] = 0;
 	}
 
-	if (intel_gen_from_pciid(devid) >= 8 && !IS_CHERRYVIEW(devid)) {
+	if (gfx_ver_major >= 8 && !IS_CHERRYVIEW(devid)) {
 		/* NOA_CONFIG */
 		mux_regs[i++] = 0xD04;
 		mux_regs[i++] = 0;
@@ -5327,7 +5329,7 @@ test_whitelisted_registers_userspace_config(void)
 		mux_regs[i++] = 0;
 	}
 
-	if (intel_gen_from_pciid(devid) <= 11) {
+	if (gfx_ver_major <= 11) {
 		/* HALF_SLICE_CHICKEN2 (shared with kernel workaround) */
 		mux_regs[i++] = 0xE180;
 		mux_regs[i++] = 0;
@@ -5426,6 +5428,7 @@ test_i915_ref_count(void)
 	drm_fd = __drm_open_driver(DRIVER_INTEL);
 	igt_require_i915(drm_fd);
 	devid = intel_get_drm_devid(drm_fd);
+	gfx_ver_major = intel_gfx_ver_major(drm_fd);
 	sysfs = perf_sysfs_open(drm_fd);
 
 	/* Note: these global variables are only initialized after calling
@@ -5951,7 +5954,7 @@ int igt_main()
 	igt_describe("Test that reason field in OA reports is never 0 on Gen8+");
 	igt_subtest_with_dynamic("non-zero-reason") {
 		/* Reason field is only available on Gen8+ */
-		igt_require(intel_gen_from_pciid(devid) >= 8);
+		igt_require(gfx_ver_major >= 8);
 		__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 			test_non_zero_reason(e);
 	}
@@ -6029,7 +6032,7 @@ int igt_main()
 		test_short_reads();
 
 	igt_subtest("mi-rpc") {
-		igt_require(intel_gen_from_pciid(devid) < 12);
+		igt_require(gfx_ver_major < 12);
 		test_mi_rpc();
 	}
 
@@ -6048,7 +6051,7 @@ int igt_main()
 		 *
 		 * For gen12 implement a separate test that uses only OAR
 		 */
-		igt_require(intel_gen_from_pciid(devid) >= 8 && intel_gen_from_pciid(devid) < 12);
+		igt_require(gfx_ver_major >= 8 && gfx_ver_major < 12);
 		igt_require_f(render_copy, "no render-copy function\n");
 		gen8_test_single_ctx_render_target_writes_a_counter();
 	}
@@ -6056,7 +6059,7 @@ int igt_main()
 	igt_subtest_group() {
 		igt_describe("Test MI REPORT PERF COUNT for Gen 12");
 		igt_subtest_with_dynamic("gen12-mi-rpc") {
-			igt_require(intel_gen_from_pciid(devid) >= 12);
+			igt_require(gfx_ver_major >= 12);
 			igt_require(has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0));
 			__for_each_render_engine(drm_fd, e)
 				gen12_test_mi_rpc(e);
@@ -6064,14 +6067,14 @@ int igt_main()
 
 		igt_describe("Test OA TLB invalidate");
 		igt_subtest_with_dynamic("gen12-oa-tlb-invalidate") {
-			igt_require(intel_gen_from_pciid(devid) >= 12);
+			igt_require(gfx_ver_major >= 12);
 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				gen12_test_oa_tlb_invalidate(e);
 		}
 
 		igt_describe("Measure performance for a specific context using OAR in Gen 12");
 		igt_subtest_with_dynamic("gen12-unprivileged-single-ctx-counters") {
-			igt_require(intel_gen_from_pciid(devid) >= 12);
+			igt_require(gfx_ver_major >= 12);
 			igt_require(has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0));
 			igt_require_f(render_copy, "no render-copy function\n");
 			__for_each_render_engine(drm_fd, e)
@@ -6092,13 +6095,13 @@ int igt_main()
 		 */
 		igt_describe("Verify exclusivity of perf streams with sample oa option");
 		igt_subtest("gen12-group-exclusive-stream-sample-oa") {
-			igt_require(intel_gen_from_pciid(devid) >= 12);
+			igt_require(gfx_ver_major >= 12);
 			test_group_exclusive_stream(ctx, true);
 		}
 
 		igt_describe("Verify exclusivity of perf streams with ctx handle");
 		igt_subtest("gen12-group-exclusive-stream-ctx-handle") {
-			igt_require(intel_gen_from_pciid(devid) >= 12);
+			igt_require(gfx_ver_major >= 12);
 			test_group_exclusive_stream(ctx, false);
 		}
 
@@ -6121,7 +6124,7 @@ int igt_main()
 		igt_describe("Verify invalid SSEU opening parameters");
 		igt_subtest_with_dynamic("global-sseu-config-invalid") {
 			igt_require(i915_perf_revision(drm_fd) >= 4);
-			igt_require(intel_graphics_ver_from_pciid(devid) < IP_VER(12, 50));
+			igt_require(intel_gfx_ver(drm_fd) < IP_VER(12, 50));
 
 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				test_global_sseu_config_invalid(ctx, e);
@@ -6130,7 +6133,7 @@ int igt_main()
 		igt_describe("Verify specifying SSEU opening parameters");
 		igt_subtest_with_dynamic("global-sseu-config") {
 			igt_require(i915_perf_revision(drm_fd) >= 4);
-			igt_require(intel_graphics_ver_from_pciid(devid) < IP_VER(12, 50));
+			igt_require(intel_gfx_ver(drm_fd) < IP_VER(12, 50));
 
 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				test_global_sseu_config(ctx, e);
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index fed8a73b4..87ce5d869 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -237,7 +237,7 @@ init(int gem_fd, const intel_ctx_t *ctx,
 		err = errno;
 
 	exists = gem_context_has_engine(gem_fd, ctx->id, e->flags);
-	if (intel_gen_from_pciid(intel_get_drm_devid(gem_fd)) < 6 &&
+	if (intel_gfx_ver_major(gem_fd) < 6 &&
 	    sample == I915_SAMPLE_SEMA)
 		exists = false;
 
@@ -742,7 +742,7 @@ sema_wait(int gem_fd, const intel_ctx_t *ctx,
 	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 	uint64_t obj_offset, bb_offset;
 
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(gem_fd)) >= 8);
+	igt_require(intel_gfx_ver_major(gem_fd) >= 8);
 
 	/**
 	 * Setup up a batchbuffer with a polling semaphore wait command which
@@ -977,7 +977,7 @@ sema_busy(int gem_fd, const intel_ctx_t *ctx,
 	int fd[2];
 	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(gem_fd)) >= 8);
+	igt_require(intel_gfx_ver_major(gem_fd) >= 8);
 
 	fd[0] = open_group(gem_fd, I915_PMU_ENGINE_SEMA(e->class, e->instance),
 			   -1);
@@ -1124,7 +1124,7 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
 	int fd;
 
 	devid = intel_get_drm_devid(gem_fd);
-	igt_require(intel_gen_from_pciid(devid) >= 7);
+	igt_require(intel_gfx_ver_major(gem_fd) >= 7);
 	igt_require(has_secure_batches(gem_fd));
 	igt_skip_on(IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid));
 
diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
index bb63ed772..b84b84c51 100644
--- a/tests/intel/sysfs_preempt_timeout.c
+++ b/tests/intel/sysfs_preempt_timeout.c
@@ -286,7 +286,7 @@ static void test_off(int i915, int engine)
 	 * GuC submission, but we are not really losing coverage as this test
 	 * isn't not a UMD use case.
 	 */
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(i915)) < 12);
+	igt_require(intel_gfx_ver_major(i915) < 12);
 
 	igt_assert(igt_sysfs_scanf(engine, "class", "%u", &class) == 1);
 	igt_assert(igt_sysfs_scanf(engine, "instance", "%u", &inst) == 1);
diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
index 056db32e1..043417907 100644
--- a/tests/intel/sysfs_timeslice_duration.c
+++ b/tests/intel/sysfs_timeslice_duration.c
@@ -208,7 +208,7 @@ static uint64_t __test_duration(int i915, int engine, unsigned int timeout)
 		.buffer_count = ARRAY_SIZE(obj),
 		.buffers_ptr = to_user_pointer(obj),
 	};
-	const unsigned int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const unsigned int gen = intel_gfx_ver_major(i915);
 	double duration = clockrate(i915);
 	unsigned int class, inst, mmio;
 	uint32_t *cs, *map;
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index d3e27e910..c52ee0750 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -128,7 +128,7 @@ static void surf_copy(int xe,
 	int result;
 
 	igt_assert(mid->compression);
-	if (intel_gen_from_pciid(devid) >= 20 && mid->compression) {
+	if (intel_gfx_ver_major(xe) >= 20 && mid->compression) {
 		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
 		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 	}
@@ -177,7 +177,7 @@ static void surf_copy(int xe,
 			if (IS_GEN(devid, 12) && is_intel_dgfx(xe)) {
 				igt_assert(!strcmp(orig, newsum));
 				igt_assert(!strcmp(orig2, newsum2));
-			} else if (intel_gen_from_pciid(devid) >= 20) {
+			} else if (intel_gfx_ver_major(xe) >= 20) {
 				if (is_intel_dgfx(xe)) {
 					/* buffer object would become
 					 * uncompressed in xe2+ dgfx
@@ -227,7 +227,7 @@ static void surf_copy(int xe,
 	 * uncompressed in xe2+ dgfx, and therefore retrieve the
 	 * ccs by copying 0 to ccsmap
 	 */
-	if (suspend_resume && intel_gen_from_pciid(devid) >= 20 && is_intel_dgfx(xe))
+	if (suspend_resume && intel_gfx_ver_major(xe) >= 20 && is_intel_dgfx(xe))
 		memset(ccsmap, 0, ccssize);
 	else
 		/* retrieve back ccs */
@@ -353,7 +353,7 @@ static void block_copy(int xe,
 	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = (intel_gen_from_pciid(intel_get_drm_devid(xe)) >= 20 &&
+	uint32_t mid_region = (intel_gfx_ver_major(xe) >= 20 &&
 			       !xe_has_vram(xe)) ? region1 : region2;
 	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
@@ -441,7 +441,7 @@ static void block_copy(int xe,
 	if (config->inplace) {
 		uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-		if (intel_gen_from_pciid(intel_get_drm_devid(xe)) >= 20 && config->compression)
+		if (intel_gfx_ver_major(xe) >= 20 && config->compression)
 			pat_index = intel_get_pat_idx_uc_comp(xe);
 
 		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
@@ -488,7 +488,7 @@ static void block_multicopy(int xe,
 	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = (intel_gen_from_pciid(intel_get_drm_devid(xe)) >= 20 &&
+	uint32_t mid_region = (intel_gfx_ver_major(xe) >= 20 &&
 			       !xe_has_vram(xe)) ? region1 : region2;
 	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
@@ -530,7 +530,7 @@ static void block_multicopy(int xe,
 	if (config->inplace) {
 		uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-		if (intel_gen_from_pciid(intel_get_drm_devid(xe)) >= 20 && config->compression)
+		if (intel_gfx_ver_major(xe) >= 20 && config->compression)
 			pat_index = intel_get_pat_idx_uc_comp(xe);
 
 		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
@@ -715,7 +715,7 @@ static void block_copy_test(int xe,
 	int tiling, width, height;
 
 
-	if (intel_gen_from_pciid(dev_id) >= 20 && config->compression)
+	if (intel_gfx_ver_major(xe) >= 20 && config->compression)
 		igt_require(HAS_FLATCCS(dev_id));
 
 	if (config->compression && !blt_block_copy_supports_compression(xe))
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index faaad0450..712b284ed 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -232,7 +232,7 @@ test_compute_kernel_loop(uint64_t loop_duration)
 	double elapse_time, lower_bound, upper_bound;
 
 	fd = drm_open_driver(DRIVER_XE);
-	ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
+	ip_ver = intel_gfx_ver(fd);
 	kernels = intel_compute_square_kernels;
 
 	while (kernels->kernel) {
@@ -335,7 +335,7 @@ igt_check_supported_pipeline(void)
 	const struct intel_compute_kernels *kernels;
 
 	fd = drm_open_driver(DRIVER_XE);
-	ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
+	ip_ver = intel_gfx_ver(fd);
 	kernels = intel_compute_square_kernels;
 	drm_close_driver(fd);
 
@@ -432,7 +432,7 @@ test_eu_busy(uint64_t duration_sec)
 
 	fd = drm_open_driver(DRIVER_XE);
 
-	ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
+	ip_ver = intel_gfx_ver(fd);
 	kernels = intel_compute_square_kernels;
 	while (kernels->kernel) {
 		if (ip_ver == kernels->ip_ver)
@@ -518,7 +518,7 @@ int igt_main()
 	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
 		sriov_enabled = is_sriov_mode(xe);
-		ip_ver = intel_graphics_ver_from_pciid(intel_get_drm_devid(xe));
+		ip_ver = intel_gfx_ver(xe);
 		igt_store_ccs_mode(ccs_mode, ARRAY_SIZE(ccs_mode));
 	}
 
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 55081f938..f77badeb7 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -261,7 +261,6 @@ const char *help_str =
 int igt_main_args("b", NULL, help_str, opt_handler, NULL)
 {
 	int fd;
-	uint16_t dev_id;
 	struct igt_collection *set, *regions;
 	uint32_t region;
 	struct rect linear[] = { { 0, 0xfd, 1, MODE_BYTE },
@@ -275,7 +274,6 @@ int igt_main_args("b", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
-		dev_id = intel_get_drm_devid(fd);
 		xe_device_get(fd);
 		set = xe_get_memory_region_set(fd,
 					       DRM_XE_MEM_REGION_CLASS_SYSMEM,
@@ -295,7 +293,7 @@ int igt_main_args("b", NULL, help_str, opt_handler, NULL)
 	for (int i = 0; i < ARRAY_SIZE(page); i++) {
 		igt_subtest_f("mem-page-copy-%u", page[i].width) {
 			igt_require(blt_has_mem_copy(fd));
-			igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
+			igt_require(intel_gfx_ver_major(fd) >= 20);
 			for_each_variation_r(regions, 1, set) {
 				region = igt_collection_get_value(regions, 0);
 				copy_test(fd, &page[i], MEM_COPY, region);
@@ -320,7 +318,7 @@ int igt_main_args("b", NULL, help_str, opt_handler, NULL)
 			 * till 0x3FFFF.
 			 */
 			if (linear[i].width > 0x3ffff &&
-			    (intel_get_device_info(dev_id)->graphics_ver < 20))
+			    (intel_gfx_ver_major(fd) < 20))
 				igt_skip("Skipping: width exceeds 18-bit limit on gfx_ver < 20\n");
 			igt_require(blt_has_mem_set(fd));
 			for_each_variation_r(regions, 1, set) {
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index a53de8fd8..b4741e64a 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -296,7 +296,6 @@ static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
  */
 static void test_info_read(struct xe_device *xe_dev)
 {
-	uint16_t devid = intel_get_drm_devid(xe_dev->fd);
 	struct drm_xe_query_config *config;
 	const char *name = "info";
 	bool failed = false;
@@ -329,7 +328,7 @@ static void test_info_read(struct xe_device *xe_dev)
 		failed = true;
 	}
 
-	if (intel_gen_from_pciid(devid) < 20) {
+	if (intel_gfx_ver_major(xe_dev->fd) < 20) {
 		val = -1;
 
 		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index 1ff25fa45..2c6271b7b 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -201,7 +201,7 @@ static int run_gpgpu_fill(int drm_fd, uint32_t devid)
 	unsigned int i;
 
 	data.bops = buf_ops_create(drm_fd);
-	fill_fn = igt_get_gpgpu_fillfunc(devid);
+	fill_fn = igt_get_gpgpu_fillfunc(drm_fd);
 
 	for (i = 0; i < NUM_ITERS_GPGPU_FILL; i++)
 		gpgpu_fill(&data, fill_fn, 0, WIDTH, HEIGHT, 16, 16, WIDTH / 2, HEIGHT / 2);
@@ -657,7 +657,7 @@ int igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 		igt_require_fd(drm_fd);
 		devid = intel_get_drm_devid(drm_fd);
 
-		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
+		igt_require_f(igt_get_gpgpu_fillfunc(drm_fd), "no gpgpu-fill function\n");
 		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid file\n");
 		xe_dev = xe_device_get(drm_fd);
 		igt_require_f(xe_dev->eu_stall, "EU stall monitoring is not available/supported\n");
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 0bdbe687d..8e814bcbc 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -12,6 +12,7 @@
  * Test category: functionality test
  */
 
+#include "intel_chipset.h"
 #include "xe/xe_eudebug.h"
 #include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
@@ -401,9 +402,7 @@ static uint64_t eu_ctl(int debugfd, uint64_t client,
 
 static bool intel_gen_needs_resume_wa(int fd)
 {
-	const uint32_t id = intel_get_drm_devid(fd);
-
-	return intel_gen_from_pciid(id) == 12 && intel_graphics_ver_from_pciid(id) < IP_VER(12, 55);
+	return intel_gfx_ver_major(fd) == 12 && intel_gfx_ver(fd) < IP_VER(12, 55);
 }
 
 static uint64_t eu_ctl_resume(int fd, int debugfd, uint64_t client,
@@ -1255,8 +1254,6 @@ static void run_online_client(struct xe_eudebug_client *c)
 
 static bool intel_gen_has_lockstep_eus(int fd)
 {
-	const uint32_t id = intel_get_drm_devid(fd);
-
 	/*
 	 * Lockstep (or in some parlance, fused) EUs are pair of EUs
 	 * that work in sync, supposedly same clock and same control flow.
@@ -1264,7 +1261,7 @@ static bool intel_gen_has_lockstep_eus(int fd)
 	 * excepted into SIP. In this level, the hardware has only one attention
 	 * thread bit for units. PVC is the first one without lockstepping.
 	 */
-	return !(intel_graphics_ver_from_pciid(id) == IP_VER(12, 60) || intel_gen_from_pciid(id) >= 20);
+	return !(intel_gfx_ver(fd) == IP_VER(12, 60) || intel_gfx_ver_major(fd) >= 20);
 }
 
 static int query_attention_bitmask_size(int fd, int gt)
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index e0d049780..3dc06f3dd 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -902,7 +902,7 @@ int igt_main()
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
 			if (s->flags & MULTI_QUEUE) {
-				igt_require(intel_graphics_ver_from_pciid(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+				igt_require(intel_gfx_ver(fd) >= IP_VER(35, 0));
 				igt_require(multi_queue_hwe != NULL);
 				igt_assert_f(!(s->flags & MULTI_VM),
 					     "MULTI_QUEUE and MULTI_VM cannot be used together.\n");
@@ -922,7 +922,7 @@ int igt_main()
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
 			if (s->flags & MULTI_QUEUE) {
-				igt_require(intel_graphics_ver_from_pciid(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+				igt_require(intel_gfx_ver(fd) >= IP_VER(35, 0));
 				igt_require(multi_queue_hwe != NULL);
 				igt_assert_f(!(s->flags & MULTI_VM),
 					     "MULTI_QUEUE and MULTI_VM cannot be used together.\n");
@@ -941,7 +941,7 @@ int igt_main()
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
 			if (s->flags & MULTI_QUEUE) {
-				igt_require(intel_graphics_ver_from_pciid(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+				igt_require(intel_gfx_ver(fd) >= IP_VER(35, 0));
 				igt_require(multi_queue_hwe != NULL);
 				igt_assert_f(!(s->flags & MULTI_VM),
 					     "MULTI_QUEUE and MULTI_VM cannot be used together.\n");
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index c9c6b4987..2c2451c26 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -444,7 +444,7 @@ test_exec_main(int fd, int n_exec_queues, int n_execs, unsigned int flags)
 	struct drm_xe_engine_class_instance *hwe;
 
 	if (flags & MULTI_QUEUE) {
-		igt_require(intel_graphics_ver_from_pciid(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(intel_gfx_ver(fd) >= IP_VER(35, 0));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
 	} else {
diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 991dcf932..a7e9f21ed 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -1047,7 +1047,7 @@ int igt_main()
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
-		igt_require(intel_graphics_ver_from_pciid(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(intel_gfx_ver(fd) >= IP_VER(35, 0));
 	}
 
 	igt_subtest_f("sanity")
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 9967a7829..19e295814 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -57,7 +57,7 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
 }
 
 static void cond_batch(struct data *data, uint64_t addr, int value,
-		       uint16_t dev_id)
+		       int fd)
 {
 	int b;
 	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
@@ -70,7 +70,7 @@ static void cond_batch(struct data *data, uint64_t addr, int value,
 	data->batch[b++] = sdi_addr;
 	data->batch[b++] = sdi_addr >> 32;
 
-	if (intel_graphics_ver_from_pciid(dev_id) >= IP_VER(20, 0))
+	if (intel_gfx_ver(fd) >= IP_VER(20, 0))
 		data->batch[b++] = MI_MEM_FENCE | MI_WRITE_FENCE;
 
 	data->batch[b++] = MI_CONDITIONAL_BATCH_BUFFER_END | MI_DO_COMPARE | 5 << 12 | 2;
@@ -156,7 +156,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	else if (inst_type == COND_BATCH) {
 		/* A random value where it stops at the below value. */
 		value = 20 + random() % 10;
-		cond_batch(data, addr, value, dev_id);
+		cond_batch(data, addr, value, fd);
 	}
 	else
 		igt_assert_f(inst_type < 2, "Entered wrong inst_type.\n");
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 7c805d208..0b60a2451 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1519,8 +1519,8 @@ int igt_main()
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("threads-%s", s->name) {
 			if (s->flags & MULTI_QUEUE) {
-				igt_skip_on_f(!(intel_graphics_ver_from_pciid(intel_get_drm_devid(fd)) >= IP_VER(35, 0)),
-						"multi_queue is supported on graphics version 35 and above");
+			igt_skip_on_f(!(intel_gfx_ver(fd) >= IP_VER(35, 0)),
+					"multi_queue is supported on graphics version 35 and above");
 				/* Balancer can't be set with multi-queue at the same time */
 				igt_assert(!(s->flags & BALANCER));
 			}
diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index f314f750f..947c82293 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -492,7 +492,7 @@ oa_add_config_fail(int fd, int sysfs, int devid,
 {
 	char path[512];
 	uint64_t config_id;
-#define SAMPLE_MUX_REG (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0) ?	\
+#define SAMPLE_MUX_REG (intel_gfx_ver(fd) >= IP_VER(20, 0) ?	\
 			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
 
 	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
diff --git a/tests/intel/xe_gpgpu_fill.c b/tests/intel/xe_gpgpu_fill.c
index ce6222ddd..d5234cede 100644
--- a/tests/intel/xe_gpgpu_fill.c
+++ b/tests/intel/xe_gpgpu_fill.c
@@ -179,7 +179,7 @@ int igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		data.bops = buf_ops_create(data.drm_fd);
 
-		fill_fn = igt_get_gpgpu_fillfunc(data.devid);
+		fill_fn = igt_get_gpgpu_fillfunc(data.drm_fd);
 		igt_require_f(fill_fn, "no gpgpu-fill function\n");
 
 		start_x = ALIGN(start_x, 4);
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index e9194b6b7..3da0e35e2 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -710,7 +710,7 @@ static void do_intel_bb_blit(struct buf_ops *bops, int loops, uint32_t tiling)
 	int i, fails = 0, xe = buf_ops_get_fd(bops);
 
 	/* We'll fix it for gen2/3 later. */
-	igt_require(intel_gen_from_pciid(intel_get_drm_devid(xe)) > 3);
+	igt_require(intel_gfx_ver_major(xe) > 3);
 
 	for (i = 0; i < loops; i++)
 		fails += __do_intel_bb_blit(bops, tiling);
@@ -878,10 +878,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	int xe = buf_ops_get_fd(bops);
 	uint32_t fails = 0;
 	char name[128];
-	uint32_t devid = intel_get_drm_devid(xe);
 	igt_render_copyfunc_t render_copy = NULL;
 
-	igt_debug("%s() gen: %d\n", __func__, intel_gen_from_pciid(devid));
+	igt_debug("%s() gen: %d\n", __func__, intel_gfx_ver_major(xe));
 
 	ibb = intel_bb_create(xe, PAGE_SIZE);
 
@@ -1041,7 +1040,7 @@ int igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 		do_intel_bb_blit(bops, 3, I915_TILING_X);
 
 	igt_subtest("intel-bb-blit-y") {
-		igt_require(intel_gen_from_pciid(intel_get_drm_devid(xe)) >= 6);
+		igt_require(intel_gfx_ver_major(xe) >= 6);
 		do_intel_bb_blit(bops, 3, I915_TILING_Y);
 	}
 
diff --git a/tests/intel/xe_media_fill.c b/tests/intel/xe_media_fill.c
index 56c962615..2a7e98e9d 100644
--- a/tests/intel/xe_media_fill.c
+++ b/tests/intel/xe_media_fill.c
@@ -125,7 +125,7 @@ int igt_main()
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		data.bops = buf_ops_create(data.drm_fd);
 
-		fill_fn = igt_get_media_fillfunc(data.devid);
+		fill_fn = igt_get_media_fillfunc(data.drm_fd);
 
 		igt_require_f(fill_fn, "no media-fill function\n");
 	}
diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index 212b1b9cd..5c4ca2bfa 100644
--- a/tests/intel/xe_multigpu_svm.c
+++ b/tests/intel/xe_multigpu_svm.c
@@ -396,7 +396,6 @@ static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
 	uint64_t batch_addr;
 	void *batch;
 	uint32_t *cmd;
-	uint16_t dev_id = intel_get_drm_devid(fd);
 	uint32_t mocs_index = intel_get_uc_mocs_index(fd);
 	int i = 0;
 
@@ -412,7 +411,7 @@ static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
 	cmd[i++] = upper_32_bits(src_addr);
 	cmd[i++] = lower_32_bits(dst_addr);
 	cmd[i++] = upper_32_bits(dst_addr);
-	if (intel_graphics_ver_from_pciid(dev_id) >= IP_VER(20, 0)) {
+	if (intel_gfx_ver(fd) >= IP_VER(20, 0)) {
 		cmd[i++] = mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT | mocs_index;
 	} else {
 		cmd[i++] = mocs_index << GEN12_MEM_COPY_MOCS_SHIFT | mocs_index;
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 2a478993e..4a9c335be 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -24,6 +24,7 @@
 #include "igt_device.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
+#include "intel_chipset.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_oa.h"
@@ -476,7 +477,7 @@ get_oa_format(enum intel_xe_oa_format_name format)
 		return dg2_oa_formats[format];
 	else if (IS_METEORLAKE(devid))
 		return mtl_oa_formats[format];
-	else if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0))
+	else if (intel_gfx_ver(drm_fd) >= IP_VER(20, 0))
 		return lnl_oa_formats[format];
 	else
 		return gen12_oa_formats[format];
@@ -797,7 +798,7 @@ oa_timestamp_delta(const uint32_t *report1,
 		   const uint32_t *report0,
 		   enum intel_xe_oa_format_name format)
 {
-	uint32_t width = intel_graphics_ver_from_pciid(devid) >= IP_VER(12, 55) ? 56 : 32;
+	uint32_t width = intel_gfx_ver(drm_fd) >= IP_VER(12, 55) ? 56 : 32;
 
 	return elapsed_delta(oa_timestamp(report1, format),
 			     oa_timestamp(report0, format), width);
@@ -1136,7 +1137,7 @@ static void pec_sanity_check(const u32 *report0, const u32 *report1,
 static void pec_sanity_check_reports(const u32 *report0, const u32 *report1,
 				     struct intel_xe_perf_metric_set *set)
 {
-	if (igt_run_in_simulation() || intel_graphics_ver_from_pciid(devid) < IP_VER(20, 0)) {
+	if (igt_run_in_simulation() || intel_gfx_ver(drm_fd) < IP_VER(20, 0)) {
 		igt_debug("%s: Skip checking PEC reports in simulation or Xe1\n", __func__);
 		return;
 	}
@@ -3407,7 +3408,7 @@ static void single_ctx_helper(const struct drm_xe_oa_unit *oau)
 	}
 
 	/* FIXME: can we deduce the presence of A26 from get_oa_format(fmt)? */
-	if (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0))
+	if (intel_gfx_ver(drm_fd) >= IP_VER(20, 0))
 		goto skip_check;
 
 	/* Check that this test passed. The test measures the number of 2x2
@@ -3586,7 +3587,7 @@ static bool has_xe_oa_userspace_config(int fd)
 	return errno != EINVAL;
 }
 
-#define SAMPLE_MUX_REG (intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0) ?	\
+#define SAMPLE_MUX_REG (intel_gfx_ver(drm_fd) >= IP_VER(20, 0) ?	\
 			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
 
 /**
@@ -3841,7 +3842,7 @@ test_whitelisted_registers_userspace_config(void)
 
 	/* NOA_CONFIG */
 	/* Prior to Xe2 */
-	if (intel_graphics_ver_from_pciid(devid) < IP_VER(20, 0)) {
+	if (intel_gfx_ver(drm_fd) < IP_VER(20, 0)) {
 		regs[config.n_regs * 2] = 0xD04;
 		regs[config.n_regs * 2 + 1] = 0;
 		config.n_regs++;
@@ -3850,7 +3851,7 @@ test_whitelisted_registers_userspace_config(void)
 		config.n_regs++;
 	}
 	/* Prior to MTLx */
-	if (intel_graphics_ver_from_pciid(devid) < IP_VER(12, 70)) {
+	if (intel_gfx_ver(drm_fd) < IP_VER(12, 70)) {
 		/* WAIT_FOR_RC6_EXIT */
 		regs[config.n_regs * 2] = 0x20CC;
 		regs[config.n_regs * 2 + 1] = 0;
@@ -3890,7 +3891,7 @@ struct test_perf {
 
 #define HAS_OA_MMIO_TRIGGER(__d) \
 	(IS_DG2(__d) || IS_PONTEVECCHIO(__d) || IS_METEORLAKE(__d) || \
-	 intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0))
+	 intel_gfx_ver(drm_fd) >= IP_VER(20, 0))
 
 static void perf_init_whitelist(void)
 {
@@ -5087,7 +5088,7 @@ int igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		sysfs = igt_sysfs_open(drm_fd);
 
 		/* Currently only run on Xe2+ */
-		igt_require(intel_graphics_ver_from_pciid(devid) >= IP_VER(20, 0));
+		igt_require(intel_gfx_ver(drm_fd) >= IP_VER(20, 0));
 
 		igt_require(init_sys_info());
 
@@ -5193,8 +5194,8 @@ int igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 				test_mi_rpc(oau);
 
 		igt_subtest_with_dynamic("oa-tlb-invalidate") {
-			igt_require(intel_graphics_ver_from_pciid(devid) <= IP_VER(12, 70) &&
-				    intel_graphics_ver_from_pciid(devid) != IP_VER(12, 60));
+			igt_require(intel_gfx_ver(drm_fd) <= IP_VER(12, 70) &&
+				    intel_gfx_ver(drm_fd) != IP_VER(12, 60));
 			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
 				test_oa_tlb_invalidate(oau);
 		}
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 2be9bfb73..c53e06246 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -22,6 +22,7 @@
 #include "igt_sysfs.h"
 #include "igt_vgem.h"
 #include "intel_blt.h"
+#include "intel_chipset.h"
 #include "intel_mocs.h"
 #include "intel_pat.h"
 #include "linux_scaffold.h"
@@ -177,8 +178,7 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
  */
 static void pat_sanity(int fd)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
-	unsigned int gfx_ver = intel_graphics_ver_from_pciid(dev_id);
+	unsigned int gfx_ver = intel_gfx_ver(fd);
 	struct intel_pat_cache pat_sw_config = {};
 	int32_t parsed;
 	bool has_uc_comp = false, has_wt = false;
@@ -412,12 +412,11 @@ static void pat_index_blt(struct xe_pat_param *p)
 	int bpp = 32;
 	uint32_t alias, name;
 	int fd = p->fd;
-	uint16_t dev_id = intel_get_drm_devid(fd);
 	uint8_t mocs_index;
 	int i;
 
 	igt_require(blt_has_fast_copy(fd));
-	mocs_index = intel_get_device_info(dev_id)->graphics_ver >= 20 ?
+	mocs_index = intel_gfx_ver_major(fd) >= 20 ?
 		     intel_get_defer_to_pat_mocs_index(fd) : intel_get_uc_mocs_index(fd);
 
 	vm = xe_vm_create(fd, 0, 0);
@@ -526,7 +525,6 @@ static void pat_index_blt(struct xe_pat_param *p)
 static void pat_index_render(struct xe_pat_param *p)
 {
 	int fd = p->fd;
-	uint16_t dev_id = intel_get_drm_devid(fd);
 	uint8_t mocs_index;
 	igt_render_copyfunc_t render_copy = NULL;
 	int size, stride, width = p->size->width, height = p->size->height;
@@ -543,7 +541,7 @@ static void pat_index_render(struct xe_pat_param *p)
 	if (p->r2_compressed) /* XXX */
 		return;
 
-	mocs_index = intel_get_device_info(dev_id)->graphics_ver >= 20 ?
+	mocs_index = intel_gfx_ver_major(fd) >= 20 ?
 		     intel_get_defer_to_pat_mocs_index(fd) : DEFAULT_MOCS_INDEX;
 
 	bops = buf_ops_create(fd);
@@ -640,7 +638,6 @@ static void pat_index_render(struct xe_pat_param *p)
 static void pat_index_dw(struct xe_pat_param *p)
 {
 	int fd = p->fd;
-	uint16_t dev_id = intel_get_drm_devid(fd);
 	uint8_t mocs_index;
 	int size, stride, width = p->size->width, height = p->size->height;
 	struct drm_xe_engine_class_instance *hwe;
@@ -664,7 +661,7 @@ static void pat_index_dw(struct xe_pat_param *p)
 			break;
 	}
 
-	mocs_index = intel_get_device_info(dev_id)->graphics_ver >= 20 ?
+	mocs_index = intel_gfx_ver_major(fd) >= 20 ?
 		     intel_get_defer_to_pat_mocs_index(fd) : DEFAULT_MOCS_INDEX;
 
 	vm = xe_vm_create(fd, 0, 0);
@@ -988,7 +985,6 @@ static void display_vs_wb_transient(int fd)
 		3, /* UC (baseline) */
 		6, /* L3:XD (uncompressed) */
 	};
-	uint32_t devid = intel_get_drm_devid(fd);
 	igt_render_copyfunc_t render_copy = NULL;
 	igt_crc_t ref_crc = {}, crc = {};
 	igt_plane_t *primary;
@@ -1004,7 +1000,7 @@ static void display_vs_wb_transient(int fd)
 	int bpp = 32;
 	int i;
 
-	igt_require(intel_get_device_info(devid)->graphics_ver >= 20);
+	igt_require(intel_gfx_ver_major(fd) >= 20);
 
 	render_copy = igt_get_render_copyfunc(fd);
 	igt_require(render_copy);
@@ -1105,10 +1101,8 @@ static uint8_t get_pat_idx_uc(int fd, bool *compressed)
 
 static uint8_t get_pat_idx_wt(int fd, bool *compressed)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
-
 	if (compressed)
-		*compressed = intel_get_device_info(dev_id)->graphics_ver >= 20;
+		*compressed = intel_gfx_ver_major(fd) >= 20;
 
 	return intel_get_pat_idx_wt(fd);
 }
@@ -1553,20 +1547,18 @@ static void __false_sharing(int fd, const struct fs_pat_entry *fs_entry)
 
 static void false_sharing(int fd)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
-	uint32_t graphics_ver = intel_get_device_info(dev_id)->graphics_ver;
 	bool is_dgfx = xe_has_vram(fd);
 
 	const struct fs_pat_entry *fs_entries;
 	int num_entries;
 
-	if (intel_graphics_ver_from_pciid(dev_id) == IP_VER(35, 11)) {
+	if (intel_gfx_ver(fd) == IP_VER(35, 11)) {
 		num_entries = ARRAY_SIZE(fs_xe3p_xpc);
 		fs_entries = fs_xe3p_xpc;
-	} else if (intel_graphics_ver_from_pciid(dev_id) == IP_VER(35, 10)) {
+	} else if (intel_gfx_ver(fd) == IP_VER(35, 10)) {
 		num_entries = ARRAY_SIZE(fs_xe3p_lpg);
 		fs_entries = fs_xe3p_lpg;
-	} else if (graphics_ver == 20) {
+	} else if (intel_gfx_ver_major(fd) == 20) {
 		if (is_dgfx) {
 			num_entries = ARRAY_SIZE(fs_xe2_discrete);
 			fs_entries = fs_xe2_discrete;
@@ -1689,7 +1681,7 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		bo_comp_disable_bind(fd);
 
 	igt_subtest_with_dynamic("pat-index-xelp") {
-		igt_require(intel_graphics_ver_from_pciid(dev_id) <= IP_VER(12, 55));
+		igt_require(intel_gfx_ver(fd) <= IP_VER(12, 55));
 		subtest_pat_index_modes_with_regions(fd, xelp_pat_index_modes,
 						     ARRAY_SIZE(xelp_pat_index_modes));
 	}
@@ -1707,10 +1699,10 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_subtest_with_dynamic("pat-index-xe2") {
-		igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
+		igt_require(intel_gfx_ver_major(fd) >= 20);
 		igt_assert(HAS_FLATCCS(dev_id));
 
-		if (intel_graphics_ver_from_pciid(dev_id) == IP_VER(20, 1))
+		if (intel_gfx_ver(fd) == IP_VER(20, 1))
 			subtest_pat_index_modes_with_regions(fd, bmg_g21_pat_index_modes,
 							     ARRAY_SIZE(bmg_g21_pat_index_modes));
 		else
@@ -1722,7 +1714,7 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		display_vs_wb_transient(fd);
 
 	igt_subtest_with_dynamic("false-sharing") {
-		igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
+		igt_require(intel_gfx_ver_major(fd) >= 20);
 
 		false_sharing(fd);
 	}
@@ -1731,7 +1723,7 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		int configfs_fd, configfs_device_fd;
 
 		igt_fixture() {
-			igt_require(intel_graphics_ver_from_pciid(dev_id) == IP_VER(35, 10));
+			igt_require(intel_gfx_ver(fd) == IP_VER(35, 10));
 
 			pci_dev = igt_device_get_pci_device(fd);
 			snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index cac24a9ad..5454bd3c4 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -380,7 +380,7 @@ test_query_gt_topology(int fd)
 	}
 
 	/* sanity check EU type */
-	if (IS_PONTEVECCHIO(dev_id) || intel_gen_from_pciid(dev_id) >= 20) {
+	if (IS_PONTEVECCHIO(dev_id) || intel_gfx_ver_major(fd) >= 20) {
 		igt_assert(topo_types & (1 << DRM_XE_TOPO_SIMD16_EU_PER_DSS));
 		igt_assert_eq(topo_types & (1 << DRM_XE_TOPO_EU_PER_DSS), 0);
 	} else {
@@ -428,7 +428,7 @@ test_query_gt_topology_l3_bank_mask(int fd)
 			}
 
 			igt_info(" count: %d\n", count);
-			if (intel_get_device_info(dev_id)->graphics_ver < 20) {
+			if (intel_gfx_ver_major(fd) < 20) {
 				igt_assert_lt(0, count);
 			}
 
diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index 29ccfc241..9528d3c3b 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -12,6 +12,7 @@
 #include "igt.h"
 #include "intel_blt.h"
 #include "intel_bufops.h"
+#include "intel_chipset.h"
 #include "intel_mocs.h"
 #include "intel_pat.h"
 #include "xe/xe_ioctl.h"
@@ -136,7 +137,7 @@ static int compare_bufs(struct intel_buf *buf1, struct intel_buf *buf2,
 static bool buf_is_aux_compressed(struct buf_ops *bops, struct intel_buf *buf)
 {
 	int xe = buf_ops_get_fd(bops);
-	unsigned int gen = intel_gen_from_pciid(buf_ops_get_devid(bops));
+	unsigned int gen = intel_gfx_ver_major(buf_ops_get_fd(bops));
 	uint32_t ccs_size;
 	uint8_t *ptr;
 	bool is_compressed = false;
diff --git a/tests/intel/xe_svm_usrptr_madvise.c b/tests/intel/xe_svm_usrptr_madvise.c
index f142e576e..bae785cec 100644
--- a/tests/intel/xe_svm_usrptr_madvise.c
+++ b/tests/intel/xe_svm_usrptr_madvise.c
@@ -103,7 +103,6 @@ gpu_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 	uint64_t batch_addr;
 	void *batch;
 	uint32_t *cmd;
-	uint16_t dev_id = intel_get_drm_devid(fd);
 	uint32_t mocs_index = intel_get_uc_mocs_index(fd);
 	int i = 0;
 
@@ -119,7 +118,7 @@ gpu_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 	cmd[i++] = upper_32_bits(src_addr);
 	cmd[i++] = lower_32_bits(dst_addr);
 	cmd[i++] = upper_32_bits(dst_addr);
-	if (intel_graphics_ver_from_pciid(dev_id) >= IP_VER(20, 0))
+	if (intel_gfx_ver(fd) >= IP_VER(20, 0))
 		cmd[i++] = mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT | mocs_index;
 	else
 		cmd[i++] = mocs_index << GEN12_MEM_COPY_MOCS_SHIFT | mocs_index;
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 929be3f2a..e5152a911 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -609,7 +609,7 @@ static void work(int i915, uint64_t ahnd, uint64_t scratch_offset, int dmabuf,
 {
 	const int SCRATCH = 0;
 	const int BATCH = 1;
-	const int gen = intel_gen_from_pciid(intel_get_drm_devid(i915));
+	const int gen = intel_gfx_ver_major(i915);
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry store[1024+1];
 	struct drm_i915_gem_execbuffer2 execbuf;
-- 
2.43.0

