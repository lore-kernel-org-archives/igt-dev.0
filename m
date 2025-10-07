Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB412CCA476
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 23:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357A510E718;
	Tue,  7 Oct 2025 23:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xa2Gl955";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7E210E718
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Oct 2025 23:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759879600; x=1791415600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zLGxcUNpRumIHCTRhRNAHRu4a3Ertrvie5JR2CLC7E8=;
 b=Xa2Gl955qp8BTMFSzxHetUgWeIijQ5bXdJJYu4Iapu1G+Xl1Tz96KQSo
 gazGMwfRkqq8Cp4BQGd3inXhDsHUQYNJN4T8O8r3cR/LZX81SLQdl9xzQ
 L5SLUab/QBV5PImtva6zwAyiFCl456Ghqr9Je0BVUUThzNUHxauoGcacF
 X+LxFciLmENfiZhS7iPtgkz0dmemA6SnAYduSYkFKu09NJnfSanSu9mFb
 TLEB7d1lC1Q54ITAp+alzWguCggCk25YfRHcWfapTG855TFO9kAZRmb0J
 BwN8VcYy5dQ1yZszo/iUMh4o9PRdZ/woM4L17DexsaMR5+Aods6cUPKil w==;
X-CSE-ConnectionGUID: Gl6YPljoROq0vEhKeGeFYA==
X-CSE-MsgGUID: o8KRse5XRFuCp+4QB9lcGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="79717936"
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="79717936"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 16:26:40 -0700
X-CSE-ConnectionGUID: EF8VvmSHROS7Vdvdfg6OOA==
X-CSE-MsgGUID: A102zVkMQG2hSjfi2da+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="179882169"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.61])
 by orviesa009.jf.intel.com with ESMTP; 07 Oct 2025 16:26:40 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v2 3/6] lib: Use new APIs for xe device info queries
Date: Tue,  7 Oct 2025 23:26:03 +0000
Message-ID: <20251007232606.363629-4-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007232606.363629-1-x.wang@intel.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251007232606.363629-1-x.wang@intel.com>
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

Update library functions to use new runtime query APIs:
- Replace intel_gen(devid) with intel_query_gen(fd)
- Replace intel_graphics_ver(devid) with intel_query_graphics_ver(fd)
- Replace intel_get_device_info(devid) with intel_query_device_info(fd)

These changes enable runtime device capability queries for xe devices
instead of relying on static device ID lookups, providing accurate
graphics version information including minor versions.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/gpgpu_shader.c    |  2 +-
 lib/gpu_cmds.c        | 22 +++++++++++-----------
 lib/igt_draw.c        |  6 ++----
 lib/igt_gt.c          | 10 ++++------
 lib/igt_store.c       |  2 +-
 lib/intel_blt.c       | 21 +++++++++------------
 lib/intel_blt.h       |  2 +-
 lib/intel_bufops.c    | 13 ++++++-------
 lib/intel_common.c    |  8 ++++----
 lib/intel_compute.c   |  7 +++----
 lib/intel_mocs.c      | 15 +++++++--------
 lib/intel_pat.c       | 17 ++++++++---------
 lib/ioctl_wrappers.c  |  2 +-
 lib/rendercopy_gen9.c | 22 +++++++++++-----------
 14 files changed, 69 insertions(+), 80 deletions(-)

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
-- 
2.43.0

