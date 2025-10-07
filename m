Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A38CCA476
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 10:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B7410E369;
	Tue,  7 Oct 2025 10:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGiohqJb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B653D10E046
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Oct 2025 05:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759813565; x=1791349565;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ehsgRu9TrM7DNXxBVduamp4hiXkkTx57rHG/SU9RA9s=;
 b=HGiohqJbBgPbEgbodbSVKC/qyXcswDUv+007nOjg9XHFZ8A7emCHfW3f
 mCVYwPNu3wJMjCvhvHUTQ3g8YXlnRzKoaiN1Bl38mQGdvPc1B+TH0xsUF
 A7M8SZPpoB3XPH9FKbLiSVFinlvIYdi2FgJmJDMBA9J0YQjfBmz2MY8y7
 xTYg6hyhAAtbQL4RE9WUvAkNrkVj8qy5AJl3XnJ829fKb7d9VUXeQBkRT
 fZFqPd2GFqopAs+kK4fPEOf3X9dKnb86+J6NNUu4u8bBX62XJXac1jwS2
 fbw8KuZ474v1Sqc+KFoYjXi8Zywl5bVjd+RZJcMx73jSHRmJNEBvT/U7y A==;
X-CSE-ConnectionGUID: t3H91/bARXm7j2JJ0NEeWg==
X-CSE-MsgGUID: lb98SLiiTL2e5WQOT1TggQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="49546098"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49546098"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 22:06:05 -0700
X-CSE-ConnectionGUID: uJbd9ZAIQ/yc0qRf0ATw7A==
X-CSE-MsgGUID: nCqIhNsgRL+rRfki6o6tug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="210734892"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.61])
 by orviesa002.jf.intel.com with ESMTP; 06 Oct 2025 22:06:05 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH] lib/intel_device_info: get the xe .graphics_rel from GMD_ID
Date: Tue,  7 Oct 2025 05:05:54 +0000
Message-ID: <20251007050554.340485-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Oct 2025 10:51:39 +0000
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

Created 3 new APIs:
intel_query_gen(int fd)
intel_query_graphics_ver(int fd)
intel_query_device_info(int fd)

On xe devices, the graphics versions both major and minor can be
accurately determined by retrieving the GMD_ID via IOCTL, rather
than relying on the static intel_device_match table. The same type
device may have different graphics minor version(.graphics_rel) value.

Although we can retrieve both the major and minor IP versions from
GMD_ID, we still retain the major version (.graphics_ver) in the
intel_device_match table. The benefit of this approach is that
.graphics_ver generally does not change with devid, allowing us to
avoid modifying the function call which don't provide fd parameter
and thereby reducing unnecessary file changes.

However, we still provide the intel_query_gen(fd) function, because
version queries within the same file should come from a consistent
source.

Replaced the lib/*.c tests/intel/*.c tools/*.c releated to xe devices
with the new APIs.

This change can avoid the trouble caused by different graphics_rel
when adding new devid to the same device in the future.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/gpgpu_shader.c                     |  2 +-
 lib/gpu_cmds.c                         | 22 +++++-----
 lib/igt_draw.c                         |  6 +--
 lib/igt_gt.c                           | 10 ++---
 lib/igt_store.c                        |  2 +-
 lib/intel_blt.c                        | 21 +++++-----
 lib/intel_blt.h                        |  2 +-
 lib/intel_bufops.c                     | 13 +++---
 lib/intel_chipset.c                    | 56 ++++++++++++++++++++++++++
 lib/intel_chipset.h                    |  3 ++
 lib/intel_common.c                     |  8 ++--
 lib/intel_compute.c                    |  7 ++--
 lib/intel_device_info.c                |  3 --
 lib/intel_mocs.c                       | 15 ++++---
 lib/intel_pat.c                        | 17 ++++----
 lib/ioctl_wrappers.c                   |  2 +-
 lib/rendercopy_gen9.c                  | 22 +++++-----
 lib/xe/xe_legacy.c                     |  2 +-
 lib/xe/xe_oa.c                         |  4 +-
 lib/xe/xe_query.c                      | 10 ++++-
 lib/xe/xe_query.h                      |  3 ++
 lib/xe/xe_sriov_provisioning.c         |  4 +-
 tests/intel/api_intel_allocator.c      |  2 +-
 tests/intel/kms_ccs.c                  | 13 ++----
 tests/intel/kms_draw_crc.c             |  2 +-
 tests/intel/kms_fbcon_fbt.c            |  2 +-
 tests/intel/kms_frontbuffer_tracking.c | 12 +++---
 tests/intel/kms_pipe_stress.c          |  4 +-
 tests/intel/xe_ccs.c                   | 24 +++++------
 tests/intel/xe_copy_basic.c            |  6 +--
 tests/intel/xe_debugfs.c               |  3 +-
 tests/intel/xe_eudebug_online.c        |  8 +---
 tests/intel/xe_exec_store.c            |  6 +--
 tests/intel/xe_fault_injection.c       |  2 +-
 tests/intel/xe_oa.c                    | 38 +++++++++--------
 tests/intel/xe_pat.c                   | 26 +++++-------
 tools/intel_tiling_detect.c            |  3 +-
 tools/xe-perf/meson.build              |  2 +-
 tools/xe-perf/xe_perf_configs.c        |  2 +-
 tools/xe-perf/xe_perf_recorder.c       |  2 +-
 40 files changed, 216 insertions(+), 175 deletions(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index a63af0d23..87be270b7 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -274,7 +274,7 @@ struct gpgpu_shader *gpgpu_shader_create(int fd)
 	const struct intel_device_info *info;
 
 	igt_assert(shdr);
-	info = intel_get_device_info(intel_get_drm_devid(fd));
+	info = intel_query_device_info(fd);
 	shdr->gen_ver = 100 * info->graphics_ver + info->graphics_rel;
 	shdr->max_size = 16 * 4;
 	shdr->code = malloc(4 * shdr->max_size);
diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index a6a9247dc..bd743f85a 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -313,14 +313,14 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
 {
 	uint32_t binding_table_offset;
 	uint32_t *binding_table;
-	uint32_t devid = intel_get_drm_devid(ibb->fd);
+	uint32_t graphics_ver = intel_query_graphics_ver(ibb->fd);
 
 	intel_bb_ptr_align(ibb, 64);
 	binding_table_offset = intel_bb_offset(ibb);
 	binding_table = intel_bb_ptr(ibb);
 	intel_bb_ptr_add(ibb, 64);
 
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
+	if (graphics_ver >= IP_VER(20, 0)) {
 		/*
 		 * Up until now, SURFACEFORMAT_R8_UNROM was used regardless of the 'bpp' value.
 		 * For bpp 32 this results in a surface that is 4x narrower than expected. However
@@ -342,13 +342,13 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
 			igt_assert_f(false,
 				     "Surface state for bpp = %u not implemented",
 				     buf->bpp);
-	} else if (intel_graphics_ver(devid) >= IP_VER(12, 50)) {
+	} else if (graphics_ver >= IP_VER(12, 50)) {
 		binding_table[0] = xehp_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
-	} else if (intel_graphics_ver(devid) >= IP_VER(9, 0)) {
+	} else if (graphics_ver >= IP_VER(9, 0)) {
 		binding_table[0] = gen9_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
-	} else if (intel_graphics_ver(devid) >= IP_VER(8, 0)) {
+	} else if (graphics_ver >= IP_VER(8, 0)) {
 		binding_table[0] = gen8_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
 	} else {
@@ -867,7 +867,7 @@ gen_emit_media_object(struct intel_bb *ibb,
 	/* inline data (xoffset, yoffset) */
 	intel_bb_out(ibb, xoffset);
 	intel_bb_out(ibb, yoffset);
-	if (intel_gen(ibb->devid) >= 8 && !IS_CHERRYVIEW(ibb->devid))
+	if (intel_query_gen(ibb->fd) >= 8 && !intel_query_device_info(ibb->fd)->is_cherryview)
 		gen8_emit_media_state_flush(ibb);
 }
 
@@ -1011,7 +1011,7 @@ void
 xehp_emit_state_compute_mode(struct intel_bb *ibb, bool vrt)
 {
 
-	uint32_t dword_length = intel_graphics_ver(ibb->devid) >= IP_VER(20, 0);
+	uint32_t dword_length = intel_query_graphics_ver(ibb->fd) >= IP_VER(20, 0);
 
 	intel_bb_out(ibb, XEHP_STATE_COMPUTE_MODE | dword_length);
 	intel_bb_out(ibb, vrt ? (0x10001) << 10 : 0); /* Enable variable number of threads */
@@ -1042,7 +1042,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
 	intel_bb_out(ibb, 0);
 
 	/* stateless data port */
-	tmp = intel_graphics_ver(ibb->devid) >= IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
+	tmp = intel_query_graphics_ver(ibb->fd) >= IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
 	intel_bb_out(ibb, 0 | tmp);                  //dw3
 
 	/* surface */
@@ -1068,7 +1068,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
 	/* dynamic state buffer size */
 	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);           //dw13
 	/* indirect object buffer size */
-	if (intel_graphics_ver(ibb->devid) >= IP_VER(20, 0))	    //dw14
+	if (intel_query_graphics_ver(ibb->fd) >= IP_VER(20, 0))	    //dw14
 		intel_bb_out(ibb, 0);
 	else
 		intel_bb_out(ibb, 0xfffff000 | 1);
@@ -1115,7 +1115,7 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
 	else
 		mask = (1 << mask) - 1;
 
-	dword_length = intel_graphics_ver(ibb->devid) >= IP_VER(20, 0) ? 0x26 : 0x25;
+	dword_length = intel_query_graphics_ver(ibb->fd) >= IP_VER(20, 0) ? 0x26 : 0x25;
 	intel_bb_out(ibb, XEHP_COMPUTE_WALKER | dword_length);
 
 	intel_bb_out(ibb, 0); /* debug object */		//dw1
@@ -1155,7 +1155,7 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
 	intel_bb_out(ibb, 0);					//dw16
 	intel_bb_out(ibb, 0);					//dw17
 
-	if (intel_graphics_ver(ibb->devid) >= IP_VER(20, 0))	//Xe2:dw18
+	if (intel_query_graphics_ver(ibb->fd) >= IP_VER(20, 0))	//Xe2:dw18
 		intel_bb_out(ibb, 0);
 	/* Interface descriptor data */
 	for (int i = 0; i < 8; i++) {			       //dw18-25 (Xe2:dw19-26)
diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index e447ca44b..b232af228 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -486,8 +486,7 @@ typedef int (*linear_x_y_to_tiled_pos_fn)(int x, int y, uint32_t stride, int swi
 
 static linear_x_y_to_tiled_pos_fn linear_to_tiled_fn(int fd, uint32_t tiling)
 {
-	const struct intel_device_info *info =
-		intel_get_device_info(intel_get_drm_devid(fd));
+	const struct intel_device_info *info = intel_query_device_info(fd);
 
 	switch (tiling) {
 	case I915_TILING_X:
@@ -636,8 +635,7 @@ typedef void (*tiled_pos_to_x_y_linear_fn)(int tiled_pos, uint32_t stride,
 
 static tiled_pos_to_x_y_linear_fn tiled_to_linear_fn(int fd, uint32_t tiling)
 {
-	const struct intel_device_info *info =
-		intel_get_device_info(intel_get_drm_devid(fd));
+	const struct intel_device_info *info = intel_query_device_info(fd);
 
 	switch (tiling) {
 	case I915_TILING_X:
diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index bec50e388..f9288e7eb 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -68,7 +68,7 @@ static bool has_gpu_reset(int fd)
 		/* Very old kernels did not support the query */
 		if (reset_query_once == -1)
 			reset_query_once =
-			      (intel_gen(intel_get_drm_devid(fd)) >= 5) ? 1 : 0;
+			      (intel_query_gen(fd) >= 5) ? 1 : 0;
 	}
 
 	return reset_query_once > 0;
@@ -468,7 +468,7 @@ void igt_fork_hang_helper(void)
 
 	fd = drm_open_driver(DRIVER_INTEL);
 
-	gen = intel_gen(intel_get_drm_devid(fd));
+	gen = intel_query_gen(fd);
 	igt_skip_on(gen < 5);
 
 	igt_fork_helper(&hang_helper)
@@ -680,8 +680,7 @@ static bool gem_store_dword_needs_physical(const struct intel_device_info *info)
  */
 bool gem_class_can_store_dword(int fd, int class)
 {
-	uint16_t devid = intel_get_drm_devid(fd);
-	const struct intel_device_info *info = intel_get_device_info(devid);
+	const struct intel_device_info *info = intel_query_device_info(fd);
 	const int ver = info->graphics_ver;
 
 	if (gem_store_dword_needs_physical(info))
@@ -719,8 +718,7 @@ bool gem_can_store_dword(int fd, unsigned int engine)
  */
 bool gem_store_dword_needs_secure(int fd)
 {
-	const struct intel_device_info *info =
-		intel_get_device_info(intel_get_drm_devid(fd));
+	const struct intel_device_info *info = intel_query_device_info(fd);
 
 	switch (info->graphics_ver) {
 	case 4:
diff --git a/lib/igt_store.c b/lib/igt_store.c
index 42ffdc5cd..c470001ef 100644
--- a/lib/igt_store.c
+++ b/lib/igt_store.c
@@ -31,7 +31,7 @@ void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 {
 	const int SCRATCH = 0;
 	const int BATCH = 1;
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int gen = intel_query_gen(fd);
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 7f7f5485e..fc824683b 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -997,7 +997,7 @@ uint64_t emit_blt_block_copy(int fd,
 			     uint64_t bb_pos,
 			     bool emit_bbe)
 {
-	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_query_graphics_ver(fd);
 	struct gen12_block_copy_data data = {};
 	struct gen12_block_copy_data_ext dext = {};
 	uint64_t dst_offset, src_offset, bb_offset;
@@ -1285,7 +1285,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 				 uint64_t bb_pos,
 				 bool emit_bbe)
 {
-	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_query_graphics_ver(fd);
 	union ctrl_surf_copy_data data = { };
 	size_t data_sz;
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
@@ -1651,7 +1651,7 @@ uint64_t emit_blt_fast_copy(int fd,
 			    uint64_t bb_pos,
 			    bool emit_bbe)
 {
-	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_query_graphics_ver(fd);
 	struct gen12_fast_copy_data data = {};
 	uint64_t dst_offset, src_offset, bb_offset;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -1918,11 +1918,10 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
 static void dump_bb_mem_copy_cmd(int fd, struct xe_mem_copy_data *data)
 {
 	uint32_t *cmd = (uint32_t *) data;
-	uint32_t devid = intel_get_drm_devid(fd);
 
 	igt_info("BB details:\n");
 
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
+	if (intel_query_graphics_ver(fd) >= IP_VER(20, 0)) {
 		igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
 			 "[copy type: %d, mode: %d]\n",
 			 cmd[0], data->dw00.xe2.client, data->dw00.xe2.opcode,
@@ -1952,7 +1951,7 @@ static void dump_bb_mem_copy_cmd(int fd, struct xe_mem_copy_data *data)
 		 cmd[7], data->dw07.dst_address_lo);
 	igt_info(" dw08: [%08x] dst offset hi (0x%x)\n",
 		 cmd[8], data->dw08.dst_address_hi);
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
+	if (intel_query_graphics_ver(fd) >= IP_VER(20, 0)) {
 		igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
 			 cmd[9], data->dw09.xe2.dst_mocs,
 			 data->dw09.xe2.src_mocs);
@@ -1972,7 +1971,6 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 	uint32_t width, height, width_max, height_max, remain;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *bb;
-	uint32_t devid = intel_get_drm_devid(fd);
 
 	if (mem->mode == MODE_BYTE) {
 		data.dw01.byte_copy.width = -1;
@@ -1995,7 +1993,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 	width = mem->src.width;
 	height = mem->dst.height;
 
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
+	if (intel_query_graphics_ver(fd) >= IP_VER(20, 0)) {
 		data.dw00.xe2.client = 0x2;
 		data.dw00.xe2.opcode = 0x5a;
 		data.dw00.xe2.length = 8;
@@ -2177,7 +2175,6 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd,
 	int b;
 	uint32_t *batch;
 	uint32_t value;
-	uint32_t devid = intel_get_drm_devid(fd);
 
 	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
 					  0, mem->dst.pat_index);
@@ -2192,7 +2189,7 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd,
 	batch[b++] = mem->dst.pitch - 1;
 	batch[b++] = dst_offset;
 	batch[b++] = dst_offset << 32;
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+	if (intel_query_graphics_ver(fd) >= IP_VER(20, 0))
 		batch[b++] = value | (mem->dst.mocs_index << 3);
 	else
 		batch[b++] = value | mem->dst.mocs_index;
@@ -2310,7 +2307,7 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 		if (create_mapping && region != system_memory(blt->fd))
 			flags |= DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 
-		if (intel_gen(intel_get_drm_devid(blt->fd)) >= 20 && compression) {
+		if (intel_query_gen(blt->fd) >= 20 && compression) {
 			pat_index = intel_get_pat_idx_uc_comp(blt->fd);
 			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 		}
@@ -2536,7 +2533,7 @@ void blt_surface_get_flatccs_data(int fd,
 		cpu_caching = __xe_default_cpu_caching(fd, sysmem, 0);
 		ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(fd));
 
-		if (intel_gen(intel_get_drm_devid(fd)) >= 20 && obj->compression) {
+		if (intel_query_gen(fd) >= 20 && obj->compression) {
 			comp_pat_index  = intel_get_pat_idx_uc_comp(fd);
 			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 		}
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 54a096c03..4d50c80f1 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -52,7 +52,7 @@
 #include "igt.h"
 #include "intel_cmds_info.h"
 
-#define CCS_RATIO(fd) (intel_gen(intel_get_drm_devid(fd)) >= 20 ? 512 : 256)
+#define CCS_RATIO(fd) (intel_query_gen(fd) >= 20 ? 512 : 256)
 #define XE2_MEM_COPY_MOCS_SHIFT                     25
 
 enum blt_color_depth {
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 475b0d1f7..a5b130510 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -462,8 +462,7 @@ typedef void *(*tile_fn)(void *, unsigned int, unsigned int,
 			unsigned int, unsigned int);
 static tile_fn __get_tile_fn_ptr(int fd, int tiling)
 {
-	const struct intel_device_info *info =
-		intel_get_device_info(intel_get_drm_devid(fd));
+	const struct intel_device_info *info = intel_query_device_info(fd);
 	tile_fn fn = NULL;
 
 	switch (tiling) {
@@ -1061,7 +1060,7 @@ static void __intel_buf_init(struct buf_ops *bops,
 		} else {
 			uint16_t cpu_caching = __xe_default_cpu_caching(bops->fd, region, 0);
 
-			if (intel_gen(bops->devid) >= 20 && compression)
+			if (intel_query_gen(bops->fd) >= 20 && compression)
 				cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 
 			bo_size = ALIGN(bo_size, xe_get_default_alignment(bops->fd));
@@ -1104,7 +1103,7 @@ void intel_buf_init(struct buf_ops *bops,
 	uint64_t region;
 	uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-	if (compression && intel_gen(bops->devid) >= 20)
+	if (compression && intel_query_gen(bops->fd) >= 20)
 		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
 
 	region = bops->driver == INTEL_DRIVER_I915 ? I915_SYSTEM_MEMORY :
@@ -1130,7 +1129,7 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 {
 	uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-	if (compression && intel_gen(bops->devid) >= 20)
+	if (compression && intel_query_gen(bops->fd) >= 20)
 		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
 
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
@@ -1201,7 +1200,7 @@ void intel_buf_init_using_handle_and_size(struct buf_ops *bops,
 	igt_assert(handle);
 	igt_assert(size);
 
-	if (compression && intel_gen(bops->devid) >= 20)
+	if (compression && intel_query_gen(bops->fd) >= 20)
 		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
 
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
@@ -1756,7 +1755,7 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 	igt_assert(bops);
 
 	devid = intel_get_drm_devid(fd);
-	generation = intel_gen(devid);
+	generation = intel_query_gen(fd);
 
 	/* Predefined settings: see intel_device_info? */
 	for (int i = 0; i < ARRAY_SIZE(buf_ops_arr); i++) {
diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
index 760faede2..4b1cb3b97 100644
--- a/lib/intel_chipset.c
+++ b/lib/intel_chipset.c
@@ -189,3 +189,59 @@ intel_check_pch(void)
 		return;
 	}
 }
+
+/**
+ * intel_query_gen:
+ * @fd: open i915/xe drm file descriptor
+ *
+ * Returns gen IP version for device @fd. For i915 devices,
+ * falls back to i915 graphics version lookup.
+ */
+unsigned intel_query_gen(int fd)
+{
+	struct xe_device *xe_dev;
+
+	if (is_i915_device(fd))
+		return intel_gen(intel_get_drm_devid(fd));
+
+	xe_dev = xe_device_get(fd);
+
+	return xe_dev->info.graphics_ver;
+}
+/**
+ * intel_query_graphics_ver:
+ * @fd: open i915/xe drm file descriptor
+ *
+ * Returns graphics IP version for device @fd. For i915 devices,
+ * falls back to i915 graphics version lookup.
+ */
+unsigned intel_query_graphics_ver(int fd)
+{
+	struct xe_device *xe_dev;
+
+	if (is_i915_device(fd))
+		return intel_graphics_ver(intel_get_drm_devid(fd));
+
+	xe_dev = xe_device_get(fd);
+
+	return IP_VER(xe_dev->info.graphics_ver, xe_dev->info.graphics_rel);
+}
+
+/**
+ * intel_query_device_info:
+ * @fd: open i915/xe drm file descriptor
+ *
+ * Returns device information structure for device @fd. For i915 devices,
+ * falls back to i915 device info lookup.
+ */
+const struct intel_device_info *intel_query_device_info(int fd)
+{
+	struct xe_device *xe_dev;
+
+	if (is_i915_device(fd))
+		return intel_get_device_info(intel_get_drm_devid(fd));
+
+	xe_dev = xe_device_get(fd);
+
+	return &xe_dev->info;
+}
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 2f6bf788a..61bdc1084 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -104,6 +104,9 @@ const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__(
 unsigned intel_gen(uint16_t devid) __attribute__((pure));
 unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
 unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
+unsigned intel_query_gen(int fd);
+unsigned intel_query_graphics_ver(int fd);
+const struct intel_device_info *intel_query_device_info(int fd);
 
 extern enum pch_type intel_pch;
 
diff --git a/lib/intel_common.c b/lib/intel_common.c
index 8b8f4652a..8c7d48f54 100644
--- a/lib/intel_common.c
+++ b/lib/intel_common.c
@@ -82,16 +82,16 @@ bool is_intel_vram_region(int fd, uint64_t region)
  */
 bool is_intel_region_compressible(int fd, uint64_t region)
 {
-	uint32_t devid = intel_get_drm_devid(fd);
+	const struct intel_device_info *devinfo = intel_query_device_info(fd);
 	bool is_dgfx = is_intel_dgfx(fd);
-	bool has_flatccs = HAS_FLATCCS(devid);
+	uint32_t gen = devinfo->graphics_ver;
 
 	/* Integrated or DG1 with aux-ccs */
-	if (IS_GEN12(devid) && !has_flatccs)
+	if (gen == 12 && !devinfo->has_flatccs)
 		return true;
 
 	/* Integrated Xe2+ supports compression on system memory */
-	if (intel_gen(devid) >= 20 && !is_dgfx && is_intel_system_region(fd, region))
+	if (gen >= 20 && !is_dgfx && is_intel_system_region(fd, region))
 		return true;
 
 	/* Discrete supports compression on vram */
diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 8011e8360..dc021320d 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -187,8 +187,7 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 								   eci, 0);
 		} else {
 			uint16_t engine_class;
-			uint32_t devid = intel_get_drm_devid(fd);
-			const struct intel_device_info *info = intel_get_device_info(devid);
+			const struct intel_device_info *info = intel_query_device_info(fd);
 
 			if (info->graphics_ver >= 12 && info->graphics_rel < 60)
 				engine_class = DRM_XE_ENGINE_CLASS_RENDER;
@@ -1932,7 +1931,7 @@ static bool __run_intel_compute_kernel(int fd,
 				       struct user_execenv *user,
 				       enum execenv_alloc_prefs alloc_prefs)
 {
-	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_query_graphics_ver(fd);
 	unsigned int batch;
 	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
 	enum intel_driver driver = get_intel_driver(fd);
@@ -2222,7 +2221,7 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 		bool threadgroup_preemption,
 		enum execenv_alloc_prefs alloc_prefs)
 {
-	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int ip_ver = intel_query_graphics_ver(fd);
 	unsigned int batch;
 	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
 	enum intel_driver driver = get_intel_driver(fd);
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index a853f9ab4..4c35a422f 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -505,7 +505,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
 
 static const struct intel_device_info intel_lunarlake_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 4,
 	.display_ver = 20,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -517,7 +516,6 @@ static const struct intel_device_info intel_lunarlake_info = {
 
 static const struct intel_device_info intel_battlemage_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 1,
 	.display_ver = 14,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -529,7 +527,6 @@ static const struct intel_device_info intel_battlemage_info = {
 
 static const struct intel_device_info intel_pantherlake_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 0,
 	.display_ver = 30,
 	.has_4tile = true,
 	.has_flatccs = true,
diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index e0c33c31c..b8b62e803 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -14,7 +14,7 @@ struct drm_intel_mocs_index {
 
 static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
 {
-	uint16_t devid = intel_get_drm_devid(fd);
+	const struct intel_device_info *devinfo = intel_query_device_info(fd);
 
 	/*
 	 * Gen >= 12 onwards don't have a setting for PTE,
@@ -23,20 +23,20 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
 	 * This helper function is providing current UC as well
 	 * as WB MOCS index based on platform.
 	 */
-	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
+	if (intel_query_graphics_ver(fd) >= IP_VER(20, 0)) {
 		mocs->uc_index = 3;
 		mocs->wb_index = 4;
 		mocs->defer_to_pat_index = 0;
-	} else if (IS_METEORLAKE(devid)) {
+	} else if (devinfo->is_meteorlake) {
 		mocs->uc_index = 5;
 		mocs->wb_index = 1;
-	} else if (IS_DG2(devid)) {
+	} else if (devinfo->is_dg2) {
 		mocs->uc_index = 1;
 		mocs->wb_index = 3;
-	} else if (IS_DG1(devid)) {
+	} else if (devinfo->is_dg1) {
 		mocs->uc_index = 1;
 		mocs->wb_index = 5;
-	} else if (IS_GEN12(devid)) {
+	} else if (devinfo->graphics_ver == 12) {
 		mocs->uc_index = 3;
 		mocs->wb_index = 2;
 	} else {
@@ -66,9 +66,8 @@ uint8_t intel_get_uc_mocs_index(int fd)
 uint8_t intel_get_defer_to_pat_mocs_index(int fd)
 {
 	struct drm_intel_mocs_index mocs;
-	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	igt_assert(intel_gen(dev_id) >= 20);
+	igt_assert(intel_query_gen(fd) >= 20);
 
 	get_mocs_index(fd, &mocs);
 
diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 156b1ee5d..2769cb116 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -17,10 +17,10 @@ struct intel_pat_cache {
 
 static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
+	const struct intel_device_info *devinfo = intel_query_device_info(fd);
+	uint32_t ip_ver = intel_query_graphics_ver(fd);
 
-	if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
-	    intel_get_device_info(dev_id)->graphics_ver == 20) {
+	if (devinfo->graphics_ver == 30 || devinfo->graphics_ver == 20) {
 		pat->uc = 3;
 		pat->wt = 15; /* Compressed + WB-transient */
 		pat->wb = 2;
@@ -28,19 +28,19 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 		pat->max_index = 31;
 
 		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
-		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
+		if (ip_ver == IP_VER(20, 1))
 			pat->max_index -= 4;
-	} else if (IS_METEORLAKE(dev_id)) {
+	} else if (devinfo->is_meteorlake) {
 		pat->uc = 2;
 		pat->wt = 1;
 		pat->wb = 3;
 		pat->max_index = 3;
-	} else if (IS_PONTEVECCHIO(dev_id)) {
+	} else if (devinfo->is_pontevecchio) {
 		pat->uc = 0;
 		pat->wt = 2;
 		pat->wb = 3;
 		pat->max_index = 7;
-	} else if (intel_graphics_ver(dev_id) <= IP_VER(12, 60)) {
+	} else if (ip_ver <= IP_VER(12, 60)) {
 		pat->uc = 3;
 		pat->wt = 2;
 		pat->wb = 0;
@@ -69,9 +69,8 @@ uint8_t intel_get_pat_idx_uc(int fd)
 uint8_t intel_get_pat_idx_uc_comp(int fd)
 {
 	struct intel_pat_cache pat = {};
-	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	igt_assert(intel_gen(dev_id) >= 20);
+	igt_assert(intel_query_gen(fd) >= 20);
 
 	intel_get_pat_idx(fd, &pat);
 	return pat.uc_comp;
diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 176cbdacc..457fd2ea9 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1072,7 +1072,7 @@ void gem_require_ring(int fd, unsigned ring)
  */
 bool gem_has_mocs_registers(int fd)
 {
-	return intel_gen(intel_get_drm_devid(fd)) >= 9;
+	return intel_query_gen(fd) >= 9;
 }
 
 /**
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index e6e5b8214..5cbdf044e 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -256,12 +256,12 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 	if (buf->compression == I915_COMPRESSION_MEDIA)
 		ss->ss7.tgl.media_compression = 1;
 	else if (buf->compression == I915_COMPRESSION_RENDER) {
-		if (intel_gen(ibb->devid) >= 20)
+		if (intel_query_gen(ibb->fd) >= 20)
 			ss->ss6.aux_mode = 0x0; /* AUX_NONE, unified compression */
 		else
 			ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
 
-		if (intel_gen(ibb->devid) < 12 && buf->ccs[0].stride) {
+		if (intel_query_gen(ibb->fd) < 12 && buf->ccs[0].stride) {
 			ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
 
 			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
@@ -303,7 +303,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
 			ss->ss7.dg2.disable_support_for_multi_gpu_atomics = 1;
 
-			if (intel_gen(ibb->devid) >= 20)
+			if (intel_query_gen(ibb->fd) >= 20)
 				ss->ss12.lnl.compression_format = lnl_compression_format(buf);
 			else
 				ss->ss12.dg2.compression_format = dg2_compression_format(buf);
@@ -681,7 +681,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
 	/* WaBindlessSurfaceStateModifyEnable:skl,bxt */
 	/* The length has to be one less if we dont modify
 	   bindless state */
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_query_gen(ibb->fd) >= 20)
 		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | 20);
 	else
 		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | (19 - 1 - 2));
@@ -726,7 +726,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
 
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
+	if (intel_query_gen(ibb->fd) >= 20) {
 		/* Bindless sampler */
 		intel_bb_out(ibb, 0);
 		intel_bb_out(ibb, 0);
@@ -899,7 +899,7 @@ gen9_emit_ds(struct intel_bb *ibb) {
 
 static void
 gen8_emit_wm_hz_op(struct intel_bb *ibb) {
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
+	if (intel_query_gen(ibb->fd) >= 20) {
 		intel_bb_out(ibb, GEN8_3DSTATE_WM_HZ_OP | (6-2));
 		intel_bb_out(ibb, 0);
 	} else {
@@ -989,7 +989,7 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	intel_bb_out(ibb, 0);
 
 	intel_bb_out(ibb, GEN7_3DSTATE_PS | (12-2));
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_query_gen(ibb->fd) >= 20)
 		intel_bb_out(ibb, kernel | 1);
 	else
 		intel_bb_out(ibb, kernel);
@@ -1006,7 +1006,7 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	intel_bb_out(ibb, (max_threads - 1) << GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
 	             GEN6_3DSTATE_WM_16_DISPATCH_ENABLE |
 	             (fast_clear ? GEN8_3DSTATE_FAST_CLEAR_ENABLE : 0));
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_query_gen(ibb->fd) >= 20)
 		intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT |
 			     GENXE_KERNEL0_POLY_PACK16_FIXED << GENXE_KERNEL0_PACKING_POLICY);
 	else
@@ -1061,7 +1061,7 @@ gen9_emit_depth(struct intel_bb *ibb)
 
 static void
 gen7_emit_clear(struct intel_bb *ibb) {
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_query_gen(ibb->fd) >= 20)
 		return;
 
 	intel_bb_out(ibb, GEN7_3DSTATE_CLEAR_PARAMS | (3-2));
@@ -1072,7 +1072,7 @@ gen7_emit_clear(struct intel_bb *ibb) {
 static void
 gen6_emit_drawing_rectangle(struct intel_bb *ibb, const struct intel_buf *dst)
 {
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
+	if (intel_query_gen(ibb->fd) >= 20)
 		intel_bb_out(ibb, GENXE2_3DSTATE_DRAWING_RECTANGLE_FAST | (4 - 2));
 	else
 		intel_bb_out(ibb, GEN4_3DSTATE_DRAWING_RECTANGLE | (4 - 2));
@@ -1266,7 +1266,7 @@ void _gen9_render_op(struct intel_bb *ibb,
 
 	gen9_emit_state_base_address(ibb);
 
-	if (HAS_4TILE(ibb->devid) || intel_gen(ibb->devid) > 12) {
+	if (intel_query_device_info(ibb->fd)->has_4tile || intel_query_gen(ibb->fd) > 12) {
 		intel_bb_out(ibb, GEN4_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2);
 		intel_bb_emit_reloc(ibb, ibb->handle,
 				    I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0,
diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 084445305..8e17ecff4 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -75,7 +75,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
 
 	if (flags & COMPRESSION)
-		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
+		igt_require(intel_query_gen(fd) >= 20);
 
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 428e7d0a2..a7fbf413a 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -447,7 +447,7 @@ static void query_hwconfig(int fd, struct intel_xe_topology_info *topinfo)
 struct intel_xe_topology_info *
 xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
 {
-	const struct intel_device_info *devinfo = intel_get_device_info(device_id);
+	const struct intel_device_info *devinfo = intel_query_device_info(drm_fd);
 	struct intel_xe_topology_info topinfo = {};
 	struct intel_xe_topology_info *ptopo;
 	struct drm_xe_query_topology_mask *xe_topo;
@@ -461,7 +461,7 @@ xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
 	};
 
 	/* Only ADL-P, DG2 and newer ip support hwconfig, use hardcoded values for previous */
-	if (intel_graphics_ver(device_id) >= IP_VER(12, 55) || devinfo->is_alderlake_p) {
+	if (intel_query_graphics_ver(drm_fd) >= IP_VER(12, 55) || devinfo->is_alderlake_p) {
 		query_hwconfig(drm_fd, &topinfo);
 	} else {
 		topinfo.max_slices = 1;
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a89e0b980..c88ed9c36 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -20,6 +20,7 @@
 
 #include "drmtest.h"
 #include "ioctl_wrappers.h"
+#include "igt_core.h"
 #include "igt_map.h"
 
 #include "xe_query.h"
@@ -375,9 +376,16 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gt_list = xe_query_gt_list_new(fd);
 
+	memcpy(&xe_dev->info, intel_get_device_info(xe_dev->dev_id), sizeof(xe_dev->info));
+
 	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
-	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
 		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
+		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN) {
+			igt_assert(xe_dev->info.graphics_ver == xe_dev->gt_list->gt_list[gt].ip_ver_major);
+			xe_dev->info.graphics_rel = xe_dev->gt_list->gt_list[gt].ip_ver_minor;
+		}
+	}
 
 	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 715b64e2f..eefeb47dc 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -74,6 +74,9 @@ struct xe_device {
 
 	/** @dev_id: Device id of xe device */
 	uint16_t dev_id;
+
+	/** @info: Device information for compatibility with i915 */
+	struct intel_device_info info;
 };
 
 #define xe_for_each_engine(__fd, __hwe) \
diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 2a02f7cc8..fba79eddb 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -50,9 +50,7 @@ const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res)
 
 static uint64_t get_vfid_mask(int fd)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
-
-	return (intel_graphics_ver(dev_id) >= IP_VER(12, 50)) ?
+	return (intel_query_graphics_ver(fd) >= IP_VER(12, 50)) ?
 		GGTT_PTE_VFID_MASK : PRE_1250_IP_VER_GGTT_PTE_VFID_MASK;
 }
 
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
index bf22c3475..12710f9df 100644
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
@@ -156,7 +156,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	else if (inst_type == COND_BATCH) {
 		/* A random value where it stops at the below value. */
 		value = 20 + random() % 10;
-		cond_batch(data, addr, value, dev_id);
+		cond_batch(data, addr, value, fd);
 	}
 	else
 		igt_assert_f(inst_type < 2, "Entered wrong inst_type.\n");
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
index 59dfb6b11..d7220d6b1 100644
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
+		igt_require(dev_info->is_pantherlake);
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
diff --git a/tools/intel_tiling_detect.c b/tools/intel_tiling_detect.c
index 951e2eecd..a6aca36f9 100644
--- a/tools/intel_tiling_detect.c
+++ b/tools/intel_tiling_detect.c
@@ -217,12 +217,11 @@ static void render(int fd, uint32_t width, uint32_t height, uint32_t tiling)
 	struct buf_ops *bops;
 	struct intel_bb *ibb;
 	struct intel_buf src, dst;
-	uint32_t devid = intel_get_drm_devid(fd);
 	igt_render_copyfunc_t render_copy = NULL;
 
 	bops = buf_ops_create(fd);
 
-	igt_debug("%s() gen: %d\n", __func__, intel_gen(devid));
+	igt_debug("%s() gen: %d\n", __func__, intel_query_gen(fd));
 
 	ibb = intel_bb_create(fd, SZ_4K);
 
diff --git a/tools/xe-perf/meson.build b/tools/xe-perf/meson.build
index 8506aa320..575b525e2 100644
--- a/tools/xe-perf/meson.build
+++ b/tools/xe-perf/meson.build
@@ -1,7 +1,7 @@
 executable('xe-perf-configs',
            [ 'xe_perf_configs.c' ],
            include_directories: inc,
-           dependencies: [lib_igt_chipset, lib_igt_xe_oa],
+           dependencies: [lib_igt, lib_igt_xe_oa],
            install: true)
 
 executable('xe-perf-recorder',
diff --git a/tools/xe-perf/xe_perf_configs.c b/tools/xe-perf/xe_perf_configs.c
index bd37fef5c..6ee261f88 100644
--- a/tools/xe-perf/xe_perf_configs.c
+++ b/tools/xe-perf/xe_perf_configs.c
@@ -192,7 +192,7 @@ main(int argc, char *argv[])
 
 	fprintf(stdout, "Found device id=0x%x\n", devid);
 
-	devinfo = intel_get_device_info(drm_fd);
+	devinfo = intel_query_device_info(drm_fd);
 	if (!devinfo) {
 		fprintf(stderr, "No device info found.\n");
 		return EXIT_FAILURE;
diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index f200fe9c9..7ce4a5684 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -1029,7 +1029,7 @@ main(int argc, char *argv[])
 
 	xe_device_get(ctx.drm_fd);
 
-	ctx.devinfo = intel_get_device_info(ctx.devid);
+	ctx.devinfo = intel_query_device_info(ctx.drm_fd);
 	if (!ctx.devinfo) {
 		fprintf(stderr, "No device info found.\n");
 		goto fail;
-- 
2.43.0

