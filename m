Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9719CFD376
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 09:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F8D10E04A;
	Fri, 28 Nov 2025 09:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YDtKV3g8";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF23710E04A
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 09:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764322750;
 bh=2LDqkos7kO+oltIXRDNZGQ+l5cqDt7eYFGEgEG/xH+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YDtKV3g8jc7zPrtMOZfLPyc2FbYSqNKm5o0eS++SSTQ5xZobDPfa+YMmBJj7LU96x
 R2E0Mm5FnpuNTpbNqgZF5/J7uasQ59/dvkUyv+ySndcSzLGZ+X669W6X4ai8TpIaRH
 qd0ZckDUPPFH+2n/+y+KQ2wMGdMuUcut2zOUnh5tHxW1/mEz3gJDOEWxFNklZTcs6c
 xAUUvYGcl8ENx4/a8vsPYDbUpUG3i7buPkwIn9Crr01qqGy49S29Sb0yMFqxHMNLZW
 GZGu5D4FZpcucjyzAKW7uPk6RAf3T8CzaKkpSRdV1z5Xt0fji0jPtx2Yuiv69fNMwD
 ebJWjMlakB9vQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2251D17E1149;
 Fri, 28 Nov 2025 10:39:10 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: [PATCH i-g-t v2 3/3] tests/panthor: Add scheduler tests
Date: Fri, 28 Nov 2025 10:38:58 +0100
Message-ID: <20251128093858.3844420-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251128093858.3844420-1-boris.brezillon@collabora.com>
References: <20251128093858.3844420-1-boris.brezillon@collabora.com>
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

Tests developed while working on this set of fixes [1].

[1]https://lore.kernel.org/all/20251112115142.1270931-1-boris.brezillon@collabora.com/

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 lib/igt_panthor.c             |  71 +++++++
 lib/igt_panthor.h             |  76 ++++++++
 tests/panthor/meson.build     |   1 +
 tests/panthor/panthor_sched.c | 338 ++++++++++++++++++++++++++++++++++
 4 files changed, 486 insertions(+)
 create mode 100644 tests/panthor/panthor_sched.c

diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
index 73ada9c59bfc..802cb182753c 100644
--- a/lib/igt_panthor.c
+++ b/lib/igt_panthor.c
@@ -2,6 +2,7 @@
 // SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
 
 #include "drmtest.h"
+#include "igt_aux.h"
 #include "igt_panthor.h"
 #include "ioctl_wrappers.h"
 #include "panthor_drm.h"
@@ -370,3 +371,73 @@ void igt_panthor_free_bo(int fd, struct panthor_bo *bo)
 
 	gem_close(fd, bo->handle);
 }
+
+/**
+ * igt_panthor_ctx_create:
+ * @fd: panthor device file descriptor
+ * @ctx: context to initialize
+ *
+ * Creates base resources (VM and GPU info) needed for GPU job submission
+ */
+void igt_panthor_ctx_create(int fd, struct panthor_ctx *ctx)
+{
+	memset(ctx, 0, sizeof(*ctx));
+	igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
+			  &ctx->gpu_info, sizeof(ctx->gpu_info), 0);
+	igt_panthor_vm_create(fd, &ctx->vm, 0);
+}
+
+/**
+ * igt_panthor_ctx_destroy:
+ * @fd: panthor device file descriptor
+ * @ctx: context to cleanup
+ *
+ * Releases all the resources attached to a GPU context.
+ */
+void igt_panthor_ctx_destroy(int fd, struct panthor_ctx *ctx)
+{
+	for (uint32_t i = 0; i < ctx->group_count; i++) {
+		struct drm_panthor_group_destroy group_destroy = {
+			.group_handle = ctx->groups[i],
+		};
+
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_DESTROY, &group_destroy), 0);
+	}
+
+	igt_panthor_vm_destroy(fd, ctx->vm, 0);
+}
+
+/**
+ * igt_panthor_ctx_add_group:
+ * @fd: panthor device file descriptor
+ * @ctx: context to add a group to
+ * @group_prio: group priority
+ * @queues: properties of queues attached to the group
+ * @queue_count: number of queues attached to the group
+ *
+ * Adds a group to a GPU context. Such groups will be released when
+ * the context is destroyed.
+ */
+void igt_panthor_ctx_add_group(int fd, struct panthor_ctx *ctx,
+			       enum drm_panthor_group_priority group_prio,
+			       const struct drm_panthor_queue_create *queues,
+			       uint32_t queue_count)
+{
+	unsigned int shader_core_count = igt_hweight(ctx->gpu_info.shader_present);
+	struct drm_panthor_group_create group_create = {
+		.queues = DRM_PANTHOR_OBJ_ARRAY(queue_count, queues),
+		.max_compute_cores = shader_core_count,
+		.max_fragment_cores = shader_core_count,
+		.max_tiler_cores = 1,
+		.priority = group_prio,
+		.compute_core_mask = ctx->gpu_info.shader_present,
+		.fragment_core_mask = ctx->gpu_info.shader_present,
+		.tiler_core_mask = ctx->gpu_info.tiler_present,
+		.vm_id = ctx->vm,
+	};
+
+	igt_assert(ctx->group_count < ARRAY_SIZE(ctx->groups));
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_CREATE, &group_create), 0);
+	igt_assert(group_create.group_handle > 0);
+	ctx->groups[ctx->group_count++] = group_create.group_handle;
+}
diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
index dc90033c0ad4..2a62eff37b2b 100644
--- a/lib/igt_panthor.h
+++ b/lib/igt_panthor.h
@@ -7,6 +7,7 @@
 #include <stddef.h>
 #include <stdint.h>
 #include <stdbool.h>
+
 #include "panthor_drm.h"
 
 struct panthor_bo {
@@ -16,7 +17,17 @@ struct panthor_bo {
 	void *map;
 };
 
+#define MAX_GROUPS_PER_CTX	128
+
+struct panthor_ctx {
+	struct drm_panthor_gpu_info gpu_info;
+	uint32_t vm;
+	uint32_t group_count;
+	uint32_t groups[MAX_GROUPS_PER_CTX];
+};
+
 void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err);
+
 void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err);
 void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err);
 void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle, uint64_t va,
@@ -38,12 +49,21 @@ void igt_panthor_group_submit_simple(int fd, uint32_t group_handle,
 				     int err);
 uint64_t igt_panthor_get_first_core(uint64_t cores_present);
 
+void igt_panthor_ctx_create(int fd, struct panthor_ctx *ctx);
+void igt_panthor_ctx_destroy(int fd, struct panthor_ctx *ctx);
+void igt_panthor_ctx_add_group(int fd, struct panthor_ctx *ctx,
+			       enum drm_panthor_group_priority group_prio,
+			       const struct drm_panthor_queue_create *queues,
+			       uint32_t queue_count);
+
 enum cs_opcode {
 	CS_OPCODE_NOP = 0,
 	CS_OPCODE_MOVE48 = 1,
 	CS_OPCODE_MOVE32 = 2,
 	CS_OPCODE_WAIT = 3,
+	CS_OPCODE_ADD64 = 17,
 	CS_OPCODE_STM = 21,
+	CS_OPCODE_BRANCH = 22,
 	CS_OPCODE_FLUSH_CACHE = 36,
 };
 
@@ -61,6 +81,16 @@ enum cs_flush_mode {
 #error "big endian not supported"
 #endif
 
+enum cs_branch_cond {
+	CS_BRANCH_COND_LE = 0,
+	CS_BRANCH_COND_GT = 1,
+	CS_BRANCH_COND_EQ = 2,
+	CS_BRANCH_COND_NE = 3,
+	CS_BRANCH_COND_LT = 4,
+	CS_BRANCH_COND_GE = 5,
+	CS_BRANCH_COND_ALWAYS = 6,
+};
+
 struct cs_instr {
 	union {
 		struct {
@@ -89,6 +119,13 @@ struct cs_instr {
 			uint64_t unused1: 23;
 			uint64_t opcode: 8;
 		} wait;
+		struct {
+			uint64_t immediate: 32;
+			uint64_t unused0: 8;
+			uint64_t src: 8;
+			uint64_t dst: 8;
+			uint64_t opcode: 8;
+		} add64;
 		struct {
 			uint64_t offset: 16;
 			uint64_t mask: 16;
@@ -97,6 +134,15 @@ struct cs_instr {
 			uint64_t src: 8;
 			uint64_t opcode: 8;
 		} stm;
+		struct {
+			uint64_t offset: 16;
+			uint64_t unused0: 12;
+			uint64_t cond: 4;
+			uint64_t unused1: 8;
+			uint64_t src: 8;
+			uint64_t unused2: 8;
+			uint64_t opcode: 8;
+		} branch;
 		struct {
 			uint64_t l2_mode: 4;
 			uint64_t lsc_mode: 4;
@@ -167,6 +213,21 @@ cs_wait(uint16_t wait_mask, bool progress_inc)
 	return instr.raw;
 }
 
+static inline uint64_t
+cs_add64(uint32_t imm, uint8_t src, uint8_t dst)
+{
+	struct cs_instr instr = {
+		.add64 = {
+			.immediate = imm,
+			.src = src,
+			.dst = dst,
+			.opcode = CS_OPCODE_ADD64,
+		},
+	};
+
+	return instr.raw;
+}
+
 static inline uint64_t
 cs_stm(uint8_t address, uint8_t src, uint16_t mask, int16_t offset)
 {
@@ -195,6 +256,21 @@ cs_stm64(uint8_t address, uint8_t src, int16_t offset)
 	return cs_stm(address, src, 0x3, offset);
 }
 
+static inline uint64_t
+cs_branch(int16_t offset, enum cs_branch_cond cond, uint8_t src)
+{
+	struct cs_instr instr = {
+		.branch = {
+			.offset = (uint16_t)offset,
+			.cond = cond,
+			.src = src,
+			.opcode = CS_OPCODE_BRANCH,
+		},
+	};
+
+	return instr.raw;
+}
+
 static inline uint64_t
 cs_flush(enum cs_flush_mode l2_mode,
 	 enum cs_flush_mode lsc_mode,
diff --git a/tests/panthor/meson.build b/tests/panthor/meson.build
index 42a46e9934a9..8bd391596a97 100644
--- a/tests/panthor/meson.build
+++ b/tests/panthor/meson.build
@@ -2,6 +2,7 @@ panthor_progs = [
 	'panthor_gem',
 	'panthor_group',
 	'panthor_query',
+	'panthor_sched',
 	'panthor_vm',
 ]
 
diff --git a/tests/panthor/panthor_sched.c b/tests/panthor/panthor_sched.c
new file mode 100644
index 000000000000..7cded16c0acd
--- /dev/null
+++ b/tests/panthor/panthor_sched.c
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: MIT
+// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
+
+#include <stdint.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+#include "drm.h"
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_panthor.h"
+#include "panthor_drm.h"
+
+static size_t
+infinite_incr_loop(uint64_t *cs, uint64_t counter_va)
+{
+	const uint8_t counter_va_reg = 68;
+	const uint8_t val_reg = 70;
+	uint64_t instrs[] = {
+		/* Load the source register ([r68; r69]) with the kernel address */
+		cs_mov48(counter_va_reg, counter_va),
+		/* Load a 0 into r70 */
+		cs_mov48(val_reg, 1),
+		/* STORE_MULTIPLE: Store the first register to the address pointed to by
+		 * [r68; r69]
+		 */
+		cs_stm64(counter_va_reg, val_reg, 0),
+		cs_wait(1, false),
+		cs_add64(1, val_reg, val_reg),
+		cs_branch(-4, CS_BRANCH_COND_ALWAYS, 0),
+	};
+
+	memcpy(cs, instrs, sizeof(instrs));
+	return sizeof(instrs);
+}
+
+struct panthor_sched_test_group_ctx {
+	uint32_t handle;
+	uint64_t *counter;
+	uint64_t cs_va;
+	uint32_t cs_size;
+};
+
+#define MAX_GROUPS	128
+
+struct panthor_sched_test_ctx {
+	struct panthor_ctx ctx;
+	struct panthor_bo cs_bo;
+	uint32_t cs_bo_offset;
+	struct panthor_bo counter_bo;
+	uint32_t counter_bo_offset;
+	uint32_t group_count;
+	struct panthor_sched_test_group_ctx groups[MAX_GROUPS];
+};
+
+#define CS_BO_VA	0x100000
+#define COUNTER_BO_VA	0x200000
+
+static void
+sched_test_ctx_create(int fd, struct panthor_sched_test_ctx *ctx)
+{
+	memset(ctx, 0, sizeof(*ctx));
+	igt_panthor_ctx_create(fd, &ctx->ctx);
+	igt_panthor_bo_create_mapped(fd, &ctx->cs_bo, getpagesize(), 0, 0);
+	igt_panthor_vm_bind(fd, ctx->ctx.vm, ctx->cs_bo.handle, CS_BO_VA, ctx->cs_bo.size,
+			    DRM_PANTHOR_VM_BIND_OP_MAP_READONLY |
+			    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP,
+			    0);
+	igt_panthor_bo_create_mapped(fd, &ctx->counter_bo, getpagesize(), 0, 0);
+	igt_panthor_vm_bind(fd, ctx->ctx.vm, ctx->counter_bo.handle, COUNTER_BO_VA,
+			    ctx->counter_bo.size,
+			    DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED |
+			    DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
+			    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP,
+			    0);
+}
+
+static void
+sched_test_ctx_destroy(int fd, struct panthor_sched_test_ctx *ctx)
+{
+	igt_panthor_ctx_destroy(fd, &ctx->ctx);
+}
+
+static void
+sched_test_ctx_add_group(int fd, struct panthor_sched_test_ctx *ctx,
+			 enum drm_panthor_group_priority group_prio)
+{
+	struct drm_panthor_queue_create queue_create = {
+		.priority = 0,
+		.ringbuf_size = getpagesize(),
+	};
+	uint64_t *cs = (uint64_t *)((uint8_t *)ctx->cs_bo.map + ctx->cs_bo_offset);
+	uint64_t *counters = ctx->counter_bo.map;
+	unsigned int group_idx = ctx->group_count;
+	uint64_t counter_va = COUNTER_BO_VA + group_idx * sizeof(counters[0]);
+	unsigned int cs_size;
+
+	igt_assert_lt(ctx->group_count, ARRAY_SIZE(ctx->groups));
+
+	igt_panthor_ctx_add_group(fd, &ctx->ctx, group_prio, &queue_create, 1);
+	cs_size = infinite_incr_loop(cs, counter_va);
+	cs_size = ALIGN(cs_size, 64);
+	ctx->groups[ctx->group_count++] = (struct panthor_sched_test_group_ctx){
+		.handle = ctx->ctx.groups[group_idx],
+		.counter = &counters[group_idx],
+		.cs_va = CS_BO_VA + ctx->cs_bo_offset,
+		.cs_size = cs_size,
+	};
+
+	ctx->cs_bo_offset += cs_size;
+	igt_assert_lt(ctx->cs_bo_offset, ctx->cs_bo.size);
+}
+
+static void
+sched_test_ctx_submit_group(int fd, struct panthor_sched_test_ctx *ctx,
+			    unsigned int group_idx)
+{
+	struct drm_panthor_queue_submit qsubmit = {
+		.queue_index = 0,
+		.stream_size = ctx->groups[group_idx].cs_size,
+		.stream_addr = ctx->groups[group_idx].cs_va,
+		.latest_flush = 0,
+	};
+	struct drm_panthor_group_submit gsubmit = {
+		.group_handle = ctx->groups[group_idx].handle,
+		.queue_submits = DRM_PANTHOR_OBJ_ARRAY(1, &qsubmit),
+	};
+
+	igt_assert_lt(group_idx, ctx->group_count);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_SUBMIT, &gsubmit), 0);
+}
+
+igt_main {
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_PANTHOR);
+	}
+
+	igt_describe("Schedule 8 groups with the same prio");
+	igt_subtest("sched_8_groups_same_prio") {
+		uint64_t min_cnt = UINT64_MAX, max_cnt = 0;
+		struct panthor_sched_test_ctx ctx;
+		const unsigned int group_cnt = 8;
+
+		sched_test_ctx_create(fd, &ctx);
+
+		for (unsigned int i = 0; i < group_cnt; i++)
+			sched_test_ctx_add_group(fd, &ctx, PANTHOR_GROUP_PRIORITY_MEDIUM);
+
+		for (unsigned int i = 0; i < group_cnt; i++) {
+			sched_test_ctx_submit_group(fd, &ctx, i);
+
+			/* Add some delay, to make sure each group becomes
+			 * active at a different time, and exercise the
+			 * idle -> active transition that appeared to be
+			 * broken at some point.
+			 */
+			usleep(100000);
+		}
+
+		/* Jobs will timeout, because we've issued an infinte loop,
+		 * but leave it some time before checking the counter
+		 * values.
+		 */
+		sleep(6);
+
+		for (unsigned int i = 0; i < group_cnt; i++) {
+			min_cnt = min(min_cnt, *ctx.groups[i].counter);
+			max_cnt = max(max_cnt, *ctx.groups[i].counter);
+		}
+
+		igt_assert_lt(200000, min_cnt);
+		igt_assert_lte(min_cnt, max_cnt);
+
+		/* Allow a 20% difference max? */
+		igt_assert_lt((((max_cnt - min_cnt) * 100) / min_cnt), 20);
+
+		sched_test_ctx_destroy(fd, &ctx);
+	}
+
+	igt_describe("Schedule 16 groups with the same prio");
+	igt_subtest("sched_16_groups_same_prio") {
+		uint64_t min_cnt = UINT64_MAX, max_cnt = 0;
+		struct panthor_sched_test_ctx ctx;
+		const unsigned int group_cnt = 16;
+
+		sched_test_ctx_create(fd, &ctx);
+
+		for (unsigned int i = 0; i < group_cnt; i++)
+			sched_test_ctx_add_group(fd, &ctx, PANTHOR_GROUP_PRIORITY_MEDIUM);
+
+		for (unsigned int i = 0; i < group_cnt; i++) {
+			sched_test_ctx_submit_group(fd, &ctx, i);
+
+			/* Add some delay, to make sure each group becomes
+			 * active at a different time, and exercise the
+			 * idle -> active transition that appeared to be
+			 * broken at some point.
+			 */
+			usleep(100000);
+		}
+
+		/* Jobs will timeout, because we've issued an infinte loop,
+		 * but leave it some time before checking the counter
+		 * values.
+		 */
+		sleep(15);
+
+		for (unsigned int i = 0; i < group_cnt; i++) {
+			min_cnt = min(min_cnt, *ctx.groups[i].counter);
+			max_cnt = max(max_cnt, *ctx.groups[i].counter);
+		}
+
+		igt_assert_lt(200000, min_cnt);
+		igt_assert_lte(min_cnt, max_cnt);
+
+		/* Allow a 20% difference max? */
+		igt_assert_lt((((max_cnt - min_cnt) * 100) / min_cnt), 20);
+
+		sched_test_ctx_destroy(fd, &ctx);
+	}
+
+	igt_describe("Schedule 15 groups with medium prio, one high");
+	igt_subtest("sched_15_groups_med_1_high") {
+		uint64_t min_cnt = UINT64_MAX, max_cnt = 0;
+		struct panthor_sched_test_ctx ctx;
+		const unsigned int group_cnt = 16;
+		const unsigned int group_high = group_cnt - 1;
+
+		sched_test_ctx_create(fd, &ctx);
+
+		for (unsigned int i = 0; i < group_cnt; i++) {
+			sched_test_ctx_add_group(fd, &ctx,
+						 i == group_high ?
+						 PANTHOR_GROUP_PRIORITY_HIGH :
+						 PANTHOR_GROUP_PRIORITY_MEDIUM);
+		}
+
+		for (unsigned int i = 0; i < group_cnt; i++) {
+			sched_test_ctx_submit_group(fd, &ctx, i);
+
+			/* Add some delay, to make sure each group becomes
+			 * active at a different time, and exercise the
+			 * idle -> active transition that appeared to be
+			 * broken at some point.
+			 */
+			usleep(100000);
+		}
+
+		/* Jobs will timeout, because we've issued an infinte loop,
+		 * but leave it some time before checking the counter
+		 * values.
+		 */
+		sleep(15);
+
+		for (unsigned int i = 0; i < group_cnt; i++) {
+			if (i == group_high)
+				continue;
+
+			min_cnt = min(min_cnt, *ctx.groups[i].counter);
+			max_cnt = max(max_cnt, *ctx.groups[i].counter);
+		}
+
+		igt_assert_lt(200000, min_cnt);
+		igt_assert_lte(min_cnt, max_cnt);
+
+		/* Allow a 30% difference max on all med groups? */
+		igt_assert_lt((((max_cnt - min_cnt) * 100) / min_cnt), 30);
+
+		/* High group's counter must be at least 1.5x the other groups. */
+		igt_assert_lt((float)max_cnt * 1.5, (float)*ctx.groups[group_high].counter);
+
+		sched_test_ctx_destroy(fd, &ctx);
+	}
+
+	igt_describe("Schedule 4 groups with RT prio, one high");
+	igt_subtest("sched_4_groups_rt_1_high") {
+		uint64_t min_cnt = UINT64_MAX, max_cnt = 0;
+		struct panthor_sched_test_ctx ctx;
+		const unsigned int group_cnt = 5;
+		const unsigned int group_high = group_cnt - 1;
+		uint64_t group_high_counter;
+
+		sched_test_ctx_create(fd, &ctx);
+
+		for (unsigned int i = 0; i < group_cnt; i++) {
+			sched_test_ctx_add_group(fd, &ctx,
+						 i == group_high ?
+						 PANTHOR_GROUP_PRIORITY_HIGH :
+						 PANTHOR_GROUP_PRIORITY_REALTIME);
+		}
+
+		for (unsigned int i = 0; i < group_cnt; i++) {
+			if (i == group_high)
+				continue;
+			sched_test_ctx_submit_group(fd, &ctx, i);
+		}
+
+		/* Leave it some time so the SW scheduler can make all RT groups
+		 * active, and the high one really doesn't get a chance to run.
+		 * Ideally the dequeueing of jobs would also take the group
+		 * priority into account, but that's not the case.
+		 */
+		usleep(200000);
+		sched_test_ctx_submit_group(fd, &ctx, group_high);
+
+		/* Make sure we wait less than the timeout, otherwise the group with
+		 * high priority will be left a chance to run as soon as one of the RT
+		 * group dies.
+		 */
+		sleep(2);
+
+		group_high_counter = *ctx.groups[group_high].counter;
+		for (unsigned int i = 0; i < group_cnt; i++) {
+			if (i == group_high)
+				continue;
+
+			min_cnt = min(min_cnt, *ctx.groups[i].counter);
+			max_cnt = max(max_cnt, *ctx.groups[i].counter);
+		}
+
+		igt_assert_lt(200000, min_cnt);
+		igt_assert_lte(min_cnt, max_cnt);
+
+		/* Allow a 30% difference max on all med groups? */
+		igt_assert_lt((((max_cnt - min_cnt) * 100) / min_cnt), 30);
+
+		/* High group should never run. */
+		igt_assert_eq(group_high_counter, 0);
+
+		sched_test_ctx_destroy(fd, &ctx);
+	}
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+}
-- 
2.51.1

