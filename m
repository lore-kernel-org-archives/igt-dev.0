Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C9D6E0F0
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Nov 2021 05:46:39 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Mon,  8 Nov 2021 11:21:48 +0530
Message-Id: <20211108055149.47185-2-apoorva1.singh@intel.com>
In-Reply-To: <20211108055149.47185-1-apoorva1.singh@intel.com>
References: <20211108055149.47185-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/i915: Introduce libraries i915_blt
 and intel_mocs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com, igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add new libraries i915_blt and intel_mocs for various blt
commands and mocs settings.

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 lib/i915/i915_blt.c   | 419 ++++++++++++++++++++++++++++++++++++++++++
 lib/i915/i915_blt.h   |  93 ++++++++++
 lib/i915/intel_mocs.c |  75 ++++++++
 lib/i915/intel_mocs.h |  43 +++++
 lib/meson.build       |   2 +
 5 files changed, 632 insertions(+)
 create mode 100644 lib/i915/i915_blt.c
 create mode 100644 lib/i915/i915_blt.h
 create mode 100644 lib/i915/intel_mocs.c
 create mode 100644 lib/i915/intel_mocs.h

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
new file mode 100644
index 00000000..a3771f40
--- /dev/null
+++ b/lib/i915/i915_blt.c
@@ -0,0 +1,419 @@
+/*
+ * Copyright © 2020 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *	Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
+ *
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
+ * @src: fd of the source BO
+ * @dst: fd of the destination BO
+ * @length: size of the src and dest BOs
+ * @reloc: pointer to the relocation entyr for this command
+ * @src_mem_type: source memory type (denotes direct or indirect
+ *			addressing)
+ * @dst_mem_type: destination memory type (denotes direct or indirect
+ *			addressing)
+ * @src_compression: flag to enable uncompressed read of compressed data
+ *			at the source
+ * @dst_compression: flag to enable compressed write at the destination
+ * @resolve: flag to enable resolve of compressed data
+ */
+static int make_block_copy_batch(int fd, uint32_t *batch_buf,
+				 uint32_t src, uint32_t dst, uint32_t length,
+				 struct drm_i915_gem_relocation_entry *reloc,
+				 int src_mem_type, int dst_mem_type,
+				 int src_compression, int dst_compression,
+				 int resolve)
+{
+	uint32_t *b = batch_buf;
+	uint8_t src_mocs = intel_get_uc_mocs(fd);
+	uint8_t dst_mocs = src_mocs;
+
+	/* BG 0 */
+	b[0] = BLOCK_COPY_BLT_CMD | resolve;
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
+static int __xy_block_copy_blt(int fd, uint32_t cmd,
+			       uint32_t *batch_buf,
+			       uint32_t src, uint32_t dst,
+			       uint32_t length, int mode, uint32_t ctx,
+			       struct intel_execution_engine2 *e)
+{
+	struct drm_i915_gem_relocation_entry reloc[4];
+	struct drm_i915_gem_exec_object2 exec[3];
+	struct drm_i915_gem_execbuffer2 execbuf;
+	int len;
+	int src_mem_type, dst_mem_type;
+	int dst_compression, src_compression;
+	int resolve;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
+
+	if (mode == 2) { /* in-place decompress */
+		src_mem_type = MEM_TYPE_LOCAL;
+		dst_mem_type = MEM_TYPE_LOCAL;
+		src_compression = COMPRESSION_ENABLE | AUX_CCS_E;
+		dst_compression = COMPRESSION_ENABLE | AUX_CCS_E;
+		resolve = FULL_RESOLVE;
+	} else if (mode == 1) { /* copy from smem to lmem */
+		src_mem_type = MEM_TYPE_SYS;
+		dst_mem_type = MEM_TYPE_LOCAL;
+		src_compression = 0;
+		dst_compression = COMPRESSION_ENABLE | AUX_CCS_E;
+		resolve = 0;
+	} else { /* copy from lmem to smem */
+		src_mem_type = MEM_TYPE_LOCAL;
+		dst_mem_type = MEM_TYPE_SYS;
+		src_compression = COMPRESSION_ENABLE | AUX_CCS_E;
+		dst_compression = 0;
+		resolve = 0;
+	}
+
+	/* construct the batch buffer */
+	memset(reloc, 0, sizeof(reloc));
+	memset(batch_buf, 0, BATCH_SIZE);
+	len = make_block_copy_batch(fd, batch_buf,
+				    src, dst, length, reloc,
+				    src_mem_type, dst_mem_type,
+				    src_compression, dst_compression,
+				    resolve);
+	igt_assert(len > 0);
+
+	/* write batch buffer to 'cmd' BO */
+	gem_write(fd, cmd, 0, batch_buf, len);
+
+	/* Execute the batch buffer */
+	memset(exec, 0, sizeof(exec));
+	if (mode == 2) {
+		exec[0].handle = dst;
+		exec[1].handle = cmd;
+		exec[1].relocation_count = !ahnd ? 4 : 0;
+		exec[1].relocs_ptr = to_user_pointer(reloc);
+		if (ahnd) {
+			exec[0].offset = get_offset(ahnd, exec[0].handle, length * CCS_RATIO, 0);
+			exec[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+			exec[1].offset = get_offset(ahnd, exec[1].handle, BATCH_SIZE, 0);
+			exec[1].flags |= EXEC_OBJECT_PINNED;
+		}
+	} else {
+		exec[0].handle = src;
+		exec[1].handle = dst;
+		exec[2].handle = cmd;
+		exec[2].relocation_count = !ahnd ? 4 : 0;
+		exec[2].relocs_ptr = to_user_pointer(reloc);
+		if (ahnd) {
+			exec[0].offset = get_offset(ahnd, exec[0].handle, length * CCS_RATIO, 0);
+			exec[0].flags |= EXEC_OBJECT_PINNED;
+			exec[1].offset = get_offset(ahnd, exec[1].handle, length * CCS_RATIO, 0);
+			exec[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+			exec[2].offset = get_offset(ahnd, exec[2].handle, BATCH_SIZE, 0);
+			exec[2].flags |= EXEC_OBJECT_PINNED;
+		}
+	}
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(exec);
+	if (mode == 2)
+		execbuf.buffer_count = 2;
+	else
+		execbuf.buffer_count = 3;
+	execbuf.batch_len = len;
+
+	if (ctx)
+		execbuf.rsvd1 = ctx;
+
+	execbuf.flags = I915_EXEC_BLT;
+	if (e)
+		execbuf.flags = e->flags;
+
+	gem_execbuf(fd, &execbuf);
+	gem_sync(fd, cmd);
+
+	return 0;
+}
+
+int xy_block_copy_blt(int fd, uint32_t cmd,
+		      uint32_t *batch_buf,
+		      uint32_t src, uint32_t dst,
+		      uint32_t length, int mode,
+		      struct intel_execution_engine2 *e)
+{
+	return __xy_block_copy_blt(fd, cmd, batch_buf, src,
+			dst, length, mode, 0, e);
+}
+
+int xy_block_copy_blt_ctx(int fd, uint32_t cmd,
+			  uint32_t *batch_buf,
+			  uint32_t src, uint32_t dst,
+			  uint32_t length, int mode, uint32_t ctx)
+{
+	return __xy_block_copy_blt(fd, cmd, batch_buf, src,
+			dst, length, mode, ctx, 0);
+}
+
+/*
+ * make_ctrl_surf_batch:
+ * @fd: open i915 drm file descriptor
+ * @batch_buf: the batch buffer to populate with the command
+ * @src: fd of the source BO
+ * @dst: fd of the destination BO
+ * @length: size of the ctrl surf in bytes
+ * @reloc: pointer to the relocation entyr for this command
+ * @src_mem_access: source memory type (denotes direct or indirect
+ *			addressing)
+ * @dst_mem_acdcess: destination memory type (denotes direct or indirect
+ *			addressing)
+ */
+static int make_ctrl_surf_batch(int fd, uint32_t *batch_buf,
+				uint32_t src, uint32_t dst, uint32_t length,
+				struct drm_i915_gem_relocation_entry *reloc,
+				int src_mem_access, int dst_mem_access)
+{
+	int num_ccs_blocks;
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
+	/*
+	 * We use logical AND with 1023 since the size field
+	 * takes values which is in the range of 0 - 1023
+	 */
+	b[0] = ((XY_CTRL_SURF_COPY_BLT) |
+		(src_mem_access << SRC_ACCESS_TYPE_SHIFT) |
+		(dst_mem_access << DST_ACCESS_TYPE_SHIFT) |
+		(((num_ccs_blocks - 1) & 1023) << CCS_SIZE_SHIFT));
+
+	b[2] = src_mocs << XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT;
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
+	b[4] = dst_mocs << XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT;
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
+int xy_ctrl_surf_copy_blt(int fd, uint32_t cmd,
+			  uint32_t *batch_buf,
+			  uint32_t src, uint32_t dst,
+			  uint32_t length, bool writetodev,
+			  struct intel_execution_engine2 *e)
+{
+	struct drm_i915_gem_relocation_entry reloc[4];
+	struct drm_i915_gem_exec_object2 exec[3];
+	struct drm_i915_gem_execbuffer2 execbuf;
+	int len, src_mem_access, dst_mem_access;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
+
+	if (writetodev) {
+		src_mem_access = DIRECT_ACCESS;
+		dst_mem_access = INDIRECT_ACCESS;
+	} else {
+		src_mem_access = INDIRECT_ACCESS;
+		dst_mem_access = DIRECT_ACCESS;
+	}
+
+	/* construct batch command buffer */
+	memset(reloc, 0, sizeof(reloc));
+	memset(batch_buf, 0, BATCH_SIZE);
+	len = make_ctrl_surf_batch(fd, batch_buf,
+				   src, dst, length, reloc,
+				   src_mem_access, dst_mem_access);
+	igt_assert(len > 0);
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
+		exec[0].offset = get_offset(ahnd, exec[0].handle, length * CCS_RATIO, 0);
+		exec[0].flags |= EXEC_OBJECT_PINNED;
+		exec[1].offset = get_offset(ahnd, exec[1].handle, length * CCS_RATIO, 0);
+		exec[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		exec[2].offset = get_offset(ahnd, exec[2].handle, BATCH_SIZE, 0);
+		exec[2].flags |= EXEC_OBJECT_PINNED;
+	}
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(exec);
+	execbuf.buffer_count = 3;
+	execbuf.batch_len = len;
+	execbuf.flags = I915_EXEC_BLT;
+	if (e)
+		execbuf.flags = e->flags;
+
+	gem_execbuf(fd, &execbuf);
+	gem_sync(fd, cmd);
+
+	return 0;
+}
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
new file mode 100644
index 00000000..f091c46a
--- /dev/null
+++ b/lib/i915/i915_blt.h
@@ -0,0 +1,93 @@
+/*
+ * Copyright © 2020 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *	Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
+ *
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
+#define MI_FLUSH_CCS		(1 << 16)
+#define MI_FLUSH_LLC		(1 << 9)
+#define MI_INVALIDATE_TLB	(1 << 18)
+
+/* XY_BLOCK_COPY_BLT instruction has 22 bit groups 1 DWORD each */
+#define XY_BLOCK_COPY_BLT_LEN_DWORD	22
+#define BLOCK_COPY_BLT_CMD		(2 << 29 | 0x41 << 22 | 0x14)
+#define COMPRESSION_ENABLE		(1 << 29)
+#define AUX_CCS_E			(5 << 18)
+#define FULL_RESOLVE			(1 << 12)
+#define PARTIAL_RESOLVE			(2 << 12)
+#define TILE_4_FORMAT			(2 << 30)
+#define TILE_4_WIDTH			(128)
+#define TILE_4_WIDTH_DWORD		((128 >> 2) - 1)
+#define TILE_4_HEIGHT			(32)
+#define SURFACE_TYPE_2D			(1 << 29)
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
+int xy_block_copy_blt(int fd, uint32_t cmd,
+		      uint32_t *batch_buf,
+		      uint32_t src, uint32_t dst,
+		      uint32_t length, int mode,
+		      struct intel_execution_engine2 *e);
+
+int xy_ctrl_surf_copy_blt(int fd, uint32_t cmd,
+			  uint32_t *batch_buf,
+			  uint32_t src, uint32_t dst,
+			  uint32_t length, bool writetodev,
+			  struct intel_execution_engine2 *e);
+
+int xy_block_copy_blt_ctx(int fd, uint32_t cmd,
+			  uint32_t *batch_buf,
+			  uint32_t src, uint32_t dst,
+			  uint32_t length, int mode, uint32_t ctx);
diff --git a/lib/i915/intel_mocs.c b/lib/i915/intel_mocs.c
new file mode 100644
index 00000000..cbb1cc69
--- /dev/null
+++ b/lib/i915/intel_mocs.c
@@ -0,0 +1,75 @@
+/*
+ * Copyright © 2021 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *      Apoorva Singh <apoorva1.singh@intel.com>
+ *
+ */
+#include "igt.h"
+#include "i915/gem.h"
+#include "intel_mocs.h"
+
+static void get_mocs_index(int fd, struct drm_i915_mocs_index *mocs)
+{
+	uint16_t devid = intel_get_drm_devid(fd);
+
+	/*
+	 * Gen >= 12 onwards don't have a setting for PTE,
+	 * so using I915_MOCS_PTE as mocs index may leads to
+	 * some undefined MOCS behavior.
+	 * Correct MOCS index should be referred from BSPCES
+	 * and programmed accordingly.
+	 * This helper function is providing current UC as well
+	 * as WB MOCS index based on platform.
+
+	 */
+	if (IS_DG1(devid)) {
+		mocs->uc_index = 1;
+		mocs->wb_index = 5;
+	} else if (IS_GEN12(devid)) {
+		mocs->uc_index = 3;
+		mocs->wb_index = 2;
+	} else {
+		mocs->uc_index = I915_MOCS_PTE;
+		mocs->wb_index = I915_MOCS_CACHED;
+	}
+}
+
+/* BitField [6:1] represents index to MOCS Tables
+ * BitField [0] represents Encryption/Decryption
+ */
+
+uint8_t intel_get_wb_mocs(int fd)
+{
+	struct drm_i915_mocs_index mocs;
+
+	get_mocs_index(fd, &mocs);
+	return mocs.wb_index << 1;
+}
+
+uint8_t intel_get_uc_mocs(int fd)
+{
+	struct drm_i915_mocs_index mocs;
+
+	get_mocs_index(fd, &mocs);
+	return mocs.uc_index << 1;
+}
diff --git a/lib/i915/intel_mocs.h b/lib/i915/intel_mocs.h
new file mode 100644
index 00000000..8289ab1f
--- /dev/null
+++ b/lib/i915/intel_mocs.h
@@ -0,0 +1,43 @@
+/*
+ * Copyright © 2021 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *      Apoorva Singh <apoorva1.singh@intel.com>
+ *
+ */
+#ifndef _INTEL_MOCS_H
+#define _INTEL_MOCS_H
+
+#define XY_FAST_COLOR_BLT_MOCS_SHIFT		21
+#define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
+#define XY_FAST_COPY_BLT_MOCS_SHIFT		17
+#define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
+#define MEM_COPY_MOCS_SHIFT			25
+
+struct drm_i915_mocs_index {
+	uint8_t uc_index;
+	uint8_t wb_index;
+};
+
+uint8_t intel_get_wb_mocs(int fd);
+uint8_t intel_get_uc_mocs(int fd);
+#endif /* _INTEL_MOCS_H */
diff --git a/lib/meson.build b/lib/meson.build
index 297b0ad2..525d62f9 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -11,6 +11,8 @@ lib_sources = [
 	'i915/gem_mman.c',
 	'i915/gem_vm.c',
 	'i915/intel_memory_region.c',
+	'i915/intel_mocs.c',
+	'i915/i915_blt.c',
 	'igt_collection.c',
 	'igt_color_encoding.c',
 	'igt_debugfs.c',
-- 
2.25.1
