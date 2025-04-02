Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26925C36014
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 06:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A2E10E6C4;
	Wed,  2 Apr 2025 06:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbEUsSxD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B51E10E6C4
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 06:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743575327; x=1775111327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xj4DoI0DtqTRLcvmQ9J57WR4wJ+tVUQRYDyfs+Pp2IQ=;
 b=hbEUsSxDlhV22tuLd0pLdiTsk4WMqXfAKnbpX8s+mbTWTJKcbEAuiEJp
 5iaymrmB6ensg8DSWFB8lBXAppKVB4d1leBAZrD29JdAnVSfAnVm7gLum
 X/53CI55CXOkIjuHxnWtVx+YL3STIturnqoeYo7aIiJpAnfeIQpTMLKPv
 4J/3CreJ0jXjuBXiPJkv2nagJThLZ0MK/HlCu7JUUPOOAEl3QXJSS67US
 04YOI4fAsPl0+d7CMryUNOPgHLhpU1xr7qk6DYJri0kZ4PzI1iH8QbLst
 X92713awTiP9fs79vqo//E/rUDv367pWSZmTwrg/H0aytzxL7BH9uAnwA g==;
X-CSE-ConnectionGUID: gheg6qLjQVek66PJwhUnaA==
X-CSE-MsgGUID: fIHbHMogRi+GdOhH2a4cuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44805919"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="44805919"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 23:28:47 -0700
X-CSE-ConnectionGUID: srDPWqW4SnazEFceChc6Rw==
X-CSE-MsgGUID: NAJ3Z/wbRTiLuX3JXy6Lzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="126492630"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by orviesa010.jf.intel.com with ESMTP; 01 Apr 2025 23:28:46 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t 1/4] benchmarks: Measure BLT performance
Date: Wed,  2 Apr 2025 12:07:20 +0530
Message-Id: <20250402063723.660112-2-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402063723.660112-1-pravalika.gurram@intel.com>
References: <20250402063723.660112-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
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

Execute N blits and time how long they complete to measure both GPU
limited bandwidth and submission overhead.

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 benchmarks/meson.build |   1 +
 benchmarks/xe_blt.c    | 369 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 370 insertions(+)
 create mode 100644 benchmarks/xe_blt.c

diff --git a/benchmarks/meson.build b/benchmarks/meson.build
index 2c9a88fd3..4421ede86 100644
--- a/benchmarks/meson.build
+++ b/benchmarks/meson.build
@@ -21,6 +21,7 @@ benchmark_progs = [
 	'kms_vblank',
 	'prime_lookup',
 	'vgem_mmap',
+        'xe_blt',
 ]
 
 benchmarksdir = join_paths(libexecdir, 'benchmarks')
diff --git a/benchmarks/xe_blt.c b/benchmarks/xe_blt.c
new file mode 100644
index 000000000..b6fd290a3
--- /dev/null
+++ b/benchmarks/xe_blt.c
@@ -0,0 +1,369 @@
+/*
+ * Copyright © 2025 Intel Corporation
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
+ *    Pravalika Gurram <pravalika.gurram@intel.com>
+ *
+ */
+
+#include "drm.h"
+#include "igt_syncobj.h"
+#include "intel_blt.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_util.h"
+
+
+#define COPY_BLT_CMD		(2<<29|0x53<<22|0x6)
+#define BLT_WRITE_ALPHA		(1<<21)
+#define BLT_WRITE_RGB		(1<<20)
+#define BLT_SRC_TILED		(1<<15)
+#define BLT_DST_TILED		(1<<11)
+
+	static double
+elapsed(const struct timespec *start, const struct timespec *end)
+{
+	return (end->tv_sec - start->tv_sec) + 1e-9*(end->tv_nsec - start->tv_nsec);
+}
+
+static void *bo_map(int fd, uint32_t handle, uint64_t size,
+		enum intel_driver driver)
+{
+	if (driver == INTEL_DRIVER_XE)
+		return xe_bo_map(fd, handle, size);
+
+	return gem_mmap__device_coherent(fd, handle, 0, size,
+			PROT_READ | PROT_WRITE);
+}
+
+static uint64_t emit_blt_src_copy(int fd,
+		uint64_t ahnd,
+		const struct blt_copy_data *blt,
+		uint64_t bb_pos,
+		bool emit_bbe,
+		uint64_t dst_offset,
+		uint64_t src_offset,
+		uint64_t bb_offset,
+		uint32_t height)
+{
+	uint32_t *b;
+	uint32_t bbe = MI_BATCH_BUFFER_END;
+	uint32_t *bb;
+	int i = 0;
+
+	src_offset += blt->src.plane_offset;
+	dst_offset += blt->dst.plane_offset;
+	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, 0);
+
+	b[i++] = COPY_BLT_CMD | BLT_WRITE_ALPHA | BLT_WRITE_RGB;
+	b[i-1] += 2;
+	b[i++] = 0xcc << 16 | 1 << 25 | 1 << 24 | (16*1024);
+	b[i++] = 0;
+	b[i++] = height << 16 | (4*1024);
+	b[i++] = dst_offset;
+	b[i++] = dst_offset >> 32; /* FIXME */
+	b[i++] = 0;
+	b[i++] = 16*1024;
+	b[i++] = src_offset;
+	b[i++] = src_offset >> 32; /* FIXME */
+
+	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
+
+	igt_assert(bb_pos + sizeof(b) < blt->bb.size);
+	memcpy(bb + bb_pos, &b, sizeof(b));
+	bb_pos += sizeof(b);
+
+	if (emit_bbe) {
+		igt_assert(bb_pos + sizeof(uint32_t) < blt->bb.size);
+		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
+		bb_pos += sizeof(uint32_t);
+	}
+
+	igt_info("[SRC COPY]\n");
+	igt_info("src offset: %" PRIx64 ", dst offset: %" PRIx64
+			", bb offset: %" PRIx64 "\n",
+			src_offset, dst_offset, bb_offset);
+	munmap(bb, blt->bb.size);
+
+	return bb_pos;
+
+}
+
+static int count;
+/*
+ * val = True To check BB is working fine or not
+ * count_val = To get the counter value how many buffers we can send in 0.1 sec
+ * loop_count = count_val time we have to submit the buffers
+ */
+static int blt_src_copy(int fd,
+		const intel_ctx_t *ctx,
+		const struct intel_execution_engine2 *e,
+		uint64_t ahnd,
+		const struct blt_copy_data *blt, uint32_t height,
+		bool val, bool count_val, bool loop_count)
+{
+	uint64_t dst_offset = 0, src_offset = 0, bb_offset = 0;
+	int ret = 0;
+	uint64_t bb_pos = 0;
+	struct timespec start, end;
+
+	igt_assert_f(ahnd, "src-copy supports softpin only\n");
+	igt_assert_f(blt, "src-copy requires data to do src-copy blit\n");
+	igt_assert_neq(blt->driver, 0);
+
+	if (!val) {
+		src_offset = get_offset_pat_index(ahnd, blt->src.handle, blt->src.size,
+				0, blt->src.pat_index);
+		dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size,
+				0, blt->dst.pat_index);
+		bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, 0);
+	}
+
+	bb_pos = emit_blt_src_copy(fd, ahnd, blt, 0, true, src_offset, dst_offset, bb_offset, height);
+
+	if (count_val) {
+		clock_gettime(CLOCK_MONOTONIC, &start);
+		do {
+			if (blt->driver == INTEL_DRIVER_XE)
+				intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+			count++;
+			clock_gettime(CLOCK_MONOTONIC, &end);
+			if (elapsed(&start, &end) > (100 / 1000.))
+				break;
+		} while (1);
+	} else if (loop_count) {
+		for (int loop = 0; loop < count; loop++) {
+			if (blt->driver == INTEL_DRIVER_XE) 
+				intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+		}
+
+	} else {
+		if (blt->driver == INTEL_DRIVER_XE) 
+			intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+	}
+	return ret;
+}
+
+static int src_copy(int xe, const intel_ctx_t *ctx,
+		uint32_t width, uint32_t height,
+		uint32_t region1, uint32_t region2, bool val, bool count, bool loop)
+{
+	struct blt_copy_data blt = {};
+	struct blt_copy_object *src, *mid, *dst;
+	const uint32_t bpp = 32;
+	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
+	uint64_t ahnd = intel_allocator_open_full(xe, ctx->vm, 0, 0,
+			INTEL_ALLOCATOR_SIMPLE,
+			ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+	uint32_t bb;
+	int ret = 0;
+
+	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
+
+	blt_copy_init(xe, &blt);
+	src = blt_create_object(&blt, region1, width, height, bpp, 0,
+			T_LINEAR, COMPRESSION_DISABLED, 0, true);
+	dst = blt_create_object(&blt, region1, width, height, bpp, 0,
+			T_LINEAR, COMPRESSION_DISABLED, 0, true);
+	igt_assert(src->size == dst->size);
+
+	blt_set_copy_object(&blt.src, src);
+	blt_set_copy_object(&blt.dst, dst);
+	blt_set_batch(&blt.bb, bb, bb_size, region1);
+
+	ret = blt_src_copy(xe, ctx, NULL, ahnd, &blt, height, val, count, loop);
+
+	put_offset(ahnd, src->handle);
+	put_offset(ahnd, dst->handle);
+	put_offset(ahnd, bb);
+	intel_allocator_bind(ahnd, 0, 0);
+	blt_destroy_object(xe, src);
+	blt_destroy_object(xe, dst);
+	gem_close(xe, bb);
+	put_ahnd(ahnd);
+	return ret;
+
+}
+
+#define SYNC 0x1
+
+static int run(int width, int batch, int time, int reps, int ncpus, unsigned flags)
+{
+	struct igt_collection *set;
+	int xe;
+	int height = width / (16 * 1024);
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+	intel_ctx_t *ctx;
+	double *shared;
+	uint32_t region1, region2;
+	uint32_t vm, exec_queue;
+	int ret;
+
+	shared = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+
+	xe = drm_open_driver(DRIVER_XE);
+	igt_require(blt_has_xy_src_copy(xe));
+	xe_device_get(xe);
+	set = xe_get_memory_region_set(xe,
+			DRM_XE_MEM_REGION_CLASS_SYSMEM,
+			DRM_XE_MEM_REGION_CLASS_VRAM);
+	intel_allocator_multiprocess_start();
+
+	region1 = 1;
+	region2 = 2;
+
+	vm = xe_vm_create(xe, 0, 0);
+	exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
+	ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
+	ret = src_copy(xe, ctx, width, height, region1, region2, true,
+								false, false);
+	xe_exec_queue_destroy(xe, exec_queue);
+	xe_vm_destroy(xe, vm);
+	free(ctx);
+	if (!ret) {
+		vm = xe_vm_create(xe, 0, 0);
+		exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
+		ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
+		ret = src_copy(xe, ctx, width, height, region1, region2,
+							false, false, false);
+		xe_exec_queue_destroy(xe, exec_queue);
+		xe_vm_destroy(xe, vm);
+		free(ctx);
+	}
+	if (batch > 1) {
+		for (int i = 1; i < batch; i++) {
+			vm = xe_vm_create(xe, 0, 0);
+			exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
+			ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
+			ret = src_copy(xe, ctx, width, height, region1, region2,
+							false, false, false);
+			xe_exec_queue_destroy(xe, exec_queue);
+			xe_vm_destroy(xe, vm);
+			free(ctx);
+		}
+	}
+	vm = xe_vm_create(xe, 0, 0);
+	exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
+	ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
+	ret = src_copy(xe, ctx, width, height, region1, region2,
+						false, true, false);
+	xe_exec_queue_destroy(xe, exec_queue);
+	xe_vm_destroy(xe, vm);
+	free(ctx);
+	if (flags & SYNC) {
+		time *= count / 2;
+		count = 1;
+	}
+
+	while (reps--) {
+		memset(shared, 0, 4096);
+
+		igt_fork(child, ncpus) {
+			double min = HUGE_VAL;
+
+			for (int s = 0; s <= time / 100; s++) {
+				struct timespec start, end;
+				double t;
+
+				clock_gettime(CLOCK_MONOTONIC, &start);
+				vm = xe_vm_create(xe, 0, 0);
+				exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
+				ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
+				ret = src_copy(xe, ctx, width, height, region1,
+						region2, false, false, true);
+				free(ctx);
+				xe_exec_queue_destroy(xe, exec_queue);
+				xe_vm_destroy(xe, vm);
+				clock_gettime(CLOCK_MONOTONIC, &end);
+
+				t = elapsed(&start, &end);
+				if (t < min)
+					min = t;
+			}
+
+			shared[child] = width/(1024*1024.)*batch*count/min;
+		}
+		igt_waitchildren();
+
+		for (int child = 0; child < ncpus; child++)
+			shared[ncpus] += shared[child];
+	}
+	intel_allocator_multiprocess_stop();
+
+	close(xe);
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	int size = 1024*1024;
+	int reps = 13;
+	int time = 2000;
+	int ncpus = 1;
+	int batch = 1;
+	unsigned flags = 0;
+	int c;
+
+	while ((c = getopt (argc, argv, "s:S:t:r:b:f")) != -1) {
+		switch (c) {
+		case 's':
+			size = atoi(optarg);
+			size = ALIGN(size, 4);
+			if (size < 4)
+				size = 4;
+			break;
+
+		case 'S':
+			flags |= SYNC;
+			break;
+
+		case 't':
+			time = atoi(optarg);
+			if (time < 1)
+				time = 1;
+			break;
+
+		case 'r':
+			reps = atoi(optarg);
+			if (reps < 1)
+				reps = 1;
+			break;
+
+		case 'b':
+			batch = atoi(optarg);
+			if (batch < 1)
+				batch = 1;
+			break;
+
+		case 'f':
+			ncpus = sysconf(_SC_NPROCESSORS_ONLN);
+			break;
+
+		default:
+			break;
+		}
+	}
+
+	return run(size, batch, time, reps, ncpus, flags);
+}
-- 
2.34.1

