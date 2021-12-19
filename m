Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8E112AF7E
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Dec 2021 13:10:02 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sun, 19 Dec 2021 18:44:40 +0530
Message-Id: <20211219131443.472654-3-apoorva1.singh@intel.com>
In-Reply-To: <20211219131443.472654-1-apoorva1.singh@intel.com>
References: <20211219131443.472654-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t, v5 2/5] lib/i915: Introduce library i915_blt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com, igt-dev@lists.freedesktop.org, ramalingam.c@intel.com, zbigniew.kempczynski@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add new library 'i915_blt' for various blt commands.

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 lib/i915/i915_blt.c | 393 ++++++++++++++++++++++++++++++++++++++++++++
 lib/i915/i915_blt.h |  72 ++++++++
 lib/meson.build     |   1 +
 3 files changed, 466 insertions(+)
 create mode 100644 lib/i915/i915_blt.c
 create mode 100644 lib/i915/i915_blt.h

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
new file mode 100644
index 00000000..5d6d53e1
--- /dev/null
+++ b/lib/i915/i915_blt.c
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include <errno.h>
+#include <sys/ioctl.h>
+#include <sys/time.h>
+#include <malloc.h>
+#include "drm.h"
+#include "igt.h"
+#include "i915_blt.h"
+#include "i915/intel_mocs.h"
+
+/*
+ * make_block_copy_batch:
+ * @fd: open i915 drm file descriptor
+ * @batch_buf: the batch buffer to populate with the command
+ * @src: handle of the source BO
+ * @dst: handle of the destination BO
+ * @length: size of the src and dest BOs
+ * @reloc: pointer to the relocation entry for this command
+ * @offset_src: source address offset
+ * @offset_dst: destination address offset
+ * @copy_mode: different modes of copy
+ * @enable_compression: flag to enable compression
+ * @return: length of batch buffer created
+ */
+static int make_block_copy_batch(int fd, uint32_t *batch_buf,
+				 uint32_t src, uint32_t dst, uint32_t length,
+				 struct drm_i915_gem_relocation_entry *reloc,
+				 uint64_t offset_src, uint64_t offset_dst,
+				 enum copy_mode mode, bool enable_compression)
+{
+	uint32_t *b = batch_buf;
+	uint32_t devid;
+	uint8_t src_mocs = intel_get_uc_mocs(fd);
+	uint8_t dst_mocs = src_mocs;
+	int src_mem_type, dst_mem_type;
+	int dst_compression, src_compression;
+	int resolve;
+
+	devid = intel_get_drm_devid(fd);
+
+	igt_assert(AT_LEAST_GEN(devid, 12));
+
+	switch (mode) {
+	case SYS_TO_SYS: /* copy from smem to smem */
+		src_mem_type = MEM_TYPE_SYS;
+		dst_mem_type = MEM_TYPE_SYS;
+		src_compression = 0;
+		dst_compression = 0;
+		resolve = NO_RESOLVE;
+		break;
+	case SYS_TO_LOCAL: /* copy from smem to lmem */
+		src_mem_type = MEM_TYPE_SYS;
+		dst_mem_type = MEM_TYPE_LOCAL;
+		src_compression = 0;
+		dst_compression = enable_compression ? (COMPRESSION_ENABLE | AUX_CCS_E) : 0;
+		resolve = NO_RESOLVE;
+		break;
+	case LOCAL_TO_SYS: /* copy from lmem to smem */
+		src_mem_type = MEM_TYPE_LOCAL;
+		dst_mem_type = MEM_TYPE_SYS;
+		src_compression = enable_compression ? (COMPRESSION_ENABLE | AUX_CCS_E) : 0;
+		dst_compression = 0;
+		resolve = NO_RESOLVE;
+		break;
+	case LOCAL_TO_LOCAL: /* copy from lmem to lmem */
+		src_mem_type = MEM_TYPE_LOCAL;
+		dst_mem_type = MEM_TYPE_LOCAL;
+		src_compression = enable_compression ? (COMPRESSION_ENABLE | AUX_CCS_E) : 0;
+		dst_compression = enable_compression ? (COMPRESSION_ENABLE | AUX_CCS_E) : 0;
+		resolve = (src == dst) ? FULL_RESOLVE : NO_RESOLVE;
+		break;
+	}
+
+	/* BG 0 */
+	b[0] = BLOCK_COPY_BLT_CMD | (resolve << 12);
+
+	/* BG 1
+	 *
+	 * Using Tile 4 dimensions.  Height = 32 rows
+	 * Width = 128 bytes
+	 */
+	b[1] = dst_compression | TILE_4_FORMAT | TILE_4_WIDTH_DWORD |
+		dst_mocs << XY_BLOCK_COPY_BLT_MOCS_SHIFT;
+
+	/* BG 3
+	 *
+	 * X2 = TILE_4_WIDTH
+	 * Y2 = (length / TILE_4_WIDTH) << 16:
+	 */
+	b[3] = TILE_4_WIDTH | (length >> 7) << DEST_Y2_COORDINATE_SHIFT;
+
+	b[4] = offset_dst;
+	b[5] = offset_dst >> 32;
+
+	/* relocate address in b[4] and b[5] */
+	reloc->offset = 4 * (sizeof(uint32_t));
+	reloc->delta = 0;
+	reloc->target_handle = dst;
+	reloc->read_domains = I915_GEM_DOMAIN_RENDER;
+	reloc->write_domain = I915_GEM_DOMAIN_RENDER;
+	reloc->presumed_offset = 0;
+	reloc++;
+
+	/* BG 6 */
+	b[6] = dst_mem_type << DEST_MEM_TYPE_SHIFT;
+
+	/* BG 8 */
+	b[8] = src_compression | TILE_4_WIDTH_DWORD | TILE_4_FORMAT |
+		src_mocs << XY_BLOCK_COPY_BLT_MOCS_SHIFT;
+
+	b[9] = offset_src;
+	b[10] = offset_src >> 32;
+
+	/* relocate address in b[9] and b[10] */
+	reloc->offset = 9 * sizeof(uint32_t);
+	reloc->delta = 0;
+	reloc->target_handle = src;
+	reloc->read_domains = I915_GEM_DOMAIN_RENDER;
+	reloc->write_domain = 0;
+	reloc->presumed_offset = 0;
+	reloc++;
+
+	/* BG 11 */
+	b[11] = src_mem_type << SRC_MEM_TYPE_SHIFT;
+
+	/* BG 16  */
+	b[16] = SURFACE_TYPE_2D |
+		((TILE_4_WIDTH - 1) << DEST_SURF_WIDTH_SHIFT) |
+		(TILE_4_HEIGHT - 1);
+
+	/* BG 19 */
+	b[19] = SURFACE_TYPE_2D |
+		((TILE_4_WIDTH - 1) << SRC_SURF_WIDTH_SHIFT) |
+		(TILE_4_HEIGHT - 1);
+
+	b += XY_BLOCK_COPY_BLT_LEN_DWORD;
+
+	b[0] = MI_FLUSH_DW | MI_FLUSH_LLC | MI_INVALIDATE_TLB;
+	reloc->offset = 23 * sizeof(uint32_t);
+	reloc->delta = 0;
+	reloc->target_handle = dst_compression > 0 ? dst : src;
+	reloc->read_domains = 0;
+	reloc->write_domain = 0;
+	reloc->presumed_offset = 0;
+	reloc++;
+	b[3] = 0;
+
+	b[4] = MI_FLUSH_DW | MI_FLUSH_CCS;
+	reloc->offset = 27 * sizeof(uint32_t);
+	reloc->delta = 0;
+	reloc->target_handle = dst_compression > 0 ? dst : src;
+	reloc->read_domains = 0;
+	reloc->write_domain = 0;
+	reloc->presumed_offset = 0;
+	reloc++;
+	b[7] = 0;
+
+	b[8] = MI_BATCH_BUFFER_END;
+	b[9] = 0;
+
+	b += 10;
+
+	return (b - batch_buf) * sizeof(uint32_t);
+}
+
+void xy_block_copy_blt(int fd, uint32_t bb_region, uint32_t src, uint32_t dst,
+		       uint64_t src_size, uint64_t dst_size, uint64_t ahnd,
+		       uint32_t length, enum copy_mode mode, bool enable_compression,
+		       uint32_t ctx, struct intel_execution_engine2 *e)
+{
+	struct drm_i915_gem_relocation_entry reloc[4];
+	struct drm_i915_gem_exec_object2 exec[3];
+	struct drm_i915_gem_execbuffer2 execbuf;
+	int len;
+	uint32_t cmd, batch_buf[BATCH_SIZE / sizeof(uint32_t)] = {};
+	uint64_t offset_src, offset_dst, offset_bb, bb_size, ret;
+
+	bb_size = BATCH_SIZE;
+	ret = __gem_create_in_memory_regions(fd, &cmd, &bb_size, bb_region);
+	igt_assert_eq(ret, 0);
+
+	offset_src = get_offset(ahnd, src, src_size, 0);
+	offset_dst = get_offset(ahnd, dst, dst_size, 0);
+	offset_bb = get_offset(ahnd, cmd, bb_size, 0);
+
+	/* construct the batch buffer */
+	memset(reloc, 0, sizeof(reloc));
+	len = make_block_copy_batch(fd, batch_buf, src, dst, length, reloc,
+				    offset_src, offset_dst, mode,
+				    enable_compression);
+
+	/* write batch buffer to 'cmd' BO */
+	gem_write(fd, cmd, 0, batch_buf, len);
+
+	/* Execute the batch buffer */
+	memset(exec, 0, sizeof(exec));
+	exec[0].handle = src;
+	exec[1].handle = dst;
+	exec[2].handle = cmd;
+	exec[2].relocation_count = !ahnd ? 4 : 0;
+	exec[2].relocs_ptr = to_user_pointer(reloc);
+	if (ahnd) {
+		exec[0].offset = offset_src;
+		exec[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		exec[1].offset = offset_dst;
+		exec[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
+				 EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		exec[2].offset = offset_bb;
+		exec[2].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	}
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(exec);
+	execbuf.buffer_count = 3;
+	execbuf.batch_len = len;
+	execbuf.flags = e ? e->flags : I915_EXEC_BLT;
+	if (ctx)
+		execbuf.rsvd1 = ctx;
+
+	gem_execbuf(fd, &execbuf);
+	gem_close(fd, cmd);
+	put_offset(ahnd, src);
+	put_offset(ahnd, dst);
+	put_offset(ahnd, cmd);
+}
+
+/*
+ * make_ctrl_surf_batch:
+ * @fd: open i915 drm file descriptor
+ * @batch_buf: the batch buffer to populate with the command
+ * @src: handle of the source BO
+ * @dst: handle of the destination BO
+ * @length: size of the ctrl surf in bytes
+ * @reloc: pointer to the relocation entyr for this command
+ * @offset_src: source address offset
+ * @offset_dst: destination address offset
+ * @writetodev: flag to enable direct access of the address
+ * @return: length of batch buffer created
+ */
+static int make_ctrl_surf_batch(int fd, uint32_t *batch_buf,
+				uint32_t src, uint32_t dst, uint32_t length,
+				struct drm_i915_gem_relocation_entry *reloc,
+				uint64_t offset_src, uint64_t offset_dst,
+				bool writetodev)
+{
+	int num_ccs_blocks, src_mem_access, dst_mem_access;
+	uint32_t *b = batch_buf;
+	uint8_t src_mocs = intel_get_uc_mocs(fd);
+	uint8_t dst_mocs = src_mocs;
+
+	num_ccs_blocks = length / CCS_RATIO;
+	if (num_ccs_blocks < 1)
+		num_ccs_blocks = 1;
+	if (num_ccs_blocks > NUM_CCS_BLKS_PER_XFER)
+		return 0;
+
+	if (writetodev) {
+		src_mem_access = DIRECT_ACCESS;
+		dst_mem_access = INDIRECT_ACCESS;
+	} else {
+		src_mem_access = INDIRECT_ACCESS;
+		dst_mem_access = DIRECT_ACCESS;
+	}
+
+	/*
+	 * We use logical AND with 1023 since the size field
+	 * takes values which is in the range of 0 - 1023
+	 */
+	b[0] = ((XY_CTRL_SURF_COPY_BLT) |
+		(src_mem_access << SRC_ACCESS_TYPE_SHIFT) |
+		(dst_mem_access << DST_ACCESS_TYPE_SHIFT) |
+		(((num_ccs_blocks - 1) & 1023) << CCS_SIZE_SHIFT));
+
+	b[1] = offset_src;
+	b[2] = offset_src >> 32 | src_mocs << XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT;
+
+	/* relocate address in b[1] and b[2] */
+	reloc->offset = 1 * sizeof(uint32_t);
+	reloc->delta = 0;
+	reloc->target_handle = src;
+	reloc->read_domains = I915_GEM_DOMAIN_RENDER;
+	reloc->write_domain = 0;
+	reloc->presumed_offset = 0;
+	reloc++;
+
+	b[3] = offset_dst;
+	b[4] = offset_dst >> 32 | dst_mocs << XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT;
+
+	/* relocate address in b[3] and b[4] */
+	reloc->offset = 3 * (sizeof(uint32_t));
+	reloc->delta = 0;
+	reloc->target_handle = dst;
+	reloc->read_domains = I915_GEM_DOMAIN_RENDER;
+	reloc->write_domain = I915_GEM_DOMAIN_RENDER;
+	reloc->presumed_offset = 0;
+	reloc++;
+
+	b[5] = 0;
+
+	b[6] = MI_FLUSH_DW | MI_FLUSH_LLC | MI_INVALIDATE_TLB;
+
+	reloc->offset = 7 * sizeof(uint32_t);
+	reloc->delta = 0;
+	reloc->target_handle =
+	dst_mem_access == INDIRECT_ACCESS ? dst : src;
+	reloc->read_domains = 0;
+	reloc->write_domain = 0;
+	reloc->presumed_offset = 0;
+	reloc++;
+	b[9] = 0;
+
+	b[10] = MI_FLUSH_DW | MI_FLUSH_CCS;
+	reloc->offset = 11 * sizeof(uint32_t);
+	reloc->delta = 0;
+	reloc->target_handle =
+	dst_mem_access == INDIRECT_ACCESS ? dst : src;
+	reloc->read_domains = 0;
+	reloc->write_domain = 0;
+	reloc->presumed_offset = 0;
+	reloc++;
+	b[13] = 0;
+
+	b[14] = MI_BATCH_BUFFER_END;
+	b[15] = 0;
+
+	b += 16;
+
+	return (b - batch_buf) * sizeof(uint32_t);
+}
+
+void xy_ctrl_surf_copy_blt(int fd, uint32_t bb_region, uint32_t src,
+			   uint32_t dst, uint64_t src_size, uint64_t dst_size,
+			   uint64_t ahnd, uint32_t length, bool writetodev,
+			   uint32_t ctx, struct intel_execution_engine2 *e)
+{
+	struct drm_i915_gem_relocation_entry reloc[4];
+	struct drm_i915_gem_exec_object2 exec[3];
+	struct drm_i915_gem_execbuffer2 execbuf;
+	int len;
+	uint32_t cmd, batch_buf[BATCH_SIZE / sizeof(uint32_t)] = {};
+	uint64_t offset_src, offset_dst, offset_bb, bb_size, ret;
+
+	bb_size = BATCH_SIZE;
+	ret = __gem_create_in_memory_regions(fd, &cmd, &bb_size, bb_region);
+	igt_assert_eq(ret, 0);
+
+	offset_src = get_offset(ahnd, src, src_size, 0);
+	offset_dst = get_offset(ahnd, dst, dst_size, 0);
+	offset_bb = get_offset(ahnd, cmd, bb_size, 0);
+
+	/* construct batch command buffer */
+	memset(reloc, 0, sizeof(reloc));
+	len = make_ctrl_surf_batch(fd, batch_buf, src, dst, length, reloc,
+				   offset_src, offset_dst, writetodev);
+
+	/* Copy the batch buff to BO cmd */
+	gem_write(fd, cmd, 0, batch_buf, len);
+
+	/* Execute the batch buffer */
+	memset(exec, 0, sizeof(exec));
+	exec[0].handle = src;
+	exec[1].handle = dst;
+	exec[2].handle = cmd;
+	exec[2].relocation_count = !ahnd ? 4 : 0;
+	exec[2].relocs_ptr = to_user_pointer(reloc);
+	if (ahnd) {
+		exec[0].offset = offset_src;
+		exec[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		exec[1].offset = offset_dst;
+		exec[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
+				 EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		exec[2].offset = offset_bb;
+		exec[2].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	}
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(exec);
+	execbuf.buffer_count = 3;
+	execbuf.batch_len = len;
+	execbuf.flags = e ? e->flags : I915_EXEC_BLT;
+	if (ctx)
+		execbuf.rsvd1 = ctx;
+
+	gem_execbuf(fd, &execbuf);
+	gem_close(fd, cmd);
+	put_offset(ahnd, src);
+	put_offset(ahnd, dst);
+	put_offset(ahnd, cmd);
+}
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
new file mode 100644
index 00000000..ff3eee7f
--- /dev/null
+++ b/lib/i915/i915_blt.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include <errno.h>
+#include <sys/ioctl.h>
+#include <sys/time.h>
+#include <malloc.h>
+#include "drm.h"
+#include "igt.h"
+
+#define MI_FLUSH_DW_LEN_DWORD	4
+#define MI_FLUSH_DW		(0x26 << 23 | 1)
+#define MI_FLUSH_CCS		BIT(16)
+#define MI_FLUSH_LLC		BIT(9)
+#define MI_INVALIDATE_TLB	BIT(18)
+
+/* XY_BLOCK_COPY_BLT instruction has 22 bit groups 1 DWORD each */
+#define XY_BLOCK_COPY_BLT_LEN_DWORD	22
+#define BLOCK_COPY_BLT_CMD		(2 << 29 | 0x41 << 22 | 0x14)
+#define COMPRESSION_ENABLE		BIT(29)
+#define AUX_CCS_E			(5 << 18)
+#define NO_RESOLVE			0
+#define FULL_RESOLVE			1
+#define PARTIAL_RESOLVE			2
+#define TILE_4_FORMAT			(2 << 30)
+#define TILE_4_WIDTH			(128)
+#define TILE_4_WIDTH_DWORD		((128 >> 2) - 1)
+#define TILE_4_HEIGHT			(32)
+#define SURFACE_TYPE_2D			BIT(29)
+
+#define DEST_Y2_COORDINATE_SHIFT	(16)
+#define DEST_MEM_TYPE_SHIFT		(31)
+#define SRC_MEM_TYPE_SHIFT		(31)
+#define DEST_SURF_WIDTH_SHIFT		(14)
+#define SRC_SURF_WIDTH_SHIFT		(14)
+
+#define XY_CTRL_SURF_COPY_BLT		(2 << 29 | 0x48 << 22 | 3)
+#define SRC_ACCESS_TYPE_SHIFT		21
+#define DST_ACCESS_TYPE_SHIFT		20
+#define CCS_SIZE_SHIFT			8
+#define MI_INSTR(opcode, flags) (((opcode) << 23) | (flags))
+#define MI_ARB_CHECK			MI_INSTR(0x05, 0)
+#define NUM_CCS_BLKS_PER_XFER		1024
+#define INDIRECT_ACCESS                 0
+#define DIRECT_ACCESS                   1
+
+#define BATCH_SIZE			4096
+#define BOSIZE_MIN			(4 * 1024)
+#define BOSIZE_MAX			(4 * 1024 * 1024)
+#define CCS_RATIO			256
+
+#define MEM_TYPE_SYS			1
+#define MEM_TYPE_LOCAL			0
+
+enum copy_mode {
+	SYS_TO_SYS = 0,
+	SYS_TO_LOCAL,
+	LOCAL_TO_SYS,
+	LOCAL_TO_LOCAL,
+};
+
+void xy_block_copy_blt(int fd, uint32_t bb_region, uint32_t src, uint32_t dst,
+		       uint64_t src_size, uint64_t dst_size, uint64_t ahnd,
+		       uint32_t length, enum copy_mode mode, bool enable_compression,
+		       uint32_t ctx, struct intel_execution_engine2 *e);
+
+void xy_ctrl_surf_copy_blt(int fd, uint32_t bb_region, uint32_t src, uint32_t dst,
+			   uint64_t src_size, uint64_t dst_size, uint64_t ahnd,
+			   uint32_t length, bool writetodev, uint32_t ctx,
+			   struct intel_execution_engine2 *e);
diff --git a/lib/meson.build b/lib/meson.build
index f500f0f1..f2924541 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -12,6 +12,7 @@ lib_sources = [
 	'i915/gem_vm.c',
 	'i915/intel_memory_region.c',
 	'i915/intel_mocs.c',
+	'i915/i915_blt.c',
 	'igt_collection.c',
 	'igt_color_encoding.c',
 	'igt_debugfs.c',
-- 
2.25.1
